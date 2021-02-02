import express from 'express';
import 'express-async-errors';
import {json} from 'body-parser';

import mongoose from 'mongoose';
import cookieSession from 'cookie-session';
import {currentUser, errorHandler, NotFoundError} from '@procigatto/common';
import {createTicketRouter} from './routes/new';
import {showTicketRouter} from './routes/show';
import {indexTicketRouter} from './routes/index';
import {updateTicketRouter} from './routes/update';

const app = express();
app.set('trust proxy', true);
app.use(json());
app.use(
    cookieSession({
        signed: false,
        secure: true
    })
);

app.use(currentUser);

app.use(createTicketRouter);

app.use(showTicketRouter);

app.use(indexTicketRouter);

app.use(updateTicketRouter);

app.all('*', async (req, res) => {
    throw new NotFoundError();
});

app.use(errorHandler);

const start = async () => {
    if (!process.env.JWT_KEY) {
        throw new Error('Error: JWT_KEY is undefined');
    }
    if (!process.env.MONGO_URI) {
        throw new Error('Error: MONGO_URI is undefined');
    }
    try {
        await mongoose.connect(process.env.MONGO_URI, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
            useCreateIndex: true
        });
        console.log('connected to mongodb');
    } catch (err) {
        console.error(err);
    }

    app.listen(3000, () => {
        console.log('Listening on port 3000!!!!!!!!');
    });

}

start();