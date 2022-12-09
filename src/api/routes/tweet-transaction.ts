import {
  Router
} from "express";

import {
  store
} from "../controllers/tweet-transaction";

const router = Router();

router.post("/", store);

export default router;