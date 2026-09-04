import express from 'express';
import 'dotenv/config';
import { config } from './config.js';

const app = express();
const PORT = config.port;

app.use(express.json());

app.get('/health', (_req, res) => {
  res.json({ status: 'ok' });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
