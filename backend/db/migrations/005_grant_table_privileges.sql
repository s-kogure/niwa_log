-- 005_grant_table_privileges.sql

-- 既存10テーブルへの自動付与済み権限を初期化
REVOKE ALL PRIVILEGES
ON TABLE
  public.users,
  public.regions,
  public.gardens,
  public.plants,
  public.user_plants,
  public.user_plant_tags,
  public.watering_logs,
  public.observation_logs,
  public.weather_cache,
  public.plant_master_requests
FROM anon, authenticated;

-- 以下、authenticatedへ必要分だけGRANT


GRANT SELECT
ON TABLE public.users
TO authenticated;

GRANT SELECT
ON TABLE public.regions
TO authenticated;

GRANT SELECT
ON TABLE public.plants
TO authenticated;

GRANT SELECT, INSERT, UPDATE
ON TABLE public.gardens
TO authenticated;

GRANT SELECT, INSERT, UPDATE
ON TABLE public.user_plants
TO authenticated;

GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLE public.user_plant_tags
TO authenticated;

GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLE public.observation_logs
TO authenticated;

GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLE public.watering_logs
TO authenticated;

GRANT SELECT
ON TABLE public.weather_cache
TO authenticated;

GRANT INSERT
ON TABLE public.plant_master_requests
TO authenticated;
