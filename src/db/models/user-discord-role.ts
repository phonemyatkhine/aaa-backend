import { DataTypes, Model, Optional } from "sequelize";
import sequelizeConnection from "../config";

interface UserDiscordRoleAttributes {
  id: number;
  userId: number;
  discordRoleId: string;
  createdAt?: Date;
  updatedAt?: Date;
  deletedAt?: Date;
}
export interface UserDiscordRoleInput
  extends Optional<
    UserDiscordRoleAttributes,
    "id" | "userId" | "discordRoleId"
  > {}
export interface UserDiscordRoleOutput extends Required<UserDiscordRoleAttributes> {}

class UserDiscordRole
  extends Model<UserDiscordRoleAttributes, UserDiscordRoleInput>
  implements UserDiscordRoleAttributes
{
  public id!: number;
  public userId!: number;
  public discordRoleId!: string;

  // timestamps!
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
  public readonly deletedAt!: Date;
}

UserDiscordRole.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    userId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    discordRoleId: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    indexes: [{
      unique: true,
      fields: ["discordRoleId", "userId"],
    }],
    timestamps: true,
    sequelize: sequelizeConnection,
  }
);

export default UserDiscordRole;