import pg from 'pg';
import { config } from './config.js';

// アプリ・migration双方から共有するDB接続プール
export const pool = new pg.Pool(config.db);

pool.on('error', (nodeError) => {
  console.error({ nodeError });
});

export function query(text, params) {
  return pool.query(text, params);
}
