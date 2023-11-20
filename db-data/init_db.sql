-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."mealTimes"
(
    "mealTime_id" bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    "mealTime_name" character varying(50) NOT NULL,
    CONSTRAINT "mealTime_pkey" PRIMARY KEY ("mealTime_id")
);

CREATE TABLE IF NOT EXISTS public.meals
(
    meal_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    "meal_userId" bigint NOT NULL,
    "meal_productId" bigint NOT NULL,
    "meal_productWeight" numeric NOT NULL,
    meal_date date NOT NULL,
    "meal_timeId" bigint NOT NULL,
    CONSTRAINT meals_pkey PRIMARY KEY (meal_id)
);

CREATE TABLE IF NOT EXISTS public.products
(
    product_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    "product_fatsecretId" bigint,
    "product_userId" bigint,
    product_name character varying(100) NOT NULL,
    product_calories integer NOT NULL,
    "product_ proteins" numeric NOT NULL,
    "product_ fats" numeric NOT NULL,
    "product_ carbohydrates" numeric NOT NULL,
    "product_isActive" boolean NOT NULL,
    CONSTRAINT products_pkey PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS public.users
(
    user_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    user_name character varying(100) NOT NULL,
    user_login character varying(30) NOT NULL,
    user_password text NOT NULL,
    user_weight numeric NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (user_id)
);

ALTER TABLE IF EXISTS public.meals
    ADD CONSTRAINT "meals_meal_productId_fkey" FOREIGN KEY ("meal_productId")
    REFERENCES public.products (product_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.meals
    ADD CONSTRAINT "meals_meal_timeId_fkey" FOREIGN KEY ("meal_timeId")
    REFERENCES public."mealTimes" ("mealTime_id") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.meals
    ADD CONSTRAINT "meals_meal_userId_fkey" FOREIGN KEY ("meal_userId")
    REFERENCES public.users (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.products
    ADD CONSTRAINT "users_userProducts" FOREIGN KEY ("product_userId")
    REFERENCES public.users (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;