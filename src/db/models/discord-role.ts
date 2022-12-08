import { DataTypes, Model, Optional } from "sequelize";
import sequelizeConnection from "../config";
import Campaign from "./campaign";
import CampaignRoleRequirement from "./campaign-role-requirement";
import DiscordGuild from "./discord-guild";
import User from "./user";
import UserDiscordRole from "./user-discord-role";

interface DiscordRoleAttributes {
  id: string;
  discordGuildId: string;
  name: string;
  createdAt?: Date;
  updatedAt?: Date;
  deletedAt?: Date;
}
export interface DiscordRoleInput
  extends Optional<
    DiscordRoleAttributes,
    "id" | "discordGuildId" | "name"
  > {}
export interface DiscordRoleOutput extends Required<DiscordRoleAttributes> {}

class DiscordRole
  extends Model<DiscordRoleAttributes, DiscordRoleInput>
  implements DiscordRoleAttributes
{
  public id!: string;
  public discordGuildId!: string;
  public name!: string;

  // timestamps!
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
  public readonly deletedAt!: Date;
}

DiscordRole.init(
  {
    id: {
      type: DataTypes.STRING,
      primaryKey: true,
    },
    discordGuildId: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: true,
    }
  },
  {
    timestamps: true,
    sequelize: sequelizeConnection,
  }
);
// DiscordRole.belongsTo(DiscordGuild, { foreignKey: "guildId" });
// DiscordRole.belongsToMany(User, { through: "User_Discord_Role" })
// DiscordRole.belongsToMany(Campaign, { through: "Campaign_Role_Requirement" })
DiscordRole.hasMany(UserDiscordRole, { foreignKey: "discordRoleId" });
DiscordRole.hasMany(CampaignRoleRequirement, { foreignKey: "discordRoleId" });

export default DiscordRole;