import TweetTransaction from "../models/tweet-transaction";
import { TweetTransactionInput, TweetTransactionOutput } from "../models/tweet-transaction";

export const create = async (payload: TweetTransactionInput): Promise<TweetTransactionOutput> => {
  const tweetTransaction = await TweetTransaction.create(payload);
  return tweetTransaction;
};

export const update = async (
  id: number,
  payload: Partial<TweetTransactionInput>
): Promise<TweetTransactionOutput> => {
  const tweetTransaction = await TweetTransaction.findByPk(id);
  if (!tweetTransaction) {
    var err = new Error("TweetTransaction not found");
    err.code = 404;
    throw err;
  }
  const updatedTweetTransaction = await (tweetTransaction as TweetTransaction).update(payload);
  return updatedTweetTransaction;
};

export const updateById = async (
  id: string,
  payload: Partial<TweetTransactionInput>
): Promise<TweetTransactionOutput> => {
  const tweetTransaction = await TweetTransaction.findOne({
    where: {
      id,
    },
  });
  if (!tweetTransaction) {
    var err = new Error("TweetTransaction not found");
    err.code = 404;
    throw err;
  }
  const updatedTweetTransaction = await (tweetTransaction as TweetTransaction).update(payload);
  return updatedTweetTransaction;
};

export const getById = async (id: number): Promise<TweetTransactionOutput> => {
  const tweetTransaction = await TweetTransaction.findByPk(id);
  if (!tweetTransaction) {
    var err = new Error("TweetTransaction not found");
    err.code = 404;
    throw err;
  }
  return tweetTransaction;
};

export const deleteById = async (id: string): Promise<boolean> => {
  const deletedTweetTransactionCount = await TweetTransaction.destroy({
    where: { id },
  });
  return !!deletedTweetTransactionCount;
};

export const getAll = async (): Promise<TweetTransactionOutput[]> => {
  return TweetTransaction.findAll();
};
