-- Database: ParkingLot

-- DROP DATABASE IF EXISTS "ParkingLot";

CREATE DATABASE "ParkingLot"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Colombia.1252'
    LC_CTYPE = 'Spanish_Colombia.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Table: public.vehicle

-- DROP TABLE IF EXISTS public.vehicle;

CREATE TABLE IF NOT EXISTS public.vehicle
(
    license_plate character varying(7) COLLATE pg_catalog."default" NOT NULL,
    entrytime timestamp without time zone NOT NULL,
    color character varying(15) COLLATE pg_catalog."default" NOT NULL,
    exittime timestamp without time zone,
    state character varying(10) COLLATE pg_catalog."default" NOT NULL,
    image bytea NOT NULL,
    imageurl character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL DEFAULT now(),
    "updatedAt" timestamp with time zone NOT NULL DEFAULT now(),
    CONSTRAINT vehicle_pkey PRIMARY KEY (license_plate, entrytime)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.vehicle
    OWNER to postgres;

-- Table: public.vehicle

-- DROP TABLE IF EXISTS public.vehicle;

CREATE TABLE IF NOT EXISTS public.vehicle
(
    license_plate character varying(7) COLLATE pg_catalog."default" NOT NULL,
    entrytime timestamp without time zone NOT NULL,
    color character varying(15) COLLATE pg_catalog."default" NOT NULL,
    exittime timestamp without time zone,
    state character varying(10) COLLATE pg_catalog."default" NOT NULL,
    image bytea NOT NULL,
    imageurl character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "createdAt" timestamp with time zone NOT NULL DEFAULT now(),
    "updatedAt" timestamp with time zone NOT NULL DEFAULT now(),
    CONSTRAINT vehicle_pkey PRIMARY KEY (license_plate, entrytime)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.vehicle
    OWNER to postgres;