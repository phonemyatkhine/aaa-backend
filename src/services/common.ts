const request = require('request');

export function doRequest(url: string, options: any) {
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