import { RequestHandler } from "express";

import * as tweetTransactionDal from "../../db/dal/tweet-transaction";
import * as userDal from "../../db/dal/user";
import * as campaignDal from "../../db/dal/campaign";
import * as campaignRoleRequirementDal from "../../db/dal/campaign-role-requirement";
import * as userDiscordRoleDal from "../../db/dal/user-discord-role";
import { TweetTransactionInput } from "../../db/models/tweet-transaction";

export const store: RequestHandler = async (req, res, next) => {
  const { discorduserid : discordUserId } = req.headers;
  const user = await userDal.getByDiscordUserId(discordUserId as string).catch(() => {
    res.status(422).json({ message: "User not found" });
    return;
  });
  const campaignId = req.body.campaignId;
  const campaign = await campaignDal.getById(campaignId).catch(() => {
    res.status(422).json({ message: "Campaign not found" });
    return;
  });
  if(!!campaign && !!user) {
    const rewardPoint = campaign.pointPerTweet;
    const requiredRoles = await campaignRoleRequirementDal.getByCampaignId(campaignId);
    const userRoles = await userDiscordRoleDal.getByUserId(user.id);

    // check if userRoles contain all the requiredRoles
    const userRoleIds = userRoles.map((userRole) => userRole.discordRoleId);
    const requiredRoleIds = requiredRoles.map((requiredRole) => requiredRole.discordRoleId);
    const isEligible = requiredRoleIds.every((requiredRoleId) => userRoleIds.includes(requiredRoleId));
    if(!isEligible) {
      return res.status(422).json({ message: "User is not eligible for this campaign" });
    }
  
    tweetTransactionDal
      .create({
        userId: user.id,
        campaignId,
        rewardPoint,
        status : true,
      } as TweetTransactionInput)
      .then(async (campaign) => {
        let transactions = await tweetTransactionDal.getByUserId(user.id);
        let totalPoints = 0;
        if(!!transactions) {
          transactions.forEach((transaction) => {
            totalPoints += transaction.rewardPoint;
          })
        }
        userDal.update(user.id, { pacaPoints: totalPoints });
        return res
          .status(201)
          .json({ message: "Successfully updated" });
      })
      .catch((err) => {
        return res.status(422).json({ message: err.message });
      });
  }
};