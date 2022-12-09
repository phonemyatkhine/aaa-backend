import {
  Router
} from "express";
import discordAuthRouter from "./discord-auth";
import campaignRouter from "./campaign";
import tweetTransactionRouter from "./tweet-transaction";
import userRouter from "./user";
import { authMiddleware } from "../../services/auth";

const router = Router();

router.use("/tweet_transactions", authMiddleware, tweetTransactionRouter)
router.use("/campaigns", authMiddleware, campaignRouter)
router.use("/users", authMiddleware, userRouter)
router.use("/auth/discord", discordAuthRouter);

// router.get("twitter-test", async (req: Request, res: Response) => {
//   const { data }: any = await got.get("https://twitter.com/WEB3Zer0");
//   console.log(data);
//   res.send(data);
// });

export default router;