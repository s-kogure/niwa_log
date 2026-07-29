-- 001_create_tables.sql

create extension if not exists pgcrypto;

create table users (
  id uuid primary key default gen_random_uuid(),

  auth_user_id uuid unique
    references auth.users(id)
    on delete set null,

  created_at timestamptz not null default now(),
  deleted_at timestamptz,

  check (
    deleted_at is not null
    or auth_user_id is not null
  )
);

create table regions (
  id uuid primary key default gen_random_uuid(),
  municipality_code text not null unique,
  municipality_name text not null,
  prefecture_name text not null
);

create table gardens (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references users(id),
  is_public boolean not null default false,

  region_id uuid not null references regions(id),
  name text,

  ground_type text not null check (
    ground_type in (
      'soil',
      'concrete',
      'gravel',
      'balcony',
      'other',
      'unknown'
    )
  ),
  rain_exposure text not null check(
    rain_exposure in ('exposed','partial_cover','covered','unknown')
  ),
  wind_exposure text not null check(
    wind_exposure in ('weak','moderate','strong','unknown')
  ),

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

create table plants (
  id uuid primary key default gen_random_uuid(),
  parent_id uuid references plants(id),
  name text not null unique,

  plant_category text not null check(
    plant_category in ('herb', 'foliage', 'vegetable', 'succulent', 'flower', 'tree', 'other')
  ),

  preferred_moisture_level numeric(3,2) not null check (
    preferred_moisture_level >= 0.05
    and preferred_moisture_level <= 1.00
  ),

  watering_amount text not null check (
    watering_amount in ('light', 'moderate', 'heavy')
  ),

  watering_pace text,
  watering_notes text,

  reference_url text,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table user_plants (
  id uuid primary key default gen_random_uuid(),

  garden_id uuid not null references gardens(id),
  plant_id uuid not null references plants(id),

  nickname text,

  planting_method text not null default 'pot' check (
    planting_method in ('pot', 'ground')
  ),

  pot_material text check (
    pot_material in ('terracotta', 'plastic', 'ceramic', 'unknown')
  ),

  soil_profile text check (
    soil_profile in ('well_draining', 'normal', 'moisture_retentive', 'unknown')
  ),

  growth_stage text check (
    growth_stage in ('seedling', 'growing', 'flowering', 'fruiting', 'mature', 'dormant', 'unknown')
  ),

  health_status text check (
    health_status in ('healthy', 'weak', 'recovering', 'critical', 'dead', 'unknown')
  ),

  memo text,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  deleted_at timestamptz
);

create table user_plant_tags (
  id uuid primary key default gen_random_uuid(),
  user_plant_id uuid not null references user_plants(id),

  name text not null,

  created_at timestamptz not null default now(),
  unique (user_plant_id, name)
);

create table watering_logs (
  id uuid primary key default gen_random_uuid(),
  user_plant_id uuid not null references user_plants(id),

  watered_at timestamptz not null,

  created_at timestamptz not null default now()
);

create table observation_logs (
  id uuid primary key default gen_random_uuid(),
  user_plant_id uuid not null references user_plants(id),
  observed_at timestamptz not null,
  memo text not null,
  created_at timestamptz not null default now()
);

-- 天気予報系テーブル
create table weather_cache (
  id uuid primary key default gen_random_uuid(),
  source text not null,
  region_id uuid not null references regions(id),

  -- 天気
  weather_condition text not null check (
    weather_condition in (
      'clear',
      'partly_cloudy',
      'cloudy',
      'rain',
      'heavy_rain',
      'snow',
      'thunderstorm',
      'other'
    )
  ),

  -- 気温
  temperature_c numeric(3,1) not null check (
    temperature_c >= -30.0
    and temperature_c <= 60.0
  ),
  -- 湿度
  humidity_percent numeric(3) not null check (
    humidity_percent >= 0
    and humidity_percent <= 100
  ),
  -- 降水確率
  precipitation_probability  numeric(3) check (
    precipitation_probability >= 0
    and precipitation_probability <= 100
  ),
  -- 降水量
  precipitation_mm numeric(5,1) not null check (
    precipitation_mm >= 0
  ),
  -- メタ情報
  target_at timestamptz not null,
  fetched_at timestamptz not null default now(),
  data_type text not null check (
    data_type in ('current', 'forecast')
  ),
  unique (region_id, target_at, data_type)
);

create table plant_master_requests (
  id uuid primary key default gen_random_uuid(),

  requested_name text not null,
  submitted_by uuid not null references users(id),

  -- status text not null default 'pending' check (
  --   status in ('pending', 'approved', 'rejected')
  -- ),

  created_at timestamptz not null default now()
  -- updated_at timestamptz not null default now()
);


-- functions

CREATE FUNCTION set_updated_at()
returns trigger
language plpgsql
as $$
begin
  NEW.updated_at = now();
  RETURN NEW;
end;
$$;

-- gardens
CREATE TRIGGER set_gardens_updated_at
BEFORE UPDATE ON gardens
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- plants
CREATE TRIGGER set_plants_updated_at
BEFORE UPDATE ON plants
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- user_plants
CREATE TRIGGER set_user_plants_updated_at
BEFORE UPDATE ON user_plants
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

-- plant_master_requests
-- CREATE TRIGGER set_plant_master_requests_updated_at
-- BEFORE UPDATE ON plant_master_requests
-- FOR EACH ROW
-- EXECUTE FUNCTION set_updated_at();


-- INDEX

CREATE INDEX idx_gardens_owner_id
ON gardens (owner_id);

CREATE INDEX idx_user_plants_garden_id
ON user_plants (garden_id);

CREATE INDEX idx_gardens_region_id
ON gardens (region_id);

CREATE INDEX idx_watering_logs_user_plant_id
ON watering_logs (user_plant_id);

CREATE INDEX idx_observation_logs_user_plant_id
ON observation_logs (user_plant_id);

CREATE INDEX idx_plants_parent_id
ON plants (parent_id);
