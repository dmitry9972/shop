--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: django_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE USER user_name WITH SUPERUSER PASSWORD 'password';



CREATE DATABASE django_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE django_db OWNER TO postgres;

\connect django_db

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO user_name;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO user_name;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO user_name;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO user_name;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO user_name;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO user_name;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO user_name;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO user_name;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO user_name;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO user_name;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_clockedschedule_id_seq OWNER TO user_name;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO user_name;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_crontabschedule_id_seq OWNER TO user_name;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO user_name;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_intervalschedule_id_seq OWNER TO user_name;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO user_name;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_periodictask_id_seq OWNER TO user_name;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO user_name;

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO user_name;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_solarschedule_id_seq OWNER TO user_name;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO user_name;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO user_name;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO user_name;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO user_name;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO user_name;

--
-- Name: main_advuser; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_advuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_activated boolean NOT NULL,
    phone character varying(128) NOT NULL,
    address character varying(1000) NOT NULL
);


ALTER TABLE public.main_advuser OWNER TO user_name;

--
-- Name: main_advuser_groups; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_advuser_groups (
    id bigint NOT NULL,
    advuser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.main_advuser_groups OWNER TO user_name;

--
-- Name: main_advuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_advuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_advuser_groups_id_seq OWNER TO user_name;

--
-- Name: main_advuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_advuser_groups_id_seq OWNED BY public.main_advuser_groups.id;


--
-- Name: main_advuser_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_advuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_advuser_id_seq OWNER TO user_name;

--
-- Name: main_advuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_advuser_id_seq OWNED BY public.main_advuser.id;


--
-- Name: main_advuser_user_permissions; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_advuser_user_permissions (
    id bigint NOT NULL,
    advuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.main_advuser_user_permissions OWNER TO user_name;

--
-- Name: main_advuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_advuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_advuser_user_permissions_id_seq OWNER TO user_name;

--
-- Name: main_advuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_advuser_user_permissions_id_seq OWNED BY public.main_advuser_user_permissions.id;


--
-- Name: main_brand; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_brand (
    id bigint NOT NULL,
    name character varying(1000) NOT NULL
);


ALTER TABLE public.main_brand OWNER TO user_name;

--
-- Name: main_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_brand_id_seq OWNER TO user_name;

--
-- Name: main_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_brand_id_seq OWNED BY public.main_brand.id;


--
-- Name: main_category; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_category (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    sub_level integer NOT NULL,
    super_category_id bigint
);


ALTER TABLE public.main_category OWNER TO user_name;

--
-- Name: main_category_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_category_id_seq OWNER TO user_name;

--
-- Name: main_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_category_id_seq OWNED BY public.main_category.id;


--
-- Name: main_country; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_country (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.main_country OWNER TO user_name;

--
-- Name: main_country_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_country_id_seq OWNER TO user_name;

--
-- Name: main_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_country_id_seq OWNED BY public.main_country.id;


--
-- Name: main_discount; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_discount (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.main_discount OWNER TO user_name;

--
-- Name: main_discount_brand; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_discount_brand (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    brand_id bigint NOT NULL
);


ALTER TABLE public.main_discount_brand OWNER TO user_name;

--
-- Name: main_discount_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_discount_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_discount_brand_id_seq OWNER TO user_name;

--
-- Name: main_discount_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_discount_brand_id_seq OWNED BY public.main_discount_brand.id;


--
-- Name: main_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_discount_id_seq OWNER TO user_name;

--
-- Name: main_discount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_discount_id_seq OWNED BY public.main_discount.id;


--
-- Name: main_discount_pediod; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_discount_pediod (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.main_discount_pediod OWNER TO user_name;

--
-- Name: main_discount_pediod_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_discount_pediod_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_discount_pediod_id_seq OWNER TO user_name;

--
-- Name: main_discount_pediod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_discount_pediod_id_seq OWNED BY public.main_discount_pediod.id;


--
-- Name: main_order; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_order (
    id bigint NOT NULL,
    order_date timestamp with time zone NOT NULL,
    advuser_id bigint NOT NULL,
    status smallint NOT NULL,
    cdek_uuid character varying(100) NOT NULL,
    CONSTRAINT main_order_status_check CHECK ((status >= 0))
);


ALTER TABLE public.main_order OWNER TO user_name;

--
-- Name: main_order_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_order_id_seq OWNER TO user_name;

--
-- Name: main_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_order_id_seq OWNED BY public.main_order.id;


--
-- Name: main_order_productset; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_order_productset (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    productset_id bigint NOT NULL
);


ALTER TABLE public.main_order_productset OWNER TO user_name;

--
-- Name: main_order_productset_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_order_productset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_order_productset_id_seq OWNER TO user_name;

--
-- Name: main_order_productset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_order_productset_id_seq OWNED BY public.main_order_productset.id;


--
-- Name: main_photo; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_photo (
    id bigint NOT NULL,
    image character varying(100),
    product_id bigint NOT NULL
);


ALTER TABLE public.main_photo OWNER TO user_name;

--
-- Name: main_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_photo_id_seq OWNER TO user_name;

--
-- Name: main_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_photo_id_seq OWNED BY public.main_photo.id;


--
-- Name: main_product; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_product (
    id bigint NOT NULL,
    description character varying(10000) NOT NULL,
    price double precision NOT NULL,
    brand_id bigint NOT NULL,
    category_id bigint NOT NULL,
    country_id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.main_product OWNER TO user_name;

--
-- Name: main_product_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_product_id_seq OWNER TO user_name;

--
-- Name: main_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_product_id_seq OWNED BY public.main_product.id;


--
-- Name: main_productset; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.main_productset (
    id bigint NOT NULL,
    product_count integer NOT NULL,
    advuser_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.main_productset OWNER TO user_name;

--
-- Name: main_productset_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.main_productset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_productset_id_seq OWNER TO user_name;

--
-- Name: main_productset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.main_productset_id_seq OWNED BY public.main_productset.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_beat_clockedschedule id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);


--
-- Name: django_celery_beat_solarschedule id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: main_advuser id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_advuser ALTER COLUMN id SET DEFAULT nextval('public.main_advuser_id_seq'::regclass);


--
-- Name: main_advuser_groups id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_advuser_groups ALTER COLUMN id SET DEFAULT nextval('public.main_advuser_groups_id_seq'::regclass);


--
-- Name: main_advuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_advuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.main_advuser_user_permissions_id_seq'::regclass);


--
-- Name: main_brand id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_brand ALTER COLUMN id SET DEFAULT nextval('public.main_brand_id_seq'::regclass);


--
-- Name: main_category id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_category ALTER COLUMN id SET DEFAULT nextval('public.main_category_id_seq'::regclass);


--
-- Name: main_country id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_country ALTER COLUMN id SET DEFAULT nextval('public.main_country_id_seq'::regclass);


--
-- Name: main_discount id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_discount ALTER COLUMN id SET DEFAULT nextval('public.main_discount_id_seq'::regclass);


--
-- Name: main_discount_brand id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_discount_brand ALTER COLUMN id SET DEFAULT nextval('public.main_discount_brand_id_seq'::regclass);


--
-- Name: main_discount_pediod id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_discount_pediod ALTER COLUMN id SET DEFAULT nextval('public.main_discount_pediod_id_seq'::regclass);


--
-- Name: main_order id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_order ALTER COLUMN id SET DEFAULT nextval('public.main_order_id_seq'::regclass);


--
-- Name: main_order_productset id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_order_productset ALTER COLUMN id SET DEFAULT nextval('public.main_order_productset_id_seq'::regclass);


--
-- Name: main_photo id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_photo ALTER COLUMN id SET DEFAULT nextval('public.main_photo_id_seq'::regclass);


--
-- Name: main_product id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_product ALTER COLUMN id SET DEFAULT nextval('public.main_product_id_seq'::regclass);


--
-- Name: main_productset id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_productset ALTER COLUMN id SET DEFAULT nextval('public.main_productset_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_advuser
22	Can change user	6	change_advuser
23	Can delete user	6	delete_advuser
24	Can view user	6	view_advuser
25	Can add Брэнд	7	add_brand
26	Can change Брэнд	7	change_brand
27	Can delete Брэнд	7	delete_brand
28	Can view Брэнд	7	view_brand
29	Can add Категория	8	add_category
30	Can change Категория	8	change_category
31	Can delete Категория	8	delete_category
32	Can view Категория	8	view_category
33	Can add Страна производитель	9	add_country
34	Can change Страна производитель	9	change_country
35	Can delete Страна производитель	9	delete_country
36	Can view Страна производитель	9	view_country
37	Can add Фото	10	add_photo
38	Can change Фото	10	change_photo
39	Can delete Фото	10	delete_photo
40	Can view Фото	10	view_photo
41	Can add Набор фото	11	add_photoset
42	Can change Набор фото	11	change_photoset
43	Can delete Набор фото	11	delete_photoset
44	Can view Набор фото	11	view_photoset
45	Can add Продукт	12	add_product
46	Can change Продукт	12	change_product
47	Can delete Продукт	12	delete_product
48	Can view Продукт	12	view_product
49	Can add Набор	13	add_productset
50	Can change Набор	13	change_productset
51	Can delete Набор	13	delete_productset
52	Can view Набор	13	view_productset
53	Can add Заказ	14	add_order
54	Can change Заказ	14	change_order
55	Can delete Заказ	14	delete_order
56	Can view Заказ	14	view_order
57	Can add Скидка на продукт по сезону	15	add_discount_pediod
58	Can change Скидка на продукт по сезону	15	change_discount_pediod
59	Can delete Скидка на продукт по сезону	15	delete_discount_pediod
60	Can view Скидка на продукт по сезону	15	view_discount_pediod
61	Can add Скидка на продукт по брэнду	16	add_discount_brand
62	Can change Скидка на продукт по брэнду	16	change_discount_brand
63	Can delete Скидка на продукт по брэнду	16	delete_discount_brand
64	Can view Скидка на продукт по брэнду	16	view_discount_brand
65	Can add Скидка на продукт	17	add_discount
66	Can change Скидка на продукт	17	change_discount
67	Can delete Скидка на продукт	17	delete_discount
68	Can view Скидка на продукт	17	view_discount
69	Can add Token	18	add_token
70	Can change Token	18	change_token
71	Can delete Token	18	delete_token
72	Can view Token	18	view_token
73	Can add token	19	add_tokenproxy
74	Can change token	19	change_tokenproxy
75	Can delete token	19	delete_tokenproxy
76	Can view token	19	view_tokenproxy
77	Can add crontab	20	add_crontabschedule
78	Can change crontab	20	change_crontabschedule
79	Can delete crontab	20	delete_crontabschedule
80	Can view crontab	20	view_crontabschedule
81	Can add interval	21	add_intervalschedule
82	Can change interval	21	change_intervalschedule
83	Can delete interval	21	delete_intervalschedule
84	Can view interval	21	view_intervalschedule
85	Can add periodic task	22	add_periodictask
86	Can change periodic task	22	change_periodictask
87	Can delete periodic task	22	delete_periodictask
88	Can view periodic task	22	view_periodictask
89	Can add periodic tasks	23	add_periodictasks
90	Can change periodic tasks	23	change_periodictasks
91	Can delete periodic tasks	23	delete_periodictasks
92	Can view periodic tasks	23	view_periodictasks
93	Can add solar event	24	add_solarschedule
94	Can change solar event	24	change_solarschedule
95	Can delete solar event	24	delete_solarschedule
96	Can view solar event	24	view_solarschedule
97	Can add clocked	25	add_clockedschedule
98	Can change clocked	25	change_clockedschedule
99	Can delete clocked	25	delete_clockedschedule
100	Can view clocked	25	view_clockedschedule
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
450a77bee19636cdd253068259d3b7296a53b51c	2021-08-31 14:07:30.97676+10	4
8e58ec44038ab7947bfb07e55f2c6fd2ded2a311	2021-08-31 18:11:13.919713+10	5
3a932ca36cef991de2ae8254d2af50749919acc5	2021-08-31 18:51:04.733333+10	1
46c901e4b12ac0283e21acb17723e9bc8d131a37	2021-09-01 20:51:09.22836+10	6
e68ec6c174362adab19a5a3cdd6d25728707816d	2021-09-01 23:23:07.294862+10	7
69207322d32d0575e00e44a3c13268119b7c7249	2021-09-01 23:23:33.965018+10	8
942f92fde7b9c3e93c4826788862e76acee04176	2021-09-01 23:38:02.252058+10	9
3e657b2ee9b5e3b1226c9465c18afd0131aada30	2021-09-01 23:38:08.330896+10	10
c34696fd0351d1bc28555040f080004ab75b00b7	2021-09-01 23:38:13.399014+10	11
e22165a62e112d925d6059fb27cbef237ae920ce	2021-09-15 14:29:07.223741+10	12
e3c60bb575dbf1a9bdf916ccff899b8edd0f3c7a	2021-09-15 14:31:13.728702+10	13
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-08-19 20:13:09.876223+10	1	Brand object (1)	1	[{"added": {}}]	7	1
2	2021-08-19 20:13:16.767583+10	2	Brand object (2)	1	[{"added": {}}]	7	1
3	2021-08-19 20:13:47.699487+10	3	Brand object (3)	1	[{"added": {}}]	7	1
4	2021-08-19 20:44:41.997502+10	1	Полуфабрикаты	1	[{"added": {}}]	8	1
5	2021-08-19 20:44:46.871333+10	1	Полуфабрикаты	2	[]	8	1
6	2021-08-19 20:45:02.220533+10	2	Консервы	1	[{"added": {}}]	8	1
7	2021-08-19 20:45:18.279819+10	3	Блинчики	1	[{"added": {}}]	8	1
8	2021-08-19 20:45:40.30395+10	1	Россия	1	[{"added": {}}]	9	1
9	2021-08-19 20:45:57.043397+10	2	Германия	1	[{"added": {}}]	9	1
10	2021-08-19 20:46:02.322393+10	3	США	1	[{"added": {}}]	9	1
11	2021-08-19 20:47:09.371501+10	1	Блинчики с фаршем и салом	1	[{"added": {}}]	12	1
12	2021-08-19 20:51:08.834776+10	4	Газированные напитки	1	[{"added": {}}]	8	1
13	2021-08-19 20:51:21.488428+10	2	Кока-кола	1	[{"added": {}}]	12	1
14	2021-08-19 21:14:12.571883+10	1	Photo object (1)	1	[{"added": {}}]	10	1
15	2021-08-19 21:16:00.213182+10	2	Photo object (2)	1	[{"added": {}}]	10	1
16	2021-08-19 21:16:18.84647+10	1	Photoset object (1)	1	[{"added": {}}]	11	1
17	2021-08-19 21:16:55.130491+10	1	Photoset object (1)	2	[{"changed": {"fields": ["\\u0424\\u043e\\u0442\\u043e"]}}]	11	1
18	2021-08-22 10:11:16.163866+10	1	Блинчики с фаршем и салом	2	[{"added": {"name": "\\u0424\\u043e\\u0442\\u043e", "object": "Photo object (3)"}}, {"added": {"name": "\\u0424\\u043e\\u0442\\u043e", "object": "Photo object (4)"}}]	12	1
19	2021-08-22 10:12:46.446448+10	2	Кока-кола	2	[{"added": {"name": "\\u0424\\u043e\\u0442\\u043e", "object": "Photo object (5)"}}, {"added": {"name": "\\u0424\\u043e\\u0442\\u043e", "object": "Photo object (6)"}}, {"added": {"name": "\\u0424\\u043e\\u0442\\u043e", "object": "Photo object (7)"}}]	12	1
20	2021-08-22 11:49:52.092871+10	8	Photo object (8)	1	[{"added": {}}]	10	1
21	2021-08-22 12:50:03.221714+10	1	Блинчики с фаршем и салом	2	[{"changed": {"name": "\\u0424\\u043e\\u0442\\u043e", "object": "Photo object (4)", "fields": ["Image"]}}, {"changed": {"name": "\\u0424\\u043e\\u0442\\u043e", "object": "Photo object (8)", "fields": ["Image"]}}]	12	1
22	2021-08-25 21:18:14.388937+10	1	Productset object (1)	1	[{"added": {}}]	13	1
23	2021-08-25 21:18:21.88104+10	2	Productset object (2)	1	[{"added": {}}]	13	1
24	2021-08-25 21:18:24.76892+10	1	Номер заказа: 1	1	[{"added": {}}]	14	1
25	2021-08-25 21:19:08.216995+10	1	Скидка на Блинчики с фаршем и салом : 99.0	1	[{"added": {}}]	17	1
26	2021-08-25 21:19:18.377053+10	1	Скидка на Coca-cola : 90.0	1	[{"added": {}}]	16	1
27	2021-08-25 21:19:28.806849+10	1	Скидка на Блинчики с фаршем и салом : 50.0	1	[{"added": {}}]	15	1
28	2021-08-31 10:17:59.905541+10	2	go	3		6	1
29	2021-08-31 14:07:26.860334+10	3	cat	3		6	1
30	2021-08-31 18:08:36.18007+10	1	9256594abd1b18ebe498719d935ac8e7f8834af0	3		19	1
31	2021-09-01 07:41:47.27379+10	14	Номер заказа: 14	2	[{"changed": {"fields": ["Productset"]}}]	14	1
32	2021-09-01 07:41:52.245971+10	16	Номер заказа: 16	2	[{"changed": {"fields": ["Productset"]}}]	14	1
33	2021-09-01 10:17:40.959942+10	16	Номер заказа: 16	2	[{"changed": {"fields": ["Productset"]}}]	14	1
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	main	advuser
7	main	brand
8	main	category
9	main	country
10	main	photo
11	main	photoset
12	main	product
13	main	productset
14	main	order
15	main	discount_pediod
16	main	discount_brand
17	main	discount
18	authtoken	token
19	authtoken	tokenproxy
20	django_celery_beat	crontabschedule
21	django_celery_beat	intervalschedule
22	django_celery_beat	periodictask
23	django_celery_beat	periodictasks
24	django_celery_beat	solarschedule
25	django_celery_beat	clockedschedule
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-08-19 15:49:43.39079+10
2	contenttypes	0002_remove_content_type_name	2021-08-19 15:49:43.401648+10
3	auth	0001_initial	2021-08-19 15:49:43.459247+10
4	auth	0002_alter_permission_name_max_length	2021-08-19 15:49:43.468355+10
5	auth	0003_alter_user_email_max_length	2021-08-19 15:49:43.475134+10
6	auth	0004_alter_user_username_opts	2021-08-19 15:49:43.483493+10
7	auth	0005_alter_user_last_login_null	2021-08-19 15:49:43.489497+10
8	auth	0006_require_contenttypes_0002	2021-08-19 15:49:43.492797+10
9	auth	0007_alter_validators_add_error_messages	2021-08-19 15:49:43.499145+10
10	auth	0008_alter_user_username_max_length	2021-08-19 15:49:43.506382+10
11	auth	0009_alter_user_last_name_max_length	2021-08-19 15:49:43.513151+10
12	auth	0010_alter_group_name_max_length	2021-08-19 15:49:43.52214+10
13	auth	0011_update_proxy_permissions	2021-08-19 15:49:43.529439+10
14	auth	0012_alter_user_first_name_max_length	2021-08-19 15:49:43.536883+10
15	main	0001_initial	2021-08-19 15:49:43.863393+10
16	admin	0001_initial	2021-08-19 15:49:43.902294+10
17	admin	0002_logentry_remove_auto_add	2021-08-19 15:49:43.915141+10
18	admin	0003_logentry_add_action_flag_choices	2021-08-19 15:49:43.926928+10
19	sessions	0001_initial	2021-08-19 15:49:43.945891+10
20	main	0002_auto_20210819_1027	2021-08-19 20:29:14.978943+10
21	main	0003_remove_discount_brand_product	2021-08-19 20:29:15.005311+10
22	main	0004_auto_20210819_1050	2021-08-19 20:50:18.724445+10
23	main	0005_auto_20210819_1112	2021-08-19 21:12:31.147529+10
24	main	0006_auto_20210821_2155	2021-08-22 10:00:03.852207+10
25	main	0007_auto_20210821_2359	2021-08-22 10:07:16.476167+10
26	main	0008_alter_photo_product	2021-08-22 10:07:16.480073+10
27	main	0009_alter_photo_product	2021-08-22 10:07:16.483028+10
28	main	0010_remove_photo_product	2021-08-22 10:07:16.485004+10
29	main	0011_photo_product	2021-08-22 10:09:26.193551+10
30	main	0012_order_status	2021-08-30 20:21:08.03298+10
31	authtoken	0001_initial	2021-08-31 13:58:34.084559+10
32	authtoken	0002_auto_20160226_1747	2021-08-31 13:58:34.128895+10
33	authtoken	0003_tokenproxy	2021-08-31 13:58:34.132115+10
34	main	0013_order_cdek_uuid	2021-09-03 19:14:01.172672+10
35	django_celery_beat	0001_initial	2021-09-13 07:34:18.844919+10
36	django_celery_beat	0002_auto_20161118_0346	2021-09-13 07:34:18.870946+10
37	django_celery_beat	0003_auto_20161209_0049	2021-09-13 07:34:18.917428+10
38	django_celery_beat	0004_auto_20170221_0000	2021-09-13 07:34:18.923151+10
39	django_celery_beat	0005_add_solarschedule_events_choices	2021-09-13 07:34:18.930453+10
40	django_celery_beat	0006_auto_20180322_0932	2021-09-13 07:34:18.960583+10
41	django_celery_beat	0007_auto_20180521_0826	2021-09-13 07:34:18.976522+10
42	django_celery_beat	0008_auto_20180914_1922	2021-09-13 07:34:18.997017+10
43	django_celery_beat	0006_auto_20180210_1226	2021-09-13 07:34:19.011436+10
44	django_celery_beat	0006_periodictask_priority	2021-09-13 07:34:19.019557+10
45	django_celery_beat	0009_periodictask_headers	2021-09-13 07:34:19.029404+10
46	django_celery_beat	0010_auto_20190429_0326	2021-09-13 07:34:19.15183+10
47	django_celery_beat	0011_auto_20190508_0153	2021-09-13 07:34:19.174976+10
48	django_celery_beat	0012_periodictask_expire_seconds	2021-09-13 07:34:19.185431+10
49	django_celery_beat	0013_auto_20200609_0727	2021-09-13 07:34:19.191815+10
50	django_celery_beat	0014_remove_clockedschedule_enabled	2021-09-13 07:34:19.198673+10
51	django_celery_beat	0015_edit_solarschedule_events_choices	2021-09-13 07:34:19.204994+10
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
j3x0jaqkjnet6yiesayr4z1vg4dymc69	.eJxVjDsOwjAQBe_iGll2Nv5R0nMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVZGHH63QjTg9sO8h3bbZZpbusykdwVedAur3Pm5-Vw_w4q9vqtiyvMCbVWSo-FnGW0oCwFcgjOWwseCtnsBhUIstdmQEXEwZPxMGrx_gDuIzej:1mKyrm:_GA-QE7cn8H9HblvyOzQW9KI6XZMYm5SJJB1bSN2rS4	2021-09-14 18:11:34.590352+10
nwf8akrk9hcj7jtsy1ro2rbkfta5gmxq	.eJxVjEEOwiAQRe_C2pBBSgGX7j0DmWFAqgaS0q6Md7dNutDtf-_9twi4LiWsPc1hYnERSpx-N8L4THUH_MB6bzK2uswTyV2RB-3y1ji9rof7d1Cwl60eR2AL2UeHzmvnMoFiIDhH7ymDsRg1DsAUnXdJIyhjrBqQld1oyuLzBdsYN84:1mPNTs:NpSx-Ke7MzR-1R1yQSpchjsIBRecx3DA6F8GDE9_sVI	2021-09-26 21:17:04.203009+10
\.


--
-- Data for Name: main_advuser; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_advuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, is_activated, phone, address) FROM stdin;
4	pbkdf2_sha256$260000$sRicP3qYqTlxBnAfBarJ7K$Tj9pY/W7ZrpczUnZ9cPLRLhELJjvPrINVTIHrqaJ56s=	\N	f	cat			cat@cats.ru	f	t	2021-08-31 14:07:30.787538+10	t		
5	pbkdf2_sha256$260000$qlQU6DmrWGxoylJ2wGkpO3$5H0uWPyfGaSvwllAOIhP/xlatZ5ghLLSvo8QBhEtmLk=	2021-08-31 18:11:34.586853+10	t	admin1				t	t	2021-08-31 18:11:13.733284+10	t		
6	pbkdf2_sha256$260000$UXnLzQrz8lJ3tDmn7a1wfL$MQaspYxOegRfR8Zmmubf/z9l4hTC9lVYQnxexy/d4/4=	\N	f	dog			dog@cats.ru	f	t	2021-09-01 20:51:09.038338+10	t		
7	pbkdf2_sha256$260000$8UuEHHu0tBOg0WL9BIs2ZE$f9R0p4M90SKjulZ6devdCmofEFIaJdO+jsHlY7sHuCw=	\N	f	dog1			dog@cats.ru	f	t	2021-09-01 23:23:07.106998+10	t		
8	pbkdf2_sha256$260000$QYqgF8QeeWeRUGJDn2toZq$zJnsp2YNm1gPvaffZgkT/ClESd8yb74Du9zfWEolsyI=	\N	f	dog2			dog@cats.ru	f	t	2021-09-01 23:23:33.780661+10	t		
9	pbkdf2_sha256$260000$I5aBwjcivoyhD6cqHI9Php$EC8xofi7qxj8bKY0q4peEnGTslChMsDeJ6ZW034WcrQ=	\N	f	cat2			cat@cats.ru	f	t	2021-09-01 23:38:02.067124+10	t		
10	pbkdf2_sha256$260000$DoXUrbLK7eGzPToRb5LXUk$QvffXARhZW630IyeocSL75y79M//clBRAB197QGoQdg=	\N	f	cat3			cat@cats.ru	f	t	2021-09-01 23:38:08.145392+10	t		
11	pbkdf2_sha256$260000$qrpR4RLAcpG8PyLuGFflQA$nYKP8x8eY7Nk7P+mPiFZooBx6r7unA08qj6qx2ok/Ng=	\N	f	cat4			cat@cats.ru	f	t	2021-09-01 23:38:13.213494+10	t		
1	pbkdf2_sha256$260000$mQyWiVEgu3iFJdVla96eQ6$y+KJ8FVSAqFVrENKBXgeKtM3lFnLjq0gyyBIPI2VFQs=	2021-09-12 21:17:04.196449+10	t	admin				t	t	2021-08-19 20:11:45.372997+10	t		
12	pbkdf2_sha256$260000$rTDLo1PlMUgJ1P3edee7X9$+VStoHsuKLWuemh0EOTt3ZTzsMN1NOKrtCVfIv4k3mI=	\N	f	caty4			caty@cats.ru	f	t	2021-09-15 14:29:07.033759+10	t		
13	pbkdf2_sha256$260000$Vy7gMG4J6y5RXmCNJ1lxdf$zDih0t545N5qc84wSqGvtsEPR66Uy69ghDBwySmOqJ8=	\N	f	caty34			caty3@cats.ru	f	t	2021-09-15 14:31:13.543336+10	t		
\.


--
-- Data for Name: main_advuser_groups; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_advuser_groups (id, advuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: main_advuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_advuser_user_permissions (id, advuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: main_brand; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_brand (id, name) FROM stdin;
1	Coca-cola
2	Fa
3	Подольск
4	Мираторг
5	Ратимир
6	Fuju
7	Fuju
8	Nike
9	Nike
10	Nike
\.


--
-- Data for Name: main_category; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_category (id, name, sub_level, super_category_id) FROM stdin;
1	Полуфабрикаты	0	\N
2	Консервы	0	\N
3	Блинчики	1	1
4	Газированные напитки	0	\N
5	Хлебобулочные изделия	0	\N
6	Хлеб	1	5
7	Сухари	1	5
8	Булочки сдобные	1	5
\.


--
-- Data for Name: main_country; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_country (id, name) FROM stdin;
1	Россия
2	Германия
3	США
4	Бельгия
5	Китай
6	Alkaline
7	Canada
8	Canada
9	Canada3
\.


--
-- Data for Name: main_discount; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_discount (id, amount, product_id) FROM stdin;
1	99	1
\.


--
-- Data for Name: main_discount_brand; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_discount_brand (id, amount, brand_id) FROM stdin;
1	90	1
\.


--
-- Data for Name: main_discount_pediod; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_discount_pediod (id, amount, start, "end", product_id) FROM stdin;
1	50	2021-08-25 21:19:22+10	2021-08-25 21:19:22+10	1
\.


--
-- Data for Name: main_order; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_order (id, order_date, advuser_id, status, cdek_uuid) FROM stdin;
2	2021-08-31 06:20:20+10	1	2	
134	2021-09-03 16:12:15.013202+10	4	3	72753031-40a6-4ea6-b438-bdda37bb96a8
8	2021-09-01 07:19:19.038513+10	1	2	
9	2021-09-01 07:23:04.460036+10	1	2	
16	2021-09-01 07:41:04+10	1	2	
19	2021-09-01 09:37:48.163854+10	1	2	
15	2021-09-01 07:40:11.915654+10	1	2	
135	2021-09-03 16:17:05.021019+10	4	3	72753031-5c27-4453-9d3d-6c22a00743c3
21	2021-09-01 09:41:59.122898+10	1	2	
35	2021-09-01 11:57:11.576067+10	1	2	
25	2021-09-01 09:46:24.447965+10	1	2	
42	2021-09-01 12:24:24.821574+10	1	2	
45	2021-09-02 15:47:51.638063+10	1	2	
133	2021-09-02 22:20:36.863591+10	4	3	72753031-f5c0-4e34-97cd-a0135f61d3fc
132	2021-09-02 22:16:58.707554+10	4	3	72753031-5094-437f-bb51-320e46a3c03c
131	2021-09-02 22:16:36.5425+10	4	3	72753031-e700-456d-ad62-673899be1f2d
130	2021-09-02 22:16:10.090025+10	4	3	72753031-8356-402e-a1fb-668b28a1dcc6
37	2021-09-01 12:04:20.149959+10	1	2	
46	2021-09-02 16:54:13.719193+10	1	2	
13	2021-09-01 07:31:51.884871+10	1	3	72753031-f134-4c70-a30f-f4011e23e6aa
54	2021-09-02 17:08:56.933411+10	1	2	
128	2021-09-02 22:12:49.904583+10	4	3	72753031-2a32-45ae-a4bb-87b70600dd17
53	2021-09-02 16:59:37.120022+10	1	2	
55	2021-09-02 17:08:58.116781+10	1	2	
60	2021-09-02 17:10:47.460239+10	1	2	
56	2021-09-02 17:08:58.695209+10	1	2	
61	2021-09-02 17:10:48.226053+10	1	2	
63	2021-09-02 17:18:01.425709+10	4	2	
65	2021-09-02 17:18:02.746699+10	4	2	
64	2021-09-02 17:18:02.113777+10	4	2	
70	2021-09-02 17:19:40.582068+10	4	2	
78	2021-09-02 17:20:37.8792+10	4	2	
77	2021-09-02 17:20:36.984209+10	4	2	
79	2021-09-02 17:22:11.971021+10	4	2	
81	2021-09-02 17:22:12.776254+10	4	2	
136	2021-09-03 16:17:47.443286+10	4	3	72753031-4f2f-42d3-bbf7-4c2295cb92fa
80	2021-09-02 17:22:12.347834+10	4	2	
82	2021-09-02 17:22:13.243554+10	4	2	72753031-8de7-4889-b7d5-f1c96ca7cbcc
84	2021-09-02 17:26:52.759554+10	4	2	
85	2021-09-02 17:26:53.319679+10	4	2	
86	2021-09-02 17:27:56.355619+10	4	2	
87	2021-09-02 17:27:57.056644+10	4	2	
67	2021-09-02 17:19:37.003945+10	4	3	72753031-3f31-448f-a9aa-e72c8f02b60b
90	2021-09-02 17:36:34.481215+10	4	3	72753031-77e3-4a4c-a861-a9747fa4edaf
89	2021-09-02 17:34:40.005586+10	4	3	72753031-4e19-45aa-b2c7-82b0ed7ad562
88	2021-09-02 17:34:39.089101+10	4	3	72753031-4252-4fa2-a5f6-e9dd3e8e2334
68	2021-09-02 17:19:37.683685+10	4	3	72753031-78e4-4c0f-adf9-56e5993feda3
23	2021-09-01 09:42:53.135901+10	1	3	72753031-b6f2-45fb-b234-f31f822353d9
51	2021-09-02 16:57:55.314062+10	1	3	72753031-0f43-4b2d-87a4-42f713685a25
93	2021-09-02 18:54:22.000538+10	4	3	72753031-0469-417a-8b16-c5b0396eec7a
95	2021-09-02 19:39:30.224561+10	4	3	72753031-6897-45e9-9be8-8052891aae51
50	2021-09-02 16:55:42.464719+10	1	3	72753031-f8e8-4405-93c5-b721d4675824
47	2021-09-02 16:54:16.305106+10	1	3	72753031-3078-41f5-a31c-c8ac772b0288
96	2021-09-02 19:40:32.697767+10	4	3	72753031-bac2-4ea5-8e86-eab6cfafdc04
44	2021-09-01 13:31:39.989267+10	1	3	72753031-0457-4286-a195-a97b30e5fe7e
43	2021-09-01 12:24:50.419821+10	1	3	72753031-9afe-4460-b8e0-d8d48d52d136
40	2021-09-01 12:20:05.315473+10	1	3	72753031-f32d-4ae3-a855-9147b07a4e5f
98	2021-09-02 19:42:10.698593+10	4	3	72753031-5a04-472d-98f0-8f6a35feeac7
99	2021-09-02 19:42:54.845846+10	4	3	72753031-ee6a-4ec3-96f0-9f3060bef340
102	2021-09-02 20:00:22.665422+10	4	3	72753031-f652-4aa2-8db0-ba01282a19b9
104	2021-09-02 20:02:09.226275+10	4	3	72753031-5bd3-4c5e-b126-e6936961a20d
39	2021-09-01 12:19:43.4325+10	1	3	72753031-b34f-4c9a-b346-e33acb0e38c3
105	2021-09-02 20:03:06.706922+10	4	3	72753031-64fc-4083-b22f-5284e4ab5717
107	2021-09-02 20:39:51.337612+10	4	3	72753031-02c5-4954-808c-9e95bbdf5b8a
108	2021-09-02 20:40:17.287477+10	4	3	72753031-98f3-4827-a413-955b5b743fc3
110	2021-09-02 21:08:07.114405+10	4	3	72753031-3124-4329-bd81-0f79c1dd2dcb
111	2021-09-02 21:09:25.119587+10	4	3	72753031-d2c8-4876-bcf6-2499ce2f18de
115	2021-09-02 21:17:19.849611+10	4	3	72753031-e165-4ca3-8dc0-4e0d4fe7c2c1
57	2021-09-02 17:10:09.503612+10	1	3	72753031-3466-4aee-8d05-75fe58408d23
59	2021-09-02 17:10:37.414876+10	1	3	72753031-9558-46ba-b810-e9ee0efb72b9
62	2021-09-02 17:17:36.164972+10	4	3	72753031-a183-4006-8591-b52c7b1d1db3
75	2021-09-02 17:20:25.318933+10	4	3	72753031-7a6a-4c0b-ad0c-eedace148ab7
76	2021-09-02 17:20:26.096932+10	4	3	72753031-e0fd-441d-8422-0aedaad6b4c6
125	2021-09-02 21:55:39.879296+10	4	3	72753031-9251-44ee-9ad0-1d12a27f6c37
72	2021-09-02 17:19:43.132936+10	4	3	72753031-b1be-4f0b-87dc-876b162a837b
71	2021-09-02 17:19:41.416269+10	4	3	72753031-d7ab-472f-a9db-975a1c911ce8
211	2021-09-11 12:42:28.270057+10	4	3	72753031-6dd9-49e4-bb8a-a7da862cb31b
123	2021-09-02 21:47:08.367271+10	4	3	72753031-99d4-4886-ab63-0d944fa29d10
122	2021-09-02 21:46:37.501325+10	4	3	72753031-d96d-4ce0-8d90-a51e463f1747
120	2021-09-02 21:44:52.256381+10	4	3	72753031-ed6a-4289-9414-23ca66e0c55b
119	2021-09-02 21:42:44.511955+10	4	3	72753031-c4b6-43d7-8001-5649c04a9d32
116	2021-09-02 21:19:54.641963+10	4	3	72753031-e4b7-4896-9ea1-c0a8f1deef8e
126	2021-09-02 21:57:24.771851+10	4	3	72753031-637d-4c1d-a299-71ae7c3eee34
24	2021-09-01 09:43:19.360941+10	1	3	72753031-5284-4113-af97-9ddf44096af0
5	2021-09-01 07:08:12.031885+10	1	3	72753031-0288-439f-a696-c35975897d10
26	2021-09-01 09:46:48.615585+10	1	3	72753031-6951-4608-974d-45d5503eed74
12	2021-09-01 07:30:46.402538+10	1	3	72753031-9bd5-473b-ad05-c6b8643e5dcd
28	2021-09-01 09:50:53.262358+10	1	3	72753031-a4b7-42fc-acb8-c9a4123cb0c1
17	2021-09-01 07:42:05.493682+10	1	3	72753031-1159-4132-9895-578dc8d9785f
30	2021-09-01 10:14:55.524904+10	1	3	72753031-16af-4796-befd-7d32dde2c8cf
20	2021-09-01 09:40:47.257816+10	1	3	72753031-3b38-480e-98a1-c1fc03da169c
32	2021-09-01 10:44:06.918552+10	1	3	72753031-ed30-491c-8673-a6d088112168
33	2021-09-01 11:46:00.476792+10	1	3	72753031-cb6f-470f-90ba-b454139d25c1
36	2021-09-01 11:57:25.962267+10	1	3	72753031-35c9-40c6-8ea9-30a8fdaf5540
91	2021-09-02 18:51:28.955077+10	4	3	72753031-e6b2-4473-b686-0ac24bc79497
176	2021-09-09 19:13:18.911986+10	4	3	72753031-acab-4929-8ff2-2a2e3fdee3c7
173	2021-09-09 19:10:49.485203+10	4	3	72753031-6465-47f5-ac66-aa8d541f3059
174	2021-09-09 19:12:24.726275+10	4	3	72753031-8fcd-4a7d-90da-34a0a4096eef
175	2021-09-09 19:12:30.161869+10	4	3	72753031-ff4d-4480-b77d-950be1490327
172	2021-09-09 19:07:01.888446+10	4	3	72753031-1383-4116-aaf9-6198f6832a21
170	2021-09-09 18:47:50.804159+10	4	3	72753031-972c-47ac-84b7-32e18038aa7a
169	2021-09-09 18:47:02.188583+10	4	3	72753031-1b36-4df9-bb28-890ad38b4d43
171	2021-09-09 18:48:54.554312+10	4	3	72753031-c057-4c9f-b614-e002c47074ec
168	2021-09-09 18:19:23.977081+10	4	3	72753031-411b-4d56-b3eb-ecd5e961a65f
83	2021-09-02 17:26:51.566224+10	4	2	
167	2021-09-09 18:17:17.238499+10	4	3	72753031-f43e-4015-af42-2adf1780b144
166	2021-09-09 18:11:47.667091+10	4	3	72753031-d9c2-48f2-97e7-dc5ea3cd6a45
165	2021-09-09 18:11:05.555112+10	4	3	72753031-780d-4048-b2ec-4a8ff6f8faa4
156	2021-09-03 20:24:18.779371+10	4	3	72753031-3aeb-4ab0-a3ac-fbbbac52987d
161	2021-09-09 18:07:28.850348+10	4	3	72753031-2d6b-4fd7-a260-540932f1b503
137	2021-09-03 16:18:18.919373+10	4	3	72753031-c74d-48da-acd1-78a0044050f7
138	2021-09-03 16:19:42.899276+10	4	3	72753031-1d7f-45d6-92de-83ff521ae4df
141	2021-09-03 16:24:41.897546+10	4	3	72753031-f177-4d78-a2ca-f84c26555ede
144	2021-09-03 16:29:45.769192+10	4	3	72753031-23d2-48b2-99fe-d3960d185b5c
145	2021-09-03 16:30:59.491409+10	4	3	72753031-078c-4bdd-ba7b-0ffa5668f088
147	2021-09-03 18:09:09.245944+10	4	3	72753031-3fbc-4739-a6a9-49ce61e4ea45
148	2021-09-03 18:12:32.083849+10	4	3	72753031-a2de-449f-bdb2-3c10027f2be1
3	2021-08-31 19:21:58.808043+10	1	3	72753031-3316-412d-a59c-36245ec4ac8a
4	2021-08-31 19:23:04.512805+10	1	3	72753031-d15e-423f-b734-71a222187f9e
151	2021-09-03 19:08:27.26114+10	4	3	72753031-c2e6-4aa0-b6f7-1341dc30d3eb
152	2021-09-03 20:18:23.851615+10	4	3	72753031-9abd-4d95-a840-0efe0d2898d1
11	2021-09-01 07:24:27.283015+10	1	3	72753031-3c95-43e4-a204-abece5739b0c
154	2021-09-03 20:22:23.027296+10	4	3	72753031-22ad-49eb-8e3b-8f429170bc4d
160	2021-09-09 18:06:53.466412+10	4	3	72753031-4c4d-4ad1-9ba2-f2f36d911049
159	2021-09-09 18:04:04.229453+10	4	3	72753031-a736-43c3-9ef0-5b8609158ae4
209	2021-09-11 12:36:44.542964+10	4	3	72753031-de7b-476f-8d21-da8d84723a3f
158	2021-09-09 18:03:44.64171+10	4	3	72753031-b0ec-4116-bc6b-99af97b5f55d
157	2021-09-09 18:02:26.939928+10	4	3	72753031-9572-4605-872b-2ba0b046cfb5
234	2021-09-13 15:59:05.251478+10	4	3	72753031-bd36-4d42-92d2-3b6b19d7c974
210	2021-09-11 12:41:58.152908+10	4	3	72753031-f286-4b36-b7b6-92eb617bca2d
212	2021-09-11 12:45:55.696617+10	4	3	72753031-3d91-4cd6-a447-cb2df0679417
213	2021-09-12 21:17:27.371092+10	4	3	72753031-f2e2-484c-9b08-dec84786d4e2
223	2021-09-13 10:21:11.465941+10	4	3	72753031-9a95-4bd3-aee1-6cd60d45e10d
224	2021-09-13 10:22:11.148557+10	4	3	72753031-1c99-4e57-afdb-4091a4c9e2d9
164	2021-09-09 18:10:46.17605+10	4	3	72753031-e384-4467-bde1-17c2a26369a2
163	2021-09-09 18:08:38.990294+10	4	3	72753031-d066-459f-83b9-4065a7146192
177	2021-09-09 19:14:42.573263+10	4	3	72753031-e2c8-4ebf-9018-d6c79355fc91
162	2021-09-09 18:08:11.924961+10	4	3	72753031-b056-4a06-b07b-3fe93ed751a8
178	2021-09-09 19:17:22.256458+10	4	3	72753031-0664-4565-b23a-12868ee1659d
179	2021-09-09 19:17:49.062733+10	4	3	72753031-91b1-401c-b036-d8b2313a3736
180	2021-09-09 19:18:32.529333+10	4	3	72753031-1fb5-45c7-8df6-1ec038711077
181	2021-09-09 19:19:03.587136+10	4	3	72753031-83ff-46b5-bdca-76fe68556958
194	2021-09-09 19:52:39.075326+10	4	3	72753031-4263-4299-9528-b606f6063573
193	2021-09-09 19:51:14.635966+10	4	3	72753031-71c4-4819-91ce-e0a5423d79e1
195	2021-09-09 19:53:14.16203+10	4	3	72753031-9dc1-45c9-ab1d-9f6b48af1519
192	2021-09-09 19:47:42.78246+10	4	3	72753031-8f9d-4def-98dc-26ee55c43ebc
191	2021-09-09 19:45:46.164173+10	4	3	72753031-b328-4541-bdd6-0f5993209438
190	2021-09-09 19:44:43.146896+10	4	3	72753031-9777-4163-b789-72232e2acf2d
189	2021-09-09 19:43:19.351048+10	4	3	72753031-115d-49e5-a2ed-fd336330c169
187	2021-09-09 19:27:40.824611+10	4	3	72753031-06cc-4352-aa13-3c3713b0766a
188	2021-09-09 19:29:27.930097+10	4	3	72753031-fac2-4337-b000-334c1b91dadc
186	2021-09-09 19:26:46.895751+10	4	3	72753031-e887-43d7-bae1-72ae33cc92e9
185	2021-09-09 19:24:28.494541+10	4	3	72753031-b085-4dcb-92eb-f5cb4876ca0b
184	2021-09-09 19:24:08.069821+10	4	3	72753031-1b4d-451f-9e29-80f66e0b1ffd
183	2021-09-09 19:23:38.137033+10	4	3	72753031-1cb9-4a36-95cf-1f3a98608eab
182	2021-09-09 19:19:35.728433+10	4	3	72753031-d155-43b7-8f49-16724929f8ad
197	2021-09-10 10:57:34.287652+10	4	3	72753031-57a5-400e-9226-4ccc88eecead
199	2021-09-10 11:05:24.365224+10	4	3	72753031-f8b6-4c22-9945-f9a5acfa662a
200	2021-09-10 11:06:37.644647+10	4	3	72753031-5d08-4775-8fb3-6bef6d64a3f6
201	2021-09-10 16:28:25.793255+10	4	3	72753031-38dd-4dd3-b676-68f004631876
202	2021-09-10 16:30:24.954643+10	4	3	72753031-bd48-432e-a591-42c9cf761475
203	2021-09-10 17:04:41.629784+10	4	3	72753031-f9f8-444e-ae1f-8d9c7e589ac9
204	2021-09-10 17:05:10.919502+10	4	3	72753031-829e-410c-852d-a2171f893307
205	2021-09-10 22:29:09.939014+10	4	3	72753031-ba34-4c43-920e-90b17ace2fd2
206	2021-09-10 22:29:39.736992+10	4	3	72753031-3d93-412d-99e9-f27ca2dc2e26
207	2021-09-10 23:06:51.779124+10	4	3	72753031-ffaf-4099-ac20-5cf8caa2e0a5
208	2021-09-11 12:15:56.597329+10	4	3	72753031-ce0e-47e7-a2fe-be6f47ee805d
214	2021-09-12 21:21:09.63454+10	4	3	72753031-20cc-4159-8ee9-602c560525b1
215	2021-09-12 21:52:43.887678+10	4	3	72753031-6d2c-4e4f-ae5d-9dbe5d312e7e
1	2021-08-25 21:18:05+10	1	2	666
216	2021-09-12 22:00:45.480144+10	4	3	72753031-eaee-4a9a-96fd-59913291f6cb
217	2021-09-12 22:18:09.827577+10	4	3	72753031-83a3-47f3-8c4e-cb36403623fa
218	2021-09-12 22:44:11.07068+10	4	3	72753031-bfdc-44cd-b5c1-1040ad62e6ec
219	2021-09-12 22:45:02.509255+10	4	3	72753031-6151-4b87-8c6f-47bbbf74faac
220	2021-09-12 22:48:11.044062+10	4	3	72753031-732b-499f-8bf1-40b0181e2e43
221	2021-09-13 08:09:52.250795+10	4	3	72753031-06bb-4393-884e-e8fd4639504e
222	2021-09-13 10:20:55.981843+10	4	3	72753031-addb-4a12-b750-287bf2805800
226	2021-09-13 13:16:32.275118+10	4	3	72753031-ac5a-4247-b49a-86932db8d2e3
227	2021-09-13 13:16:35.241205+10	4	3	72753031-2ad5-4c7c-9201-5355ef668632
129	2021-09-02 22:15:10.184482+10	4	3	72753031-b365-444a-b3ce-56f91f51d784
66	2021-09-02 17:19:36.34742+10	4	3	72753031-9aa7-4cae-bed7-8c858572aa10
139	2021-09-03 16:20:58.953898+10	4	3	72753031-f3a8-4f42-8bd2-228142c1e59e
140	2021-09-03 16:23:06.335867+10	4	3	72753031-67ec-4bd5-952b-9178c6575ff3
18	2021-09-01 07:53:48.250509+10	1	3	72753031-6c53-4f35-a5fc-93004b80d0a8
142	2021-09-03 16:28:20.069487+10	4	3	72753031-7663-4353-9a0d-54cbcfaac9f8
92	2021-09-02 18:51:30.658179+10	4	3	72753031-3899-4c05-b8e0-bfd1e7bba300
143	2021-09-03 16:28:58.605051+10	4	3	72753031-0fc3-4edb-b2ef-b35d595cf5e7
94	2021-09-02 18:58:08.003736+10	4	3	72753031-03a7-4962-b388-4f01a3a28acb
97	2021-09-02 19:42:09.7853+10	4	3	72753031-11fd-424e-82c5-f970885832af
100	2021-09-02 19:44:00.510626+10	4	3	72753031-1551-46c3-b07e-28bfad01948f
146	2021-09-03 17:03:50.521841+10	4	3	72753031-1fec-4fe6-9e80-c3c79c388fbb
149	2021-09-03 18:49:13.023019+10	4	3	72753031-d9d7-43ec-9b49-f5601b8cc404
150	2021-09-03 18:50:09.586474+10	4	3	72753031-7729-4ad8-8df8-5aace31e8198
101	2021-09-02 20:00:00.308981+10	4	3	72753031-9c58-4c51-9995-1624c304c362
103	2021-09-02 20:01:36.778351+10	4	3	72753031-eafe-496c-b29b-bc6ce366a293
106	2021-09-02 20:03:36.022092+10	4	3	72753031-8940-4a64-9267-7689e8dccb9d
109	2021-09-02 20:40:31.079659+10	4	3	72753031-45a4-4af9-972f-25edd1ec66a2
112	2021-09-02 21:13:33.662335+10	4	3	72753031-f84c-4135-8ba8-bfe0205f1f99
113	2021-09-02 21:14:05.472697+10	4	3	72753031-6710-4532-b7fa-291aef6c878f
6	2021-09-01 07:15:35.579867+10	1	3	72753031-d06d-43ca-a475-1301ccca65e8
7	2021-09-01 07:18:27.858421+10	1	3	72753031-4233-44cc-9793-9a8530a023f3
153	2021-09-03 20:21:43.104319+10	4	3	72753031-c1d5-4994-b720-ded976168272
10	2021-09-01 07:23:57.860215+10	1	3	72753031-f476-4cd3-bca1-a906b3676053
114	2021-09-02 21:14:17.387791+10	4	3	72753031-a9d3-4762-9569-9c0709cb46aa
49	2021-09-02 16:55:41.693928+10	1	3	72753031-1ce2-4147-9fad-77ebb96894dd
48	2021-09-02 16:55:40.644742+10	1	3	72753031-415b-4356-94be-29532ea9ffe6
41	2021-09-01 12:20:37.596567+10	1	3	72753031-0a34-4e44-8b3a-edbd82127c2c
52	2021-09-02 16:59:07.945033+10	1	3	72753031-c44d-4670-97b2-169b4f58c216
58	2021-09-02 17:10:10.889041+10	1	3	72753031-5b45-4dd1-a574-fb4c3cfe2daa
74	2021-09-02 17:20:24.79736+10	4	3	72753031-750b-4cc5-97a4-d7657e0a9f94
73	2021-09-02 17:20:24.186108+10	4	3	72753031-51a2-495b-ae3a-78ae2c8b0bd2
69	2021-09-02 17:19:39.048784+10	4	3	72753031-dee5-49de-8549-c7784a5a937d
196	2021-09-10 10:50:58.145977+10	4	3	72753031-d4b1-44c2-bf0a-0d5a7182fe3f
198	2021-09-10 10:58:53.287089+10	4	3	72753031-0e4b-4fdd-bc1f-725bbab9c556
225	2021-09-13 11:51:39.622216+10	4	3	72753031-6ab5-4090-aa69-215cc29e4d00
228	2021-09-13 13:16:41.607079+10	4	3	72753031-1595-4366-9716-423ea358196f
229	2021-09-13 13:48:51.249201+10	4	3	72753031-ab6b-4ef0-a684-01d8adf2437c
230	2021-09-13 13:48:51.669438+10	4	3	72753031-f424-42b3-91fd-72a48378f942
124	2021-09-02 21:47:39.001814+10	4	3	72753031-106c-4d49-90bb-67dd4bba51b0
121	2021-09-02 21:45:49.822663+10	4	3	72753031-7aa8-4e7c-a315-fda947b193ef
27	2021-09-01 09:47:33.319582+10	1	3	72753031-141d-4c9d-b515-21aff3e8b6e0
155	2021-09-03 20:23:04.829669+10	4	3	72753031-0898-4478-862f-0c21f06d2946
31	2021-09-01 10:18:07.667664+10	1	3	72753031-bd39-448e-9ea9-077759ea2485
118	2021-09-02 21:35:46.773535+10	4	3	72753031-2de1-41c7-8c78-647ecd6df784
232	2021-09-13 13:48:52.707693+10	4	3	72753031-e6c9-4765-b2c7-e8dce3f73d7c
117	2021-09-02 21:27:33.895283+10	4	3	72753031-4d4a-4995-9d5e-a95de840ac64
127	2021-09-02 22:04:08.894739+10	4	3	72753031-f7fb-475f-92f9-39e877a2d419
14	2021-09-01 07:33:45+10	1	3	72753031-b12d-449c-b0ee-decd4e18a8ac
29	2021-09-01 10:13:04.680673+10	1	3	72753031-ede2-49bb-ab93-18d0bace61f7
22	2021-09-01 09:42:19.062018+10	1	3	72753031-6c8a-407b-90cf-99ba8c00e793
233	2021-09-13 13:50:17.226588+10	4	3	72753031-90e1-4fdd-b956-a09e4d150d97
246	2021-09-13 16:02:02.283511+10	4	3	72753031-ee9c-4b9b-93bc-529c26b2f9e0
237	2021-09-13 16:00:41.668893+10	4	3	72753031-e3ee-4311-9bd0-c2200c32a7ef
235	2021-09-13 16:00:40.629892+10	4	3	72753031-7bc1-44d2-a5b1-31be3396fd3a
236	2021-09-13 16:00:41.24176+10	4	3	72753031-2f00-4688-92a1-812fadfc376b
245	2021-09-13 16:02:01.904274+10	4	3	72753031-4937-4497-a55c-4be92d0c9814
231	2021-09-13 13:48:52.194623+10	4	3	72753031-9588-40da-adbc-463a8255f327
244	2021-09-13 16:02:01.45276+10	4	3	72753031-d0b6-4d17-9bec-e746d486f6bc
241	2021-09-13 16:01:48.541928+10	4	3	72753031-07a5-4c69-9829-587998ae1533
240	2021-09-13 16:01:48.012872+10	4	3	72753031-38eb-4f38-82a5-7fcc52429a26
239	2021-09-13 16:01:47.488323+10	4	3	72753031-49d3-4515-9016-731293454be6
238	2021-09-13 16:01:46.855772+10	4	3	72753031-4375-4ed9-b4c8-c6e78770d875
242	2021-09-13 16:01:48.967064+10	4	3	72753031-155d-47d2-9264-98d4ea49d55d
34	2021-09-01 11:47:03.304545+10	1	3	72753031-05cb-4e16-861a-d6fbb6c8e599
38	2021-09-01 12:06:28.53384+10	1	3	72753031-e085-4e79-9e1a-2799dc565fe3
252	2021-10-19 07:41:12.526733+10	4	3	72753031-8f44-44c0-9a83-b498dcebb192
256	2021-10-25 21:42:09.370641+10	4	3	72753031-b2be-448d-9f9f-2d7e9af509ef
253	2021-10-25 18:35:55.615716+10	4	3	72753031-f163-4a06-95de-72ff0e06e440
243	2021-09-13 16:02:01.070876+10	4	3	72753031-35db-4ba2-b945-d28e377f0f35
247	2021-09-13 16:02:02.650572+10	4	3	72753031-bbbb-4724-88d2-f09e337d7cea
248	2021-09-13 16:02:02.999198+10	4	3	72753031-9e05-415b-89ca-56c4c29460f0
249	2021-09-13 16:02:03.360608+10	4	3	72753031-c137-45b7-ab0e-546a61d3bdfa
255	2021-10-25 21:37:34.337008+10	4	3	72753031-2cb9-4dce-9d0f-1511e7a0c41b
250	2021-09-17 20:33:13.628274+10	4	3	72753031-2bb6-4d67-8c47-3b1d7e2f2651
254	2021-10-25 18:36:19.245296+10	4	3	72753031-d386-4882-b531-9173660fcad0
251	2021-09-18 10:49:12.448384+10	4	3	72753031-7128-4f0b-8b70-31856be213e9
257	2021-10-25 23:22:50.489829+10	4	3	72753031-a033-49e1-a07c-6bc3e2695ec8
\.


--
-- Data for Name: main_order_productset; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_order_productset (id, order_id, productset_id) FROM stdin;
1	1	1
2	1	2
3	2	2
4	3	1
5	4	1
6	5	1
7	6	1
8	7	1
9	10	1
10	11	1
11	12	1
12	13	1
13	14	1
15	14	2
16	16	2
17	17	1
18	18	1
19	18	2
20	20	1
21	20	2
22	22	1
23	22	2
24	23	1
25	23	2
26	24	1
27	24	2
28	26	1
29	26	2
30	27	1
31	27	2
32	28	1
33	28	2
34	29	1
35	29	2
36	30	1
37	30	2
38	31	1
39	31	2
40	32	1
41	32	2
42	33	1
43	33	2
44	34	1
45	34	2
46	36	1
47	36	2
50	38	1
51	38	2
52	39	1
53	39	2
54	40	1
55	40	2
56	41	1
57	41	2
60	43	1
61	43	2
62	44	1
63	44	2
64	45	1
65	45	2
66	46	1
67	46	2
68	47	1
69	47	2
70	48	1
71	48	2
72	49	1
73	49	2
74	50	1
75	50	2
76	51	1
77	51	2
78	52	1
79	52	2
80	53	1
81	53	2
82	54	1
83	54	2
84	55	1
85	55	2
86	56	1
87	56	2
88	57	1
89	57	2
90	58	1
91	58	2
92	59	1
93	59	2
94	60	1
95	60	2
96	61	1
97	61	2
98	62	1
99	62	2
100	63	1
101	63	2
102	64	1
103	64	2
104	65	1
105	65	2
106	66	1
107	66	2
108	67	1
109	67	2
110	68	1
111	68	2
112	69	1
113	69	2
114	70	1
115	70	2
116	71	1
117	71	2
118	72	1
119	72	2
120	73	1
121	73	2
122	74	1
123	74	2
124	75	1
125	75	2
126	76	1
127	76	2
128	77	1
129	77	2
130	78	1
131	78	2
132	79	1
133	79	2
134	80	1
135	80	2
136	81	1
137	81	2
138	82	1
139	82	2
140	83	1
141	83	2
142	84	1
143	84	2
144	85	1
145	85	2
146	86	1
147	86	2
148	87	1
149	87	2
150	88	1
151	88	2
152	89	1
153	89	2
154	90	1
155	90	2
156	91	1
157	91	2
158	92	1
159	92	2
160	93	1
161	93	2
162	94	1
163	94	2
164	95	1
165	95	2
166	96	1
167	96	2
168	97	1
169	97	2
170	98	1
171	98	2
172	99	1
173	99	2
174	100	1
175	100	2
176	101	1
177	101	2
178	102	1
179	102	2
180	103	1
181	103	2
182	104	1
183	104	2
184	105	1
185	105	2
186	106	1
187	106	2
188	107	1
189	107	2
190	108	1
191	108	2
192	109	1
193	109	2
194	110	1
195	110	2
196	111	1
197	111	2
198	112	1
199	112	2
200	113	1
201	113	2
202	114	1
203	114	2
204	115	1
205	115	2
206	116	1
207	116	2
208	117	1
209	117	2
210	118	1
211	118	2
212	119	1
213	119	2
214	120	1
215	120	2
216	121	1
217	121	2
218	122	1
219	122	2
220	123	1
221	123	2
222	124	1
223	124	2
224	125	1
225	125	2
226	126	1
227	126	2
228	127	1
229	127	2
230	128	1
231	128	2
232	129	1
233	129	2
234	130	1
235	130	2
236	131	1
237	131	2
238	132	1
239	132	2
240	133	1
241	133	2
242	134	1
243	134	2
244	135	1
245	135	2
246	136	1
247	136	2
248	137	1
249	137	2
250	138	1
251	138	2
252	139	1
253	139	2
254	140	1
255	140	2
256	141	1
257	141	2
258	142	1
259	142	2
260	143	1
261	143	2
262	144	1
263	144	2
264	145	1
265	145	2
266	146	1
267	146	2
268	147	1
269	147	2
270	148	1
271	148	2
272	149	1
273	149	2
274	150	1
275	150	2
276	151	1
277	151	2
278	152	1
279	152	2
280	153	1
281	153	2
282	154	1
283	154	2
284	155	1
285	155	2
286	156	1
287	156	2
288	157	1
289	157	2
290	158	1
291	158	2
292	159	1
293	159	2
294	160	1
295	160	2
296	161	1
297	161	2
298	162	1
299	162	2
300	163	1
301	163	2
302	164	1
303	164	2
304	165	1
305	165	2
306	166	1
307	166	2
308	167	1
309	167	2
310	168	1
311	168	2
312	169	1
313	169	2
314	170	1
315	170	2
316	171	1
317	171	2
318	172	1
319	172	2
320	173	1
321	173	2
322	174	1
323	174	2
324	175	1
325	175	2
326	176	1
327	176	2
328	177	1
329	177	2
330	178	1
331	178	2
332	179	1
333	179	2
334	180	1
335	180	2
336	181	1
337	181	2
338	182	1
339	182	2
340	183	1
341	183	2
342	184	1
343	184	2
344	185	1
345	185	2
346	186	1
347	186	2
348	187	1
349	187	2
350	188	1
351	188	2
352	189	1
353	189	2
354	190	1
355	190	2
356	191	1
357	191	2
358	192	1
359	192	2
360	193	1
361	193	2
362	194	1
363	194	2
364	195	1
365	195	2
366	196	1
367	196	2
368	197	1
369	197	2
370	198	1
371	198	2
372	199	1
373	199	2
374	200	1
375	200	2
376	201	1
377	201	2
378	202	1
379	202	2
380	203	1
381	203	2
382	204	1
383	204	2
384	205	1
385	205	2
386	206	1
387	206	2
388	207	1
389	207	2
390	208	1
391	208	2
392	209	1
393	209	2
394	210	1
395	210	2
396	211	1
397	211	2
398	212	1
399	212	2
400	213	1
401	213	2
402	214	1
403	214	2
404	215	1
405	215	2
406	216	1
407	216	2
408	217	1
409	217	2
410	218	1
411	218	2
412	219	1
413	219	2
414	220	1
415	220	2
416	221	1
417	221	2
418	222	1
419	222	2
420	223	1
421	223	2
422	224	1
423	224	2
424	225	1
425	225	2
426	226	1
427	226	2
428	227	1
429	227	2
430	228	1
431	228	2
432	229	1
433	229	2
434	230	1
435	230	2
436	231	1
437	231	2
438	232	1
439	232	2
440	233	1
441	233	2
442	234	1
443	234	2
444	235	1
445	235	2
446	236	1
447	236	2
448	237	1
449	237	2
450	238	1
451	238	2
452	239	1
453	239	2
454	240	1
455	240	2
456	241	1
457	241	2
458	242	1
459	242	2
460	243	1
461	243	2
462	244	1
463	244	2
464	245	1
465	245	2
466	246	1
467	246	2
468	247	1
469	247	2
470	248	1
471	248	2
472	249	1
473	249	2
474	250	1
475	250	2
476	251	1
477	251	2
478	252	1
479	252	2
480	253	1
481	253	2
482	254	1
483	254	2
484	255	1
485	255	2
486	256	1
487	257	1
\.


--
-- Data for Name: main_photo; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_photo (id, image, product_id) FROM stdin;
1	blinch.jpeg	1
2	blinch2.jpeg	1
3	blinch2_STlNfey.jpeg	1
5	kola.jpg	2
6	kokoko.jpeg	2
7	coca-cola_05.jpg	2
4		1
8		1
\.


--
-- Data for Name: main_product; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_product (id, description, price, brand_id, category_id, country_id, name) FROM stdin;
2	Кока-кола 1 литр	50	1	4	3	Кока-кола
1	Блинчики с фаршем и салом 1000 калорий в одном!	200	3	3	1	Блинчики с фаршем и салом
3	Блинчики с сыром	400	3	3	1	Блинчики
4	Пирожок с вареньем 200 гр	100	4	8	1	Пирожок с вареньем
5	Сухари с изюмом 500 гр	1000	4	7	1	Сухари с изюмом
6	Никель 1000 тонн.	0	1	1	1	NorNikel
7	111	111	1	3	6	111
8	111	111	1	3	6	111888
9	Никель 1000 тонн.	0	1	1	1	NorNikel2
10	Никель 1000 тонн.	0	1	1	1	NorNikel3
11	Никель 1000 тонн.	0	1	1	1	NorNikel4
12	Никель 1000 тонн.	0	1	1	1	NorNikel5
13	Никель 1000 тонн.	0	1	1	1	NorNikel6
14	Никель 1000 тонн.	0	1	1	1	NorNikel7
15	Никель 1000 тонн.	0	1	1	1	NorNikel8
16	Никель 1000 тонн.	0	1	1	1	NorNikel9
17	Никель 1000 тонн.	0	1	1	1	NorNikel10
18	Никель 1000 тонн.	0	1	1	1	NorNikel11
19	Никель 1000 тонн.	0	1	1	1	NorNikel12
\.


--
-- Data for Name: main_productset; Type: TABLE DATA; Schema: public; Owner: user_name
--

COPY public.main_productset (id, product_count, advuser_id, product_id) FROM stdin;
1	3	1	1
2	5	1	2
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 100, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 33, true);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 1, false);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 25, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 51, true);


--
-- Name: main_advuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_advuser_groups_id_seq', 1, false);


--
-- Name: main_advuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_advuser_id_seq', 13, true);


--
-- Name: main_advuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_advuser_user_permissions_id_seq', 1, false);


--
-- Name: main_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_brand_id_seq', 10, true);


--
-- Name: main_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_category_id_seq', 8, true);


--
-- Name: main_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_country_id_seq', 9, true);


--
-- Name: main_discount_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_discount_brand_id_seq', 1, true);


--
-- Name: main_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_discount_id_seq', 1, true);


--
-- Name: main_discount_pediod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_discount_pediod_id_seq', 1, true);


--
-- Name: main_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_order_id_seq', 257, true);


--
-- Name: main_order_productset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_order_productset_id_seq', 487, true);


--
-- Name: main_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_photo_id_seq', 8, true);


--
-- Name: main_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_product_id_seq', 19, true);


--
-- Name: main_productset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_name
--

SELECT pg_catalog.setval('public.main_productset_id_seq', 2, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: main_advuser_groups main_advuser_groups_advuser_id_group_id_e23ca7e3_uniq; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_advuser_groups
    ADD CONSTRAINT main_advuser_groups_advuser_id_group_id_e23ca7e3_uniq UNIQUE (advuser_id, group_id);


--
-- Name: main_advuser_groups main_advuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_advuser_groups
    ADD CONSTRAINT main_advuser_groups_pkey PRIMARY KEY (id);


--
-- Name: main_advuser main_advuser_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_advuser
    ADD CONSTRAINT main_advuser_pkey PRIMARY KEY (id);


--
-- Name: main_advuser_user_permissions main_advuser_user_permis_advuser_id_permission_id_ff36fb91_uniq; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_advuser_user_permissions
    ADD CONSTRAINT main_advuser_user_permis_advuser_id_permission_id_ff36fb91_uniq UNIQUE (advuser_id, permission_id);


--
-- Name: main_advuser_user_permissions main_advuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_advuser_user_permissions
    ADD CONSTRAINT main_advuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: main_advuser main_advuser_username_key; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_advuser
    ADD CONSTRAINT main_advuser_username_key UNIQUE (username);


--
-- Name: main_brand main_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_brand
    ADD CONSTRAINT main_brand_pkey PRIMARY KEY (id);


--
-- Name: main_category main_category_name_key; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_category
    ADD CONSTRAINT main_category_name_key UNIQUE (name);


--
-- Name: main_category main_category_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_category
    ADD CONSTRAINT main_category_pkey PRIMARY KEY (id);


--
-- Name: main_country main_country_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_country
    ADD CONSTRAINT main_country_pkey PRIMARY KEY (id);


--
-- Name: main_discount_brand main_discount_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_discount_brand
    ADD CONSTRAINT main_discount_brand_pkey PRIMARY KEY (id);


--
-- Name: main_discount_pediod main_discount_pediod_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_discount_pediod
    ADD CONSTRAINT main_discount_pediod_pkey PRIMARY KEY (id);


--
-- Name: main_discount main_discount_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_discount
    ADD CONSTRAINT main_discount_pkey PRIMARY KEY (id);


--
-- Name: main_order main_order_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_order
    ADD CONSTRAINT main_order_pkey PRIMARY KEY (id);


--
-- Name: main_order_productset main_order_productset_order_id_productset_id_95ace0cb_uniq; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_order_productset
    ADD CONSTRAINT main_order_productset_order_id_productset_id_95ace0cb_uniq UNIQUE (order_id, productset_id);


--
-- Name: main_order_productset main_order_productset_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_order_productset
    ADD CONSTRAINT main_order_productset_pkey PRIMARY KEY (id);


--
-- Name: main_photo main_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_photo
    ADD CONSTRAINT main_photo_pkey PRIMARY KEY (id);


--
-- Name: main_product main_product_name_key; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_product
    ADD CONSTRAINT main_product_name_key UNIQUE (name);


--
-- Name: main_product main_product_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_product
    ADD CONSTRAINT main_product_pkey PRIMARY KEY (id);


--
-- Name: main_productset main_productset_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_productset
    ADD CONSTRAINT main_productset_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: main_advuser_address_3f8b4be7; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_advuser_address_3f8b4be7 ON public.main_advuser USING btree (address);


--
-- Name: main_advuser_address_3f8b4be7_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_advuser_address_3f8b4be7_like ON public.main_advuser USING btree (address varchar_pattern_ops);


--
-- Name: main_advuser_groups_advuser_id_37f9a801; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_advuser_groups_advuser_id_37f9a801 ON public.main_advuser_groups USING btree (advuser_id);


--
-- Name: main_advuser_groups_group_id_24f10e83; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_advuser_groups_group_id_24f10e83 ON public.main_advuser_groups USING btree (group_id);


--
-- Name: main_advuser_is_activated_d85bdc74; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_advuser_is_activated_d85bdc74 ON public.main_advuser USING btree (is_activated);


--
-- Name: main_advuser_user_permissions_advuser_id_0caf15c4; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_advuser_user_permissions_advuser_id_0caf15c4 ON public.main_advuser_user_permissions USING btree (advuser_id);


--
-- Name: main_advuser_user_permissions_permission_id_fd33caf9; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_advuser_user_permissions_permission_id_fd33caf9 ON public.main_advuser_user_permissions USING btree (permission_id);


--
-- Name: main_advuser_username_b088ff85_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_advuser_username_b088ff85_like ON public.main_advuser USING btree (username varchar_pattern_ops);


--
-- Name: main_brand_name_24a36b0c; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_brand_name_24a36b0c ON public.main_brand USING btree (name);


--
-- Name: main_brand_name_24a36b0c_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_brand_name_24a36b0c_like ON public.main_brand USING btree (name varchar_pattern_ops);


--
-- Name: main_category_name_eb0f0831_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_category_name_eb0f0831_like ON public.main_category USING btree (name varchar_pattern_ops);


--
-- Name: main_category_super_category_id_5da53584; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_category_super_category_id_5da53584 ON public.main_category USING btree (super_category_id);


--
-- Name: main_country_name_1c6d92a2; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_country_name_1c6d92a2 ON public.main_country USING btree (name);


--
-- Name: main_country_name_1c6d92a2_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_country_name_1c6d92a2_like ON public.main_country USING btree (name varchar_pattern_ops);


--
-- Name: main_discount_brand_brand_id_f312b0ad; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_discount_brand_brand_id_f312b0ad ON public.main_discount_brand USING btree (brand_id);


--
-- Name: main_discount_pediod_product_id_b24101d1; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_discount_pediod_product_id_b24101d1 ON public.main_discount_pediod USING btree (product_id);


--
-- Name: main_discount_product_id_15ca5eda; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_discount_product_id_15ca5eda ON public.main_discount USING btree (product_id);


--
-- Name: main_order_advuser_id_1acd8315; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_order_advuser_id_1acd8315 ON public.main_order USING btree (advuser_id);


--
-- Name: main_order_cdek_uuid_79defc6c; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_order_cdek_uuid_79defc6c ON public.main_order USING btree (cdek_uuid);


--
-- Name: main_order_cdek_uuid_79defc6c_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_order_cdek_uuid_79defc6c_like ON public.main_order USING btree (cdek_uuid varchar_pattern_ops);


--
-- Name: main_order_productset_order_id_3baa1da6; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_order_productset_order_id_3baa1da6 ON public.main_order_productset USING btree (order_id);


--
-- Name: main_order_productset_productset_id_507909f1; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_order_productset_productset_id_507909f1 ON public.main_order_productset USING btree (productset_id);


--
-- Name: main_photo_product_id_409ceaf1; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_photo_product_id_409ceaf1 ON public.main_photo USING btree (product_id);


--
-- Name: main_product_brand_id_d55caeb1; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_product_brand_id_d55caeb1 ON public.main_product USING btree (brand_id);


--
-- Name: main_product_category_id_c0d90f41; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_product_category_id_c0d90f41 ON public.main_product USING btree (category_id);


--
-- Name: main_product_country_id_c0ce4525; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_product_country_id_c0ce4525 ON public.main_product USING btree (country_id);


--
-- Name: main_product_description_dbecf61d; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_product_description_dbecf61d ON public.main_product USING btree (description);


--
-- Name: main_product_description_dbecf61d_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_product_description_dbecf61d_like ON public.main_product USING btree (description varchar_pattern_ops);


--
-- Name: main_product_name_1d18c288_like; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_product_name_1d18c288_like ON public.main_product USING btree (name varchar_pattern_ops);


--
-- Name: main_productset_advuser_id_93a0f240; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_productset_advuser_id_93a0f240 ON public.main_productset USING btree (advuser_id);


--
-- Name: main_productset_product_id_a187f7d9; Type: INDEX; Schema: public; Owner: user_name
--

CREATE INDEX main_productset_product_id_a187f7d9 ON public.main_productset USING btree (product_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_main_advuser_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_main_advuser_id FOREIGN KEY (user_id) REFERENCES public.main_advuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_main_advuser_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_main_advuser_id FOREIGN KEY (user_id) REFERENCES public.main_advuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_advuser_groups main_advuser_groups_advuser_id_37f9a801_fk_main_advuser_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_advuser_groups
    ADD CONSTRAINT main_advuser_groups_advuser_id_37f9a801_fk_main_advuser_id FOREIGN KEY (advuser_id) REFERENCES public.main_advuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_advuser_groups main_advuser_groups_group_id_24f10e83_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_advuser_groups
    ADD CONSTRAINT main_advuser_groups_group_id_24f10e83_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_advuser_user_permissions main_advuser_user_pe_advuser_id_0caf15c4_fk_main_advu; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_advuser_user_permissions
    ADD CONSTRAINT main_advuser_user_pe_advuser_id_0caf15c4_fk_main_advu FOREIGN KEY (advuser_id) REFERENCES public.main_advuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_advuser_user_permissions main_advuser_user_pe_permission_id_fd33caf9_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_advuser_user_permissions
    ADD CONSTRAINT main_advuser_user_pe_permission_id_fd33caf9_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_category main_category_super_category_id_5da53584_fk_main_category_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_category
    ADD CONSTRAINT main_category_super_category_id_5da53584_fk_main_category_id FOREIGN KEY (super_category_id) REFERENCES public.main_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_discount_brand main_discount_brand_brand_id_f312b0ad_fk_main_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_discount_brand
    ADD CONSTRAINT main_discount_brand_brand_id_f312b0ad_fk_main_brand_id FOREIGN KEY (brand_id) REFERENCES public.main_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_discount_pediod main_discount_pediod_product_id_b24101d1_fk_main_product_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_discount_pediod
    ADD CONSTRAINT main_discount_pediod_product_id_b24101d1_fk_main_product_id FOREIGN KEY (product_id) REFERENCES public.main_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_discount main_discount_product_id_15ca5eda_fk_main_product_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_discount
    ADD CONSTRAINT main_discount_product_id_15ca5eda_fk_main_product_id FOREIGN KEY (product_id) REFERENCES public.main_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_order main_order_advuser_id_1acd8315_fk_main_advuser_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_order
    ADD CONSTRAINT main_order_advuser_id_1acd8315_fk_main_advuser_id FOREIGN KEY (advuser_id) REFERENCES public.main_advuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_order_productset main_order_productse_productset_id_507909f1_fk_main_prod; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_order_productset
    ADD CONSTRAINT main_order_productse_productset_id_507909f1_fk_main_prod FOREIGN KEY (productset_id) REFERENCES public.main_productset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_order_productset main_order_productset_order_id_3baa1da6_fk_main_order_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_order_productset
    ADD CONSTRAINT main_order_productset_order_id_3baa1da6_fk_main_order_id FOREIGN KEY (order_id) REFERENCES public.main_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_photo main_photo_product_id_409ceaf1_fk_main_product_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_photo
    ADD CONSTRAINT main_photo_product_id_409ceaf1_fk_main_product_id FOREIGN KEY (product_id) REFERENCES public.main_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_product main_product_brand_id_d55caeb1_fk_main_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_product
    ADD CONSTRAINT main_product_brand_id_d55caeb1_fk_main_brand_id FOREIGN KEY (brand_id) REFERENCES public.main_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_product main_product_category_id_c0d90f41_fk_main_category_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_product
    ADD CONSTRAINT main_product_category_id_c0d90f41_fk_main_category_id FOREIGN KEY (category_id) REFERENCES public.main_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_product main_product_country_id_c0ce4525_fk_main_country_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_product
    ADD CONSTRAINT main_product_country_id_c0ce4525_fk_main_country_id FOREIGN KEY (country_id) REFERENCES public.main_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_productset main_productset_advuser_id_93a0f240_fk_main_advuser_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_productset
    ADD CONSTRAINT main_productset_advuser_id_93a0f240_fk_main_advuser_id FOREIGN KEY (advuser_id) REFERENCES public.main_advuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_productset main_productset_product_id_a187f7d9_fk_main_product_id; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.main_productset
    ADD CONSTRAINT main_productset_product_id_a187f7d9_fk_main_product_id FOREIGN KEY (product_id) REFERENCES public.main_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

