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

export const show: RequestHandler = async (req, res, next) => {
  const { id } = req.params;
  campaignDal
    .getById(parseInt(id))
    .then((campaign) => {
      return res
        .status(200)
        .json({ message: "Campaign fetched successfully", data: campaign });
    })
    .catch((err) => {
      return res.status(err.code).json({ message: err.message });
    });
};

export const store: RequestHandler = async (req, res, next) => {
  campaignDal
    .create(req.body as CampaignInput)
    .then((campaign) => {
      return res
        .status(201)
        .json({ message: "Campaign created successfully", data: campaign });
    })
    .catch((err) => {
      return res.status(422).json({ message: err.message });
    });
};

export const destroy: RequestHandler = async (req, res, next) => {
  const { id } = req.params;
  campaignDal.deleteById(id).then((isDeleted) => {
    if (isDeleted) {
      return res.status(200).json({ message: "Campaign deleted successfully" });
    }
    return res.status(404).json({ message: "Campaign not found" });
  });
};

export const update: RequestHandler = async (req, res, next) => {
  const { id } = req.params;
  campaignDal
    .updateById(id, req.body as CampaignInput)
    .then((campaign) => {
      return res
        .status(200)
        .json({ message: "Campaign updated successfully", data: campaign });
    })
    .catch((err) => {
      return res.status(err.code).json({ message: err.message });
    });
};
