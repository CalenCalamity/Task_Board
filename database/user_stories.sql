--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-06-22 04:53:24

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
-- TOC entry 207 (class 1259 OID 16426)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16424)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 209 (class 1259 OID 16436)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16434)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 205 (class 1259 OID 16418)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16416)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 211 (class 1259 OID 16444)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16454)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16452)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 210 (class 1259 OID 16442)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 215 (class 1259 OID 16462)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16460)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 217 (class 1259 OID 16522)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16520)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 216
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 203 (class 1259 OID 16408)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16406)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 201 (class 1259 OID 16397)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16395)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 200
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 218 (class 1259 OID 16553)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16565)
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_association (
    id bigint NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16652)
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO postgres;

--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 224
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- TOC entry 220 (class 1259 OID 16576)
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_code (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16666)
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO postgres;

--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 225
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- TOC entry 221 (class 1259 OID 16584)
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_nonce (
    id bigint NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16677)
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO postgres;

--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 226
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- TOC entry 223 (class 1259 OID 16621)
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_partial (
    id bigint NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16693)
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO postgres;

--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 227
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- TOC entry 222 (class 1259 OID 16592)
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_usersocialauth (
    id bigint NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16710)
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO postgres;

--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 228
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- TOC entry 230 (class 1259 OID 16716)
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task (
    id bigint NOT NULL,
    task_title character varying(80) NOT NULL,
    priority character varying(2) NOT NULL,
    due_date timestamp with time zone NOT NULL,
    description character varying(254) NOT NULL,
    assigned_user_email character varying(254) NOT NULL,
    is_deleted boolean NOT NULL,
    last_modified_by_email character varying(254) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    last_modified_date timestamp with time zone NOT NULL,
    created_by_id bigint,
    is_complete boolean NOT NULL
);


ALTER TABLE public.task OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16727)
-- Name: task_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_comment (
    id bigint NOT NULL,
    assigned_user_email character varying(254) NOT NULL,
    message character varying(254) NOT NULL,
    is_deleted boolean NOT NULL,
    last_modified_by_email character varying(254) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    last_modified_date timestamp with time zone NOT NULL,
    created_by_id bigint,
    task_id bigint
);


ALTER TABLE public.task_comment OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16725)
-- Name: task_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_comment_id_seq OWNER TO postgres;

--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 231
-- Name: task_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_comment_id_seq OWNED BY public.task_comment.id;


--
-- TOC entry 229 (class 1259 OID 16714)
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO postgres;

--
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 229
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- TOC entry 2956 (class 2604 OID 16429)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2957 (class 2604 OID 16439)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2955 (class 2604 OID 16421)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2958 (class 2604 OID 16447)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2959 (class 2604 OID 16457)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2960 (class 2604 OID 16465)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2961 (class 2604 OID 16525)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2954 (class 2604 OID 16411)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2953 (class 2604 OID 16400)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2963 (class 2604 OID 16654)
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- TOC entry 2964 (class 2604 OID 16668)
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- TOC entry 2965 (class 2604 OID 16679)
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- TOC entry 2967 (class 2604 OID 16695)
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- TOC entry 2966 (class 2604 OID 16712)
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- TOC entry 2969 (class 2604 OID 16719)
-- Name: task id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- TOC entry 2970 (class 2604 OID 16730)
-- Name: task_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_comment ALTER COLUMN id SET DEFAULT nextval('public.task_comment_id_seq'::regclass);


