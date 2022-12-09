import { RequestHandler } from "express";

import * as userDal from "../../db/dal/user";

export const getAuthUser: RequestHandler = async (req, res, next) => {
  const { discorduserid : discordUserId } = req.headers;
  const user = await userDal.getByDiscordUserId(discordUserId as string);
  if(!user) {
    return res.status(404).json({ message: "User not found"});
  }

  return res.status(200).json({
    message: "User fetched successfully",
    data: user,
  });
};