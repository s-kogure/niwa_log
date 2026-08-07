-- 006_revoke_default_privileges.sql

-- publicスキーマで今後作成されるオブジェクトについて、
-- anon / authenticated への自動権限付与を停止する

ALTER DEFAULT PRIVILEGES
FOR ROLE postgres
IN SCHEMA public
REVOKE ALL PRIVILEGES ON TABLES
FROM anon, authenticated;

ALTER DEFAULT PRIVILEGES
FOR ROLE postgres
IN SCHEMA public
REVOKE ALL PRIVILEGES ON SEQUENCES
FROM anon, authenticated;

ALTER DEFAULT PRIVILEGES
FOR ROLE postgres
IN SCHEMA public
REVOKE EXECUTE ON FUNCTIONS
FROM anon, authenticated;

ALTER DEFAULT PRIVILEGES
FOR ROLE postgres
REVOKE EXECUTE ON FUNCTIONS
FROM PUBLIC;
