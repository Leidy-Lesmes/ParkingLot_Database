-- Database: ParkingLot

-- DROP DATABASE IF EXISTS "ParkingLot";

CREATE DATABASE "ParkingLot"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Colombia.1252'
    LC_CTYPE = 'Spanish_Colombia.1252'
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

-- Table: public.vehicle_history

-- DROP TABLE IF EXISTS public.vehicle_history;

CREATE TABLE IF NOT EXISTS public.vehicle_history
(
    history_id integer NOT NULL DEFAULT nextval('vehicle_history_history_id_seq'::regclass),
    event_time timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    event_type character varying(10) COLLATE pg_catalog."default" NOT NULL,
    url character varying(255) COLLATE pg_catalog."default" NOT NULL,
    method character varying(10) COLLATE pg_catalog."default" NOT NULL,
    payload text COLLATE pg_catalog."default",
    error_message text COLLATE pg_catalog."default",
    error_payload text COLLATE pg_catalog."default",
    CONSTRAINT vehicle_history_pkey PRIMARY KEY (history_id),
    CONSTRAINT vehicle_history_event_type_check CHECK (event_type::text = ANY (ARRAY['Request'::character varying, 'Error'::character varying]::text[])),
    CONSTRAINT vehicle_history_method_check CHECK (method::text = ANY (ARRAY['GET'::character varying, 'POST'::character varying, 'PATCH'::character varying]::text[]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.vehicle_history
    OWNER to postgres;