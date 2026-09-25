import express from 'express';
import { config } from './config.js';
import healthRouter from './routes/health.js';
import verificationRouter from './routes/verification.js';
import { notFoundHandler, errorHandler } from './middleware/errorHandler.js';

const app = express();

app.use(express.json());

app.use(healthRouter);

// 検証用ルートは開発環境でのみ有効にする（本番ではマウントしない）
if (config.nodeEnv === 'development') {
  app.use(verificationRouter);
}

app.use(notFoundHandler);
app.use(errorHandler);

export default app;