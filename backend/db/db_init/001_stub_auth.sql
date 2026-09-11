create schema if not exists auth;

create table if not exists auth.users (
    id uuid primary key default gen_random_uuid ()
    -- ローカル開発用スタブ: 004のtriggerがidしか参照しないため最小構成
);

create role anon nologin;

create role authenticated nologin;

create role service_role nologin;

create function auth.uid() returns uuid
  language sql stable
  as $$
    select nullif(current_setting('request.jwt.claim.sub', true), '')::uuid
  $$;