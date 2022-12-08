import { DataTypes, Model, Optional } from "sequelize";
import sequelizeConnection from "../config";

interface TweetTransactionAttributes {
  id: number;
  userId: number;
  campaignId: number;
  rewardPoint: number;
  status: boolean;
  createdAt?: Date;
  updatedAt?: Date;
  deletedAt?: Date;
}
export interface TweetTransactionInput
  extends Optional<
    TweetTransactionAttributes,
    "id" | "userId" | "campaignId" | "rewardPoint" | "status" 
  > {}
export interface TweetTransactionOutput extends Required<TweetTransactionAttributes> {}

class TweetTransaction
  extends Model<TweetTransactionAttributes, TweetTransactionInput>
  implements TweetTransactionAttributes
{
  public id!: number;
  public userId!: number;
  public campaignId!: number;
  public rewardPoint!: number;
  public status!: boolean;

  // timestamps!
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
  public readonly deletedAt!: Date;
}

TweetTransaction.init(
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
    campaignId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    rewardPoint : {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    status: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: true,
    }
  },
  {
    timestamps: true,
    sequelize: sequelizeConnection,
  }
);

export default TweetTransaction;