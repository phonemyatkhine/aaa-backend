import {
  Router
} from "express";

import {
  login,
  callback,
} from "../controllers/discord-auth";

const router = Router();

router.get("/login", login);
router.get("/callback", callback);

export default router;