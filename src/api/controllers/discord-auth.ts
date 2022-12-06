import {
  RequestHandler
} from 'express';
import { validateTokenWithDiscord } from '../../services/auth';
const request = require('request');

export const getLoginUrl: RequestHandler = async (req, res) => {
  const scope = "guilds guilds.members.read identify";
  const redirect_uri = (process.env.FRONTEND_APP_URL ?? '') + (process.env.DISCORD_CALLBACK_URL ?? '');

  const searchParams = new URLSearchParams();
  searchParams.append("client_id", process.env.DISCORD_CLIENT_ID ?? '');
  searchParams.append("redirect_uri", redirect_uri);
  searchParams.append("response_type", "code");
  searchParams.append("scope", scope);
  const url = `https://discord.com/api/oauth2/authorize?${searchParams.toString()}`;

  res.header('Content-Type', 'application/json');
  res.send({
    url
  });
}

export const getToken: RequestHandler = async (req, res) => {
  const {
    code
  } = req.query;

  try {
    request.post('https://discord.com/api/oauth2/token', {
      form: {
        client_id: process.env.DISCORD_CLIENT_ID ?? '',
        client_secret: process.env.DISCORD_CLIENT_SECRET ?? '',
        grant_type: "authorization_code",
        code: code as string,
        redirect_uri: process.env.FRONTEND_APP_URL + "/auth/discord/callback",
      }
    }, async (err: any, response: any, body: any) => {
      const {
        access_token
      } = JSON.parse(response.body);
      if(!access_token) {
        res.status(500).send({
          message: "Something went wrong"
        });
      }
      request.get("https://discord.com/api/users/@me", {
        'auth': {
          'bearer' : access_token
        }
      }, (err: any, response: any, body: any) => {
        const {
          id, username, avatar,
        } = JSON.parse(response.body);
        res.header('Content-Type', 'application/json');
        res.send({
          discordUserId: id,
          username: username,
          avatar : `https://cdn.discordapp.com/avatars/${id}/${avatar}.png`,
          accessToken: access_token,
        })
      });
    });
  } catch (error) {
    console.log(error);
    res.sendStatus(500);
    res.send({
      "message": "Something went wrong"
    })
  }
}

export const validateToken: RequestHandler = async (req, res) => {
  const { accesstoken, discorduserid } = req.headers;
  const discordUserId = discorduserid as string;
  const accessToken = accesstoken as string;

  const response = await validateTokenWithDiscord(discordUserId, accessToken);

  return res.status(response.code).send(response);
}

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