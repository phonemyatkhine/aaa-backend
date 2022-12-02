import { Request, Response } from "express";
import got from "got";

const express = require("express");
const app = express();
const port = 3000;

app.get("/", async (req: Request, res: Response) => {
  const { data }: any = await got.get("https://twitter.com/WEB3Zer0");
  console.log(JSON.stringify(data));
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
