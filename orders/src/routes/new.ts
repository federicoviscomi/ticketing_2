import express, {Request, Response} from 'express';
import {requireAuth, validateRequest} from '@procigatto/common';
import {body} from 'express-validator';
import * as mongoose from 'mongoose';

const router = express.Router();

router.post(
    '/api/orders',
    requireAuth, [
        body('ticket')
            .not()
            .isEmpty()
            .custom((input: string) => mongoose.Types.ObjectId.isValid(input))
            .withMessage('ticket id must be provided')
    ],
    validateRequest,
    async (req: Request, res: Response) => {
        res.send({});
    }
);

export {router as newOrderRouter};