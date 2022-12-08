import {
  Router
} from "express";

import {
  validateToken,
  getLoginUrl,
  getToken,
  logout
} from "../controllers/discord-auth";
import { authMiddleware } from "../../services/auth";

const router = Router();

router.get("/get_login_url", getLoginUrl);
router.get("/get_token", getToken);
router.get("/validate_token", authMiddleware, validateToken);
router.post("/logout", logout)

export default router;