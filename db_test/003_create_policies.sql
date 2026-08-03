CREATE POLICY users_select_own
ON public.users
FOR SELECT
TO authenticated
USING (
  auth_user_id = (SELECT auth.uid())
);

CREATE POLICY regions_select_authenticated
ON public.regions
FOR SELECT
TO authenticated
USING (true);

CREATE POLICY gardens_select_owner_or_public
ON public.gardens
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.users
    WHERE users.id = gardens.owner_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
  OR (
    is_public = true
    AND deleted_at IS NULL
  )
);

CREATE POLICY gardens_insert_own
ON public.gardens
FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM public.users
    WHERE users.id = gardens.owner_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY gardens_update_own
ON public.gardens
FOR UPDATE
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.users
    WHERE users.id = gardens.owner_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
)
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM public.users
    WHERE users.id = gardens.owner_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY plants_select_authenticated
ON public.plants
FOR SELECT
TO authenticated
USING (true);

CREATE POLICY user_plants_select_owner_or_public
ON public.user_plants
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.gardens
    WHERE gardens.id = user_plants.garden_id
      AND (
        EXISTS (
          SELECT 1
          FROM public.users
          WHERE users.id = gardens.owner_id
            AND users.auth_user_id = (SELECT auth.uid())
        )
        OR (
          gardens.is_public = true
          AND gardens.deleted_at IS NULL
        )
      )
  )
);

CREATE POLICY user_plants_insert_own
ON public.user_plants
FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM public.gardens
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE gardens.id = user_plants.garden_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY user_plants_update_own
ON public.user_plants
FOR UPDATE
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.gardens
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE gardens.id = user_plants.garden_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
)
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM public.gardens
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE gardens.id = user_plants.garden_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY user_plant_tags_select_visible_parent
ON public.user_plant_tags
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    WHERE user_plants.id = user_plant_tags.user_plant_id
  )
);

CREATE POLICY user_plant_tags_insert_own
ON public.user_plant_tags
FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    JOIN public.gardens
      ON gardens.id = user_plants.garden_id
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE user_plants.id = user_plant_tags.user_plant_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY user_plant_tags_update_own
ON public.user_plant_tags
FOR UPDATE
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    JOIN public.gardens
      ON gardens.id = user_plants.garden_id
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE user_plants.id = user_plant_tags.user_plant_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
)
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    JOIN public.gardens
      ON gardens.id = user_plants.garden_id
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE user_plants.id = user_plant_tags.user_plant_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY user_plant_tags_delete_own
ON public.user_plant_tags
FOR DELETE
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    JOIN public.gardens
      ON gardens.id = user_plants.garden_id
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE user_plants.id = user_plant_tags.user_plant_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY watering_logs_select_own
ON public.watering_logs
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    JOIN public.gardens
      ON gardens.id = user_plants.garden_id
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE user_plants.id = watering_logs.user_plant_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY watering_logs_insert_own
ON public.watering_logs
FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    JOIN public.gardens
      ON gardens.id = user_plants.garden_id
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE user_plants.id = watering_logs.user_plant_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY watering_logs_update_own
ON public.watering_logs
FOR UPDATE
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    JOIN public.gardens
      ON gardens.id = user_plants.garden_id
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE user_plants.id = watering_logs.user_plant_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
)
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    JOIN public.gardens
      ON gardens.id = user_plants.garden_id
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE user_plants.id = watering_logs.user_plant_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY watering_logs_delete_own
ON public.watering_logs
FOR DELETE
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    JOIN public.gardens
      ON gardens.id = user_plants.garden_id
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE user_plants.id = watering_logs.user_plant_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY observation_logs_select_visible_parent
ON public.observation_logs
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    WHERE user_plants.id = observation_logs.user_plant_id
  )
);

CREATE POLICY observation_logs_insert_own
ON public.observation_logs
FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    JOIN public.gardens
      ON gardens.id = user_plants.garden_id
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE user_plants.id = observation_logs.user_plant_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY observation_logs_update_own
ON public.observation_logs
FOR UPDATE
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    JOIN public.gardens
      ON gardens.id = user_plants.garden_id
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE user_plants.id = observation_logs.user_plant_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
)
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    JOIN public.gardens
      ON gardens.id = user_plants.garden_id
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE user_plants.id = observation_logs.user_plant_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY observation_logs_delete_own
ON public.observation_logs
FOR DELETE
TO authenticated
USING (
  EXISTS (
    SELECT 1
    FROM public.user_plants
    JOIN public.gardens
      ON gardens.id = user_plants.garden_id
    JOIN public.users
      ON users.id = gardens.owner_id
    WHERE user_plants.id = observation_logs.user_plant_id
      AND users.auth_user_id = (SELECT auth.uid())
  )
);

CREATE POLICY weather_cache_select_authenticated
ON public.weather_cache
FOR SELECT
TO authenticated
USING (true);

CREATE POLICY plant_master_requests_insert_own
ON public.plant_master_requests
FOR INSERT
TO authenticated
WITH CHECK (
  EXISTS (
    SELECT 1
    FROM public.users
    WHERE users.id = plant_master_requests.submitted_by
      AND users.auth_user_id = (SELECT auth.uid())
  )
);
