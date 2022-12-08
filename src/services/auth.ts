const request = require('request');

export const validateTokenWithDiscord = async (discordUserId: string, accessToken: string) => {
  let response: any = await doRequest("https://discord.com/api/users/@me", {
    auth: {
      bearer : accessToken
    } 
  });
  const data = JSON.parse(response);
  return data.id == discordUserId;
}

export const authMiddleware = async (req: any, res: any, next: any) => {
  try {
    const { accesstoken, discorduserid } = req.headers;
    const discordUserId = discorduserid as string;
    const accessToken = accesstoken as string;
    
    if(!discordUserId || !accessToken) {
      res.header('Content-Type', 'application/json');
      res.status(403).send({
        "message": "Invalid Token"
      });
      return;
    }
  
    const auth = await validateTokenWithDiscord(discordUserId, accessToken);
    if(auth) {
      next();
    } else {
      res.header('Content-Type', 'application/json');
      res.status(403).send({
        "message": "Inalid Token"
      });
    }
  } catch (error) {
    console.log(error);
    res.sendStatus(500);
    res.send({
      "message": "Something went wrong"
    })
  }
}

function doRequest(url: string, options: any) {
  return new Promise(function (resolve, reject) {
    request(url, options, function (error: any, res: any, body: any) {
      if (!error && res.statusCode === 200) {
        resolve(body);
      } else {
        reject(error);
      }
    });
  });
}