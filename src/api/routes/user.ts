import {
  Router
} from "express";

import {
  getAuthUser
} from "../controllers/user";

const router = Router();

router.get("/@me", getAuthUser);

export default router;