import express from 'express';
import healthRouter from './routes/health.js';
import verificationRouter from './routes/verification.js';
import { notFoundHandler, errorHandler } from './middleware/errorHandler.js';

const app = express();

app.use(express.json());

app.use(healthRouter);

app.use(verificationRouter);

app.use(notFoundHandler);
app.use(errorHandler);

export default app;