--
-- TOC entry 3202 (class 0 OID 16426)
-- Dependencies: 207
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3204 (class 0 OID 16436)
-- Dependencies: 209
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 16418)
-- Dependencies: 205
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add association	7	add_association
26	Can change association	7	change_association
27	Can delete association	7	delete_association
28	Can view association	7	view_association
29	Can add code	8	add_code
30	Can change code	8	change_code
31	Can delete code	8	delete_code
32	Can view code	8	view_code
33	Can add nonce	9	add_nonce
34	Can change nonce	9	change_nonce
35	Can delete nonce	9	delete_nonce
36	Can view nonce	9	view_nonce
37	Can add user social auth	10	add_usersocialauth
38	Can change user social auth	10	change_usersocialauth
39	Can delete user social auth	10	delete_usersocialauth
40	Can view user social auth	10	view_usersocialauth
41	Can add partial	11	add_partial
42	Can change partial	11	change_partial
43	Can delete partial	11	delete_partial
44	Can view partial	11	view_partial
45	Can add auth group	12	add_authgroup
46	Can change auth group	12	change_authgroup
47	Can delete auth group	12	delete_authgroup
48	Can view auth group	12	view_authgroup
49	Can add auth group permissions	13	add_authgrouppermissions
50	Can change auth group permissions	13	change_authgrouppermissions
51	Can delete auth group permissions	13	delete_authgrouppermissions
52	Can view auth group permissions	13	view_authgrouppermissions
53	Can add auth permission	14	add_authpermission
54	Can change auth permission	14	change_authpermission
55	Can delete auth permission	14	delete_authpermission
56	Can view auth permission	14	view_authpermission
57	Can add auth user	15	add_authuser
58	Can change auth user	15	change_authuser
59	Can delete auth user	15	delete_authuser
60	Can view auth user	15	view_authuser
61	Can add auth user groups	16	add_authusergroups
62	Can change auth user groups	16	change_authusergroups
63	Can delete auth user groups	16	delete_authusergroups
64	Can view auth user groups	16	view_authusergroups
65	Can add auth user user permissions	17	add_authuseruserpermissions
66	Can change auth user user permissions	17	change_authuseruserpermissions
67	Can delete auth user user permissions	17	delete_authuseruserpermissions
68	Can view auth user user permissions	17	view_authuseruserpermissions
69	Can add comment	18	add_comment
70	Can change comment	18	change_comment
71	Can delete comment	18	delete_comment
72	Can view comment	18	view_comment
73	Can add django admin log	19	add_djangoadminlog
74	Can change django admin log	19	change_djangoadminlog
75	Can delete django admin log	19	delete_djangoadminlog
76	Can view django admin log	19	view_djangoadminlog
77	Can add django content type	20	add_djangocontenttype
78	Can change django content type	20	change_djangocontenttype
79	Can delete django content type	20	delete_djangocontenttype
80	Can view django content type	20	view_djangocontenttype
81	Can add django migrations	21	add_djangomigrations
82	Can change django migrations	21	change_djangomigrations
83	Can delete django migrations	21	delete_djangomigrations
84	Can view django migrations	21	view_djangomigrations
85	Can add django session	22	add_djangosession
86	Can change django session	22	change_djangosession
87	Can delete django session	22	delete_djangosession
88	Can view django session	22	view_djangosession
89	Can add social auth association	23	add_socialauthassociation
90	Can change social auth association	23	change_socialauthassociation
91	Can delete social auth association	23	delete_socialauthassociation
92	Can view social auth association	23	view_socialauthassociation
93	Can add social auth code	24	add_socialauthcode
94	Can change social auth code	24	change_socialauthcode
95	Can delete social auth code	24	delete_socialauthcode
96	Can view social auth code	24	view_socialauthcode
97	Can add social auth nonce	25	add_socialauthnonce
98	Can change social auth nonce	25	change_socialauthnonce
99	Can delete social auth nonce	25	delete_socialauthnonce
100	Can view social auth nonce	25	view_socialauthnonce
101	Can add social auth partial	26	add_socialauthpartial
102	Can change social auth partial	26	change_socialauthpartial
103	Can delete social auth partial	26	delete_socialauthpartial
104	Can view social auth partial	26	view_socialauthpartial
105	Can add social auth usersocialauth	27	add_socialauthusersocialauth
106	Can change social auth usersocialauth	27	change_socialauthusersocialauth
107	Can delete social auth usersocialauth	27	delete_socialauthusersocialauth
108	Can view social auth usersocialauth	27	view_socialauthusersocialauth
109	Can add task	28	add_task
110	Can change task	28	change_task
111	Can delete task	28	delete_task
112	Can view task	28	view_task
\.


