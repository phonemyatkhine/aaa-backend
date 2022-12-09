import { RequestHandler } from "express";

import * as tweetTransactionDal from "../../db/dal/tweet-transaction";
import * as userDal from "../../db/dal/user";
import * as campaignDal from "../../db/dal/campaign";
import { TweetTransactionInput } from "../../db/models/tweet-transaction";

export const store: RequestHandler = async (req, res, next) => {
  const { discorduserid : discordUserId } = req.headers;
  const user = await userDal.getByDiscordUserId(discordUserId as string);
  const campaignId = req.body.campaignId;
  const campaign = await campaignDal.getById(campaignId);
  const rewardPoint = campaign.pointPerTweet;

  tweetTransactionDal
    .create({
      userId: user.id,
      campaignId,
      rewardPoint,
      status : true,
    } as TweetTransactionInput)
    .then((campaign) => {
      return res
        .status(201)
        .json({ message: "Successfully updated" });
    })
    .catch((err) => {
      return res.status(422).json({ message: err.message });
    });
};