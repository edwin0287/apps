PGDMP     	    3                {            theater    10.13    10.13 y    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    26517    theater    DATABASE     �   CREATE DATABASE theater WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_United States.1252' LC_CTYPE = 'Spanish_United States.1252';
    DROP DATABASE theater;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    26593    accounts_useraccount    TABLE     T  CREATE TABLE public.accounts_useraccount (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL
);
 (   DROP TABLE public.accounts_useraccount;
       public         postgres    false    3            �            1259    26606    accounts_useraccount_groups    TABLE     �   CREATE TABLE public.accounts_useraccount_groups (
    id integer NOT NULL,
    useraccount_id integer NOT NULL,
    group_id integer NOT NULL
);
 /   DROP TABLE public.accounts_useraccount_groups;
       public         postgres    false    3            �            1259    26604 "   accounts_useraccount_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_useraccount_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.accounts_useraccount_groups_id_seq;
       public       postgres    false    209    3            �           0    0 "   accounts_useraccount_groups_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.accounts_useraccount_groups_id_seq OWNED BY public.accounts_useraccount_groups.id;
            public       postgres    false    208            �            1259    26591    accounts_useraccount_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_useraccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.accounts_useraccount_id_seq;
       public       postgres    false    207    3            �           0    0    accounts_useraccount_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.accounts_useraccount_id_seq OWNED BY public.accounts_useraccount.id;
            public       postgres    false    206            �            1259    26614 %   accounts_useraccount_user_permissions    TABLE     �   CREATE TABLE public.accounts_useraccount_user_permissions (
    id integer NOT NULL,
    useraccount_id integer NOT NULL,
    permission_id integer NOT NULL
);
 9   DROP TABLE public.accounts_useraccount_user_permissions;
       public         postgres    false    3            �            1259    26612 ,   accounts_useraccount_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_useraccount_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.accounts_useraccount_user_permissions_id_seq;
       public       postgres    false    3    211            �           0    0 ,   accounts_useraccount_user_permissions_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.accounts_useraccount_user_permissions_id_seq OWNED BY public.accounts_useraccount_user_permissions.id;
            public       postgres    false    210            �            1259    26549 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    3            �            1259    26547    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    3    203            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    202            �            1259    26559    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    3            �            1259    26557    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    3    205            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    204            �            1259    26541    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    3            �            1259    26539    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    201    3            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    200            �            1259    26651    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         postgres    false    3            �            1259    26649    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    3    213            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    212            �            1259    26531    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    3            �            1259    26529    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    3    199            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    198            �            1259    26520    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    3            �            1259    26518    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    197    3            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    196            �            1259    26704    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    3            �            1259    26675    events_event    TABLE     �  CREATE TABLE public.events_event (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    description character varying(120),
    content text,
    category character varying(50) NOT NULL,
    date_event timestamp with time zone,
    date_created timestamp with time zone NOT NULL,
    costo numeric(5,2),
    url character varying(2048),
    thumbnail character varying(100)
);
     DROP TABLE public.events_event;
       public         postgres    false    3            �            1259    26673    events_event_id_seq    SEQUENCE     �   CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.events_event_id_seq;
       public       postgres    false    215    3            �           0    0    events_event_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events_event.id;
            public       postgres    false    214            �            1259    26686    events_useraccountevent    TABLE     �   CREATE TABLE public.events_useraccountevent (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    "User_id_id" integer,
    event_id_id integer
);
 +   DROP TABLE public.events_useraccountevent;
       public         postgres    false    3            �            1259    26684    events_useraccountevent_id_seq    SEQUENCE     �   CREATE SEQUENCE public.events_useraccountevent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.events_useraccountevent_id_seq;
       public       postgres    false    3    217            �           0    0    events_useraccountevent_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.events_useraccountevent_id_seq OWNED BY public.events_useraccountevent.id;
            public       postgres    false    216            �
           2604    26596    accounts_useraccount id    DEFAULT     �   ALTER TABLE ONLY public.accounts_useraccount ALTER COLUMN id SET DEFAULT nextval('public.accounts_useraccount_id_seq'::regclass);
 F   ALTER TABLE public.accounts_useraccount ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    207    207            �
           2604    26609    accounts_useraccount_groups id    DEFAULT     �   ALTER TABLE ONLY public.accounts_useraccount_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_useraccount_groups_id_seq'::regclass);
 M   ALTER TABLE public.accounts_useraccount_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208    209            �
           2604    26617 (   accounts_useraccount_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.accounts_useraccount_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_useraccount_user_permissions_id_seq'::regclass);
 W   ALTER TABLE public.accounts_useraccount_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210    211            �
           2604    26552    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202    203            �
           2604    26562    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204    205            �
           2604    26544    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200    201            �
           2604    26654    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    213    213            �
           2604    26534    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199            �
           2604    26523    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �
           2604    26678    events_event id    DEFAULT     r   ALTER TABLE ONLY public.events_event ALTER COLUMN id SET DEFAULT nextval('public.events_event_id_seq'::regclass);
 >   ALTER TABLE public.events_event ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    214    215    215            �
           2604    26689    events_useraccountevent id    DEFAULT     �   ALTER TABLE ONLY public.events_useraccountevent ALTER COLUMN id SET DEFAULT nextval('public.events_useraccountevent_id_seq'::regclass);
 I   ALTER TABLE public.events_useraccountevent ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216    217            �          0    26593    accounts_useraccount 
   TABLE DATA               x   COPY public.accounts_useraccount (id, password, last_login, is_superuser, email, name, is_active, is_staff) FROM stdin;
    public       postgres    false    207   ��       �          0    26606    accounts_useraccount_groups 
   TABLE DATA               S   COPY public.accounts_useraccount_groups (id, useraccount_id, group_id) FROM stdin;
    public       postgres    false    209   ڣ       �          0    26614 %   accounts_useraccount_user_permissions 
   TABLE DATA               b   COPY public.accounts_useraccount_user_permissions (id, useraccount_id, permission_id) FROM stdin;
    public       postgres    false    211   ��                 0    26549 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    203   �       �          0    26559    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    205   1�       }          0    26541    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    201   N�       �          0    26651    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    213   ��       {          0    26531    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    199   ��       y          0    26520    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    197   1�       �          0    26704    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    218   �       �          0    26675    events_event 
   TABLE DATA               �   COPY public.events_event (id, title, description, content, category, date_event, date_created, costo, url, thumbnail) FROM stdin;
    public       postgres    false    215   �       �          0    26686    events_useraccountevent 
   TABLE DATA               ^   COPY public.events_useraccountevent (id, date_created, "User_id_id", event_id_id) FROM stdin;
    public       postgres    false    217   %�       �           0    0 "   accounts_useraccount_groups_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.accounts_useraccount_groups_id_seq', 1, false);
            public       postgres    false    208            �           0    0    accounts_useraccount_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.accounts_useraccount_id_seq', 3, true);
            public       postgres    false    206            �           0    0 ,   accounts_useraccount_user_permissions_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.accounts_useraccount_user_permissions_id_seq', 1, false);
            public       postgres    false    210            �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       postgres    false    202            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    204            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);
            public       postgres    false    200            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 25, true);
            public       postgres    false    212            �           0    0    django_content_type_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);
            public       postgres    false    198            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);
            public       postgres    false    196            �           0    0    events_event_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.events_event_id_seq', 5, true);
            public       postgres    false    214            �           0    0    events_useraccountevent_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.events_useraccountevent_id_seq', 15, true);
            public       postgres    false    216            �
           2606    26603 3   accounts_useraccount accounts_useraccount_email_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.accounts_useraccount
    ADD CONSTRAINT accounts_useraccount_email_key UNIQUE (email);
 ]   ALTER TABLE ONLY public.accounts_useraccount DROP CONSTRAINT accounts_useraccount_email_key;
       public         postgres    false    207            �
           2606    26622 Z   accounts_useraccount_groups accounts_useraccount_gro_useraccount_id_group_id_9e1772b3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_useraccount_groups
    ADD CONSTRAINT accounts_useraccount_gro_useraccount_id_group_id_9e1772b3_uniq UNIQUE (useraccount_id, group_id);
 �   ALTER TABLE ONLY public.accounts_useraccount_groups DROP CONSTRAINT accounts_useraccount_gro_useraccount_id_group_id_9e1772b3_uniq;
       public         postgres    false    209    209            �
           2606    26611 <   accounts_useraccount_groups accounts_useraccount_groups_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.accounts_useraccount_groups
    ADD CONSTRAINT accounts_useraccount_groups_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.accounts_useraccount_groups DROP CONSTRAINT accounts_useraccount_groups_pkey;
       public         postgres    false    209            �
           2606    26601 .   accounts_useraccount accounts_useraccount_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.accounts_useraccount
    ADD CONSTRAINT accounts_useraccount_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.accounts_useraccount DROP CONSTRAINT accounts_useraccount_pkey;
       public         postgres    false    207            �
           2606    26636 e   accounts_useraccount_user_permissions accounts_useraccount_use_useraccount_id_permissio_54014a73_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_useraccount_user_permissions
    ADD CONSTRAINT accounts_useraccount_use_useraccount_id_permissio_54014a73_uniq UNIQUE (useraccount_id, permission_id);
 �   ALTER TABLE ONLY public.accounts_useraccount_user_permissions DROP CONSTRAINT accounts_useraccount_use_useraccount_id_permissio_54014a73_uniq;
       public         postgres    false    211    211            �
           2606    26619 P   accounts_useraccount_user_permissions accounts_useraccount_user_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_useraccount_user_permissions
    ADD CONSTRAINT accounts_useraccount_user_permissions_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.accounts_useraccount_user_permissions DROP CONSTRAINT accounts_useraccount_user_permissions_pkey;
       public         postgres    false    211            �
           2606    26589    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    203            �
           2606    26575 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    205    205            �
           2606    26564 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    205            �
           2606    26554    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    203            �
           2606    26566 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    201    201            �
           2606    26546 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    201            �
           2606    26660 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    213            �
           2606    26538 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    199    199            �
           2606    26536 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    199            �
           2606    26528 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    197            �
           2606    26711 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    218            �
           2606    26683    events_event events_event_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.events_event
    ADD CONSTRAINT events_event_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.events_event DROP CONSTRAINT events_event_pkey;
       public         postgres    false    215            �
           2606    26691 4   events_useraccountevent events_useraccountevent_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.events_useraccountevent
    ADD CONSTRAINT events_useraccountevent_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.events_useraccountevent DROP CONSTRAINT events_useraccountevent_pkey;
       public         postgres    false    217            �
           1259    26620 (   accounts_useraccount_email_edd49186_like    INDEX     ~   CREATE INDEX accounts_useraccount_email_edd49186_like ON public.accounts_useraccount USING btree (email varchar_pattern_ops);
 <   DROP INDEX public.accounts_useraccount_email_edd49186_like;
       public         postgres    false    207            �
           1259    26634 -   accounts_useraccount_groups_group_id_07495d90    INDEX     y   CREATE INDEX accounts_useraccount_groups_group_id_07495d90 ON public.accounts_useraccount_groups USING btree (group_id);
 A   DROP INDEX public.accounts_useraccount_groups_group_id_07495d90;
       public         postgres    false    209            �
           1259    26633 3   accounts_useraccount_groups_useraccount_id_1eefb17f    INDEX     �   CREATE INDEX accounts_useraccount_groups_useraccount_id_1eefb17f ON public.accounts_useraccount_groups USING btree (useraccount_id);
 G   DROP INDEX public.accounts_useraccount_groups_useraccount_id_1eefb17f;
       public         postgres    false    209            �
           1259    26648 <   accounts_useraccount_user_permissions_permission_id_5751e5ed    INDEX     �   CREATE INDEX accounts_useraccount_user_permissions_permission_id_5751e5ed ON public.accounts_useraccount_user_permissions USING btree (permission_id);
 P   DROP INDEX public.accounts_useraccount_user_permissions_permission_id_5751e5ed;
       public         postgres    false    211            �
           1259    26647 =   accounts_useraccount_user_permissions_useraccount_id_9ee22c82    INDEX     �   CREATE INDEX accounts_useraccount_user_permissions_useraccount_id_9ee22c82 ON public.accounts_useraccount_user_permissions USING btree (useraccount_id);
 Q   DROP INDEX public.accounts_useraccount_user_permissions_useraccount_id_9ee22c82;
       public         postgres    false    211            �
           1259    26590    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    203            �
           1259    26586 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    205            �
           1259    26587 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    205            �
           1259    26572 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    201            �
           1259    26671 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    213            �
           1259    26672 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    213            �
           1259    26713 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    218            �
           1259    26712 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    218            �
           1259    26702 +   events_useraccountevent_User_id_id_52e0c6f9    INDEX     y   CREATE INDEX "events_useraccountevent_User_id_id_52e0c6f9" ON public.events_useraccountevent USING btree ("User_id_id");
 A   DROP INDEX public."events_useraccountevent_User_id_id_52e0c6f9";
       public         postgres    false    217            �
           1259    26703 ,   events_useraccountevent_event_id_id_64ea9704    INDEX     w   CREATE INDEX events_useraccountevent_event_id_id_64ea9704 ON public.events_useraccountevent USING btree (event_id_id);
 @   DROP INDEX public.events_useraccountevent_event_id_id_64ea9704;
       public         postgres    false    217            �
           2606    26628 Z   accounts_useraccount_groups accounts_useraccount_groups_group_id_07495d90_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_useraccount_groups
    ADD CONSTRAINT accounts_useraccount_groups_group_id_07495d90_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.accounts_useraccount_groups DROP CONSTRAINT accounts_useraccount_groups_group_id_07495d90_fk_auth_group_id;
       public       postgres    false    203    209    2766            �
           2606    26642 ^   accounts_useraccount_user_permissions accounts_useraccount_permission_id_5751e5ed_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_useraccount_user_permissions
    ADD CONSTRAINT accounts_useraccount_permission_id_5751e5ed_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.accounts_useraccount_user_permissions DROP CONSTRAINT accounts_useraccount_permission_id_5751e5ed_fk_auth_perm;
       public       postgres    false    2761    211    201            �
           2606    26623 U   accounts_useraccount_groups accounts_useraccount_useraccount_id_1eefb17f_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_useraccount_groups
    ADD CONSTRAINT accounts_useraccount_useraccount_id_1eefb17f_fk_accounts_ FOREIGN KEY (useraccount_id) REFERENCES public.accounts_useraccount(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.accounts_useraccount_groups DROP CONSTRAINT accounts_useraccount_useraccount_id_1eefb17f_fk_accounts_;
       public       postgres    false    207    209    2777            �
           2606    26637 _   accounts_useraccount_user_permissions accounts_useraccount_useraccount_id_9ee22c82_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_useraccount_user_permissions
    ADD CONSTRAINT accounts_useraccount_useraccount_id_9ee22c82_fk_accounts_ FOREIGN KEY (useraccount_id) REFERENCES public.accounts_useraccount(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.accounts_useraccount_user_permissions DROP CONSTRAINT accounts_useraccount_useraccount_id_9ee22c82_fk_accounts_;
       public       postgres    false    207    2777    211            �
           2606    26581 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    2761    205    201            �
           2606    26576 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    2766    203    205            �
           2606    26567 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    199    2756    201            �
           2606    26661 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    213    2756    199            �
           2606    26666 M   django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_useraccount_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_useraccount_id FOREIGN KEY (user_id) REFERENCES public.accounts_useraccount(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_useraccount_id;
       public       postgres    false    213    2777    207            �
           2606    26692 M   events_useraccountevent events_useraccountev_User_id_id_52e0c6f9_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.events_useraccountevent
    ADD CONSTRAINT "events_useraccountev_User_id_id_52e0c6f9_fk_accounts_" FOREIGN KEY ("User_id_id") REFERENCES public.accounts_useraccount(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.events_useraccountevent DROP CONSTRAINT "events_useraccountev_User_id_id_52e0c6f9_fk_accounts_";
       public       postgres    false    2777    207    217            �
           2606    26697 W   events_useraccountevent events_useraccountevent_event_id_id_64ea9704_fk_events_event_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.events_useraccountevent
    ADD CONSTRAINT events_useraccountevent_event_id_id_64ea9704_fk_events_event_id FOREIGN KEY (event_id_id) REFERENCES public.events_event(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.events_useraccountevent DROP CONSTRAINT events_useraccountevent_event_id_id_64ea9704_fk_events_event_id;
       public       postgres    false    2795    217    215            �   =  x�m��n�@��5<E�q`f41�UѦ�4�U3 ���EA���Ƥ���,�/G
�x��J(ԑ�Ѝ���(6�Ҭ�\ۨ�hf�RcY�^�9*��۰�(`3�C]}�R?w^&P m ѓǀ�UE&H%�.p�>��Ɣ��&y.���u7.�ǜv�|�-�ŋ�Vʒu�T�f�۱��p蜈k��tH���:�o����?�9�>ֈ�0��9�_�}�Ir~�,�A<���w�HT�X�K{/se��.�at�ך΍HM#c�Zޚ���5��(�fe9�x�M���=+�1�}ƃ�\�A~��7��EQ�YE}o      �      x������ � �      �      x������ � �            x������ � �      �      x������ � �      }   X  x�u�[j�0E��Ud%v���F��Ĥ���2�o�ȶ������pAJ|�6i�>�MCb�<������Wj@����QW�������+
`�}4;� �l6�︮�d��Ȓ�1�[Q?Ƣ a��Hp$\�-�e�g�� ��J����"�:9u�A�`���t�ݎ��1��Fg"UNu"�_P��GEƗA4������^��m�������AO�5�1`��0�� ��G�7�W�$m�M��D	Zg���� "���"�Q���<"���܏rE�����!"�&�R��Sp x�y��u�޵���*�{�E�zצ_}�W��b�b\���!���Uő      �   �  x���Mk�@����k����:�z	��!K�Em\�PB�{W=Tk�u:<��>3�XT*�]T�(�ZPrh�ŗ}�=��}�}��m��-�{~_�M�6�X�|���MIMH(���}w�^����k_]���OQ." qN����tJ�߇�L!>�5NG������~��su���qbq@h�ٝ��zS���ŎL *�"H$6�5��F���������~��}�+}>��s[���?�_��]��`P���V���Ɠ�]Qq+>L���q�inA�SD:u<��7g���j�ڍmoR�Cj�,#�$F���ݚ�s��	���<��|���x=ˈ�iʸ8��b�?�*�A��Z)�Ɛ'��i��vT�|�i���R�ꉯ-כ�a�״7�H3-h��J�3쐽]�4}�t�r�ȕ�4�"�<>!��&��@F
w�&���g���u�i���!��0:Xƴ�)�+�����f�Z��}k�      {   l   x�M�K�0D�3�A��a�D�*���Ro�T�j��g����e�h���OTicq/�<.�ЬW��M�;���o�g��_/H9[�pt��^!o�����f�4��[�9      y   �  x���ݎ� ���S�԰7�g9	!��!Qq����m2�7ƈ냽���O�N1�f�4��nrљ�A��H���≐Vu�"?~�_J����j�}A�=��%�@.2�6f���6���oE�� ��z�at���T6ԣ�փ�.�=R�@�L�D�uI;7��(F%�Q!���0~��["�`2#dE�g�`��qi�u�s[�+Ȑ�BD��ku�fQB�ٰ]"�%UU�~����Dm�gmC�A�vY���O��Ph@*��u�cK2�T��e�;(�	���
�u	~���p&�6Z--�^���s�߷�*��#�PRB�����_�<l��+��T���W�r��n[��s�R'���¦I|Nw�Ʒ�A��
��|����O���j$�R�T��^����MI7�j{7��*��c#y�
uy������O(O\�T�T����Qck�      �   �  x���ێ�@���)|H�84�^LF�`��C���9���@?��^�>�{[�'��R)Q]�;h{ۦ�b�_�x�7�u$E��7W�o�O�nK\?]d�Q�W�Ext@$N��9-�t�;���[î)O�Cೌ�}����+��.�"@�0��,�:�i��-��.�"ڵ<��K���z��oap�C��Kf͍ѡ��{����w������>)L�y�	ʗ�{�w�9�v��ۜ�+����/[�J:�Fa�How��c>9����zC hkhX�Z�P)���-�Ur��Z����7��`�Ki���Р��^�* *�>��fAM%k&y�e�60�8�e�	�.����0>��v���Vl>�j��N�.#����t�N�6�&Z�_)�P YC��Y��"�P��v2+��I�b.$�k��H�T4Ѯ����Ei�wk�,`Z��ru&}��VW����      �   -  x��V�n7}��b���u��Xyrd7p_�K��Z�vqI��ZP>��[~�g���j��K_���px��F�I�]�&*��w�8'UR��Gms��r����BEڸ���F*YVFmH�9��1��"��$mq�ҩ�!�g��te3�5SΑغ*/�N!˔�R-��<י�<G��@Κ<�B�nܢ�R�V�G�����7�Ly&5�Z�/�e�&�_:*����1|H�QV(��v���l���A����R�h<:��u$�n�{�����qo(�Q��m1�¸�Y���(���:Y�
�0Bժpх���t�;�^g{Ҿ�|s0l�W~ye����x��@��]l�* ��F��,i�^�-ݸJh�4QF/��Z%
u���q�1����A������yUc
~T�٤\,e�`e���EKe��-�T�b[��l�{WA�!�׀�rt�P9����?��̂�����C�暓u�l�J$ٌ�F$b�
��p��5}�{^g&ހ$J��,��/�obS��������Α�����}�]�I��HQ(������3��+X,R�IP�f��-a) <I�#���y9t�$�Ѹ�R�/��<�:��9r��fИ8ϛ��w�*}A�(�}��9����S�?�����(>f��$v^��=���#�~�N&��-�{*��M��83�!���N:���q��l2�puy>i��\N���[��!�,7n�ʡ?���&ݤG#�[����/��I-�u�h�t�4�m�S�-e[+\#[�fl�$�~ԨB�ҭ��k�s:A���5{�R�шךIF=*nZ|��CγN=���%(R<��}KW����4{\+�B���rCV���l�1�O5.�vǃ=�zx<�'J�?���ÛKt�n�Ӫ,��:����g��ϥ���6�}wƈ?�I-��Ӏ6��!u�$��e��4���`�XY�݈E{�ZRWy����Y�i�
���pDQ˨�f:������(-^TJP�+1���l��_T@��cu�k������)U�O�W��!�42)va+ʝ$�
J2�,��y��W��a��J�~I ���p��Ř���o��ƻTM�ӌ�	4�HhYxdu�f�ed;ė�7=�3�[s�]<��D�����D��&��y5��ʿ����-60=RU�CD�)l2��0Hz�z+��e���PVnw�������[qZ��~qs��M/�,��l���Kq�}=A}��of�L;�ZY��)�hh�:D/ǯ�\���@�Eo���$�n4d�, �{>��u����t���?����S�{f��umj�	�%�.      �   �   x�]���0�s<E�0�Y����is�	���Β�iVA-��<S��"��y U�i[�n"�ȑ����3��0���b#�O)~=+��<P�W帍�,��V��ė�җ����#i�p�^����̚o�����E��>j�ݐ��g�iZ�ݮ��\q��Ь��2&
��}����8��,3ٟ�8���B�s�˫�R�tGZ�     