--
-- TOC entry 3206 (class 0 OID 16444)
-- Dependencies: 211
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$260000$QN8BFofwBmXnFVhxixYOx2$rP4jsj+ewG0tbdRCe7Pu3QVkTApmBFEPrIgPmffMPFs=	2021-06-20 18:37:17.530341+02	f	tester			lancemac26@gmail.com	f	t	2021-06-20 18:37:17.253354+02
4	pbkdf2_sha256$260000$k3L8KVn1gu6sUmvz9XH30k$bQ1lPGgnrHhfJOPmiqVRe0P9/0o8Eu/ur5JmKnJy8Jc=	2021-06-22 00:00:14.355744+02	f	qwdsad			qsdqsd@gmail.com	f	t	2021-06-22 00:00:14.078155+02
3	pbkdf2_sha256$260000$W0VArS8kwJWgGgsPCiiBEk$V4V9ILBPYQdJwbne7q6QJ55tKApT87mZujNcBgyaD+Y=	2021-06-22 00:02:08.898507+02	f	second_user			test@gmail.com	f	t	2021-06-21 23:56:52.602311+02
1	pbkdf2_sha256$260000$ls5sFR6PtzDmL66JjTzSZt$mQznTG2zi0LNHoxIk+w9ZjzbyEMYscKm5D1ROrcScaM=	2021-06-22 04:27:56.183659+02	t	admin			calencalamity@gmail.com	t	t	2021-06-20 18:27:22.519908+02
\.


--
-- TOC entry 3208 (class 0 OID 16454)
-- Dependencies: 213
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 16462)
-- Dependencies: 215
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 16522)
-- Dependencies: 217
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 16408)
-- Dependencies: 203
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	social_django	association
8	social_django	code
9	social_django	nonce
10	social_django	usersocialauth
11	social_django	partial
12	users	authgroup
13	users	authgrouppermissions
14	users	authpermission
15	users	authuser
16	users	authusergroups
17	users	authuseruserpermissions
18	users	comment
19	users	djangoadminlog
20	users	djangocontenttype
21	users	djangomigrations
22	users	djangosession
23	users	socialauthassociation
24	users	socialauthcode
25	users	socialauthnonce
26	users	socialauthpartial
27	users	socialauthusersocialauth
28	users	task
\.


