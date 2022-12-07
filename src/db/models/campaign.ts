import { DataTypes, Model, Optional } from "sequelize";
import sequelizeConnection from "../config";

interface CampaignAttributes {
  id: number;
  name: string;
  tweetId: string;
  guildId: string;
  createdAt?: Date;
  updatedAt?: Date;
  deletedAt?: Date;
}
export interface CampaignInput
  extends Optional<
    CampaignAttributes,
    "id" | "name" | "tweetId" | "guildId"
  > {}
export interface CampaignOutput extends Required<CampaignAttributes> {}

class Campaign
  extends Model<CampaignAttributes, CampaignInput>
  implements CampaignAttributes
{
  public id!: number;
  public name!: string;
  public tweetId!: string;
  public guildId!: string;

  // timestamps!
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
  public readonly deletedAt!: Date;
}

Campaign.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    tweetId: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    guildId: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    timestamps: true,
    sequelize: sequelizeConnection,
  }
);

export default Campaign;