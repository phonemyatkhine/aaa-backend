import {
  RequestHandler
} from 'express';
import { findOrCreate } from "../../db/dal/user"
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
    console.log("Hello world");
    request.post('https://discord.com/api/oauth2/token', {
      form: {
        client_id: process.env.DISCORD_CLIENT_ID ?? '',
        client_secret: process.env.DISCORD_CLIENT_SECRET ?? '',
        grant_type: "authorization_code",
        code: code as string,
        redirect_uri: process.env.FRONTEND_APP_URL + "/auth/discord/callback",
      }
    }, (err: any, response: any, body: any) => {
      if(response) {
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
          if(response) {
            const {
              id, username, avatar,
            } = JSON.parse(response.body);
            res.header('Content-Type', 'application/json');
            res.send({
              discordUserId: id,
              username: username,
              avatar : `https://cdn.discordapp.com/avatars/${id}/${avatar}.png`,
              accessToken: access_token,
            });
            findOrCreate({
              discordUserId: id,
              discordUsername: username,
            });
          }
        });
      }
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
  res.header('Content-Type', 'application/json');
  res.status(200).send({
    "message": "Valid Token"
  });
}

export const logout: RequestHandler = async (req, res) => {
  // const { accesstoken, discorduserid } = req.headers;
  // request.post("https://discord.com/api/oauth2/token/revoke", {
  //   auth: {
  //     bearer : accesstoken
  //   }
  // }, (err: any, response: any, body: any) => {
  //   console.log("Logout ",response);
  //   console.log("Logout Err ",err);
    res.header('Content-Type', 'application/json');
    res.send({
      "message": "Logged out successfully"
    })
  // });
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