--
-- TOC entry 3196 (class 0 OID 16397)
-- Dependencies: 201
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-06-20 18:22:45.739306+02
2	auth	0001_initial	2021-06-20 18:22:46.014307+02
3	admin	0001_initial	2021-06-20 18:22:46.083309+02
4	admin	0002_logentry_remove_auto_add	2021-06-20 18:22:46.092307+02
5	admin	0003_logentry_add_action_flag_choices	2021-06-20 18:22:46.099304+02
6	contenttypes	0002_remove_content_type_name	2021-06-20 18:22:46.122305+02
7	auth	0002_alter_permission_name_max_length	2021-06-20 18:22:46.131304+02
8	auth	0003_alter_user_email_max_length	2021-06-20 18:22:46.139302+02
9	auth	0004_alter_user_username_opts	2021-06-20 18:22:46.147302+02
10	auth	0005_alter_user_last_login_null	2021-06-20 18:22:46.155306+02
11	auth	0006_require_contenttypes_0002	2021-06-20 18:22:46.157306+02
12	auth	0007_alter_validators_add_error_messages	2021-06-20 18:22:46.165309+02
13	auth	0008_alter_user_username_max_length	2021-06-20 18:22:46.236309+02
14	auth	0009_alter_user_last_name_max_length	2021-06-20 18:22:46.245306+02
15	auth	0010_alter_group_name_max_length	2021-06-20 18:22:46.256308+02
16	auth	0011_update_proxy_permissions	2021-06-20 18:22:46.264306+02
17	auth	0012_alter_user_first_name_max_length	2021-06-20 18:22:46.272306+02
18	sessions	0001_initial	2021-06-20 18:22:46.304307+02
19	default	0001_initial	2021-06-20 18:22:46.561305+02
20	social_auth	0001_initial	2021-06-20 18:22:46.562305+02
21	default	0002_add_related_name	2021-06-20 18:22:46.574305+02
22	social_auth	0002_add_related_name	2021-06-20 18:22:46.57531+02
23	default	0003_alter_email_max_length	2021-06-20 18:22:46.581305+02
24	social_auth	0003_alter_email_max_length	2021-06-20 18:22:46.582305+02
25	default	0004_auto_20160423_0400	2021-06-20 18:22:46.592307+02
26	social_auth	0004_auto_20160423_0400	2021-06-20 18:22:46.593305+02
27	social_auth	0005_auto_20160727_2333	2021-06-20 18:22:46.606305+02
28	social_django	0006_partial	2021-06-20 18:22:46.646306+02
29	social_django	0007_code_timestamp	2021-06-20 18:22:46.668306+02
30	social_django	0008_partial_timestamp	2021-06-20 18:22:46.680307+02
31	social_django	0009_auto_20191118_0520	2021-06-20 18:22:46.699305+02
32	social_django	0010_uid_db_index	2021-06-20 18:22:46.726308+02
33	social_django	0011_auto_20210620_1821	2021-06-20 18:22:47.021383+02
34	social_django	0004_auto_20160423_0400	2021-06-20 18:22:47.058376+02
35	social_django	0002_add_related_name	2021-06-20 18:22:47.059377+02
36	social_django	0001_initial	2021-06-20 18:22:47.060379+02
37	social_django	0003_alter_email_max_length	2021-06-20 18:22:47.061379+02
38	social_django	0005_auto_20160727_2333	2021-06-20 18:22:47.062375+02
47	users	0001_initial	2021-06-20 20:07:19.08217+02
48	users	0002_auto_20210620_1943	2021-06-20 20:07:19.088169+02
49	users	0003_comment_task	2021-06-20 20:07:19.093169+02
50	users	0004_auto_20210620_1950	2021-06-20 20:07:19.097167+02
51	users	0005_comment_task	2021-06-20 20:07:19.103167+02
52	users	0006_auto_20210620_1958	2021-06-20 20:07:19.10717+02
53	users	0007_comment_task	2021-06-20 20:07:19.11217+02
54	users	0008_auto_20210620_2002	2021-06-20 20:07:19.117171+02
55	users	0009_auto_20210620_2003	2021-06-20 20:09:30.925741+02
56	users	0010_comment_task	2021-06-20 20:09:30.929746+02
57	users	0011_auto_20210620_2005	2021-06-20 20:09:30.931746+02
58	users	0012_comment_task	2021-06-20 20:09:30.933618+02
59	users	0013_auto_20210620_2009	2021-06-20 20:09:30.936076+02
60	users	0014_comment_task	2021-06-20 20:10:06.581909+02
61	users	0015_auto_20210621_1244	2021-06-21 12:44:51.651085+02
62	users	0016_auto_20210622_0248	2021-06-22 02:48:52.879934+02
\.


--
-- TOC entry 3213 (class 0 OID 16553)
-- Dependencies: 218
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
x9ifasl2w4ln2vvljef29fpyuw5h7bjf	.eJxVjDsOwyAQBe9CHSE-i4GU6X0GtLAQnERYMnYV5e6xJRdJ-2bevFnAba1h63kJE7Erk-zyu0VMz9wOQA9s95mnua3LFPmh8JN2Ps6UX7fT_QtU7HV_C2ekgVIKgB-y1EI7gqxzAQVo9o4yfrCxoHdaJ1IpWhXJemOF1MUB-3wB0jM3fg:1lvTHN:EVthJP0uiVgeEDzvqAC-qpQJS6_NLGK78N4IbUZfIlY	2021-07-06 01:24:33.578287+02
athzvhn7l8k49zaphwy71i131pltzfr0	.eJxVjDsOwyAQBe9CHSE-i4GU6X0GtLAQnERYMnYV5e6xJRdJ-2bevFnAba1h63kJE7Erk-zyu0VMz9wOQA9s95mnua3LFPmh8JN2Ps6UX7fT_QtU7HV_C2ekgVIKgB-y1EI7gqxzAQVo9o4yfrCxoHdaJ1IpWhXJemOF1MUB-3wB0jM3fg:1lvW8q:S8WD3ee_X3XqoVX7sX3Ffysp056t4eJxYZAFrsyVGSY	2021-07-06 04:27:56.189686+02
\.


--
-- TOC entry 3214 (class 0 OID 16565)
-- Dependencies: 219
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- TOC entry 3215 (class 0 OID 16576)
-- Dependencies: 220
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 16584)
-- Dependencies: 221
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- TOC entry 3218 (class 0 OID 16621)
-- Dependencies: 223
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 16592)
-- Dependencies: 222
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
\.


