import 'dotenv/config';

const required = [
  'POSTGRES_HOST',
  'POSTGRES_PORT',
  'POSTGRES_DB',
  'POSTGRES_USER',
  'POSTGRES_PASSWORD',
  'AUTHENTICATOR_USER',
  'AUTHENTICATOR_PASSWORD',
  'SUPABASE_URL',
  'SUPABASE_ANON_KEY',
];

for (const key of required) {
  if (!process.env[key]) {
    throw new Error(`環境変数 ${key}が設定されていません`);
  }
}


export const config = {
  port: process.env.PORT || 3000,
  nodeEnv: process.env.NODE_ENV,
  supabaseUrl: process.env.SUPABASE_URL,
  supabaseAnonKey: process.env.SUPABASE_ANON_KEY,
  // アプリ実行時の接続（authenticatorロール。RLSが機能する権限を絞った接続）
  db: {
    host: process.env.POSTGRES_HOST,
    port: process.env.POSTGRES_PORT,
    database: process.env.POSTGRES_DB,
    user: process.env.AUTHENTICATOR_USER,
    password: process.env.AUTHENTICATOR_PASSWORD,
  },
  // migration専用の接続（postgresスーパーユーザー。CREATE TABLE等の管理操作用）
  migrationDb: {
    host: process.env.POSTGRES_HOST,
    port: process.env.POSTGRES_PORT,
    database: process.env.POSTGRES_DB,
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
  },
};