import { RequestHandler } from "express";

export const index: RequestHandler = async (req, res, next) => {
    res.send("Hello index!");
}

export const store: RequestHandler = async (req, res, next) => {
    res.send("Hello store!");
}

export const show: RequestHandler = async (req, res, next) => {
    const { slug } = req.params;
    res.send("Hello show!" + slug);
}

export const update: RequestHandler = async (req, res, next) => {
    const { slug } = req.params;
    res.send("Hello update!" + slug);
}

export const destroy: RequestHandler = async (req, res, next) => {
    const { slug } = req.params;
    res.send("Hello destroy!" + slug);
}