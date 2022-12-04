import {
  RequestHandler
} from 'express';
const request = require('request');

export const login: RequestHandler = async (req, res) => {
  const scope = "guilds guilds.members.read identify";
  const redirect_uri = (process.env.APP_URL ?? '') + (process.env.DISCORD_CALLBACK_URL ?? '');

  const searchParams = new URLSearchParams();
  searchParams.append("client_id", process.env.DISCORD_CLIENT_ID ?? '');
  searchParams.append("redirect_uri", redirect_uri);
  searchParams.append("response_type", "code");
  searchParams.append("scope", scope);
  const url = `https://discord.com/api/oauth2/authorize?${searchParams.toString()}`;

  res.redirect(url);
}

export const callback: RequestHandler = async (req, res) => {
  const {
    code
  } = req.query;

  request.post('https://discord.com/api/oauth2/token', {
    form: {
      client_id: process.env.DISCORD_CLIENT_ID ?? '',
      client_secret: process.env.DISCORD_CLIENT_SECRET ?? '',
      grant_type: "authorization_code",
      code: code as string,
      redirect_uri: process.env.APP_URL + "/auth/discord/callback",
    }
  }, (err: any, response: any, body: any) => {
    res.header('Content-Type', 'application/json');
    res.send(response.body)
  });
}

// export const login: RequestHandler = async (req, res) => {
//   passport.authenticate('discord')(req, res);
// }

// export const callback: RequestHandler = async (req, res) => {
//   passport.authenticate('discord', {
//     failureRedirect: '/'
//   })(req, res, () => {
//     res.send(200);
//   });
// }