import {
  Router
} from "express";

import {
  index,
  // show,
  // store,
  // destroy,
  // update
} from "../controllers/campaign";

const router = Router();

router.get("/", index);
// router.post("/", store);
// router.get("/:id", show);
// router.put("/:id", update);
// router.delete("/:id", destroy);

export default router;