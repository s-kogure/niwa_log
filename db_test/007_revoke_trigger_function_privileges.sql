-- 007_revoke_trigger_function_privileges.sql

-- trigger専用関数を一般ロールから直接実行できないようにする
REVOKE EXECUTE
ON FUNCTION public.handle_new_user()
FROM PUBLIC, anon, authenticated, service_role;

REVOKE EXECUTE
ON FUNCTION public.set_updated_at()
FROM PUBLIC, anon, authenticated, service_role;
