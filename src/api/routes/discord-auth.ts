import {
  Router
} from "express";

import {
  getLoginUrl,
  getToken,
  validateToken
} from "../controllers/discord-auth";

const router = Router();

router.get("/get_login_url", getLoginUrl);
router.get("/get_token", getToken);
router.get("/validate_token", validateToken);

export default router;