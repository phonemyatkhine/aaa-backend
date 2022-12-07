import Campaign from "../models/campaign";
import { CampaignInput, CampaignOutput } from "../models/campaign";

export const create = async (payload: CampaignInput): Promise<CampaignOutput> => {
  const campaign = await Campaign.create(payload);
  return campaign;
};

export const update = async (
  id: number,
  payload: Partial<CampaignInput>
): Promise<CampaignOutput> => {
  const campaign = await Campaign.findByPk(id);
  if (!campaign) {
    var err = new Error("Campaign not found");
    err.code = 404;
    throw err;
  }
  const updatedCampaign = await (campaign as Campaign).update(payload);
  return updatedCampaign;
};

export const updateById = async (
  id: string,
  payload: Partial<CampaignInput>
): Promise<CampaignOutput> => {
  const campaign = await Campaign.findOne({
    where: {
      id,
    },
  });
  if (!campaign) {
    var err = new Error("Campaign not found");
    err.code = 404;
    throw err;
  }
  const updatedCampaign = await (campaign as Campaign).update(payload);
  return updatedCampaign;
};

export const getById = async (id: number): Promise<CampaignOutput> => {
  const campaign = await Campaign.findByPk(id);
  if (!campaign) {
    var err = new Error("Campaign not found");
    err.code = 404;
    throw err;
  }
  return campaign;
};

export const deleteById = async (id: string): Promise<boolean> => {
  const deletedCampaignCount = await Campaign.destroy({
    where: { id },
  });
  return !!deletedCampaignCount;
};

export const getAll = async (): Promise<CampaignOutput[]> => {
  return Campaign.findAll();
};
