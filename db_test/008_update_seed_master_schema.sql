-- 008_update_seed_master_schema.sql

begin;

-- =========================================================
-- regions
-- =========================================================

alter table public.regions
add column is_active boolean not null default true;


-- =========================================================
-- plants: aliases
-- =========================================================

alter table public.plants
add column aliases text[] not null default '{}'::text[];


-- =========================================================
-- plants: growth_form
-- =========================================================

-- 既存レコードが存在していてもmigrationできるよう、
-- いったんNULL許容で追加する
alter table public.plants
add column growth_form text;

-- 既存レコードは暫定的に unknown とする
update public.plants
set growth_form = 'unknown'
where growth_form is null;

alter table public.plants
alter column growth_form set not null;

alter table public.plants
add constraint plants_growth_form_check
check (
  growth_form in (
    'herbaceous',
    'shrub',
    'tree',
    'vine',
    'other',
    'unknown'
  )
);


-- =========================================================
-- plants: plant_category
-- =========================================================

-- 旧categoryの tree が既存データに残っていた場合、
-- 新categoryへ機械的に変換できないためmigrationを停止する
do $$
begin
  if exists (
    select 1
    from public.plants
    where plant_category = 'tree'
  ) then
    raise exception
      'plants.plant_category に旧値 tree が存在します。新しい plant_category へ分類し直してからmigrationを再実行してください。';
  end if;
end
$$;

alter table public.plants
drop constraint if exists plants_plant_category_check;

alter table public.plants
add constraint plants_plant_category_check
check (
  plant_category in (
    'foliage',
    'flower',
    'orchid',
    'herb',
    'vegetable',
    'fruit',
    'succulent',
    'other'
  )
);

commit;
