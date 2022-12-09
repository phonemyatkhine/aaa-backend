import { RequestHandler } from "express";

import * as campaignDal from "../../db/dal/campaign";
import { CampaignInput } from "../../db/models/campaign";

export const index: RequestHandler = async (req, res, next) => {
  campaignDal
    .getAll()
    .then((campaigns) => {
      return res
        .status(200)
        .json({ message: "Campaigns fetched successfully", data: campaigns });
    })
    .catch((err) => {
      return res.status(500).json({ message: "Internal server error" });
    });
};