--
-- TOC entry 3225 (class 0 OID 16716)
-- Dependencies: 230
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task (id, task_title, priority, due_date, description, assigned_user_email, is_deleted, last_modified_by_email, created_date, last_modified_date, created_by_id, is_complete) FROM stdin;
3	asd	P2	2021-06-24 02:00:00+02	asdasd\r\n\r\nasd	lancemac26@gmail.com	f	calencalamity@gmail.com	2021-06-21 02:00:00+02	2021-06-21 02:00:00+02	1	f
2	Test Task	P1	2021-06-22 02:00:00+02	Test task to view the functionality	calencalamity@gmail.com	f	('calencalamity@gmail.com',)	2021-06-20 18:37:17.530341+02	2021-06-22 01:10:07.470886+02	1	f
7	Complete Test	P3	2018-04-19 02:00:00+02	asd	calencalamity@gmail.com	t	calencalamity@gmail.com	2021-06-21 02:00:00+02	2021-06-22 01:52:34.656576+02	1	t
9	asd	P1	2021-06-10 02:00:00+02	asdasd	lancemac26@gmail.com	f	('calencalamity@gmail.com',)	2021-06-22 01:55:00.911357+02	2021-06-22 01:55:49.030166+02	1	t
6	bgr	P1	2021-06-11 02:00:00+02	asdasd	test@gmail.com	t	test@gmail.com	2021-06-21 02:00:00+02	2021-06-22 02:06:33.600555+02	1	f
5	casdca	P1	2021-06-18 02:00:00+02	asdasda\r\n\r\nTesting update functionality	lancemac26@gmail.com	t	calencalamity@gmail.com	2021-06-21 02:00:00+02	2021-06-22 06:06:35.817513+02	1	f
\.


--
-- TOC entry 3227 (class 0 OID 16727)
-- Dependencies: 232
-- Data for Name: task_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task_comment (id, assigned_user_email, message, is_deleted, last_modified_by_email, created_date, last_modified_date, created_by_id, task_id) FROM stdin;
3	lancemac26@gmail.com	asd	f	calencalamity@gmail.com	2021-06-22 04:53:08.211981+02	2021-06-22 04:53:08.211981+02	1	3
4	lancemac26@gmail.com	asd	f	calencalamity@gmail.com	2021-06-22 04:53:41.123453+02	2021-06-22 04:53:41.123453+02	1	3
1	lancemac26@gmail.com	asd	t	calencalamity@gmail.com	2021-06-22 04:52:02.520505+02	2021-06-22 05:29:31.911539+02	1	3
5	lancemac26@gmail.com	test	t	calencalamity@gmail.com	2021-06-22 05:30:27.555031+02	2021-06-22 05:35:17.839131+02	1	3
2	lancemac26@gmail.com	asd	t	calencalamity@gmail.com	2021-06-22 04:52:55.062786+02	2021-06-22 05:36:20.209349+02	1	3
6	lancemac26@gmail.com	asd	t	calencalamity@gmail.com	2021-06-22 05:37:23.373445+02	2021-06-22 05:37:25.807619+02	1	5
7	lancemac26@gmail.com	asd	t	calencalamity@gmail.com	2021-06-22 05:37:46.461771+02	2021-06-22 05:37:50.650692+02	1	5
8	lancemac26@gmail.com	asdasd	t	calencalamity@gmail.com	2021-06-22 05:47:55.338858+02	2021-06-22 06:06:17.195356+02	1	5
9	lancemac26@gmail.com	qwsd	t	calencalamity@gmail.com	2021-06-22 06:06:22.661363+02	2021-06-22 06:06:24.477903+02	1	5
\.


--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 112, true);


--
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);


--
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 216
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 28, true);


--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 200
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 62, true);


--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 224
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 225
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 226
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 227
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 228
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 231
-- Name: task_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_comment_id_seq', 9, true);


--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 229
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_id_seq', 9, true);


