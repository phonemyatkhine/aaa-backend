import {
  Router
} from "express";

import {
  index,
} from "../controllers/campaign";

const router = Router();

router.get("/", index);

export default router;