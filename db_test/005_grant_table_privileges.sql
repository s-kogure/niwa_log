-- 005_grant_table_privileges.sql

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
