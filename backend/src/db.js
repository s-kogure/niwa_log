import pg from 'pg';
import { config } from './config.js';

// アプリ実行時用のDB接続プール（authenticatorロール。RLSが機能する権限を絞った接続）
export const pool = new pg.Pool(config.db);

pool.on('error', (nodeError) => {
  console.error({ nodeError });
});

export function query(text, params) {
  return pool.query(text, params);
}

// 認証済みユーザーとして、RLSを効かせた状態でクエリを実行する
export async function queryAsUser(userId, text, params) {
  const client = await pool.connect();
  try {
    await client.query('BEGIN');

    await client.query('SET LOCAL ROLE authenticated');
    await client.query('SELECT set_config($1, $2, true)', ['request.jwt.claim.sub', userId]);

    const result = await client.query(text, params);

    await client.query('COMMIT');

    return result;
  } catch (err) {
    await client.query('ROLLBACK');
    throw err;
  } finally {
    client.release();
  }
}