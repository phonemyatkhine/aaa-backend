import CampaignRoleRequirement from "../models/campaign-role-requirement";
import { CampaignRoleRequirementInput, CampaignRoleRequirementOutput } from "../models/campaign-role-requirement";

export const create = async (payload: CampaignRoleRequirementInput): Promise<CampaignRoleRequirementOutput> => {
  const campaignRoleRequirement = await CampaignRoleRequirement.create(payload);
  return campaignRoleRequirement;
};
``
export const update = async (
  id: number,
  payload: Partial<CampaignRoleRequirementInput>
): Promise<CampaignRoleRequirementOutput> => {
  const campaignRoleRequirement = await CampaignRoleRequirement.findByPk(id);
  if (!campaignRoleRequirement) {
    var err = new Error("CampaignRoleRequirement not found");
    err.code = 404;
    throw err;
  }
  const updatedCampaignRoleRequirement = await (campaignRoleRequirement as CampaignRoleRequirement).update(payload);
  return updatedCampaignRoleRequirement;
};

export const updateById = async (
  id: string,
  payload: Partial<CampaignRoleRequirementInput>
): Promise<CampaignRoleRequirementOutput> => {
  const campaignRoleRequirement = await CampaignRoleRequirement.findOne({
    where: {
      id,
    },
  });
  if (!campaignRoleRequirement) {
    var err = new Error("CampaignRoleRequirement not found");
    err.code = 404;
    throw err;
  }
  const updatedCampaignRoleRequirement = await (campaignRoleRequirement as CampaignRoleRequirement).update(payload);
  return updatedCampaignRoleRequirement;
};

export const getById = async (id: number): Promise<CampaignRoleRequirementOutput> => {
  const campaignRoleRequirement = await CampaignRoleRequirement.findByPk(id);
  if (!campaignRoleRequirement) {
    var err = new Error("CampaignRoleRequirement not found");
    err.code = 404;
    throw err;
  }
  return campaignRoleRequirement;
};

export const getByCampaignId = async (campaignId: number): Promise<CampaignRoleRequirementOutput[]> => {
  const campaignRoleRequirement = await CampaignRoleRequirement.findAll({
    where: {
      campaignId,
    }
  });
  if (!campaignRoleRequirement) {
    var err = new Error("CampaignRoleRequirement not found");
    err.code = 404;
    throw err;
  }
  return campaignRoleRequirement;
};

export const deleteById = async (id: string): Promise<boolean> => {
  const deletedCampaignRoleRequirementCount = await CampaignRoleRequirement.destroy({
    where: { id },
  });
  return !!deletedCampaignRoleRequirementCount;
};

export const getAll = async (): Promise<CampaignRoleRequirementOutput[]> => {
  return CampaignRoleRequirement.findAll();
};