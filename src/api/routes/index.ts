import {
  Router
} from "express";
import discordAuthRouter from "./discord-auth";
import guildRouter from "./campaign";
import got from "got";

const router = Router();

router.use("/guilds", guildRouter)
router.use("/auth/discord", discordAuthRouter);

// router.get("twitter-test", async (req: Request, res: Response) => {
//   const { data }: any = await got.get("https://twitter.com/WEB3Zer0");
//   console.log(data);
//   res.send(data);
// });

export default router;