--
-- TOC entry 2984 (class 2606 OID 16551)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2989 (class 2606 OID 16478)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2992 (class 2606 OID 16441)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2986 (class 2606 OID 16431)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2979 (class 2606 OID 16469)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2981 (class 2606 OID 16423)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3000 (class 2606 OID 16459)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3003 (class 2606 OID 16493)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2994 (class 2606 OID 16449)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3006 (class 2606 OID 16467)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3009 (class 2606 OID 16507)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2997 (class 2606 OID 16545)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3012 (class 2606 OID 16531)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2974 (class 2606 OID 16415)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2976 (class 2606 OID 16413)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2972 (class 2606 OID 16405)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3016 (class 2606 OID 16560)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3019 (class 2606 OID 16643)
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- TOC entry 3021 (class 2606 OID 16618)
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- TOC entry 3025 (class 2606 OID 16616)
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- TOC entry 3027 (class 2606 OID 16657)
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- TOC entry 3030 (class 2606 OID 16671)
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- TOC entry 3032 (class 2606 OID 16606)
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- TOC entry 3041 (class 2606 OID 16682)
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- TOC entry 3034 (class 2606 OID 16698)
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- TOC entry 3036 (class 2606 OID 16602)
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- TOC entry 3050 (class 2606 OID 16735)
-- Name: task_comment task_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_comment
    ADD CONSTRAINT task_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 3047 (class 2606 OID 16724)
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- TOC entry 2982 (class 1259 OID 16552)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2987 (class 1259 OID 16489)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2990 (class 1259 OID 16490)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2977 (class 1259 OID 16475)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2998 (class 1259 OID 16505)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 3001 (class 1259 OID 16504)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 3004 (class 1259 OID 16519)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3007 (class 1259 OID 16518)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2995 (class 1259 OID 16546)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3010 (class 1259 OID 16542)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3013 (class 1259 OID 16543)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3014 (class 1259 OID 16562)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3017 (class 1259 OID 16561)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3022 (class 1259 OID 16607)
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- TOC entry 3023 (class 1259 OID 16608)
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- TOC entry 3028 (class 1259 OID 16634)
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- TOC entry 3042 (class 1259 OID 16636)
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- TOC entry 3043 (class 1259 OID 16631)
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- TOC entry 3044 (class 1259 OID 16632)
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- TOC entry 3037 (class 1259 OID 16639)
-- Name: social_auth_usersocialauth_uid_796e51dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);


--
-- TOC entry 3038 (class 1259 OID 16640)
-- Name: social_auth_usersocialauth_uid_796e51dc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);


--
-- TOC entry 3039 (class 1259 OID 16614)
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- TOC entry 3048 (class 1259 OID 16752)
-- Name: task_comment_created_by_email_id_144b3a1e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX task_comment_created_by_email_id_144b3a1e ON public.task_comment USING btree (created_by_id);


--
-- TOC entry 3051 (class 1259 OID 16753)
-- Name: task_comment_task_id_945d80b8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX task_comment_task_id_945d80b8 ON public.task_comment USING btree (task_id);


--
-- TOC entry 3045 (class 1259 OID 16741)
-- Name: task_created_by_id_02e24056; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX task_created_by_id_02e24056 ON public.task USING btree (created_by_id);


--
-- TOC entry 3054 (class 2606 OID 16484)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3053 (class 2606 OID 16479)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3052 (class 2606 OID 16470)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3056 (class 2606 OID 16499)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3055 (class 2606 OID 16494)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3058 (class 2606 OID 16513)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3057 (class 2606 OID 16508)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3059 (class 2606 OID 16532)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3060 (class 2606 OID 16537)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3061 (class 2606 OID 16609)
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3064 (class 2606 OID 16755)
-- Name: task_comment task_comment_created_by_id_67cb715c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_comment
    ADD CONSTRAINT task_comment_created_by_id_67cb715c_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3063 (class 2606 OID 16747)
-- Name: task_comment task_comment_task_id_945d80b8_fk_task_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_comment
    ADD CONSTRAINT task_comment_task_id_945d80b8_fk_task_id FOREIGN KEY (task_id) REFERENCES public.task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3062 (class 2606 OID 16736)
-- Name: task task_created_by_id_02e24056_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_created_by_id_02e24056_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2021-06-22 04:53:25

--
-- PostgreSQL database dump complete
--

