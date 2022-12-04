import express, { Express, Request, Response } from "express";
import dotenv from "dotenv";
import routes from "./api/routes";
import bodyParser from "body-parser";
import got from "got";

dotenv.config();

const cors = require("cors");
const app: Express = express();
const jsonParser = bodyParser.json();
const isDev = process.env.NODE_ENV === "development";

const whitelist = ['https://www.pacapaca.io/'];
const corsOptions = {
  origin: function (origin: any, callback: any) {
    if (whitelist.indexOf(origin) !== -1) {
      callback(null, true)
    } else {
      callback(new Error('Not allowed by CORS'))
    }
  }
}
// CORS only limits on production/staging server
if(!isDev) {
  app.use(cors(corsOptions));
} else {
  app.use(cors());
}
app.use(jsonParser);
app.use("/api", routes);

app.get("twitter-test", async (req: Request, res: Response) => {
  const { data }: any = await got.get("https://twitter.com/WEB3Zer0");
  console.log(data);
  res.send(data);
});

const port = process.env.PORT;
try {
  app.listen(port, () => {
    console.log(`⚡️[server]: Server is running at https://localhost:${port}`);
  });
} catch (error: any) {
  console.log(`Error occurred: ${error.message}`);
}