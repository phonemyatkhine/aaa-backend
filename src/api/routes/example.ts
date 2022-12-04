import { Router } from "express";

import { index, show, store, destroy, update } from "../controllers/example";

const router = Router();

router.get("/", index);
router.post("/", store);
router.get("/:slug", show);
router.put("/:slug", update);
router.delete("/:slug", destroy);

export default router;