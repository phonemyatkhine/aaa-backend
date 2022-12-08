import { DataTypes, Model, Optional } from "sequelize";
import sequelizeConnection from "../config";
import Campaign from "./campaign";
import DiscordGuild from "./discord-guild";
import DiscordRole from "./discord-role";
import TweetTransaction from "./tweet-transaction";
import UserDiscordGuild from "./user-discord-guild";
import UserDiscordRole from "./user-discord-role";

interface UserAttributes {
  id: number;
  discordUserId: string;
  discordUsername: string;
  twitterUserId: string;
  twitterUsername: string;
  pacaPoints: number;
  createdAt?: Date;
  updatedAt?: Date;
  deletedAt?: Date;
}
export interface UserInput
  extends Optional<
    UserAttributes,
    "id" | "discordUserId" | "discordUsername" | "twitterUserId" | "twitterUsername" | "pacaPoints"
  > {}
export interface UserOutput extends Required<UserAttributes> {}

class User
  extends Model<UserAttributes, UserInput>
  implements UserAttributes
{
  public id!: number;
  public discordUserId!: string;
  public discordUsername!: string;
  public twitterUserId!: string;
  public twitterUsername!: string;
  public pacaPoints!: number;

  // timestamps!
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
  public readonly deletedAt!: Date;
}

User.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    discordUserId: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
    discordUsername: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    twitterUserId: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    twitterUsername: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    pacaPoints: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0,
    }
  },
  {
    timestamps: true,
    sequelize: sequelizeConnection,
  }
);

User.belongsToMany(DiscordGuild, { through: "User_Discord_Guild" });
User.belongsToMany(DiscordRole, { through: "User_Discord_Role" });
User.belongsToMany(Campaign, { through: "Tweet_Transaction" });
User.hasMany(TweetTransaction, { foreignKey: "userId" });
User.hasMany(UserDiscordGuild, { foreignKey: "userId" });
User.hasMany(UserDiscordRole, { foreignKey: "userId" });

export default User;