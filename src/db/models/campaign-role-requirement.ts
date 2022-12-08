import { DataTypes, Model, Optional } from "sequelize";
import sequelizeConnection from "../config";

interface CampaignRoleRequirementAttributes {
  id: number;
  campaignId: number;
  discordRoleId: number;
  createdAt?: Date;
  updatedAt?: Date;
  deletedAt?: Date;
}
export interface CampaignRoleRequirementInput
  extends Optional<
    CampaignRoleRequirementAttributes,
    "id" | "campaignId" | "discordRoleId"
  > {}
export interface CampaignRoleRequirementOutput extends Required<CampaignRoleRequirementAttributes> {}

class CampaignRoleRequirement
  extends Model<CampaignRoleRequirementAttributes, CampaignRoleRequirementInput>
  implements CampaignRoleRequirementAttributes
{
  public id!: number;
  public campaignId!: number;
  public discordRoleId!: number;

  // timestamps!
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
  public readonly deletedAt!: Date;
}

CampaignRoleRequirement.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    campaignId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    discordRoleId: {
      type: DataTypes.BIGINT,
      allowNull: false,
    },
  },
  {
    timestamps: true,
    sequelize: sequelizeConnection,
  }
);

export default CampaignRoleRequirement;