import {
  Router
} from "express";
import discordAuthRouter from "./discord-auth";
import exampleRouter from "./example";
import got from "got";

const router = Router();

router.use("/example", exampleRouter)
router.use("/auth/discord", discordAuthRouter);

// router.get("twitter-test", async (req: Request, res: Response) => {
//   const { data }: any = await got.get("https://twitter.com/WEB3Zer0");
//   console.log(data);
//   res.send(data);
// });

export default router;