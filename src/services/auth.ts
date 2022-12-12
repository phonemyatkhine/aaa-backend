import { doRequest } from "./common";
export const validateTokenWithDiscord = async (discordUserId: string, accessToken: string) => {
  let response: any = await doRequest("https://discord.com/api/users/@me", {
    auth: {
      bearer : accessToken
    } 
  }).catch((err) => {
    return false;
  });

  const data = JSON.parse(response);
  if(data) {
    return data.id == discordUserId;
  } else {
    return false;
  }
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
        "message": "Invalid Token"
      });
    }
  } catch (error) {
    res.sendStatus(500);
    res.send({
      "message": "Something went wrong"
    })
  }
}