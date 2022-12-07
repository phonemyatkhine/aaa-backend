const request = require('request');

export const validateTokenWithDiscord = async (discordUserId: string, accessToken: string) => {
  let response: any = await doRequest("https://discord.com/api/users/@me", {
    auth: {
      bearer : accessToken
    } 
  });
  console.log(response);
  const data = JSON.parse(response);
  if(data.id == discordUserId) {
    return { code: 200, message: "Valid Token", data: data };
  }
  return { code: 403, message: "Invalid Token" }
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