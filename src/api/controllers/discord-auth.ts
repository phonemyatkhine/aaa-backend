
import { RequestHandler } from 'express';

export const login: RequestHandler = async (req, res) => {
    console.log(req.body);
    res.send(req.body);
}

export const redirect: RequestHandler = async (req, res) => {
    console.log(req.body);
    res.send(req.body);
}
