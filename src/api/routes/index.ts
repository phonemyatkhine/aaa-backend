import { Router } from "express";
import discordAuthRouter from "./discord-auth";
import exampleRouter from "./example";

const router = Router();

router.use("/example", exampleRouter)
router.use("/discord_auth", discordAuthRouter);

export default router;