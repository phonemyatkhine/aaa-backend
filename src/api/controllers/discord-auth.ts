import {
  RequestHandler
} from 'express';
import { request } from 'http';
import { doRequest } from '../../services/common';
import { populateDiscordData } from "../../services/discord";
const FormData = require('form-data');

export const getLoginUrl: RequestHandler = async (req, res) => {
  const scope = "guilds guilds.members.read identify";
  const redirect_uri = (process.env.FRONTEND_APP_URL ?? '') + (process.env.DISCORD_CALLBACK_URL ?? '');

  const searchParams = new URLSearchParams();
  searchParams.append("client_id", process.env.DISCORD_CLIENT_ID ?? '');
  searchParams.append("redirect_uri", redirect_uri);
  searchParams.append("response_type", "code");
  searchParams.append("scope", scope);
  const url = `https://discord.com/api/oauth2/authorize?${searchParams.toString()}`;

  res.status(200).json({
    url
  });
}

export const getToken: RequestHandler = async (req, res) => {
  const {
    code
  } = req.query;

  let response: any = await doRequest(`https://discord.com/api/oauth2/token`, {
    method: "POST",
    form: {
      client_id: process.env.DISCORD_CLIENT_ID ?? '',
      client_secret: process.env.DISCORD_CLIENT_SECRET ?? '',
      grant_type: "authorization_code",
      code: code as string,
      redirect_uri: process.env.FRONTEND_APP_URL + "/auth/discord/callback",
    }
  }).catch((err) => {
    res.status(500).json({
      message: "Something went wrong"
    });
    return;
  });

  if(response) {
    const {
      access_token
    } = JSON.parse(response);
    if(!access_token) {
      res.status(500).send({
        message: "Something went wrong"
      });
    }
    let resp: any = await doRequest("https://discord.com/api/users/@me", {
      auth: {
        bearer: access_token
      }
    }).catch((err) => {
      res.status(500).json({
        "message": "Something went wrong"
      });
      return;
    });
    const {
      id, username, avatar,
    } = JSON.parse(resp);

    let discordUser = await populateDiscordData(id, username, access_token).catch((err) => {
      res.status(err.code).json({
        "message": err.message
      });
      return;
    });

    res.status(200).json({
      discordUserId: id,
      username: username,
      avatar : `https://cdn.discordapp.com/avatars/${id}/${avatar}.png`,
      accessToken: access_token,
    });
    return;
  }
}

export const validateToken: RequestHandler = async (req, res) => {
  const {accesstoken : accessToken, discorduserid: discordUserId} = req.headers;
  populateDiscordData(discordUserId as string, "", accessToken as string);
  
  res.status(200).json({
    "message": "Valid Token"
  });
}

export const logout: RequestHandler = async (req, res) => {
  var form = new FormData();
  form.append('client_id', process.env.DISCORD_CLIENT_ID ?? '');
  form.append('client_secret', process.env.DISCORD_CLIENT_SECRET ?? '');
  form.append('token', req.headers.accesstoken);

  const logoutRes = await doRequest("https://discord.com/api/oauth2/token/revoke", {
    method: "POST",
    headers: form.getHeaders(),
    body: form
  }).catch((err) => {
    res.status(500).json({
      "message": "Something went wrong"
    });
    return;
  });

  res.status(200).json({
    "message": "Logged out successfully"
  })
};

/* using passport 
export const login: RequestHandler = async (req, res) => {
  passport.authenticate('discord')(req, res);
}

export const callback: RequestHandler = async (req, res) => {
  passport.authenticate('discord', {
    failureRedirect: '/'
  })(req, res, () => {
    res.send(200);
  });
}
*/