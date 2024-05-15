PGDMP                      |            dev    16.1 (Debian 16.1-1.pgdg120+1)    16.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    120256    dev    DATABASE     n   CREATE DATABASE dev WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE dev;
                beuser    false            �            1259    120373    t_bug    TABLE     �   CREATE TABLE public.t_bug (
    id integer NOT NULL,
    bug_note character varying(255),
    created_at timestamp without time zone,
    project_id bigint
);
    DROP TABLE public.t_bug;
       public         heap    beuser    false            �            1259    120355 	   t_bug_dtl    TABLE     �   CREATE TABLE public.t_bug_dtl (
    id integer NOT NULL,
    short_descript character varying(255),
    title character varying(255),
    bug_id bigint
);
    DROP TABLE public.t_bug_dtl;
       public         heap    beuser    false            �            1259    120354    t_bug_dtl_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_bug_dtl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.t_bug_dtl_id_seq;
       public          beuser    false    238            �           0    0    t_bug_dtl_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.t_bug_dtl_id_seq OWNED BY public.t_bug_dtl.id;
          public          beuser    false    237            �            1259    120372    t_bug_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_bug_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.t_bug_id_seq;
       public          beuser    false    242            �           0    0    t_bug_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.t_bug_id_seq OWNED BY public.t_bug.id;
          public          beuser    false    241            �            1259    120414    t_connection    TABLE     0  CREATE TABLE public.t_connection (
    id integer NOT NULL,
    db_host character varying(255),
    db_pass character varying(255),
    db_port character varying(255),
    db_schema character varying(255),
    db_target character varying(255),
    db_usr character varying(255),
    project_id bigint
);
     DROP TABLE public.t_connection;
       public         heap    beuser    false            �            1259    120413    t_connection_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_connection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.t_connection_id_seq;
       public          beuser    false    252            �           0    0    t_connection_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.t_connection_id_seq OWNED BY public.t_connection.id;
          public          beuser    false    251            �            1259    120321    t_dictionary    TABLE     �   CREATE TABLE public.t_dictionary (
    id integer NOT NULL,
    descript_note character varying(255),
    descript_note_v character varying(255)
);
     DROP TABLE public.t_dictionary;
       public         heap    beuser    false            �            1259    120320    t_dictionary_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_dictionary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.t_dictionary_id_seq;
       public          beuser    false    230            �           0    0    t_dictionary_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.t_dictionary_id_seq OWNED BY public.t_dictionary.id;
          public          beuser    false    229            �            1259    120276 
   t_document    TABLE     �   CREATE TABLE public.t_document (
    id integer NOT NULL,
    descriptions character varying(255),
    file_name character varying(255),
    file_path character varying(255),
    file_type character varying(255)
);
    DROP TABLE public.t_document;
       public         heap    beuser    false            �            1259    120275    t_document_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_document_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.t_document_id_seq;
       public          beuser    false    220            �           0    0    t_document_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.t_document_id_seq OWNED BY public.t_document.id;
          public          beuser    false    219            �            1259    120312    t_func    TABLE       CREATE TABLE public.t_func (
    id integer NOT NULL,
    func_comment character varying(255),
    func_comment_vn character varying(255),
    func_name character varying(255),
    func_param character varying(255),
    return_value character varying(255),
    project_id bigint
);
    DROP TABLE public.t_func;
       public         heap    beuser    false            �            1259    120311    t_func_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_func_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.t_func_id_seq;
       public          beuser    false    228            �           0    0    t_func_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.t_func_id_seq OWNED BY public.t_func.id;
          public          beuser    false    227            �            1259    120364    t_mst_cd    TABLE     �   CREATE TABLE public.t_mst_cd (
    id integer NOT NULL,
    mstkbn character varying(255),
    prm_json jsonb,
    project_id bigint
);
    DROP TABLE public.t_mst_cd;
       public         heap    beuser    false            �            1259    120363    t_mst_cd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_mst_cd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.t_mst_cd_id_seq;
       public          beuser    false    240            �           0    0    t_mst_cd_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.t_mst_cd_id_seq OWNED BY public.t_mst_cd.id;
          public          beuser    false    239            �            1259    120294    t_note    TABLE     �   CREATE TABLE public.t_note (
    id integer NOT NULL,
    note_dtl character varying(255),
    note_of_phase character varying(255),
    note_type character varying(255),
    project_id bigint
);
    DROP TABLE public.t_note;
       public         heap    beuser    false            �            1259    120346 
   t_note_dtl    TABLE     �   CREATE TABLE public.t_note_dtl (
    id integer NOT NULL,
    short_descript character varying(255),
    img_path character varying(255),
    title character varying(255),
    note_id bigint
);
    DROP TABLE public.t_note_dtl;
       public         heap    beuser    false            �            1259    120345    t_note_dtl_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_note_dtl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.t_note_dtl_id_seq;
       public          beuser    false    236            �           0    0    t_note_dtl_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.t_note_dtl_id_seq OWNED BY public.t_note_dtl.id;
          public          beuser    false    235            �            1259    120293    t_note_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.t_note_id_seq;
       public          beuser    false    224            �           0    0    t_note_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.t_note_id_seq OWNED BY public.t_note.id;
          public          beuser    false    223            �            1259    120330    t_prm    TABLE     �   CREATE TABLE public.t_prm (
    id integer NOT NULL,
    prm_order integer,
    prm_cd character varying(255),
    prm_id character varying(255),
    prm_name character varying(255),
    prm_value character varying(255)
);
    DROP TABLE public.t_prm;
       public         heap    beuser    false            �            1259    120329    t_prm_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_prm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.t_prm_id_seq;
       public          beuser    false    232            �           0    0    t_prm_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.t_prm_id_seq OWNED BY public.t_prm.id;
          public          beuser    false    231            �            1259    120405 	   t_project    TABLE       CREATE TABLE public.t_project (
    id integer NOT NULL,
    end_date timestamp without time zone,
    project_cd character varying(255),
    project_descript character varying(255),
    project_name character varying(255),
    start_date timestamp without time zone
);
    DROP TABLE public.t_project;
       public         heap    beuser    false            �            1259    120404    t_project_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.t_project_id_seq;
       public          beuser    false    250            �           0    0    t_project_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.t_project_id_seq OWNED BY public.t_project.id;
          public          beuser    false    249            �            1259    120380    t_role    TABLE     ^   CREATE TABLE public.t_role (
    id integer NOT NULL,
    role_name character varying(255)
);
    DROP TABLE public.t_role;
       public         heap    beuser    false            �            1259    120379    t_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.t_role_id_seq;
       public          beuser    false    244            �           0    0    t_role_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.t_role_id_seq OWNED BY public.t_role.id;
          public          beuser    false    243            �            1259    120303    t_table    TABLE     �   CREATE TABLE public.t_table (
    id integer NOT NULL,
    logical character varying(255),
    logical_v character varying(255),
    physical character varying(255),
    project_id bigint
);
    DROP TABLE public.t_table;
       public         heap    beuser    false            �            1259    120387    t_table_dtl    TABLE     `  CREATE TABLE public.t_table_dtl (
    id integer NOT NULL,
    data_type character varying(255),
    is_fk boolean,
    logical character varying(255),
    logical_v character varying(255),
    max_length character varying(255),
    nullable boolean,
    physical character varying(255),
    project_id bigint,
    table_name character varying(255)
);
    DROP TABLE public.t_table_dtl;
       public         heap    beuser    false            �            1259    120386    t_table_dtl_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_table_dtl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.t_table_dtl_id_seq;
       public          beuser    false    246            �           0    0    t_table_dtl_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.t_table_dtl_id_seq OWNED BY public.t_table_dtl.id;
          public          beuser    false    245            �            1259    120302    t_table_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.t_table_id_seq;
       public          beuser    false    226            �           0    0    t_table_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.t_table_id_seq OWNED BY public.t_table.id;
          public          beuser    false    225            �            1259    120285    t_task    TABLE     �   CREATE TABLE public.t_task (
    id integer NOT NULL,
    short_descipt character varying(255),
    title character varying(255),
    project_id bigint
);
    DROP TABLE public.t_task;
       public         heap    beuser    false            �            1259    120339 
   t_task_dtl    TABLE     z   CREATE TABLE public.t_task_dtl (
    id integer NOT NULL,
    descript_note character varying(255),
    task_id bigint
);
    DROP TABLE public.t_task_dtl;
       public         heap    beuser    false            �            1259    120338    t_task_dtl_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_task_dtl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.t_task_dtl_id_seq;
       public          beuser    false    234            �           0    0    t_task_dtl_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.t_task_dtl_id_seq OWNED BY public.t_task_dtl.id;
          public          beuser    false    233            �            1259    120284    t_task_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.t_task_id_seq;
       public          beuser    false    222            �           0    0    t_task_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.t_task_id_seq OWNED BY public.t_task.id;
          public          beuser    false    221            �            1259    120267    t_user    TABLE     �   CREATE TABLE public.t_user (
    id integer NOT NULL,
    pwd character varying(255),
    usr_id character varying(255),
    urs_name character varying(255)
);
    DROP TABLE public.t_user;
       public         heap    beuser    false            �            1259    120258    t_user_guide    TABLE     �   CREATE TABLE public.t_user_guide (
    id integer NOT NULL,
    descript_note character varying(255),
    descript_note_v character varying(255)
);
     DROP TABLE public.t_user_guide;
       public         heap    beuser    false            �            1259    120396    t_user_guide_dtl    TABLE     �   CREATE TABLE public.t_user_guide_dtl (
    id integer NOT NULL,
    descript_note character varying(255),
    descript_note_v character varying(255)
);
 $   DROP TABLE public.t_user_guide_dtl;
       public         heap    beuser    false            �            1259    120395    t_user_guide_dtl_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_user_guide_dtl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.t_user_guide_dtl_id_seq;
       public          beuser    false    248            �           0    0    t_user_guide_dtl_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.t_user_guide_dtl_id_seq OWNED BY public.t_user_guide_dtl.id;
          public          beuser    false    247            �            1259    120257    t_user_guide_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_user_guide_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.t_user_guide_id_seq;
       public          beuser    false    216            �           0    0    t_user_guide_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.t_user_guide_id_seq OWNED BY public.t_user_guide.id;
          public          beuser    false    215            �            1259    120266    t_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.t_user_id_seq;
       public          beuser    false    218            �           0    0    t_user_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.t_user_id_seq OWNED BY public.t_user.id;
          public          beuser    false    217            �            1259    120422    t_user_project    TABLE     c   CREATE TABLE public.t_user_project (
    usr_id bigint NOT NULL,
    project_id bigint NOT NULL
);
 "   DROP TABLE public.t_user_project;
       public         heap    beuser    false            �            1259    120427    t_user_role    TABLE     ]   CREATE TABLE public.t_user_role (
    usr_id bigint NOT NULL,
    role_id bigint NOT NULL
);
    DROP TABLE public.t_user_role;
       public         heap    beuser    false            �           2604    120376    t_bug id    DEFAULT     d   ALTER TABLE ONLY public.t_bug ALTER COLUMN id SET DEFAULT nextval('public.t_bug_id_seq'::regclass);
 7   ALTER TABLE public.t_bug ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    242    241    242            �           2604    120358    t_bug_dtl id    DEFAULT     l   ALTER TABLE ONLY public.t_bug_dtl ALTER COLUMN id SET DEFAULT nextval('public.t_bug_dtl_id_seq'::regclass);
 ;   ALTER TABLE public.t_bug_dtl ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    237    238    238            �           2604    120417    t_connection id    DEFAULT     r   ALTER TABLE ONLY public.t_connection ALTER COLUMN id SET DEFAULT nextval('public.t_connection_id_seq'::regclass);
 >   ALTER TABLE public.t_connection ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    252    251    252            �           2604    120324    t_dictionary id    DEFAULT     r   ALTER TABLE ONLY public.t_dictionary ALTER COLUMN id SET DEFAULT nextval('public.t_dictionary_id_seq'::regclass);
 >   ALTER TABLE public.t_dictionary ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    230    229    230            �           2604    120279    t_document id    DEFAULT     n   ALTER TABLE ONLY public.t_document ALTER COLUMN id SET DEFAULT nextval('public.t_document_id_seq'::regclass);
 <   ALTER TABLE public.t_document ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    220    219    220            �           2604    120315 	   t_func id    DEFAULT     f   ALTER TABLE ONLY public.t_func ALTER COLUMN id SET DEFAULT nextval('public.t_func_id_seq'::regclass);
 8   ALTER TABLE public.t_func ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    227    228    228            �           2604    120367    t_mst_cd id    DEFAULT     j   ALTER TABLE ONLY public.t_mst_cd ALTER COLUMN id SET DEFAULT nextval('public.t_mst_cd_id_seq'::regclass);
 :   ALTER TABLE public.t_mst_cd ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    240    239    240            �           2604    120297 	   t_note id    DEFAULT     f   ALTER TABLE ONLY public.t_note ALTER COLUMN id SET DEFAULT nextval('public.t_note_id_seq'::regclass);
 8   ALTER TABLE public.t_note ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    224    223    224            �           2604    120349    t_note_dtl id    DEFAULT     n   ALTER TABLE ONLY public.t_note_dtl ALTER COLUMN id SET DEFAULT nextval('public.t_note_dtl_id_seq'::regclass);
 <   ALTER TABLE public.t_note_dtl ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    235    236    236            �           2604    120333    t_prm id    DEFAULT     d   ALTER TABLE ONLY public.t_prm ALTER COLUMN id SET DEFAULT nextval('public.t_prm_id_seq'::regclass);
 7   ALTER TABLE public.t_prm ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    232    231    232            �           2604    120408    t_project id    DEFAULT     l   ALTER TABLE ONLY public.t_project ALTER COLUMN id SET DEFAULT nextval('public.t_project_id_seq'::regclass);
 ;   ALTER TABLE public.t_project ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    250    249    250            �           2604    120383 	   t_role id    DEFAULT     f   ALTER TABLE ONLY public.t_role ALTER COLUMN id SET DEFAULT nextval('public.t_role_id_seq'::regclass);
 8   ALTER TABLE public.t_role ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    244    243    244            �           2604    120306 
   t_table id    DEFAULT     h   ALTER TABLE ONLY public.t_table ALTER COLUMN id SET DEFAULT nextval('public.t_table_id_seq'::regclass);
 9   ALTER TABLE public.t_table ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    225    226    226            �           2604    120390    t_table_dtl id    DEFAULT     p   ALTER TABLE ONLY public.t_table_dtl ALTER COLUMN id SET DEFAULT nextval('public.t_table_dtl_id_seq'::regclass);
 =   ALTER TABLE public.t_table_dtl ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    245    246    246            �           2604    120288 	   t_task id    DEFAULT     f   ALTER TABLE ONLY public.t_task ALTER COLUMN id SET DEFAULT nextval('public.t_task_id_seq'::regclass);
 8   ALTER TABLE public.t_task ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    222    221    222            �           2604    120342    t_task_dtl id    DEFAULT     n   ALTER TABLE ONLY public.t_task_dtl ALTER COLUMN id SET DEFAULT nextval('public.t_task_dtl_id_seq'::regclass);
 <   ALTER TABLE public.t_task_dtl ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    233    234    234            �           2604    120270 	   t_user id    DEFAULT     f   ALTER TABLE ONLY public.t_user ALTER COLUMN id SET DEFAULT nextval('public.t_user_id_seq'::regclass);
 8   ALTER TABLE public.t_user ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    218    217    218            �           2604    120261    t_user_guide id    DEFAULT     r   ALTER TABLE ONLY public.t_user_guide ALTER COLUMN id SET DEFAULT nextval('public.t_user_guide_id_seq'::regclass);
 >   ALTER TABLE public.t_user_guide ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    216    215    216            �           2604    120399    t_user_guide_dtl id    DEFAULT     z   ALTER TABLE ONLY public.t_user_guide_dtl ALTER COLUMN id SET DEFAULT nextval('public.t_user_guide_dtl_id_seq'::regclass);
 B   ALTER TABLE public.t_user_guide_dtl ALTER COLUMN id DROP DEFAULT;
       public          beuser    false    248    247    248            �          0    120373    t_bug 
   TABLE DATA           E   COPY public.t_bug (id, bug_note, created_at, project_id) FROM stdin;
    public          beuser    false    242   P�       �          0    120355 	   t_bug_dtl 
   TABLE DATA           F   COPY public.t_bug_dtl (id, short_descript, title, bug_id) FROM stdin;
    public          beuser    false    238   m�       �          0    120414    t_connection 
   TABLE DATA           o   COPY public.t_connection (id, db_host, db_pass, db_port, db_schema, db_target, db_usr, project_id) FROM stdin;
    public          beuser    false    252   ��       �          0    120321    t_dictionary 
   TABLE DATA           J   COPY public.t_dictionary (id, descript_note, descript_note_v) FROM stdin;
    public          beuser    false    230   �       �          0    120276 
   t_document 
   TABLE DATA           W   COPY public.t_document (id, descriptions, file_name, file_path, file_type) FROM stdin;
    public          beuser    false    220   �       �          0    120312    t_func 
   TABLE DATA           t   COPY public.t_func (id, func_comment, func_comment_vn, func_name, func_param, return_value, project_id) FROM stdin;
    public          beuser    false    228   (�       �          0    120364    t_mst_cd 
   TABLE DATA           D   COPY public.t_mst_cd (id, mstkbn, prm_json, project_id) FROM stdin;
    public          beuser    false    240   E�       �          0    120294    t_note 
   TABLE DATA           T   COPY public.t_note (id, note_dtl, note_of_phase, note_type, project_id) FROM stdin;
    public          beuser    false    224   b�       �          0    120346 
   t_note_dtl 
   TABLE DATA           R   COPY public.t_note_dtl (id, short_descript, img_path, title, note_id) FROM stdin;
    public          beuser    false    236   �       �          0    120330    t_prm 
   TABLE DATA           S   COPY public.t_prm (id, prm_order, prm_cd, prm_id, prm_name, prm_value) FROM stdin;
    public          beuser    false    232   ��       �          0    120405 	   t_project 
   TABLE DATA           i   COPY public.t_project (id, end_date, project_cd, project_descript, project_name, start_date) FROM stdin;
    public          beuser    false    250   G�       �          0    120380    t_role 
   TABLE DATA           /   COPY public.t_role (id, role_name) FROM stdin;
    public          beuser    false    244   n�       �          0    120303    t_table 
   TABLE DATA           O   COPY public.t_table (id, logical, logical_v, physical, project_id) FROM stdin;
    public          beuser    false    226   ��       �          0    120387    t_table_dtl 
   TABLE DATA           �   COPY public.t_table_dtl (id, data_type, is_fk, logical, logical_v, max_length, nullable, physical, project_id, table_name) FROM stdin;
    public          beuser    false    246   ��       �          0    120285    t_task 
   TABLE DATA           F   COPY public.t_task (id, short_descipt, title, project_id) FROM stdin;
    public          beuser    false    222   ��      �          0    120339 
   t_task_dtl 
   TABLE DATA           @   COPY public.t_task_dtl (id, descript_note, task_id) FROM stdin;
    public          beuser    false    234   �      �          0    120267    t_user 
   TABLE DATA           ;   COPY public.t_user (id, pwd, usr_id, urs_name) FROM stdin;
    public          beuser    false    218   +�      �          0    120258    t_user_guide 
   TABLE DATA           J   COPY public.t_user_guide (id, descript_note, descript_note_v) FROM stdin;
    public          beuser    false    216   H�      �          0    120396    t_user_guide_dtl 
   TABLE DATA           N   COPY public.t_user_guide_dtl (id, descript_note, descript_note_v) FROM stdin;
    public          beuser    false    248   e�      �          0    120422    t_user_project 
   TABLE DATA           <   COPY public.t_user_project (usr_id, project_id) FROM stdin;
    public          beuser    false    253   ��      �          0    120427    t_user_role 
   TABLE DATA           6   COPY public.t_user_role (usr_id, role_id) FROM stdin;
    public          beuser    false    254   ��                  0    0    t_bug_dtl_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.t_bug_dtl_id_seq', 1, false);
          public          beuser    false    237                       0    0    t_bug_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.t_bug_id_seq', 1, false);
          public          beuser    false    241                       0    0    t_connection_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.t_connection_id_seq', 1, true);
          public          beuser    false    251                       0    0    t_dictionary_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.t_dictionary_id_seq', 1, false);
          public          beuser    false    229                       0    0    t_document_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.t_document_id_seq', 1, false);
          public          beuser    false    219                       0    0    t_func_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.t_func_id_seq', 1, false);
          public          beuser    false    227                       0    0    t_mst_cd_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.t_mst_cd_id_seq', 1, false);
          public          beuser    false    239                       0    0    t_note_dtl_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.t_note_dtl_id_seq', 1, false);
          public          beuser    false    235                       0    0    t_note_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.t_note_id_seq', 1, false);
          public          beuser    false    223            	           0    0    t_prm_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.t_prm_id_seq', 8, true);
          public          beuser    false    231            
           0    0    t_project_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.t_project_id_seq', 1, true);
          public          beuser    false    249                       0    0    t_role_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.t_role_id_seq', 1, false);
          public          beuser    false    243                       0    0    t_table_dtl_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.t_table_dtl_id_seq', 8240, true);
          public          beuser    false    245                       0    0    t_table_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.t_table_id_seq', 422, true);
          public          beuser    false    225                       0    0    t_task_dtl_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.t_task_dtl_id_seq', 1, false);
          public          beuser    false    233                       0    0    t_task_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.t_task_id_seq', 1, false);
          public          beuser    false    221                       0    0    t_user_guide_dtl_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.t_user_guide_dtl_id_seq', 1, false);
          public          beuser    false    247                       0    0    t_user_guide_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.t_user_guide_id_seq', 1, false);
          public          beuser    false    215                       0    0    t_user_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.t_user_id_seq', 1, false);
          public          beuser    false    217                       2606    120362    t_bug_dtl t_bug_dtl_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.t_bug_dtl
    ADD CONSTRAINT t_bug_dtl_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.t_bug_dtl DROP CONSTRAINT t_bug_dtl_pkey;
       public            beuser    false    238                       2606    120378    t_bug t_bug_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.t_bug
    ADD CONSTRAINT t_bug_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.t_bug DROP CONSTRAINT t_bug_pkey;
       public            beuser    false    242                       2606    120421    t_connection t_connection_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.t_connection
    ADD CONSTRAINT t_connection_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.t_connection DROP CONSTRAINT t_connection_pkey;
       public            beuser    false    252                       2606    120328    t_dictionary t_dictionary_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.t_dictionary
    ADD CONSTRAINT t_dictionary_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.t_dictionary DROP CONSTRAINT t_dictionary_pkey;
       public            beuser    false    230            �           2606    120283    t_document t_document_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.t_document
    ADD CONSTRAINT t_document_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.t_document DROP CONSTRAINT t_document_pkey;
       public            beuser    false    220                       2606    120319    t_func t_func_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.t_func
    ADD CONSTRAINT t_func_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.t_func DROP CONSTRAINT t_func_pkey;
       public            beuser    false    228                       2606    120371    t_mst_cd t_mst_cd_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.t_mst_cd
    ADD CONSTRAINT t_mst_cd_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.t_mst_cd DROP CONSTRAINT t_mst_cd_pkey;
       public            beuser    false    240                       2606    120353    t_note_dtl t_note_dtl_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.t_note_dtl
    ADD CONSTRAINT t_note_dtl_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.t_note_dtl DROP CONSTRAINT t_note_dtl_pkey;
       public            beuser    false    236                       2606    120301    t_note t_note_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.t_note
    ADD CONSTRAINT t_note_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.t_note DROP CONSTRAINT t_note_pkey;
       public            beuser    false    224            	           2606    120337    t_prm t_prm_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.t_prm
    ADD CONSTRAINT t_prm_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.t_prm DROP CONSTRAINT t_prm_pkey;
       public            beuser    false    232                       2606    120412    t_project t_project_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.t_project
    ADD CONSTRAINT t_project_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.t_project DROP CONSTRAINT t_project_pkey;
       public            beuser    false    250                       2606    120385    t_role t_role_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.t_role
    ADD CONSTRAINT t_role_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.t_role DROP CONSTRAINT t_role_pkey;
       public            beuser    false    244                       2606    120394    t_table_dtl t_table_dtl_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.t_table_dtl
    ADD CONSTRAINT t_table_dtl_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.t_table_dtl DROP CONSTRAINT t_table_dtl_pkey;
       public            beuser    false    246                       2606    120310    t_table t_table_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.t_table
    ADD CONSTRAINT t_table_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.t_table DROP CONSTRAINT t_table_pkey;
       public            beuser    false    226                       2606    120344    t_task_dtl t_task_dtl_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.t_task_dtl
    ADD CONSTRAINT t_task_dtl_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.t_task_dtl DROP CONSTRAINT t_task_dtl_pkey;
       public            beuser    false    234            �           2606    120292    t_task t_task_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.t_task
    ADD CONSTRAINT t_task_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.t_task DROP CONSTRAINT t_task_pkey;
       public            beuser    false    222                       2606    120403 &   t_user_guide_dtl t_user_guide_dtl_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.t_user_guide_dtl
    ADD CONSTRAINT t_user_guide_dtl_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.t_user_guide_dtl DROP CONSTRAINT t_user_guide_dtl_pkey;
       public            beuser    false    248            �           2606    120265    t_user_guide t_user_guide_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.t_user_guide
    ADD CONSTRAINT t_user_guide_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.t_user_guide DROP CONSTRAINT t_user_guide_pkey;
       public            beuser    false    216            �           2606    120274    t_user t_user_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.t_user
    ADD CONSTRAINT t_user_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.t_user DROP CONSTRAINT t_user_pkey;
       public            beuser    false    218            !           2606    120426 "   t_user_project t_user_project_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.t_user_project
    ADD CONSTRAINT t_user_project_pkey PRIMARY KEY (usr_id, project_id);
 L   ALTER TABLE ONLY public.t_user_project DROP CONSTRAINT t_user_project_pkey;
       public            beuser    false    253    253            #           2606    120431    t_user_role t_user_role_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.t_user_role
    ADD CONSTRAINT t_user_role_pkey PRIMARY KEY (usr_id, role_id);
 F   ALTER TABLE ONLY public.t_user_role DROP CONSTRAINT t_user_role_pkey;
       public            beuser    false    254    254                       2606    120433    t_prm unq_t_prm_0 
   CONSTRAINT     V   ALTER TABLE ONLY public.t_prm
    ADD CONSTRAINT unq_t_prm_0 UNIQUE (prm_id, prm_cd);
 ;   ALTER TABLE ONLY public.t_prm DROP CONSTRAINT unq_t_prm_0;
       public            beuser    false    232    232            )           2606    120459    t_bug_dtl fk_t_bug_dtl_bug_id    FK CONSTRAINT     {   ALTER TABLE ONLY public.t_bug_dtl
    ADD CONSTRAINT fk_t_bug_dtl_bug_id FOREIGN KEY (bug_id) REFERENCES public.t_bug(id);
 G   ALTER TABLE ONLY public.t_bug_dtl DROP CONSTRAINT fk_t_bug_dtl_bug_id;
       public          beuser    false    3349    238    242            *           2606    120464    t_bug fk_t_bug_project_id    FK CONSTRAINT        ALTER TABLE ONLY public.t_bug
    ADD CONSTRAINT fk_t_bug_project_id FOREIGN KEY (project_id) REFERENCES public.t_project(id);
 C   ALTER TABLE ONLY public.t_bug DROP CONSTRAINT fk_t_bug_project_id;
       public          beuser    false    3357    242    250            +           2606    120469 '   t_connection fk_t_connection_project_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_connection
    ADD CONSTRAINT fk_t_connection_project_id FOREIGN KEY (project_id) REFERENCES public.t_project(id);
 Q   ALTER TABLE ONLY public.t_connection DROP CONSTRAINT fk_t_connection_project_id;
       public          beuser    false    250    252    3357            &           2606    120444    t_func fk_t_func_project_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_func
    ADD CONSTRAINT fk_t_func_project_id FOREIGN KEY (project_id) REFERENCES public.t_project(id);
 E   ALTER TABLE ONLY public.t_func DROP CONSTRAINT fk_t_func_project_id;
       public          beuser    false    250    3357    228            (           2606    120454     t_note_dtl fk_t_note_dtl_note_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_note_dtl
    ADD CONSTRAINT fk_t_note_dtl_note_id FOREIGN KEY (note_id) REFERENCES public.t_note(id);
 J   ALTER TABLE ONLY public.t_note_dtl DROP CONSTRAINT fk_t_note_dtl_note_id;
       public          beuser    false    236    224    3329            %           2606    120439    t_note fk_t_note_project_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_note
    ADD CONSTRAINT fk_t_note_project_id FOREIGN KEY (project_id) REFERENCES public.t_project(id);
 E   ALTER TABLE ONLY public.t_note DROP CONSTRAINT fk_t_note_project_id;
       public          beuser    false    3357    224    250            '           2606    120449     t_task_dtl fk_t_task_dtl_task_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_task_dtl
    ADD CONSTRAINT fk_t_task_dtl_task_id FOREIGN KEY (task_id) REFERENCES public.t_task(id);
 J   ALTER TABLE ONLY public.t_task_dtl DROP CONSTRAINT fk_t_task_dtl_task_id;
       public          beuser    false    234    222    3327            $           2606    120434    t_task fk_t_task_project_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_task
    ADD CONSTRAINT fk_t_task_project_id FOREIGN KEY (project_id) REFERENCES public.t_project(id);
 E   ALTER TABLE ONLY public.t_task DROP CONSTRAINT fk_t_task_project_id;
       public          beuser    false    250    3357    222            ,           2606    120474 +   t_user_project fk_t_user_project_project_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_user_project
    ADD CONSTRAINT fk_t_user_project_project_id FOREIGN KEY (project_id) REFERENCES public.t_project(id);
 U   ALTER TABLE ONLY public.t_user_project DROP CONSTRAINT fk_t_user_project_project_id;
       public          beuser    false    253    3357    250            -           2606    120479 '   t_user_project fk_t_user_project_usr_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_user_project
    ADD CONSTRAINT fk_t_user_project_usr_id FOREIGN KEY (usr_id) REFERENCES public.t_user(id);
 Q   ALTER TABLE ONLY public.t_user_project DROP CONSTRAINT fk_t_user_project_usr_id;
       public          beuser    false    218    3323    253            .           2606    120489 "   t_user_role fk_t_user_role_role_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_user_role
    ADD CONSTRAINT fk_t_user_role_role_id FOREIGN KEY (role_id) REFERENCES public.t_role(id);
 L   ALTER TABLE ONLY public.t_user_role DROP CONSTRAINT fk_t_user_role_role_id;
       public          beuser    false    3351    254    244            /           2606    120484 !   t_user_role fk_t_user_role_usr_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_user_role
    ADD CONSTRAINT fk_t_user_role_usr_id FOREIGN KEY (usr_id) REFERENCES public.t_user(id);
 K   ALTER TABLE ONLY public.t_user_role DROP CONSTRAINT fk_t_user_role_usr_id;
       public          beuser    false    3323    254    218            �      x������ � �      �      x������ � �      �   T   x�3��JIJ�*�/.I/J-.̱��7�4�34��34�33�2516�w���/�K-20��p�祖���$r��r��qqq �w      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�3�4������v	��s
��q?�=Q!'��<��̇��pq��4�)z��[!���D 3/�˘�]�1HiPb^J~.�	�	��	H: �ᮅ�
a�\fW9����B�S���e�pT����Ԣ�d.��Pic�^��=... &�K{      �      x�3���tFP\1z\\\ B �      �      x������ � �      �      x��\[S�ؖ~v�ʖ|}����3USSS3SS�p�\8l�e�s��n�-�� �		�4�B.Đ�clI�S��Y�-iK[6��J���i_�Z{����-$:�ם�U���>��~��]��/�g�ۉ��{5g�S�1W�4�F"�K.�����(�2��T���q�Ob�'-�Z�EI������r�^��;��#=����X�w$}3K�	anK&ѽܲ����6�������b��t�+��c���hV+sŲ5U�s�Q�"�R���_~����[gu+,\)7�f��QyE�
B�w�ҽXs��ͻ~�h���M�'c���p7����g�(B����s�2r��rł���>|q���^_;[��/`�b(�2��z<�
A�t������=��Z�9YCh��c���O`�Yfހ��x&��I���p�><q�u��������8���@�m��nҥ|¾���� n���W'�)x����n��U��Z�Ҋ?��0+�ic�\�&��
�GJ��R!�".�4O�l���O] 8W)Η�����$#2(�N�H�Ǘ��Y��*|�o?�?���y�Z�&��Q��KH�Q	�Vzw���;�#g\D��(�E�u�ɪ4��:��Ns�^ݐ/�d��h�6Fߑ-eS(�IɃMRb�B��9�ey�J&Cba2˛�T2��'̶�J�<?���K촖��^ۛ۽�W�ӗ��5ߖ��	�n�-���Q��~3I���(�*Њ��{m/�1=W��1��0�r���eHG`��u${3I���h�������^�F�	P���<{��#�40�I��R5I�H���Z*�`�>o��s���
ؼa���?�JEYy�Bb�BzbB!S�xlo\ȊmM7|���.k4^�𙄻��~�Qm��%U��	nIԳ[�z.�+�쪠������D닳�Թ���ڍ�X���nTH�����4�Ǎ�0��Q��70�������N�N��juZ+������Y8�;�c�#
(\�c�U���:�Q�A�:1����7���f�����4ʨ��g���N��Z���0���~�����_xѽn�Z�^F�:�'��L@�cX���������Y���@:ndl��t.ܸL�@t��V"�`���{`n�/>@Hѽz��0��(Ĕe��&�[X�&��������ⴿwi9b�pV��K�:�q}��I��t/����畐�0��	�P��Z>
 ��Q���c���@�%�ey��'����1�ېY��̉`�M�����/�:������J�>ǡ�U�/��]�QA�����ׅ'���zhQ��Ě��R���ns���11S�Q��Vφ��	����B*����y�ˋ�Q�o��x��`q����w�F���!��S餄c�sZK����#p�80��x�F�S:@#rtYKȖ���
��?�V���%	V�!Wj�����Z�MX��)�?��d�������!g�5��:A�B5s���	;���x��z�G:�p>�72� ���{ʒ�'xlG����$>H� ��A���d�B�ٻp�~����@I�&�eǉ�S	��tֈ�5��ygq���nl_�t�]CR�[X��{�7��srа}EÚ���`�Ӑ�+��VI}3�P>p2�W��-��/q4��T}�x�q<��}m�5]�eY�G�/���G��eg{Wa��fx�2�8*T �I8��ڻ'��1g���b�������mc��Q�jT	��û�1��������RJ7d^�ş�l2���K��[��3�p���7LK�:��8�F�O��E����45,Jb��� h�r?���qs۾��h��[,��*�@�W11���Ϧo b#U�7�!߽z�~�|�ם�SVf��\��p��sr�>�#G��(iB2�@�^zK�H�꾻��nA�j!�
�������u�GH8�b�ܞB��:�c�����xֽ��_�w��K����X�pÍ01z�����'�jN.�#���7W��W��#̡	��U,�	q�i��4� :��s3	�@��AJ���4!��h��Ӄ�f�v��
�Up�1�eÜ)�J&/�9]������1XA�b�4ء��
�Kg�}���\}C��0��Y�d����� ���}���V-X�J�D1q.;�U�o�w�c��J�G>7�B�"� p�^�#�d%�IU�aLBtk��:����U6Ɇ�T�V��ľx۽~
�m�Ug,��Q\r^��!��:�W��;��X�5���W�����{g
�BX^UL���;9'C7H�H�LO}�RBG��6���V���}d^UC�G�Uqj���j�W�ЧPa�P��Y_��=��7��5$�j����" Q�N��U��{�86=A(U�z�����׏v�%fO/�������Zu,O���
K����g�zX]�c�1�86Q��=.�%�Ȟ9�?aY�I &�,��G,����Ȕ��Q㯐0��e�]}5q���0a�j�P�I��0vY��+I�"�]KB������4?Q�� V �\FԠ�/�_��J��RZ�����#u�=����XF�J[CZRTn�+ĺ݋g������! �b��2���� ��vZ�����N���S%�-���v�����N�W��sO_-$�[��hc��v6�np�.� ]K�b(��$���B�Kd�A? ���4-YA�R(������W� T�U���J��zXE:�����|`�����7a�~�EKi7pŀ	��	����>�r�,R��Wq�T�l�'R��v����bZe�%�L<��%D�-Z*��x��x�Y�O��L��M�J[)C� m�s?A���KC )/��9��/ͯ<ǰf��M��T�WX5��WKI�'8=�ڽ��_��?��AS�V��<MSP�����<�OI	����,ښ��kX����
�b��A��_�a���h*ۇ�7������KNp;^t4���A�S���A&���v��˚�p�'�AZ/���ˀ�3|vTZ�&�8s
��b�^{%jb�2��W'��3�%&iZ�d���1����7{�c#cmx0E�U=�o?�2B��K]�^W�ʋi�>QL���{!h�������?̔iAt4#�GW�)�+�_�b63�J�^/������?9�O��b(�����k/t۷#>D&�ٓ�"���O�h�n��m�Y�ǳ�(1���d��I��U�ؘ;E�բ5]Q�9�
�aE�+��H�n���{q�I�����eQu^K+z�ҩxB*���Tayipo�F�"��I�@Z����U!Ŏa��2�i�6d./1	c9;�Ҋ��PŰ	*�;�h:k3G
#�A�8�5j�:38�N+*�iD��E�e.eD덈��2T�z#�hj�u�e(>�DzFQC�}q����x�D�"G=�!����M1_a�I��:8�($k�9�7���ڷ78-��;����9LH�jF��2�LT>:��+� �$�h�&�e�d����r��q���-�ұ�)�\<CA�����@��{y��s��7v䁆��.��qr83203�)��&Â��I6�&��Ҿlj0��ʆ)�d6��8D�%��᪳��C�	lŠp&�'b�=/�˦��Eb�ᙉ1�q���І��:�����+�I�Y!�{!�.�v8v���Mkٴ�h�c'8�+��储
� ���P*_`��&0�kP�N�-�0�ϫH�����y��M�Ȃp#"ˑ�&
C��`>ʪ��L��"�}��� �x!yM�LJ%\&�K�@6�\�Ԝ�W`�����0ʠ�F�.#�KD!�K.YD\��1��U.� }׳z�~ލ �L�ǰ����*f��Q�|R\��*�?���S	��"�7��%uӬ�N��1���Y|?�
0��e'���B�ջ~�o�&��Qs�̧���)��5(���:�t�j�$]Ɉ�e@�|Z���ј�0���q�&_�p����������Sp�[��)���^��c��I�*�O�e~ ���ξ8�T�<�B<��d ��B2�ȓp*�{� =  �ڠ�%��լ"�3i�W+hB�Wb�,t����t�_)�,�R�pPHK 5,
 ^TT���]Ί#��o�_��9;��۪�1T��V�&�;���xg7�B~��o�R��X\/���W<���'�����:O�yB���e�M�'�D�}o�HN��C9.Ž8H���UBA+D��N������y<��U�,���W�5}��RLq��n�r�"p&R�$_���P�GIS��X3Y�tjJ��� o���t��tKOf��;d%��@J㺽�7�x׊̜�2s�8�Ǭ6$��BA�p�a8;�G�L/DF�0 8#W��"nF�<?�����Sg�k��|��%Zuڪ���1��r����������o�ׇOb�����S�!��T����N?��!�M)�f�?���w��n��Q�z�?k5�=rs���A����I��Q(>%B�3Q�ac��~�����b�3�jf�� M�o>gs� HP4���p�m�{7tĚ6�$&Em�A�!]1�(:��oBenZj���r"н<�@��
�ܽ�kXe�5!��������`��������'�l��^�����]�">������h��)
>�Ym� ~v.�+��fGf]��Pf��N�����x��>U�Vg+� ��iP��늽� z�Ç
f8��u�>��D�w��Ά1Q��:n�x�<����M/̜'��Jgut�?	� ]u�s`�&ς�c��5U/�H.zp@:�J��2���W!��	'hr6%���,F���UH�x{B��>U�Y\��\����=bM����N��Hx��7�}�Ҩ�'Xh��"�Vh1��Y�U~nKO+:�Ck��2Fk��8A�J�C�s��B�T+�L�o�� ��'�ƥ2�@M�S����Ģ�l	Z-�<z�0j<�� .�еo취V���ص������F���곾���@bX\(4mD�7b3�X�Ne�zۺ������b�������=?Gm��"���ި�?I���щ�H� D���ɥ���R��P����㔭봅0�+NHԉ�4`��s��,~��:����WD�Y|�>^�h�I6DBE�7��Kҳ4zk�NK;F���n@�6��.�b���D< �.E&����Ǻ*���1�3�8n�8�����([��M�� ^�Twճ�8���W�#Z�B��T��^�F�j1d���p��<��R�I�@x y�nZ�JX������I
�,���͂>
k��bDe+ Q���|�������0�w�K�x~9rO�e.0��1>c�iV�B)��Ν�P��N/x�J��6(�<�Rjr�Dd]�E9�%�5.�j�|]Op�;( 5�B�+�ָ�k���X�����Τ㨺���}x#X��.�6cM!�/���vщ֍G��Ao q�h���T�{��� �s�($���p�{_��eD�Qʠ⠞���1���
9o]�e{�KL�*��|r��Z���Á�� 6����^ぇ� ���~C\E���$�71$֨3aFH�S��������aQQ��%��<Ix3�*

	E�_�"?�NoQ�*NP�/PZ�ϭOA��oP����D��7Ǭ�Q��q�I��Z"D�(h1���I �����t���ޮF=��>��I8wܭ�AP^��gR���^��^뛏08�-��������6��٧�d'�Z���ic�#/{jO���N&c��$�J���?;G��cv�ātk���{�o@g�Z ��^���A�eZu��C��K]>Ыs���I��>�o�}�g���b�Wk���6���X�sv�6>Z#/	�F�*��d.qc�%e\i|]	��#��X�Ź{t¹\��U�Ty:��,�,P䳮i|���8�ԤR���$�/��A*�L�'��6h'&���t�4_�ңt*����G�Y�4�`6�o)a��e���i��4>���*]����*�T��~���ө|HL6nJ�*��x�E�g�������c�!��ʁ��LpB�v|��Gd��`Ik`J�O��׼17H��J�iQ�HkZ�N�$'�:��/��?%�/      �      x����G�����Kf�ƶ���8v��5ۻ6��vf�l�ҪT��
*��nO�	(��!�� �Լ��x�/[��U��_XE����#3����������q��6��c��0���0���<�?�v���鵟Ǘ�8���oǪ�����u4�6�U��'㓽�1��z�Tm4��'7��k_��&n?���/��Ԑ�2jUL���Ï���~��z�����O�g�o��Ѝh�q�Nn������3����_��q��[u|m��MW]N׵�g��+>ʭ]Ω��G��K$�n@V�!��+jd9��P�:����ܥ�+3֐�4���������;_�!I�-H@���B���0�����_�o_On�Ln<�K2�6��jg�Um�����k��Gӛ{�W���;�x_�!x�Z�K���&ov�La֩�Du��i���3�?"q�J.��ӳ���K��>�8�4������e�tw���鵛��+ɐ���_���E�?p����㝃7�陌֝3����1cѿq�����Q����r�9?
������HXΏ�`9?J'��;wƷ��<�=��ŉ� �GNN7�8	9�;���~<��e�ӻ�k��8�-��F��g-���F���r/�t.��� ֹ4չ4:����;�����;G�ޓk-Z���$y�lq��9���{�u��0y�t|�������o�����Z��'N�ڱOl������G�u��ݽ�����2�s1t+َ��Ο0úƮ��`�D��!O�w���ӿi������Ş���K���]�����GA�I��s���K�(�S�d���ͣfz�������]-�񁳺G���E�O��wǗnȟ�WUݨO����sX�>T@b�2�l��k�2�:����Zd,�"lV��K��K��\k�Y������t/�f��=:j�-ē���{�/_��$FU�?��hc��{���e��<��m,����	��Ѱ&7ώw�q�|�ɑ�x��O61a����x����)^j�v�|[5+m���u �������/����o�S_���`'VIV���ɭד�/�r�䉥�/�/�<�%���
�Ĕ��DN���Z-���s@�_=!A���	�m��m���������ý�W��go�������F�;\��-@�+�������{���_�}>��;��c�ǣ��A�M:|P�~�xK�}}'�UҺ�aΚNΛ�Z���%9ՒO-ٺF}��O	^���Gq��Q�z�JZc�hg�*b��?҃��N�T�h�L���$���9��)� U��`ț�<˛�n�׈��+��>cr�>�&�^u���{�p�Ϝu��ʙ�z�s�$�1߇����r�f������N\k�_����yC��5�Ȉ�3�x��F%̭[ª޷nɩ�uKV=Э[���n	j��uKXݺ�0}rѺuo$�ֽ����F_��c�Is�|=![wЍ]4&,u��*����N#�l��p�XS'�x��6ͩǶD����0�e4�/u����kb�!�pW�4��˶2���\���z �ol,b��|�c#`v}�7��r��7����8���l5UY������ �����f�7hko���2 �7BS ً���@	�l93�f��F2@��>� +3����7�S�}rk��0-J�0�\�q]B���r L��^��X�!]��\?ۜd�O����>x]�۴Fu*��ҀR��IR��Xu�[4�4<�� �,{�����{���C�T�[�
X�թ���EPٶ^
� �ɪ�'� �%|�� ��8XXO��d�RB�g�������E2�Ԑf|&�9?�U�;�$�⬒���Y%)� g�$5��U���=�$�⬒(��[�y�7�}�Ϛ���pR���[\���VE_}���]_^0&��ĸV�PD�Y�X3-��x@W�^��GWJG\�3��jIeŪa�Ti�q�nX����S8l�GYEq�##�'rJU�[���-_�4S�E!�UJ�tS1_�4�ꌢ�;�Q}�Z�{��^M)h��i�E�W@�R�Q�|�"z2���_@aF�[�Wb
�.�NA�:E$__5�j�����g��(b��|eE���/�����z�����6|_,�T��nm+�[�iQG6�ݶb{�Q��ɛ��m�tr����2��x3�����	3���4�U>������@������%P��ʗ
O��i��������@u��R8f��"?��+t��.?��'�����rS"zi�1���(j��-���Lg�"��85�r�h�uh�X�D��
�<PT�^T,򁂖v�`A,H�הD0[6%
�i\���V&
�cn�x�v'���T�	�`�P�'��Ϥԓt�#�LA����Ec*Z��o��
�ҪU�H�PP��U�@Hu��'��;��Iu�*��v>�M��	�|���S	���jXs%�E�[� 9�%��ZA��K� �8P(r��Gs
�N+��A°q gy������C�0|��w?[ՙ0E��1=T��C{�^>w�է�E�Cq�%,P��d���X ��D�<#�(�w����x��B�����w�ӈ[�8�OE}.����A4J8�!��޶�6m��(�~���������/M��ơE�a���0�t��%>M��>پ`����R���mH�7
"~
��-��V�zGH��#6G�������x%5��hzɡA>~�����5��ξ��K��'k���N�o���:��KB�ʧ�y>iDhb�T"$��N�V�)Ω�%-U�B��*W�x��V)庛Y�&z�	����Iz�w*r��ea�z[v�p��Ѩ��a��$�����d|�֐��g$�BN�8Y���f�5=��1�QП������E�4#k�sN�����4|�j^C���V%~*����X�@�@^�(�а��,��_��fY7�ƽ���U8�uѽo���n����%X�b%�CX��h$�����g����8n�X��_� �æ�m	-��l�!��5����c�����7C^�8���Ym���t�ܑ8��z�`Ml0-s3��RZ�R�Y5��Pi؋��s�)t%�ĆIT�����k���_ �U�Y8���\;yu���߷l�o65�Ro��;����;⹥&�?J�ؖ\t��9��(�bM�u�ϯN�9'����CG�.����ؗ6|	�P�?�+D��c�ӷ�[�Qە�:;琤լ*����?��M��e�j�8�<R��6>{�����TT��o[��	x��Q�l���c��JSM�JTMk�������!Y34���S'Y9�毽R$ml`r��9K����hC)��ƙ^}ɥ��w�n+�\�L}t������1��=���u�R�rkZ?&g����g=�:'�m^>��}9}{�p��c���/	�5S�`�A
Lvʹ��ɱEz ����rA�5 �&Z���8��e0Q0dW�#;��@=`�y�=Z��s{���o^M!
�C��8I�Ӊ�_2tl�i����ˉA�<9x�;�����c�b;1�/�2���y|����3������8v�R�Z9�;����N�v$t�ǻ�w��f��S�ҋ�A/�8���SV?���՞|�x�K4AR����	[T��0z�zG��X���VL��H�:�/Nn���_l��v)@ӽ>�����+��Ů��d���)�Z������Zp`]�c�Õ�Ï�����Fw�TϷ��$&�|���y����'w����^^N�u=r}x�|���}�`��O�N�B�Ay�a�NP�=0rH�uq7~��Λw��"�i��Uoz���՗b ����թ4rT����L��_�9|�C�oOV#������������=㈃:��gu���aF%�Ɛ����_|��}�G�/����[yc��t?g����|r���ϟ&�^Cj��'1�)����'����^����/����F/��,y�v@� {�B������ţ3W�tP���<    �U����	��1�R[���+�J  ���yv�X��?m����1��y��Ni�s���aί &ݦ��ҧB�	O׉��ݶ�\�v��`[�ڣEzL�:֍���#(]�t)Я���s������,|�4�=͹�_��y��,}���ǽńZ�53ņ�w�� <�;ѿI����R��k�ޘ#z������p��kF���$������K�V���/ ��R�s��[�����9��אz�~�*L���H���#�H�J�N�]p�L��^nr�ܹɅ�v�&�u�$�� D̺XO��O�죅���
ҳ�؂d��u��q��fGn	R�K	Bv�+AtGNR�J�R�8D��e�mɦg��!���c�M�78�c��3�w�����%���S�ZA"�y|?��y���I�i�!���ce�7f���^��b�N&�"�����}��"����=p`-�ၳpxd	��XQ��L�eo�0��W���9�_IKgU����u�Z�������(�{2�J�;�.egpY�@j#P�B��lw66����w����0;4��ІAziw�E��������Ⱥ_��0/?O��Ɠ=IT~yb£��(f��I"4���]:�;�iI[1,i�^7�Li+ؔ�x���g��T���u����z�aN�=�(췇e�0����r��\o�=�r�C�vA�=�<���z��aT >����;h"Yh�hÇ~-�S�N}l�6��'j�y� �C2���nD���f;1n6�\p��)�f�|��lZ�86��f�Z��g��#_��H���Gc"
bS�:�2Z߄��N��݆~p�O�&����'���H-�C-�e<X>�x�'�x�d��GF�j;���N�M�Y�P��O�.����L����k2����f�&8}��9� ��v8�.Oe�������а�ԙ�VR�ПK�?�/�< �o�9�a��U�e�#Q�3ˑ8��r$�dF9��M��5�H�(J�%�3�Z|E?8��8�����b_-�%�q;�Vu���ѥvJ��ˮ�X��3&�l�[�κj�^��b�sP3�5�������>F�g$�K@r:�5���.o}���˻�#(�|����`}z����H9;��>!�n��u��O����翤���4��!)hY���U���2)�*�5��ŝ^1��_8��+&���溽"N��Oo�a���_.���R�/$���ri`���H1�ძlB�%���r턫n�.'\nJ�p1Ӷ/�o<ػ�.����W����܏����S���ל?G3��1�חgq���L��	q���[�)�gv��ˇ��J{�e��˰�Kci7]5�7]�/s�E�&���噖P�i���S��sz�.�
:�n�ᄚ��eL�
Te�T<˜7�iR��ּ¦I�i�q�mVT l�(lVT}T�����F�g���%�����d���k��h��-)6K��-)N'fd�u�<�t�<�^��<�;�����������"ی�d���h��8��%����!��?&�ܒ�LJG�EL�%1����6T(�d�S�d����OόW�����m4�Ib;��N���t��L�X��t��o�S�0f:�7����o�S �w7�=t�!�4�C[ߠZ�����`挵�>��a�r
�m�S� F8�
d{S4�����)�q$�
�ػ���7���5�w͎g9@&�R��,���݃����a���Y�s`Cd�Կ�y���dvZ��/sNh+;T��3\�3K�L���W�5Q�I��<.Y���4'�/�y5}�IB,�d���RP�!*/}��>_�hl�j�P���X3�8������ܞk<�Ij@v�G"�A����')�V�I�mp�^J ��>0~W *}���OOvg�t���Wu\}<�����'�BH��#��^����A)���
,�V���V%7b��c�,�L
<�����Y�5�1�3w�@l�����򫈼��$-��tBG8C40�V�f��&�78S��.����\����c�)�I\��~� �z�&�sl[<����t2k���� y&�6X�SWC�g�j����.Ϋ�����8�1ٲ����c���jƕm�`��^���h��Ͼt�v�����i�<{
��7	�n[ �eňeшNY�d��<�/C`K�;8k���lW"L+��O7E��f�lfӌ���
4�f�9'F*u�"���&���k��ýut��1��_!�5u`S;�j��um	�i�������^1=�'��<Ѣ9=�'�l`55 �����5�����k�um�I`�_���'	iN�����	g���L)�>�D���M±P֐�U��?E׬�d�>N�~��]�Y���iE�ɠ���_�sA#��Uu��>��킐d�}ΰf��0˟�Q>@��=�Ē[ s�5�����i7�a��-Z�tC}�,�S�1Z��[��R�jLYu�&�(j5�OE�9���ᥖ���-������mܔq�B��K%�Qt)��	p<])�Sѕb�])�Gѕ2|])+�r�X⏼�RiC�1 2��:���"��O w{��{Zn=���i�
Ir�=b+w:&)��{v�0|՝;����'��Ð\�>�|֓H��u+1g C	��N}Ưm�;X�XJ�@���z�|�.��Py���`����\^�,�'ㄋeݷ�� |�;s��.ߥ3H��j�E2I��d.�y3J�����i��H)O:\�&\H+�f��4�Z�!ޙ'\�' s��2���eS��x>��\L�$e.j�le.�W�2����]�0�
W��)�U�i�ҩ�H�>�$BR�˜�te����Hg�Y��^S�/����?��L5�o����<�+EÜp
�O�k��}���'y�z �� �>�. �޺�	�2P8�W$����p�HP��M���"Nu.E|b)�!�VV?�cT�j�_���!V��w�S�����!X�w��U��d5J�؟N�O�9���p21x���*ؚty?��I����;�cK�CO����yJ�/q�d�I�u� ���s&V�]8��;�	:k�$��Q�b:��M�ަ$�o�t�6�����R�E������,��5�V:iye������V(	�av����o�	%{8�J�0X�����1Հ"��j���.^��Yò�c�$���:�Gb�K�������ȳA�������X��n�(WP��:ž�"9�2�����)R@A�qa�8#��E8���Hxs����0b��L��d�K%�2]*�k$�*�D�m�g��J	5�\�Ng8[�c��sx^&���Q�`�L���B��y�s(��:���hs(��2�b����x��Τx��A��������U�G�ۧŜ��a|S�����������wĆ�d�n�Ajȭ��vD�prϭ'��e�g���t��B���ψ�5�gB�8ǔ(��Y�a{9�����37�
�֢> OO6��3T���#���G��7d���ֆ,)��L$!p;�LB�N(����pR�᪕p����������2�bNM�)X!�r̄8[�@�g%F| ��d����El=K�k�xۛ����>B��
��2�r�(H���$�s8F����(�1d���>�ayx��Iۓ�szLB.���(	��GA�H�#s	p�����E�u�t�&�
w��}�$��=\!�6���#��mC��m�<l��iۆ(o�6��ض!�׶X(B��%H��k��[K�K��!#wAH���~NHhxx�@��0�r��`�;N2�^2զP����e�`XEe"�L��w�\]7'�u�G��ņ�%�� �D�Ԧ���my5��$G��z�����!�^C�ZE�H�V�"~Yt���{d��jF�G&aΑ��m�w$Aͳ$與�ֳ�R�rEL/=}-go��S�a��`�P�������k��9� ���#�Q�u�l��]b��-�o�����-�cjY�"��V8º�(�u�    �gk��윥N�oȦs{��`�t���d�4��~����3O�򌣅���jE�L�uw/�	~��Waǯb��S��"��"��?�'����4�ֻ�'/5�f�8���)��61�����/��_��?������-�3"I�2�� �EN�8o�y���{{{gra{�����m�B-P'6_�s�q$�G�/":p� 0Rܖ���i�����9�GeS�#��{�Tf����]T��0V��y5�=YT{�P���Ы\��`ۂ׫\1���A�o�dy�A�glDy��A�O$���A�77+���%�U��0�ZG��H�$`ֽ+�uIM�;�S:���U��anռf����V�kN�L��j^㈼�LSj����$+��X���a�Jq�b/�����2"�W=F�*[����+>ʯ�"�����8^��Hb	X�4I,�󨸈Hz�ӣi~;�h+�Ms��h=ZָZ)�I/���w�FU)T��_�#�f���
��ZF�=N��Vq�F�iR{��h��p�X6U��$���Zvt?�;x�zvC��[税rk��n`a;ԍ�17�{\dE���|n��������X��+k�����l5Tu�2�z
j\5�SPSq5��s�B�f�B�6t�J��Xe�#�OBt��ˈ�`�S����WNtĪ�E�8Wt�P8ˑb{k�nl��ƈ�&�᪸��i3ؾR�V�}�X�G��R�-�ľR�n�}%a]Tx_)�`Tf_)V�
�	�@����� Zb���.�]��)Cj�Q�(�(~�&9�������7��O���%.]gw�ç?����x'�L(,PmwW�ĵMh��{�$� ��43Xj�A4JR5Ƀ�������Xy�uY�*+ξ8F���T��� �l�o�:��Q�Άy֯���E�l�O%;��[��&���1N"}M��0��X�[�ھ����6���o����
�&�� ����Og�eV��2�>���S\q
�<�-�Vܢ��s�
`BV�S`��ds���bL�ϲcQ�z���ލGR�N�<��6�	�b/�����K��Yb���C�-�W�6��ٶ@>a��/t�߶H^!�>�s��x�퓃�';���O�C��E�o��5�$1�m4WB�CYX�\���T<A���s�#���t`��1
Y4c�l��-�\!٦�n�b�4��,�Hl�s �_����}"�f�>������y�i�����z�hdY{I����h����f�6�8/[ �l��z	�zA���JZ^<,�f��� HN�TA��B*�
�dvw?_x�-��S���mR��sD6ژ�uo������(Z�7g�� 1E6�7��&z��0�(#�kd#}"�l�oܑE�z��"����X���{������*+kb�����ߦ?Z^ܨ֔ɨ�U+y���L_i}y�;_��
��QK˄�=�D`��=lv��_�x�� �IۚF �&q=�Y]��Fb��T`N�������1�w���$��q2p�( �x�Q��<�9�����G���	q����%k���&��#f]��N�??~���(�3�y-7�	s��ӌvΘ`U�p�����o�N��e���s��C2��z�h���rX閸����.PPDИ:�Q����tץ�V���Q"��,u1�g�L�>fO��o���u5y����}@Y���1&*���.b`xݘ+�/��ilB�s���L��	k�q�����t�&�,�[�Ĵ��"�8�� S��(z�;��Ɯ����#
�W%�E�P�X���:,D�Dp����E�4�
�4,�m��6�� 	hM�oZ��K�y&�5a�	iM�ORZ�䛘֤!�ܲo/.`�«aEj������H�����_c 0ۂ�Ƕ��%���F���!���0��-�:<|5�|���GZ��xu6�+��Z���^7�G[��~�V<c.�b���x�N�����p��RO@�kW�������A����4�<�SA�5x�ɣ�eй�����ބ��߅��M%߆��DęF�T��Aq����BJf��6c��0�gV�@则�3[���>JAO��cw=I��u�JeP�I
�p�.��Y
P��W�)��3��y
�(���Y�x�RA3��U
�֡R�e
Hz�y��t��z�Z�Oz��
�8�r�G��u+�� ��Hz�L���6�7�M�H�l�< �@���6�'�M�Mwl爔]1"e�O���?՚�J���ϛ� � k��[h����R�5�? .O�j������í��h������3ɲ(Q��؅�8D:�^{	�(&���x�s{v��lD�x�
&��zh� �S�H�z%��Q*��F	�uR2G8>k��f�dΈw�����}��w�!��v�H���Jb	ָV)"PB�p���w	��&P�O�$X��L%�H��o$Z�|���#�Y<c��;�Yq|"�%�;�Ya�0��d���H��{q?Jdm����p �p�\}>ٽ6�a��1.(Z3���M��㝃7�%��G뛬i�'�"fN
���N�����"{:��e#�]<��g�/�A-�zEE��� ےs��v#�5BlBB�.���v���K�Z�uVj�A.=p'�u��<�l'�����A�xD�](�D���{~u��9���}ka��]���?=�j9(+�L���EY�����çB���-5kKh�eCL���foC�����?��MH��ѳ'T{�g��uF��^���ߌP~��Vڧq���M�c.'@E��&Ξ�.��@��Z�p(��H�8D*c�M�1��|����jS��Na��fY��?��"��l蘉i�Č!�_����C��0�©"'�6���ʛ�l�]��I
�6�)��k��2̠ Ӣ08z����l^*}�����E���RB��iB��.�K����W2h$�5��f�(�Dր�����X�Ok��MbP8����\�	����6��n���m�Pt�l/h[*�)h��P�
FΥ�|�x��M���W�L!7A�L@¥6J�k
�����X��B�Z�J�X�ZxQ�0V��B��d��?�yt�{�]si��]]�y�;N�zt���T
��
��W���yJ������2&�\�)a�z� �����n��^��ӕ��o����~a&P�����^�f5�:o`96����w a>I��@{+J�rk����)�o� �a�v�n+��� l�{f(��N�1���p(V�`1}���#����ms��42�c�7�b�(,�M�I�p5�G%��y���N93#�9��Iz�k5�i`,v�f����Mbr'>Λx`�G��x��I�x��p�#.�xf�$�D��U�Ƀ0�ip�&v�_�<���_�t���_ޗ�/�����祘(���2��G��,�7��F����y姨R.'i�6�7w>�?|�3}v��jd�^H!D��9�E��8p�ԆV�F�s7�|�.��S�u�.��SL�w� ��Zd�����M9-s�����[�g�~���(:���\��f�ti��sAC|?.��Oy݀�z�l�`R�]]���2j������oC$�*��f=��[�D�La� m�w��$�{�bY�>\�&l"֠�Մ�q���,�"W3���@<���5aA�*)�ע�r<�)
�򴤤o+J
򱠤_�I�i@!��s�Y�/0I��I��r�=�W�88޹�Ь�G%8 ��vi��+G�Ƶ+��S� �_VB�p(X�S��u�
<� �������;���Tys)p ��8�G� ��
� ���P�h@ǼoS� �4�(p ��r�W� j�� ��<
@h�O+��l.�Q� ���+���α�A���<䷁��afjq3"�tA��ٯ$}����Nb�a���5��a�ޚ�m��(����ڽ5���Y^vo��{k~.�ra��e���*�q��u~pDf�����O����#j���+ɾ~VI ̯O�� �Q̖���5���ֆV����m529q�e��    Yl���Y����yp�iK��ݾ{t��9�9%�G�Ρ�W����F�g����#������j��s�Н[̸+��(����a�ȃ[�g^��Mn�N������"k|r��t�Q���֛�3�� 5�X\kQD�sv��t�b[���ZԪo*��Qʆ�+=es�W��Y>�lZ�ZS6ȣ̔���%���cl���g��om�%��������Hy̻h��7\^ZKz_�������p�o�}��ڒ\�kާ�<M�O�E��F�v��������oW�ǻ��Z�
D�c�A�ፓ���1���_�XKr�����u���+�'/.�](�U�6�7�嫺7Z�s�8�J��O�ha0\��`��m����.[oi��+ �ҹd�`a���[9���J�'�����:�q@�r�<?��5�t�.����X��63&�Y?+��}���w�p2�o�����b�oLn}��C��.��.,����C�Cf�0��ӗR�q�BuQt�DI5�X�X�ny�6\����d�B�������ϠV{��x3g�u�����w��d����/�Y|�|����?�u��B���≟+�]�Ԥ���}/��,��x�����%"�sh�b�s8���s8�C�s`�"�s8�"�ݜF��p����o.���*�!����δ��8Ϡ�!�u���ĄFٻ�R�����
���魻���1�Ho6�ң���RJz�Ɯ�����%�`p�Y��Eꉆa8�t�{� ���wj�s��$�e�d(e��I�eW"�˛;��w��M��a�BFmN��Q��4j�JF�� ��Q���qY,����_ޟa�Ĳ�%�K��r�����D2�2̵�n:4g���Ƭ�}��zw2�~yt�o�g�2<,��L�q|Fҋ���}��#��\�ɤ�����kG���!w��>W=�~%ZPo�<�v-����eh ��)y��W.b<<�48�H�e�V9y���]@����{!��������z����a�=����������>^tyܒNuyH�<l+�p�=f9� |�W6;���9���.�P2'sKf��o~p���� m5�SQ�����.���?���?����՝t��֊�.k9]«h^g�^:�'�E8��ؿ�~s�
;\1��԰W��ۇr>�ݝ���}aSҜX���Z~��iq�Rݥ8��v���`=�S��y�Rݥ8�/�:��������'W���K?pF_��챙����N�ww��諤�i�`+���B��.��}�2��l�wZX�Pݥ8���B������N���g�UR�t�?���i�RX�Pݥ8���B�Z�q�W�-,f���~Fo��{���E<AT��pdi�h�o���G�j�|�9���is�>�js�%�׺�U�\�9�e[��"{���hxÄ},����x��x.�֫LbK%�1Z�/3&�S���Ӿ�:��7W_��7��wsA�j�\<����qsQK��\@/m�
G���׃7�ɂaɱ�Kʌyr�w<^Jz�j�E��ī��K'8�7:0��,��-;�C���X�n�Oda�d�a�#�0�8Ja�-�{2���]|�28*h2ҘC�Hc��2�ԃ7O�n����L�2Jc"-~"�Գ�lBI[�(~�e��w�Ƿ�WAÆWࢸ�J�$�)�������ǯUFi�dfi�9���2`C�r�G��⿆���
�N��XQw��O,�;�����ݣ����X_�I���|t�����|�b�6u�]	�h�sz�����<t�r�}S�X@��5�\�S>{���I_�aVq�B����bYe�J^.��ֈ���{�_��� �)7,Ϋ)y�f 	o[�ZH9\Ǽڬ)n�I�텞w�Ռ���
��Q��&���$s�ʗ&s }*�9�%�9h��Ħ�DQ�V q�P�\Y�"�Q�N ��p���|�4��ƪrK��',�X����;�����\�1E*�L�|�)^�Xd
��L���`l��W|ݡL�q�A���$J__��N��X�S�� �D�����V��ϒ�7�
���<���~l$��8�u4�{�����������k8@㯶q�3�,����2�2(���K�h�>����7��/���ߵK���^����`m�+'�O��˛�d��˟8��as�\y���K����ydó�V�9)\�ɠ'9�E��6�޲����FXX�8���׫�� ���k��Sh^Woz��yu�l�i�t&I.�(��IJ���n���-6,�1Zu��_)3���?�#��
��Ņ��ݷ��T)ɽ��I$��lw���nUd���C��ŉ*4E�*#O��U��څ��	 58t���#j�	���F]�`z��Ɛf��_�zI|�tn	���s��H���B*w�K��Y��kS���?�'a6V��V�	';v�����ߦwM�_�q��Hy�����U�rtD�z3�����}ƃi�x0iP�(�g��փ�s4�?t4ʲ2�y�h\+�SG���[G�,p�ǎ�u�\8�V��Z��	�V^e!�LLCj=�5B!/3'���%R����h�=U�C1�?)ng���-x!����o_N�^�#M�v꬗nV��I���O.��}�i�-��S��igG��ïz|mu{��Q�[d�g�(a*���B��t�:L�D��E���4e}S@�e�,��D�`�K�iA=͙/�]�b1pbj�"�n`��-e�����E����*���A��M�Vg��4Ǡ�|_?�)oD��+T/^�͞��i����Qx��o�T���9�^>ifY�4���Fs �\���~h����Y�M�x{4�!���|�h�r�!(	+�� �*h�=��-EV�� xǋDC���ː?`G(�����"2����ڋß?M��6/%�B���I�h����R��l�,ӳ��eH�v��]�)T��	�פ����_�2Y�qC>���`t*1�! ���e���9*���<� ��%+G���ތ?\1�[��z�Ps�_-B�?�����ߦ?};������G��=Bm����o��~�&�o�Od��5��o����S��M"��q�{��8�n}�'�J,���P`���r�����[���,F�Bc�<_�<@yX���"H��x������p5�O,Q,���z�X�)]��E݅A�j{�:�\��7I\�:�)���=�'�p��cC^Y���F/셑Mt�.Y�c�znj���/N��` rGT���W�^>X8��P�mq]`9#B��mQI�5����@�xhos~�1��;��� '�y
:��	����ԇ�*��9���&�+��D���5)>��&�/z�d���z���k��eO�x}���y�>
�e�x{�1��MB��(S�ez<��R%%���&�C!	(�jH@�V>jV�G�0��F��	��\�Ҝ���F�ؓj��1�Q���kD��vx�q��o�$�`�b#b:їыZ��s���'O�]��(|�P0$ܢQ�i����{7���'�<�.�ſe����/��qhA(�^�m�7��`����%�)��]�J �+����OD����&�<��E����[�|�4~y�����o^>����g`�݈v5Zs��5���c�-��'��ҹ�^?^"�����ؘ<��������Z瑂$3���yL,�G
�噽��y'.��>9K0̎�.oo�rq��H�4E1B���Ǎ��v��ǀFi�I� �3q�"R���%:Fa�r�S��$9"�����jq	��R�S��]����5r8+�s7:���Q�<tm0��yK����yD�G��xχ���~@�W��}0��F<��M���Õ��=�K�le���Հ`w0�vd����ġ�s�K1#�P��i�"C8>D3@/+����P���j�`Im#�#���:�rHC�=4������kE�d� +��hn+7R���*~v����c놳�?I��~Xі�a9�񻶰�F@,˸ d&\�a��9+�v��/N    �x���G��LQ����+�@,=���~g�L܈6z����PC;�z��=b������i�lK9� $��#��̝�WG�kh��:9�Ha@�K�8�:3�l��Sa� ���1P�k���2����O���P��\)���&˼?�wߧ�|�oo��5���kD��*����Y��^�
XV�B�|4+�O�BKkVX�K�B��/J�%�{��݃���sqK}r���P��p6<��@��.�ia =���� �j�������Jo#�,�ҰV�TM�����]T�OD��\.�Ũ��+DS��"��Y�`o���ޱ�Z�Q����hb3�x�M�g[��d��K�$�Ѭ6P<q%b�]�O���B]�8>=��x;@v�#�\Qؠ"� �j�?�nMӫw���6�_%�i��/�zy+Xp�M'Zjg��7M�Fިk�L:#�|���@�D� ����P�d8I .�a�5��#��A��"Ο�>#�3��F�j)�`�jU��+D��צAāP��6*�E1�ϦѾS�eӠ��3<6aӺ��N��& �h_Eg�l�RI��N�1���*�ܟܹ��w�������RUW������(��H	��f;28VH���,���#��` ��A{�W(���)Ԡ�<גb��1�̪F��Cj�ܸ�Ĉk10օE~]���4�R�o��6w�D�m�mDV��qml��C����М�Q�ee�,'ʹ���1���[�� %u�5���[Ѭ �wl����i��I�p��ȝ��&��.j� ���4gz�?s�g���8~�q��5/�Q�lRS�D:x�EO��3�D���]�g*��d�䛡���;��jN�n��{;�$h�����9�M��L'��MҢ���A5oz��Vo����)���V����K��w؁��ƀJ���5��v��� `+g0���ǿfĵ*A�O�T�:��)�c�������o�W��a���j�DO��\��v��"u|�X�h��T����k�#���G� � �6���	l�Zȃ�'^_����0�x�{[�R�&�'f� Yuы�&2IY�*BJ�1�XMV��O��Oj �|:K�-[�B�������K�h��j-��bт��-\iu�E��$bZ�G�(B��]?%��`�l�$(ߍ�5��Y���f&�q�]'�1����XP$?W��QP��	
�� (5�xW�T�a#戍�G�����g�g��C�ĳ���)�"��y�s�TV�1n��D��*-���膤*J�A��W��=fR?�N-�(=��~���ym^��
2@��d����L-�4�8Sq�Mz��wXK!��Z�G���ϣ�?�%�(H�ⷭ ��@��ai�?\�B�nf� �#YMz�=��ZI�T/UE�Г2�%4�p֠t�Mp���k��"��| ��,�� d)8�qpO�A�?;8�y������!�'8��e ��ҩ�!�+�7iQ��Z����fR9�i�c����
�Ս�����>ܞ�\�M�Lj��G��r���ԊX�q�:���xˁ3�=[�n�SO`���*ki�a�E�@y�ޜ�>y�����:��eY��
1���xU%K]�ڇG�D�`<5�|��R���(�Ek�&`����7ߌ�ߛ>�a}^<����@8���5�UO!k�p�����X�J�	[����_؋]d]�
^�6�	J/=G�ar�����]Y�\�+��9��K�M�V��j2��vrlz�mڭ��ߝB?��-��A��Q���ܾ{t�dE1�Ѫ��,�"��5&���}��������@���
%gɼķ3o�9� i7 �7�dy$ۀ�<�b�|�k N�7�dy\qF�Rk��y��S/+�R@�S(��D�G �ʦ@�,�D���K�@��U��� Ľ(^� ����mj6
'Q�s����V1P�0��`��7�����B{� Y
Ƣ��:��c�_@��c�,������������X��i,�A�!�C��RU��U�
�I/�j��K+� ���Y�M������d�S惓C��* �v�w���V3�j�̱��PS]: ��N\�ys��k�{�=�9�ND;k�X���[o�7�xV�)K��?�(�h�{m�[�"�۬@$�;.�H��f��QY�����7m�t����t{K�g[1��4C��I1�^A����`��CX�P9ڲI5����匎�"�\:���S��n�d�6#��jhe%��͆�l*F+��[��H�'S���D�	� �Q���A?m~.8"�����!88󛝼Sb�����C�1�gT�����7�[[�b&����/�K�ud�A�])��E_,,�_�ӣq��9���Xw�5����+%>�er�(��*~����]���mDm�����
|���[�\��|rxµ�u䲸(��o�2�~����٧��xZ�[�Ē�������=�8^�6�/�f嬮�s�aj�)W��	�#��#�Sjާ���|�r�Uu����c��6=3x%��+Q�����Q<�m,��TTk�(�E���m~�����c�{r��Ŀ��A� &���lI�Cpu}_e��n��T�.r�8&����O���R\_=�JJ9puT�����o�e�"�������L�o�"ףz�Y����V�����S���,Y�ȅ�r�Bb�q?��,lrl�sH��ި8D�ѭw�O^R��v�H��(B��E�X5�[5�b�r��F�#Σb�E����;�����`��?��;F<��	y������G���J�,A�xs���E3��̐�yE�J��x��Q�`�¨Nf�¨.�GaT'ҧ0�Z�0���Q���:�҂7��+"���-rS��K�H3���Ȗ�)�$����?���~���A�7 �֤pX���x@G��N�Q�?̈D�p%?��㝣{�/�-�!���ڰ����e.D?D��X����Iz�z�6 �ޠ)Po�F��>�}��+����^?�ٸr�����ir�����2�����	�P�4���hUi�2:�l2>�s9r�P�V4�aD#h�lh��	͆����F�+i@#H�3���g���J/9�����F�3�g@*����}w�����M��PL�� �a����;�g���>{_�_�!�f��_&�@x�3�anv��bi� �:��Zg0�ou.̥�@��mp{'���e`t��r"��������x_�f�~�h@�-oaB�&���ulC��(��ω������B����46p�q�B ��_��": ����u�o�����e|�V�?#�tk�"'ɉX͜0�u4�J���D�����=���������ۋ�Mn�N��^��(�/���d�wr#g��N����sE�H�Q)��C*�+�j�>a���--=��GZDkZ,@!��1��o>����S)X�'�M���p�@l����;l�o �� Z5���`h#����Q�� Uْe{�5� �Z���W2�4�h L1n8r2,a���y-(��������D���Ղ<f 0�["��2��%�2q��n��?f ��%y6�@ː����<,�{�c���q�#�ns�����#�ʬ��ad$�jv������bF��+��A�9���H!�B��%㢕O*�"�d�q1K��q�<��8��J�w���9��ݣ��b���'o��G���{=�=�%b���L�p/Al����;	l$�� �AZ�]��`�h8���Gag�����N6�4�0�]E�q2�=~�ٿ�2����gW8dMU<x�VS���L	�3�ʆ���b�Q�`Vpa{����O�~�ݐk���3��?Z�Ф����V�;'��
9<(F7���ĵ�2[��<F��|����5[q�����g��_e��~_��.Z��5\�{�K�sE�>r���8��\GIUρ�p%�GdEs�(��q�8AN�
t�(����@a�	k�:U8+����D��z��Хﾳ��q�L,�!N�g    ��mHrM�!���	���H�tg�i2��Sc�*M&k�4�-;y�|}����;+��I�+�鐊��Qu{��,d��L_5)ӭj����6rn�f�1�l#�ա18Üu�MH�Rz.3o2�k�����.�҇|Q]aX�aR��F���X&��
��������oNO.�]�}k��l��EL���LP�w�d����_FP^�cr�������7�]�ӝ���yd5��L6x���1�+����O��c�]�����W�b�܄Z]jLH
�
�؊�Z��&dkbqثR�����{�Q=�g_��>���?����u����F�����:�!�bR��!u�C�fu���1rz�8��¹mS�8��>P�dҷ3�mE���sfFtAMK��}'�?L�^��T�u��Gß��
>Ŷvĭ�:7�m��>q�K�|4H�/����N��DIl����t�ѡ|d��=�GV/貗i����I���^�~���&w��+@h(m'&��,�$�׮U ������㳔_����o��on�Q?��ܜ�w�6�̥��xR��m�d^m�S�Ld'0{�ۛ>�uF�p���5�)��_zt�W���M�%viӠX�q���
8ǌ퉲�S�N&a�9ܬ�s���IG����	<���|�4�=�a�_��y�̋���qo1� ���2�}~�l�?�s�@({��_^������NY����qRĆ�f���GnuHOH��U����c�$�ո6��m�KT�;eE�⊜�SV|ru�P�=���B�ii��8���9�̥�$`@\d�����y$��P��t�9#�Q�FD��PP�Ȁ��� Wd(-3��A�":dFJt��s��!4 �� gB��{��ay�y�`=Gx��C"O��LH��'�F�$d�sǏL?$�ut%s����|Fy{�*�v��鸴H���z��agy��ٝ��Kץ&�����z�ط�<��>�pt��U���S�/��I���N�����"4yM�T s��ݛ��������������ҋF1yGG>��4���x�ƜZ�r4ӻ ��*����h�����F�;sD��۹�fc��}L�����q]���@ϰ�y�6�q7av� �8T���ד�V�_�J6����oBU�����I��:� `QZn!�p:hXcBqǂA����):Ac�b�T~F�D��[��8��ح���L�g-�8�D�� � 8T@R�O�.�ۦuA����#���ɮėԛD7Vh۰����5��=>������CNjˌ���k#"-��]��hu������7���ˏ��q2`��u��C������%UbDI�S�9d���>~�`r����O�v��g@���m,��P�0�@�/�I%ݾ'Ug��0�#(į�Bʱ�o�'?}�V�������(f15Ky���Ow���yxzJBƔ�������F�����{_���pD��Np� cA��� 2r�.���88�����ݻ*�5�<��x�b5��H��1�wf}�S
+���u������N{��k���6�t���^J���v�M��^�86q8�2�ZIw,����9�l�u/��X� �A���M^=>|�������a�^��>89\����� ߀8��9a��8�;�A�e�r8Ǹ�H����I�D$��0Z���Lx��7���[�f�����_elU�L&�!\+�KƎ�b!����e�sl䮐!�6�3@4�[,��zL!y劦���SH�O�
�-Y@�dyQ!y����vMb��GK��V��`��)&���+6��p�qe���s��4����>t0�嗥����U�QJT����?�W�"��(4���v�Q��g�q���e^ߚk���5�� ����M.�Ƕr!=����\`��`��8��ك�r�q^�J�HGg�L�>>�~a��ʛZ}�(Z���6r���Β:͕7Q[�J��ۇ�i"sq�#�C��?JmK13�-�Y(3�5D�{px_ؠ?�=<��\�/�����'�4�<�2_\Õ{]` 9!��U�5�����V�+\L��r�M�\��yN�kv��� v؁k��T��fE���2��k���W�&��~t�[�Q�~d��� ^Cr9~���+�S��ꚵ�j���}��<��e������i�]υ�Ih'*��[؛�f4Z@TU�//*M���f,9����8�� ������H���?�W�3����Vcp���FP�o�( ���N�!���;���pF3���sZA�0�����,b=��\R8��ˁ��H����￝޾ǋ�aOeF�H2�d����^B0�lm��
�Y~�@0�t%��a���ߒM�Q��獮y����\���d���[����dz��ѝ�ۏ��uvu�7�f�3̶�p�##�-���x��#C�� .�������KC���P������d�]�����>��s���p"cd��.�#��F9��o7���]�O8�������ɺJ��>�'��{Ř��9�B�ʹOs���� ��<�fÝ�M��6�}�Mwf7��J��!��3�l��˳�W���թ���z�R�Y��l���(5�;�ic�A�s�bW��3
� ;�(�����FQ�9��z<�(��ۣ��Ga۟���ז��l#���g: a���������g%o䥒א�������瀟 �d�K)	p;%�~�T�_%�!.�$��K2\eI�g�ӊ
��g��Jz�dS�t��+,#YFU��]��	�D� �AD��"���C��Sy�h���P���KQ|���o���+�ϲU�>P�+v�}}���[?�z�7�~ag/O���7�[o��4zۚ��K�|�����%���I�G�?���u8���ͽ��_SZ�e?ڤ߉f���{����;�}������`�2?��9����8�tu|�5�F6>~4O�V�������|\�=�g�ρ{����ͨ�F��ee���ˮ�.�c?��i?��������1�_8�\�ghTV���u�t�J����F3��(�.�f���!�����l�f���m����epF��.���8S�|����r�L`iQ��|i,W�4�6�?���J�j�ʦa�I>�Xm�_*V�W:���J�j��8!��x(|��\��]5�}�q<����\}>�u[��4
APz�;k���x17�/F�y�b���.&����LOw]�k����P�Z����q��<���gٯf�i�����o���"����g��/n��� ;�D�n&6��3�a6��l��}&7����!'�͗�Q]��w׸����<�&ϯN�9�UEi{BQȨ���t)�b_&K!i�}U41<m��ٍ@E�$�`og��ol��P��?J�P�s�7Q��|`}���2G��;ٶ\�7�%�w
۪t)�Bĥ�Z(����Z�Ċ�r-�Y��Ң,%�B1m���(9E&���o�|r�p냮<������K�E9|���!�B�M�#�m���^��6������e��ɭ7���ʳ��"4!v�[I���;��9��ť��/<��ڨ�������ȁ}8�k��q����CG�.��q�h�����o�5�?���.8������p�6:����L"�����_Js4:�W�H>��iQ'/?�w/L���\�)k:N�>c�e.������ŕ�2��;����>�f��s���܏��� ��e��:�:����V���E'�K^=��?x�;u��Z�\W�'"��ѹo���$�������R�"�Z頍I�2Q��*��>�G/�+Y �d�#N�a1sFʱ�Ѣ;�ѽ��S�"����֖!D�{?a��蔥RU�q�Lٞ߆>>1����jjR;��$ 'X>:�dr�}v�H#fv�XEDT��H��E�hI����"����5z!,���n>0޾Ȥ���w��E
�qJ���I'3���$r˒0_,�	�%Y���$-���򯒰�NU�0ZO���#��V��2�x    �G����.YY/opǪ{��[s쇷هGv��4���rR �$##o��2_���JY���D�ͳ�^F՚EJ؝��y0��q���+Ę�ȉt�dԄ�ׇ�����d����2��{��5����7�{�Zbaf8�����YOo[�6#"\�"�a Y:܃���Så֊q��"�<c�t�������!:`��Yt;  N��"��K���t�7�a<�M�������o"9��P�~�Ƶ�d�����\�����{�D�.}}i��c�c�d�0'�yd�d�@;%��o�fd��[�7Lx�m2�;�,�w�u8��~�sO��{{0Ѝ�T��gw[wf���7�mV�3�C��yz�3���r�(�����)3�K5�Q'].��p!!��7�'A�E����f?)��c� ��N�0^T6�؟J�-���J��|m��)�&MAu���~~��)��]�?ϓ-��x�����LK١h)7��L��!#�2Pൢ��[+P�0k]�p��)P,���O.l�g�D*�}s�쾄�H���C��5C$N��B:�d!"�)�
�+ĸd_+���.�	I��qU��6�T�E6�ṟ�W_�4F��^�c\�U@q:��0.�)��10qLa�� S���"��8����n~�B�Sû��d;5�$�+g�����O�SP�m!������h[HX�m!q!�� �U	�ha�E�+OI��N'��0�x���;|��-n��*m�C�Sn��b ���A�qb��c0���u��#��Y�"<oj����#Oc�tYE:�
����x�A��WD�xLR^���V�!�Ev�g���]j�bv+>�v�o���F�w��V�e���zv~�1����#��Ȩ��=��dT�@mS��z!J����Z�G{@
ΐ���������NЎ�D��������IbYZ���
`a� ��
������
��uek\"~�	F>ݙ�*��'����!{���b�_�}N$�/	����t�g�����P��98J��>�?pxhji8c��(踈�ŤG�aݣE�D(�>�T��lZE�p�%����ޏf	X1����.�{���.4�ٺ#-��w�Hr:�f�9�H�C��QO�@�C�VE����_�&���:8�^A�ut�����l�L�]8��;0/l�"�W�U��a���۫\q�x�+V �rE��*W�0^�
֫<I4�;�7\	:'���p�2�a���w	Ļ�&�]��ľ�Lg!���S�)�$�ƞ;���ߙ<�=}�������u�ԋ���L��O�>β_xw��L�B�v�����q����N���jY��P�Ib;���0��S\�I��SJ�	V�H�Is/!�$�
q/'�$�Vڱ�A`��]�F)��%n��ey�%�f��Ki-�JiVaVA�o%)f��<��*�H��1�%,�)�����G�1θ��Q&΋�ꢅ���t���a/9����OYG����q��%����rw������oюq;wƷ�W/4�p('�h���ؓվw�D]�T$�uD��`#�k�p�즛�Nx���D����L�]}K�A��t3����O���O_L�������cC/?6ʵՍ�R��9�ß��T�{��_7#Y�pXT�'�����!��d�@����KIa4)-��/�����@
�X�m�r�gP�)r�:��y�o�R'� u�O��֌�~c��<�%�J��rt�Q��G�5I�Jl���`s��S71����̗��p��E�R�C�K26��y|�����G���ܹto���w򇲪p�[_ZNz��V�Y���2�>~����-�٨�h�%�%�*�e����fPBzK���%�%�HvZ[aK�n	���$���B	n��:�2r[�,�[I�-i͠R;��^L�u~ t[�#G ^��x���o�/4��Q�~<�;}�Q��o�K�b�y�� =p>~��׃7�M�0�wr!���� p�5����������U���������U�R���]�����c���Eu�.��]�x��ܮ�������;�g����\ձ��]�|��{����|�;v~j�o���L4��r�B�zYH�YC%��� �dή�Q.r"���q`p�?���6�z��L�l23,-�16��7Osq	�C�^=��\-��4���X)�N����8�3�q��+"�\��J$�[.PCB�/�׾�<�y���������_>�����v��{��lY�~��K�[@2�/��{2c�*��#2�kܒy��
�"�4=��������{�wF���វ������?���"|��{�ʉV �	�[K���_֤��{hA��h9���B0�t|oޗR_�rpf��fL*B����V`�.Q/^>؞~x�~�4���'��(f���P���:�g����~���8q��]��]�nꕹ��lvA�]�Z���1à?�)�a}���s�"=�.�`ݥ8�Nkl����}��\J�AK�$�@�a�ۡ��Ճ��9��KqlW|0Yd}�){�[���t�B�ѡK�s�W���?�N�ٰ����8�'�1oZ�.o�-.����gN�3���?󘝊G�8�tV�CS��j\�W�s��EݭC�t��Ѩ�{�����ԉ^x�bj~��l��t��x��UX�����Ďw�}��7��.� B^w�lUN�ӓ��������PZw�[�*&�h��a/K9���|�ը΀Qy�h�g8�`�'g��O�h�W��ۘ�|�pF�"��� 'y��� �8_�������K���c˫��g9�?�����
@������y7[�D�e�s������nU�p,R-���_1�������b���+f���bZi�W���0��Zxs.%�9'gڛ�Ǝ�E����E/�.��_��9�p�o�?�j_C�~1"%��6#����)��!&��������C\�
[�v�Z��b�e���1����"N_sә7�H�:+f_)���8r@�Z��oGI���������'[�lA�R��B4��1�ArE>y5}�Bf1SW���"�#�N�+`y�X��\aBHs�
#��[�+NQ�Xޒ���O�N(I.q0W��h='�������V1넧[W
D��%�J:)Bm^鄋X#C�?����X	�����B 	�8�9 ��rR�&���W{�f�yC��IQ������)���N�.Z;�|R�N��X�*XT>	L�bYK�'���O
�=/�'ű�.��'�j�w1�K��a��R�<Z�E�>o.��_�<���_`s6AZ�ɛ�6�歒WM�����Z/0W�F`�/��X��F Gb[pdcQ��8�1�*~[���jf�W�o��A$�m���Z�{6��e"+��-R��4��[��U�uն��'���9e�+�b��"�0>�c�/o�	��N�8^�bK�ߖJ0f��Kt-?�-�`ȑ�H��F�����d5�,��E�&��yNb3d��(���[ �pA20N6zU栩���'���qG(��p�y��狩ޮ�X����,_�_�����D/�_�����f�!�y�z�Kh��g��-G���"���:�QD�m���2^�ی�Q>�$M�5%i��1I���I�mPҨV�M�ۑ+{������6#cX��|�<�G ��2�c|�hn��5]���y.ڢe��QA����/�q��u�UI�Dޣ���w��t�r�#T%X s���OֶYV������]��AE'fvK�h_:�X��:�����'��tg����T���6J��6X<ҭU~�xR+�>[�ad.h�l����Ys� ka��IJL�$Ѭ6�CRb;$	 �q�獔�HV"���[ GA����FR���b?C���E���f��RwJ���ڎDB�' 3Ih�f��ջd�)��r��m��Oz��4k�q�7{�A���ڴT5�N�7���\���2���^
M�����Eq]�]�K�2V��6v�Q=�\��0�|�;y����� ��⟕�c:^�x�;�����D��x�T~�    ^�?�����߈�=y�7��W��(N6�5c�_(qFxFČ�p0u���t�ӳo'o����^z����(���|#I�M��y��=sm��Ge�|�R%V^�:�7���Y��gm�>�E��Ir`�����W���8��ҁ��T�N>�O���.����z�|����"�ⵘk��-!���1l|���3��S	�F�,�c[̣̳k����A>�_CD�k/U��YVg���(�H?-�ZZ���y�L�gY%�Bn4�(U1	;��"6�I<�@#��a��O���2~��Ae�
���\}u��=H�?�����Ć����F�x���cW+EB�@ix�:xszr��r�[?�&�EM����i�?#��.{+DT���N@+�	܀($|[U��Jt�X�`�Ha��Ru]�����3}��l�cm�D�/���d9�M�f�2��|���3����Й�X޷:�p�CD�������	#�8��9e�mʡ"v���R�+0�[�ÝJa��:r�9��.]�(%29���\x�I�BJz��V7\�]�Շ,�<}�����)IzC[&��U)�d4��'7.);�J�yJh�G}&�7���#z��b�6[l���Jj�d^�>�}���:R�a����t�VV��9>E��S,"Z��~��Ԍ��W�o�_G�������;��ˠA���J���-W"�����<�m$'۳��x�`� �K�� �G�cmuex�Y}uM�IQ�5�k�pYM����=�3`�T<���?�9�����s�õa�7��l��	Ȣ�=�A�<
�,���(f#�x-_s�E�gWˑ���F$�,�X��]�&W�����h\��E4ڷ|M��cD=�P��F4֧�M��uDSC=J��mù!�!6�'�LU�q�u8��ꤽU�+k��������Om��6q�)���N۴�F��F�⾁������ҁQ����恀^�����y��e�d��-�k��'�Y�S�%����5�����9eY2|<t�Q�ӂ�� ����"V:8י��yK]�xt�FU+�=S*[�d��b�x1�O+h[-��
(�{��ޭ���{�|縻��nz>x������<A�r~V��rfO��Ԛ9[%h��_/��=�Ч��w�?]Qz��V(���q��`[M�|�,��+2O�����C�Wp�:����f�qY��3�?�e5S�/�S3f=6�����<�	�2�]�|�R R�W�I�"A-������� �	<�_���X�9~<6w�Y��bU|�����Y�6aЅ��'������+2݌�sG�0���Y*X�)���Jm�F)�"�U��w��Y#���9!�a�f��S�&�9���M��+�-?^R,�����y�n������J�s~��"]�?��?�y�N�LFL\�KKk��J�]��h�S�@80\%׭4<ӆb e�LP��q1�2i 0��� �V�0QO9�DǝT���0�q1�Vi�g��u��>���~ 2  �! g(�dA ͪ0�u9Pr����=�u�����ro[���B�P&�2y\) S"�2�4�W�I���dQc�����ð�1��J,J��ç�����I�~�;Rਔ�_hq�h��U�qA�xA,�/($��q����UV����͍�_zC\)�,�= �S��o+84��Fl�N�t��^
��jlQ�h����_�w��r������pvq��`՛�J���&R.9u!��BtTqh����0agAs��������޺�eEu�0��G`�?ER�d�J�c]�u���Q���v��0< m-P�������)k�;����Xd�3;4��9�X���ۧ������/}=ݻ�������Ҕ"��"A��	��2$6� ���	���# V�b���pp�;��~����ڳ�B|���t�zZ�O���b�pp����׍j�M�GM��|1��1`kd@m�����)X.���l�������:Tl|�N���SKT'T�w��y4��Z T�'���{�bd�KUa!��D>��d'XG"�C�����"?�`t���+Z<i��Z��a��\r�%�=��{�BZp�{�Z�|l�d���
GQ��(E2V�onO�}���!S�P=�083g,��H$�|��gDU����L
��ӓ8x��M���Uѷ,H��C�t���H������)��2ݠ'�(A5�fi���D�?p�/�_A�I:mG��S�P>^�/�7e�1����e����,�^�,ϨS(K��'���L���@���`�z�Pv6>��, �9�2v�,���%���YZ�{��Vx�2����E�^&\3�Z]p ���ڷ���[�{{�7��*�g9�0�i߿|�Y	���'�J`�Ƒ)�Ip�Y1>EC3Q���Tx�R㠌�28�X�����R� ��s�UP��:z�8<C�`niޓ�:#ւHT.�=^{|�yc�n�9����ع i� ��&�]k�&h=B&@}[���Z-R��H��V#�&U��"�,P�ִ|����u�Ax��h]zK ������c����ڭ�O�%QoE+�ѯ	�V2F���qf�_�~�^JB��8��h���Z�'Qݙ�9r���}je�;�q��,zݤfH&�b�L�A��L�Q	�Lr�:"�P�b"����ml9�8+)�v�7���@0�t��{刺݆*�~خ����q�W��V���9 ��)f��@T�d�:U(�?��ܴ�JC	&�À
����~_�#4���K-~��9�u�{9�ޅ���\�(���Fy6�m�i��F�J���{6Z��Qh�M��^=v�Ž����e6�D���K���ң�Y�WZ|�0&�1N�����S˖��)��{��2�a�bU�B��4!֨�O4�-̆R��v�I�4V#͊���6�Ѽ+r�V"�}��Ы�e�z� 4����9m�o���Apu+Fi5�u���;�1+V<����FutЪ�t<��:f�6�DwR
 ��S�1*^�
l+�$�n�������_��o^�6���2hT{��\�S/���b#��}!"�Bd�{��j۹��`%���*��=�˨:�q-��IEI=�[��dѠ�dը�d�j���I��,������űF��sU�hP������xnZ�È�?e
�۸�2X��2��t5/�aB�Zf�3��U�&!�*�b\�
2�UaF�*�j��J2��Ui4I���IEm͢�κ�pϊ$�9�Y��ޖ�Ǘ�>~t����鯏�Ԥ�1'�%�E�d�� �}S��X��؀X�vD311 ��u���ΊPг����qq�o*�$�%t��G�ɭ���_�ȶ�.F���c������&����9� �q7ep��t�:��I�YA��H��#��m�n�F�Y�>y�������4r��W㛗�"��_$���!�Pg���ǡUG����W���7��1/c+~(k�R�(f�~R�ƾ'Y7q<�4S��J�1R��X��d,(Q�*�v����ݏ������I�apO>�tM�c��@�pl~}�yU��Ñ�1�V�&c� �w|� ���Mp� ��y�(��pu�G؞�GD�^V�!����W|�[|����҂�h�ͨ��#b���G;G�m(�1��ѽ��.^犙J� �T-^͊�J�0��ѭ��U��T����h8QI��9:]���Q�b4�l�U_ⵥ�ڴ�_�Ė��2�Q#C�]2�(&�
d��Z�ci/�-� %��ʎ�`���Z�9��j��
P�i�6�?���s�����]f3��:O�l��z���=���������=3X�gY-����A�l���>��bn��Te������pu+b��Zu�&|�#��h����;�lD<��uu� �{�C�n�5��*�(\+�D4��@X����8���2�� ����L�3F;�W�P�q�c��R��������Y)߈ʧJu[���� �=�T+B �SA�,� y    v��¬Vg<v�E�v�X>0��g\���(kڋ��J� �r��Ht5Q��E���5#m�n(�k���0�<9
�ܡ� m�u��{G�Y��(��Ξ�#���Գ%x�Y�� ��*f�G���t!"�o��>��ZeM0=ƪSA���{��������[aH\���GèP�-����2�\�Go�����3��b[T!�?���K$U��R+q���4��O���K�{#we��3�"�V��1�4���1�0�H,�і*p&i�d���iͪ�hI�6���aHC��G�����_�Z�
x�ѣ�7��$�GL�����m���Z�4쉣2#�@|u���}Cp8P����6cd����ΰS��g(��T�\;5�A8�a�^���������6򈕮�.b�����pS�r.�˶S�UB	K���j�� 2� ���Y*��`�������w��g�þ��m��|e�r��;ù���4��[ם��!Z9"��ial�U�sD0�s �X9"V�3����A�>���@����{�?�_��xFQ�P+�$��i)��IEbq����ߙ�Sm>'�w~YO�Q��Q�CU���t�lX�I'4�;t�q{N`v��	��Ɯ��ܕZ�[��8K`zI�9�|����!/����qh�[J�\�~T!)Mn��f�F#��I��,���CWo�UAMo�E��[)���#TC���)C�R;˞C:&ZqH�0S�ṯᐎYv�1��!��8�#Xu��ㄝt:�����z����獌~����
���	@�J���d{��	�JPmB3�M@6�i��@����+�f"�� ڄV9xv4?ϛ��FR弒AE�h�J�I��)��%"��X���3�y~���lw����tzs�;�M�4�-4i+њ��1�DM>������ݏ�SdI/.��YVBP�ÝZ�p�[3eP'�g�D�"?N�E}�gU���5�a�ΡQ��x�!����l������yK����W��[w�v�g{��U�=+�̢�Ԍ��R�����#���M��G9j"�����d9�?���OS���y�ˢ��),� �����|�7���o�{�2��G�L�E�7�z�}�65ٽ�S˫��8��]�(�j#/ʡ��7w�zN3�&~y�O�l��9Z�b�ga��4K�K!i<�m[߉��&#�vD�����1僰�㋌�t�����ħɈ�����׭�b�; ���N[~�ЬW8��'�~���$�q?AT�,A�(��l6�&�h~��>�~�LipPΤ�3`���\�E$AT�*��$�4�3sId׾�H�I�3�y������Ś���S($�����$[��/׎׾�߽>ڽ!�1r2�^�P8p*�,p:���&1dz��'`�XJ]c,��q,ҟ�X�����
"�T��4���W�A[�3m� �5z�d��*}� ��!�/?��{��EҴ��i^Ji�C����{�FZ�zBэ�ިdi?�����L��![���1��?�s�sS�U�q�:c����LtF�)6U��)0qa�`��2x���"@���om\�i�:�O���m�L{R50w��dpP�z�`�0�Xم֨V�f�0���4��b0��U�D�7��tk}�:���Y�P�F�Uz��؜F���ԭ��I���Rm�W��'�5��P��'��+�4��]���?�6>���/v�G��iN�n��\���:|�����=�2�y��R7�����#q�Jp�y#����3K�����`�OA�8Q�"�Kx���Lo}TS$�K���w)&{o����|K��<ب�/����xz��L��i�o�,��w��y���P� ��&'6� �d6h���E��Z��������W���������GCO�A�"":m.���鳏QCɍ}J���	�]Y��/�Lx�P����R.�=8xe�]^^���WϸKvA�5�K��h�` �Oh/�'ZI��,��|�P(��������D0����c%�'bUN�9�z��saDU�I�s��i]�����<C�$*�}M��S�'��=!�d����@ݦhqiA�t�n#K�G�#� Йк*�,Y��:̆�⺄I������L����_&���L:Sws����Ҩ�ᚶje��Z�a�V�hܰ�a��lUqmӦ��n�K�7Ǖ�Aj�� ��.��Ab�$678@[	���魻��.�kO�7�p4PX\�m�c~+8@'s��4�@�rG�W'JA[��PM�EQ`�F�(j�n��5���ԏR��kH���a�nǴ����ڥ���Fs��l-1Y<z�S�S��	�(���ӷ��Uw��U�;1�owta���Lq]bg���+��Xu����+��+�q�h[0���5�������<���|6�I� W�Ex�{`��sQ�IA>�����I]�Ծ�[�q�y�؄�.6��/���|���芳?�����yM��%)4����#���3wq<����8iRJ ��D�y�ש�(���3}I���!�v��۰v��DjF�t��0ŖP���m{Gx��w�j�wLS�D���X���,D��n�o���p}�V��;��O����k&���5�'�U>��a��MÑ���s�u����O^ ���3�(�k���x�)��K�%`+鳄i�FKp6�i�W��VK��鵄g%͖0+�ۆ������%�0��[��ޘJ��9�풌βp�c~�n��.��
m{�\�/L��%S��m�>��|]�N2�M66���6z9���^�l���A�d�r`�~(�¼`����wɢu��l�j�M\������݌����5�v��:|w9���d��YG�$��`\���~>]1�����L0�Q:�c~T�lh�[����h�粘Msz��t�fb�Q��(��-���kXcW�]gr�h�fm�C�&/Y��{�0ko��nl@��M�+�&���L���,=����e^?!�!N.a�傅��n���_I�_�de��?v�$�H?ʜPb��(�g�W���Vr��4=�ld���$y 4Γ,+��)�z����.{���i�<����a)�yg3���O��k�2Mڍ� .����H�m+�g�I��~�B�q5z�H�d&R��? ۻ����?�Y���̶��?��1  �= �� <�Y;���f���N��ӻD#��p��W�ڭ�ρ2����q��4a�?��|嘟�����|���?Q��9F��C�W�W�Xv%\{^�i�m�Ь���E�Q´�9Jp�\G	��w$ 6�F�k�[$@'�&܆�����Ξ�?���ZZ��"�$K߿�F G}ʿ"��"1Li�s;\��w�����ɮ\�Ytu��M�_�\2V=uԯ�%���]3�^�Ϩsĉ_R;Ͼ���pv��T񈠽T$:�=�`c\������Q�w�={,��ީ%�&^pܩ�-1P�(�9^���41gE�hg��Kz�����������˅(�3�3^(�����xs�y�IG��f���ʎ 9[���h����H��t�Nm������@cJ�ǧW�K��>i�����k�j��͌���=��f�=�yݲY�2�[2�!�!r�ϩ5�bX�$�d�!
@L!�ՠ$���.�Q�Ȧ"�R��~ޘ�񐄮���e5,L�ZXޡ����"�|�6�$N���B0�f#��b`��w�H��y���N��������W5j�@������"�V���#pڂ�:1�E����4\�J��R{��-��>�*_�����Z=�����߼_kh���v�/ݯ��*�?>��YT���$�� �)�!��?�j�Í�U*`vMf�h�T&`6Ld�c�4�,U��iVLad�&`���)�k7�F�y�!�֤�B��]8b�4^sg*T#�r6.��0�i��F���+��=�|�����U�A������פ�K�q���V]�5hu��ֈ[���`$Ͷ)]�єL�*���ee��L�,_���e���ٵ�	����l�B1�    �c�6��Ҭ�؃bX��b���Nh��Bxj B5��Bx|(��K�FX+�ӈh�<�`6r��N�4BgNCZ�J�4"Ҽ�j�μwV�6���Y�/	!�-� ��'	a�=��M���x�����{���hn2�*�@`�ŎׯL��"�9�*t���&HBV?�r+�jj�[���&�`5��2���L�=�!�Z�B����lx!ώ����f�g��cXmO����}�{�dv�\��� �n�F���-:b�ey:[�)n���3AA�R/61��Wۏ@�w ��1�������e����1~8Vc�����D��R��J�Ɏ��3�Ou#�2uNA
�@):�{�2���䄍L	�J�ã7�ꪱ�!������ 3�M�򢌫�t�Йa"r3���s�[d"r+	~O�׻�[���Л�-L ������}��9n榢"(U��Y�C�B%K��J�á�� 1K���OB�y�d�CgQϲ.�ڳ�E@+��e���,Z�"��[�gy����VX}	Ӵ�ő8�'�D��euE��1M�OW��"��0C];��?�>��)U~��o�o��<ӽ+��{��7��T�+D��x��"�hA���5�Q��2o?�� �\��uvw?8��b�`�͹7$P��Y��D�Ԝ���Ŝ�
�Kt����h���(�Y���9�1�Z�ޡ����L
��xR�6�(j�R�Ƨ�B�rd)T�s+4 +gV�t^E��ɜU1��윊l�=����L�Gf�{��V�G�h�=B0�#��=BHc��5�x��r�ݐ"̥���YM;PDc�ٌ��n�G�0�~$�&~$��KOg�/�����w�F_C,m	�_7��׍�`�A���
�����w��������N���i�B�sn�s�A`;��%ͯ������.7_GKir��샔�
�F#7/�߬��~q�|E r��]��([����?!�J(�F�B��HP�kى�D�P�
�����??���j�9�"[:��|��]�u�w2B\O��IK�#�5��.�p�>n�>۴<|8��kyn���q�-��18P����s:�'?O� ���ܛ��\������v�U��.!*�(^PH�}�O�=�l�׹��'�L�Ü�3	Uə��I ұl����LvЊ�.bY3�E<�6��h�<��Y�"`e���H<nj����@��e���/���V��¼fNq���%�-8%qG���Y���6�5	*z����D��x����t�%[N$�z�Bi�!�Q�%�F�h�)��ӛ�_�F?4�<I!��t����U%u�Z�㤹z�8����>($)�f@���=S�W�w^E�6z�_�=�朑f���N���NN^�=���|����JH$�^�@��UmZ@B��?�-~o����Y�%Q�-�BJ�F�(I��J��;BI��6PU���H����M�$Ÿۓ�Ъ1��.�׷�^E����# ��^�MK>L�2�6-���{�MK��e H����2������d'�_��c�%�Jt�DU��KȒ��P5�,�7����7���߃�߹*�3��Wğ�<��s���_{�_Ju���tz0rW"$�:h�Ķ�5���ǁF�P����Cl��K܄C�;�;X��QhP����rУ��"��ׂ�����O&��iں
��*2��޻�Snms���f��(��~⍊|�N�h����F9�Y�^J7ԙw����2�?M�{|�}�+1�/,�̯&����G���`z�,^'�l�O�HK��`��B�Jh<�D}�~Y���o��_|�?�W�U��V��J�V�½A\�x/#z����pDC�B6�r�Epz�,8�o
��'��Fٛ�RШ��גM�f{���y���ڦ<xk�;���+��J����|����ٳ�G����#�t݉��0��Y���~��__M�=*<ܒW`�6���7t�˓={)/�����Yƍ4���5��6�K�FG�E�������2� �����?��徿�m��K���{YN�0�=�V�I��K�M�qn4�������Qr�"1�SҰ���7�7�,mQ8.���-���Ղ�g�Y���\ͼy�|�d��DT�!���o$s�F��H�WB!�:�L�����x��O�����ty�r�����w��?�����z�O&���d?���f���>Y0R�'kՔ7�~��w8:�Z�.�j�6�xfWb�2�#���1ސ��5�șz���t�ƕ�Ek��I"'�O�ɳ@��	���ܘ��i������/���/���t�Q\����z�{W������ơ8�Q?������]��	N�ٳ�g���|�� ��ܙɐ"��KRG��@�bv���Ԭ��F\��_~x|�k�J�[��`H��L������,���B�O�8�|X!�X��O�f�_Mw�N�o�y��hI�S��C�C���zG?}��|s�yS��o@���2	[-"�����v�a�EG{sD2۔#��n�h��b��,LZ�qj�/g��1]�r53T&Ժ^W*2�4�G�kH��m=K�HBQ�x����1���5��3��n�r����ٟ7_�w�%��7�`��x๎����gS9�?a)���k���Q��ūr%L����}����@ 7�?ޟn_g$I$vD�@4ESW"TtLÌHo��U��fѬ�I�Ӱ�B�i<j�/�9���Y83Nf�����(C��?��Zh������x��T�y���4
WPp�q*�B �
5�dPy�!*�Uy�!��rJjW��(ǨP��뒭O
v���l|Yd닡��G���|�jc��7j5�9I�vs
?:ݜ(�n��Q�5E��mhl�i��Q��"�(sj��Q���2�U�6���ʙ u��u�����^�[i��z6�]����i�����H۟Q���E��tG�p�e�hM�.jC�������ԟ�����$#X�C�3��4sL_�&�	��C����F��������t�ϔ6��K�$K�|v���B�_��Np���m�`�q�n�&��� ������v�����.��0� X-�󉓿J�t�d:\�^�E?)'{V=:+�S���MNiMu��Ǐ����Iw�
�t����n�0�Kt�1�^F)G��=���ۄ�j�l-�Yr�0�6�]Ԉ�8p�1�d�N/�t�G�]�+H|��������VR�ik��x�ɗÃ��«jy�+��:dQQY`p��DIg�+��ĈE�Z�.��C�������~ȏ����� A�fƛ�1�kᴖw�e���@m�����"+����>�u�v��[�zc/�Lm��:�:s%���D\:|�����a9������(������$���v�t�%�.&��RR�#A���W�/^���{ߣ�s�5l�=�%�@) ��w�?����`��N���v��7�XàD�F���m� .k���~�f����̝c��d���q�lr�lj���i65��3;�����"���li��g�
L��M��E�s���LS���7͎�/?�4��""����"�E�����i��"���X$@�
��e\`��,�W$D���5��H�Պ+
�x���P�>)(M�)f1Ti���Hz�ERHW��o1�ւ�� =�R0�+g|�t�GA��9E��ou8%�Hon�4�� �
�=��Q���4l`�4FK7�V��_|:z�(�����E��Y�<�<{����ē�m���&P$=G^@�2��S��S-�sha����qA.-���Jľ��+�5ά�iL~@�o�l}o�0}z9�0�y:#���{�M����E����|��<��ڌ}C��X��-xJ��Mwźv����P=�TN�X'F"��'d��o�&�p��91X�%�v9�o�een��&Yaf�8Al��dd��vQۛ���	�گ�l�`�閰�y��M`zE�lkf�~Q�����0�2�y:Ú@�KX�<�EM���D������[߄k:�_Ve�L5s� ���'H�S*b��N�
Z��[`bELn��˝XA[���L���-`�@C뚀�L��YM��+hO    �"˾�!M��W~A��Y�ELg�������^Ts����L#��i#n9ىVQ�1�!�JdrH*��8���@�:�F��P0�mv���` �/����.��`�"lmj糼:ȞR�L)�)��P��V��7�B ?���B���i��`k�")���)U���	M�#I��	F�<Z�#���4P��� si8H�Ʋ�b� =��Y�*�C�!���}?~���=Z��,>E��ù����o�;���k��-ڀƝ̹��	)녡0}���e,- �9qZ��`����������G��+�n�����x�
��b�uU)�CSI2����n>3?D#������tT�Z/d��v�zt
uj�)�Dߏ<^{��Z��/h�
��qۑ�����)le��N�
3KT%9%g��f.UChT}T"�JX��Q�:���T���'�%7����	k@j�yLx C��9��u�~�w�B��b.e��tSr�tAI~����E/� �G�l�	1EF���lҲ�<�{W��Poĳ�����"��b�������O+��o����Y�ERX�f�1;s´�
)E
�$E�-��Q��X�;���/�{����`�(^�pn�zZn��.��SD
R8�U��ۣ>C��J6�	>����s�S�x:V����=�-Y�7�?�x���b0�|�n��`���M� [C�w��#�������}�����Nt.�,8z����F�#v��o}�M�yF��k�^���`��3�'g��ϵ���e�L�����-Â-7W��8���!�ceq���ŭo]�T�&�JY��Ҟ���}��9n��ק�%�)�'N��)O}��FG�^�<C����jf���ilT��H8`�F3���+���:P�2@0�a� �a�����L��}��l9kA�j��1�����ky���ah����7���<YOxE�����t��6g!=���{x
	O�|���������W'�p���n.��P��*K|�m1�O�b����h��Ȗ��������(����	�����`у��*Ģ��Z:�����M��$#d���z�������Wc�y�j�3j]�QƝ��a�q5����,�՘G�VCc>P~�=38w��g_�΋7����Q�����m�l�,i1L��Zɐ�s��p���g1<>���'�kpϤ���
�(��)��j�!I��k뇟E1�`]a&����x���ٽwӝ+L�����%wueN�X��m�67�}�����3��*E��
]u�K��-L-�`�0�|����R]wSKu�-L-߂�0�6���COf����c���Y�qIUŊҩ0�
����Ng+`й�Ӫmn	J?@����+���*����nhr��ǧ�T���9�ؖ���x�ОT�"U��'�5ՠT$U��P*M�KjQ
�M��V�>�3gWV��}]v�Hh�"z�=ɧ{�~�H�$�2g�{�5m�B�1+�	��2t�NN9�K��:�~؞>�?{�C���v��sƝd�E���������<�l�wu��Z����h���z��U'��ݭ5�vj���I�k�6ׄ��ت�	�io{M��i��5�)%H+o�	�ca�u��󃑳"�4-	�49�!GO�Y[�۷��!ĊT[�V����ae�#$�#Rz�#��Q��*GDZ��"��wq�A h5��.���x&q���BY@yˌ��Ԩ����[^���F�F��*؈`�٩�QuǛ�~��~t��i2�|��(
�Z�x��c�����/?�;���J	�y��o�?�?Q��yʗ�E�� E��c-���lMz��m�c��ġf�6s��"�i��c�0�L҅b�i�P�I��^_��u�O�;;��X l�U(`����Y+�n�,���&��>�����e0+g����$+XV!A���l@:0a�A�@�
d�`�~őwN�W�WP6�2e�,Et�Q��V�_��.�@�'I��2�oz��Ǉ�f�
	���7����o����&�9G��5��s����j���=;:�H�Xt�\����<8^��'���љ<��+�^�	>D'�B�w���R����J�	6�O�?=�WSd$��2�ӊJ��9 �G 
�f���(Q`M.�Kۍ)(
�J�<�jZ)OT�SX����q�<�hR)������R)��m��V�[�e7rK�`~�S<NK�O��u�X�z	�l9|�X4Y��>�sZĶ0���'��R�d�(��a�~1Eň`�61%$���FaMj�),7���aʈa5�I�wV<�4�	iq��G_2���W�XiJz\�m2�tD���B ��y�M#*f��+���+;�t��K�o+g�Hh/�u�EET�R����k���7;�j
�`��Z��Q�|�͞��F�boB��;W���*��QZ�=��z[�|F�8�Kd"#�����Gn��y㽌��B;�fw����>Q����#����KŅS�K��N��_*�=Gu4?�$~r��4����,:*����/��ﶏ�^���ʩDFZ��]�k�<���e}����U"p����o��O�����`4Ǽ2p�J�|퉸���g�������2�րo�����N��?!��Fs�/�nj��j��$�4F+l4P�+s�\5G8#���*�b��#����P��nH�)܈TM�͏E���p��
���Mi�JD6���/��]l[��g2�d��L=�e�cH�jhsVN]�N�8o>�\牝��U��d.�JL���ٍ���"l��^�0���̏H�D,Z���'.#�^^�`��������ᆴ�n��B�W�ŀ��M`J{q#2�5#�`4�`��~eӖvU'��,���F�Nyd�F�<ͤ�)O4ks�3+w9�qFMNyd��F<ܫ���B���K���<��v�u����U�#i�Q�29z���T%���\"
9�7w�۝wj�� �.=�2{~Uq�,{�N*�&U�0�Y��J�������~�`�������2�U��V��R\*���j&��~�k:��������7چ�fZ��c�F�|�}����6���~
v
R�g�/�n�nu����D�T)��Q/$"K"�sˇ�DH�������*r��nL�?�����+K��4U^��~{����֟��7i�G����F�����i2��p�\�A/�7^LwnN�{t��-�Q�󍖂}B3#R�D*�F9+Β�A:�'Z���f�\�v�쀲�3tʅ�!�*%�֊�F�:��H��/����>�:J�h+w�`��� ��b�����hw{�w��O�[؝iH&���-��7"GT͸_X�<E��2�V�EP�{���&�*�mȑ�ؓg��u��{�(�l~n�΋�c��_3y��ף���k���\��Ik�|z��'Dԕ̔h�'.�ؽ��%.l��E�JgV�p����-.'��֚@8�L�<��y�cE�N%'��5���<Lki@+^�{�:L+h@p�����end�5 q�K�LE���m���8=f�U���:E�Ȍ�0V�;���	,(�b�A�ji����һ�hna94䲻m�A5�r���:T�OT��S�;��6:�
#׭�,��qgt�v+c���Xs�F8.шd�� ���d�*Q��Јb���k)?��̂8�Ό=W<�v��6X<��������G��C��F����0�@���q��[�ޟ�:���	�n��=�ǩ� 0�U�ԭ��H�R�fP���T X˸Hƙ���$��֬&xs�4�p{�����?řÆ��������	F]��h ���k���H0K.����{q��"�J�"��)AX� E	q���81	�Lr��4	�ڕ$O<��K��y�����r0tp�fdG0钟�<���.��`��97�E�̂�3��o�5�?���  J��J[� �{� �ȇAU=G�a�/�3/$U�A��G�҅�	]9L��>��y' t�/H�\?X��`�kހ ��q�7�x�T�b'��IH��1�lj�W��Qe2�M�%2    ���Xw�4�t'8�8wB2�r'4�w�3�pǨ�i|;�ի��h"s#��7B����]�Y���V>���)8�r��ǐ33mCG!��D�e� 4�P\2���
�'s0��*��1�d�aƏ��0�8�F�a�:V�x��C�9��.��D���������ㆹ!l��j��@�3��O̳q�`��Iaݚ��MN���DPm�#�u����@��'�{��L?wvE7;�����.hB��d*��f���i3�"��<�#�t~�1�NTj=ڙ�+T����T��̽N�J
�mtT�6�f��R�@��8�+UT��	R�ҟ��Mк�v6�(��i��	`�|?0�MXf�G�ʪ���Z��ˍ�5l�� Q#iYi�>ZAP�mEF�*;��C@-��d��=��r����|���,z�d	��*�٬�!�3��GH���͸��T�#(�j~G+�Yg���㈥�T����`�a|�xR��k��f���!*�t8b�#6ybˊNC��J�h5�d����^Cx&�A�j6G������B����A���D͟�ϳ�w���Q����"|�ڂ��Nf��n"#<3PiK���D?���Oë��.�R�y�;}KB�GF�z�0���A�~73v�a���L�p�Fs��"V�X�^$}2���!��H4FaG�S�0��H����gG� �,�6��m�	�᪛�b�w)��ŏ��v����(|�Ny��a1$Kkv��ѧ�6�egY1:��r�	ϼ�e�2*jS��u-��Җ	ˬ�e�1/p��ZUw�0ֵ�m��C��RN{ JJXF3Q�d��ė�gi�V��lk:�LDT�;�L�6j��5�`H���ӣI��	3�V^ 8V,5�gj�(k��k ��bX&6�1�� ��j��b���"
�|�U� �dVM��j���Y���d�� w#m9b������V�ΐ6bo��Di+vJ��8vj�1@�|�:����4�������AO�҆�cP˓��Ժ$P�R��gR钠L]�y�K4*s�X=c�-�)�w�Xr=�	�L
 �ܖP�G��sJK���,zH4^�f��!�t�C��B�4�U@u�%a$��c�u�W��^2h@HvJ� r 9���&)�� ,+9Y�g��P�X�b����̛�I��f`ݾs{xjO��3A5�{�=@�s������[�� C�ګ�Y���H��U�I7w(��g��vM�.=TJz]*%��dx�g+tf7�.
����(�]�A�C�^�$ O3��(M��o_�J��Z���]׀^�z>sm6uV~yc��_�MU�?|;{�)�~�?ݾ�X�B��͙��4H�k��"[)��01�!�G2L�$Ig�*� ��m���9�`�D�=W<�s�At�i�	h_���xl���� �ڕ�Miё[��zF�R���$S�oa(�8)ۓ�����]z*_$%`�q��Д�A_=�k��A�Z-��}�AT��D��D�nH^)&�sտ�=T�/�87{�J=!��8b�M9�(�g����d+w�R���W #P�Ӑ	3P�Wq23��\XTpm�
�B�������2n鵺�����\����I^���I:�E��ܝ��?z�%���ǣ����5:H��v�S��ݪ�猬�*��'" :y��971�xsw���(3���BT.����Y��`㏃�ga0�m�T�*s���s���M�lN_�7]����a���̖�C��,CSJZ�h���@��&�&�vbgS �9�^>�6~���CE�	ښ�CXS��w7�R��eO�l�R{i'9��2ޮ�)rV����Yx��]Ұ���
1�T,�����g�I����+�y���@9/�<Qz��(�X�xP�}Ӭi������q�4ɂ`p��2�#	KJ��-6nk��X��&�n�ma�J"!T��V �����d�nI#DІ�.�pMc-�Ze�?�tۦ����(��!Z������[�� ��*� gyq�WI)������&�8M���RH�pI�:D��F��шI��eT{�߬�R��n	y�<��^����'���ٽ=F�F�:!Sr����G@��2_��i��К����aCr���H�,G$
ی����*Y����q���Jy*��b�=#Ҟ�J�"�f, �A��4��8o�L2�4w�h�������ݶ,�4�{$���~�߽V�+�w�����oGΒ��gψq�d�"�^���B%�{ybM,�� ����?'�p������ם�͛�����O�g�pp��;�F��.�gB��G�h�4i�j�-���y�q�4�5I�扦��<�&T[ܒ�h�")�($�!��dD[�v�/�Z��hC��-�K���-AZ��fM��	
�hp�oW)lC}�|����V�wI��-yA����W�7���� ,i���a�la��- 8���dX��ЌK�I��2-^@p�z�=����^��+!T1+�3	�ސ�����_��=��Q�q��k^\d!O��a�^B0�rf|9�cXɺ�@Ӥ+�2ȹ�Ô+�2θ�0��+�1.,Y4���J쁮������˞x���{�+1�(��M�,V��P#[���%�h�c��Z�!RՖpb���Z�AT�rK8D1j	�H�j2����F2AZ��їa���d����@j��k�I�yDImt=�`���/*PD�"�\{���ǫ�K��&���A�m�:��T}�&�V� uj���؞3E%�Ǟ���� 9#�C���畎��>L"ϧ/�����u�����R���.%cr��������Mw�N�o����K-;�ђü`[�ӭ=	�9����V+so��uTZ�d5��o�(�F�-Gsc�>9��
]�$����k���g�����4�\>,?��Ħ��P�um��1�s��������}���r
�7@]�9���H1Ї9��%M)b]��&���ϟ�O���g�$#RUALd2S���r)#��**ƣ���;��L;�$V���������ח���*%/|61(�H��]�H��l)͐iAs�83���uhH��H^��*ʂJq�j�4�A��Ț3�'�f /y�SDA�([[<dZ��!�l��$��ll��g��T�� q�O��  dɗ���8�غMC�_N�]�'Af��%��N?�"�y� ��?z�Z�D���W}��l�*�ʼSs�=�nՅ���yR�:Jr�+f�N`��V�wT	NF�:��
�/�1R3O�Q������ݟ���P�yOx���+�]��7YF�|�F�	���H����_k2wF��`�����>��?|3�Y�!��y�����֟C����9?��Ti�ū3�4Զ��a�-B	���G"H��Q�C�Ɩ8 ��������ʒ�<3���ݣ�w�DT01���w�H���w��ϩ�N�D���9��֟��7�°��z0�!�x�����/�)�ݽ�r�.�8*��oñ�i��N�cS�;Q9jXtz�J�?�m�SV���X�� 	/H4�8ro�^��#�{��Et=7@����޻�K?�Wn���Ϗ(Q���]��!��8�庫,�Km,�l�����,��]ut��a!�{�YKQ�E�Hb.�8�d��PlRC�WX�TJ3�b�_�>��Fga���#LK�I� �M���5RK�s�*����^�+� m�q�D!%�خP��6*�V��6V�#_��5B��YC��Y��g�4�$���rL���,��z�q��tN���4�n-�����i�9����rh<O j��V55��ǒ�݈B�)�{�;W-I��@95�~w:�,�ӨJ�2j2}BZ��P:��g"�M��7q�kL/)�%d2�G��*`O-%Di�K"��<	��ro�j�-��d�"�Y�-BUΫE�tZDBY�ީ�*�쟏����jۇ��;���_钖Z/���D���F�!�+�"w"eE�IH�����B�'?� N��$SnJHn2<��KO����z��5<����'�    =��Nz⮎�3F �yT&�㰆/��O4�^�F�<�j#O3�d�fь<�rD#�3�j�}��̲\�r�v[L�}���U�Sf�P��1eKI` ����q�H��b��k���Y��:��,��+'�z++<0�HB�i�l�xq¬�#]�g_N���mgeA�s i�-�(M�%$�ٻ:V,A��{Fq)�y�d�ȥ����ݏ�����س��M��k�^W��3�-��S4W�(�a��)���2Q���Z��*�f
�H=Sh�U����$����+ƞ�����7t�H�NÁK+3�΃�w�$j�>�#!xD�-�����K�%�)�����4��#,,�NѴP�nZ� ���l�����D�4��Ξ�p��,��b���&�i#ͣ(�(��ªF>P�I�e�E=�R6�����"(�a{Wt����	쌐߂�wj����/]+�}(�?��lOX Պ�@���@���<;��mc�0+B��i����Ir�$T�nCo�N���dD�4m �;&z�DtM��1�ڀyF��S�K��tg�$���U��ua����˅�+�;���[H4�j���"�
L�P9�	s`��QX�a����,�<� [J�4�K��h���'?|�'eQ-Y&��1�����;QX�Kߍ.���H��yhM+��:�Yt'NS�~!�st`P�1�{k���c��V¦�q�/�X����hs���[uܴ�-�)Qi|d�D�\��M�����������v�8@�s�����@$0wMI�V��V�{�$�����c	7=�Z�=&��д}9���N��倚=$�j�y�Iլ"���a�`�$��)IP}"��W� ��[� H�i�T�Ca�#�È�xǺ�O�	������oo�3qU�BĠU���w�p�jorW<�	���Eg�4qt��u���t��`O���/v���q����{q����O7g7 �����I�yz������k��gr��G}���V������+T`�F����o��>l�.�)���2q���nԔ
?������w"��G����Ӑq���#�y�2��G.�e�����Ǌ�;bт>E*h������o���EPěmRA���T�"L��VgP݊��[�qu+�3�nEP�խ��08"���/��p �P��Hh��C�'W�����Ϗ/}���a�C�j�M\7+a�?ד�JV7a:�è8�J��ce$��JL�`�������m��fNlo��)��7^�2%�&�
L�^����;�4]�����^��yz}�=��c_,/D�'-���Y<΢6I*������!`4b?��36�'�Ii��*W�Ǉ�7�#I�<����5�l�.{,���A��`X��;u����� =���@'��EM��3A~�s� �-��A;���PK6qj�]�Z���P�4rꨕ��Z���P-��]�Ή^N�sD��ö�m�x��pU���x�������=�O^$��	�f�DL��rL�=�� �ڜ��ev������s����ť�R����h���8�5Ӱ�4�*��+sN�la��aۨ��c7,�lu|��U���#�*��t�6V	�]a:,����W��.~�N��M��h�Ϟ���,M2����Ε��	��[�NnG�UN��h��J�	n�&�:�Kh&Nq�SL8d�T/ᠴnN���)�sJj%S)\&��%������@�e�?-X��}���7�*�
z�!S�;y����B�Ay��QN���RqΟ�?\H��*���$�����iU?�T��J�]*�S��R9I^p�k��+�)�?-�*a�����o�A�Z�D)!�Z�F)���������HZ�A"��	3鹙^p����c��{��~#���Eg�U�!�&�U,�ޞҿ�@M�\/�Tm|�,����U)���q>�mS�U�ۺ�:D��Z7~��>����"��\�-��w���`2�UR��-@%�R�W��3�J�

�J���3�IUt�mf�!i�@u�Te�l(�*��/*���D��QU�v�h�*�g���Ⱦ]�b���uU��"h��
UC�.Zș[�����!j��9N�T�Z�H�C�
�!x4��E�B޿r���v��k��W��w����S �����q�gQ������^��c�B�+t,�P��ÉC��7qܓt7q�Y�6q`Sg�4�5q8CW�4�41І������8fu7S��� ���Dx�&��i"���t���ˍp��	~!fO�O*6b$�8ӝϳ�w��̀L�n�.����� �y�خ�	Û�YC*ӽ+�?߁�ǹ��Q�v}Kn߹D0�.��{� +��������!̮5/�N܍C4.h�#�jV9Z����gP�F�4*v��V�y�����B��ɼ�� ��/�v���sX	p�)�8s�ڦ�~�8V���q,�K2��r��ă;}r߿�#�K�> �Mr%���:-�<獈M��5]Ҏv�9����,a#:b�=�$KsކDr�"&-���6���Z����	Q]K�Uŧ� DES=����<�7�v�В�?�
~������\�Rh��d��}A�R�/@$()�J���~e�igA/Y�eATɟ�V(�nZ��(g��f��!�%�1OX3Cc�R� �kAC<3U�̵0����!���X�.�S����f��r����q�o^���\�f��\��qȈ��앓ɡF&U0�\�>�t���`m�
�? ��{�������ґF��[�ޟ�ё�pe��|���I4���ٛ���-��KщENGV�u��ag%gB�K��*Gk[�߮{�h��ť{�:�,�i[t;�Gq�!Q���
3�
2���j/��,љ�ʑ3��,9��Cjdq�7Z�)*�LH��\�l�������q�??l�W/=��ٍ�����~���`�L2��'�8������Sv���v=q&�\>��Ŀ��h�#׃a�Y��3�Ĭm�?l<KN��b��Bf�kq\��<j�y�5����9���ݜ���bJ���/{Z� ʹ���׵�ܨ䞹��BiS�rj�jJg�Һ�ʬ[PxTj�L�Q�Ms�G��Rc��8N�W	�7g�%Ԏu(AwOBJ�=c=(A��/���}�Aތ`��Ȭt��:��s���:֪fo~���R���!������@)/�:Ē¡�3_������5�a\��9�v&�Iq�\'ע�V�F�`\���98Zp�:����U������.Ug�WW�S��R4�Zp#�f���@�07����O�b6�-`3𠱪��֪�.z�|�`��מ����:�M\�Y.�+� ��_�
[E�����X�̙6Td��1Ӧ~�����3g�T��<PTA�iK?�V�L��̙�Td��1Ӷ~����63g�V�9<*Q����g�ɟ!�b���2�r(T~$���W7^��ɼ�9*-���ͫ�?/� �d^�lJ�ʆ��u���ΫE�K#"�W?�B%!�Ok���k�3S,g�L-��l����A����o��Ձ�E�r8����GG�?9@�4��[Ή��e��!0��h���5��rΈ6/u�x����]��֢s�9�Y`����hnm:��s�ۮ���'�fO>1�|'��j����%/qaPAK �q�!y�e��;O�H��!��r2�s!7�d*Q�Q�U�Y��Fs.�bJbN�R�4ބ#��	�x�A=ڑ�8��)ƀ	��ťEp�u�M#'�Z��$�b�N���mX����5�m!e�Ú��qD�5�j#e����qH)k�K-fRo�z��D=Hcjþ�4F��6KҘ�27��(��\�@cHc�(6���ӄw�ś�L���|�����qǠr���D'�QaT�'��'e��m2*������Y�����M�����Q�2�ѐ���������9�K:a&�!i����{>����x�L��'��9��IQUάx��@���Lꂉ�w+    #���D���}�Go4	[Vr�!�ȕ��aVqj~�B��f!E%�L#d̦�N��g�1Z��a4�ui�� I������@:4�o�j� b:� �� ���Kn���`ɝ��;��[����`9o�!����]�/^Lq��..Oά��������M�����l6V��V�6����ۨ���aY4@|�unnK�x=��8XAV_�3�"�v���7n�c�����jΡ��R�Y3i�Ύ�����%�5c5�i���T��Jm��[]��$Ǔ���x�A�@��pe�hR�9�;+���f����7g��Z��y2���i֨2�ѫ�����<��G<��ۭ}�{}�{�sLG��e1���\/k�J�����u�:J���B�N��߮�ۗ�;W��0����	9��M���W��e�5+a�>�w2�QT�tR���:PB��Y��G.���B�XQ����..�b�=@���`���mK���;u��Y� ���R��sbnm�_�s#�eĠ�3��e�g )H�P`���`˽2�Ż��­�����V�K���Y�>F~<����g?M�6F?V���B3�ܻ�]D�$��],w�:���A���S�����P�_翉i����?[\����PV�z�*W���asE���p��7�"�7Z��p�h��"�Ћp� �E���12D��������E�ɉp��7y���7�"�7T�7Y���p��<jn�E8o�
"L?��Z�E���A��pS+�ycd�pKa]4@L��'�y��"��E8o��"�ҋp�P�"�bE8�+�-N��D����*�0�X@�sFk�^��).�-�獑!�mU�uA31-_�ۜ�a��p��ʊp[/�yC�p��<l��9ΣV�^��F� ��c��S\��z�����"�7IĆ�p>;�/fed'l>'�4�)���vB�b����BQkVC�#���6*�2ܮa1Qi��(��YC^N�~QGMC�F9��
ZG)��.�����R�#`���~�yS���o�FY�����-��6��]Zp�ߕ�X�VH�ڐS�Ave%���
�	x����DZP��<B�RR��$B`��`�����~������8XN�l�&�ꐩ�k�Di�
��)�f�.pGA$R�l�;����Be�(�^�mE(ß=P��'����VP,ő@���(����h�cZ/����Q���lk�@�|:��
m�۩Y(�F�fu�(ͼT%ڨ�F���(�B�6���ҵt�
V�ck �8�[��1�Q������+�4��	s�����etz�	Jϖj�7�r�[D1�{�X���
� к��g��*|-���?�S7`+=�\��[>o󄻺��l��!���8�3ˆC(�48��������o�e!��h���~���O;nt�퀐����	ʮ��@�d���ƪ�Ũ�a��JZ�����4+Ah�MP����)�0U�&#-����1Gn�zz�ӕƇ���pĢ7+���o�6�-j�-iC,�l[�6�x�1D�����L��^�6���5�2B�j!ݿZ$oFo�r(H�r$����h�YFG�!���h����ǐm�Pm�-S��$U0C���a�sӿ������#`|�Oi�[0A�a�%���v	>O��B-,<m�f�cd]؎�H��y'<��$�.���֩�Q�!W����á��R��-�<I!���ʝ���X�J���ֱp�B�v�<A!Jqs�??!������{4�X4�X�71�[#f,����q�m
b��*��'*[�x\tO$�s�vlT|�E<'c�IZ47�M�x�49A�5��Y)-��i-ha�`l��LC����gB�n��zV� ��[9��gnG�<K�$=aK̖)	S-ؒ0�̘�Y��$̳aN�DC{�Y0(!`_�_��d�/K7�I������Gi�n"��W[ Bl����I?���|ׇ�HH1� 9���3���������ӣ*��u29�� �������� ��&��54pƴ��`f��[�T3��B!�B�!ę�B�y�!��1Lyݚah!DY)Lp�:��w�����H!��؈*��J!���9&%����xC��hS�r1F�D��3�@R��	>�Q��\����+BD�Ehz��:�E�KTf���q��(d��*� R����U�����iJ�F�G㦪���V9}X��Q��B����e����.C4�����	Y�.@kX2tA�	��P�]�i��qf�.H27tA�C�� ʂ����2%E�	r�8�\����DM|�W�͙��9��!d�O�B�^�$>K�MO]�M��{�`��]"�L[WVg�l[g�똉3 u���z6��h���✢ZJ�
�p�C����Ϩ;Jv��Oo���ܜ����}��Z;c�L�ML�^�P�����!벳�*=�e������U-߃�Q�UCBd[�P=��a��W���KJ�j�^t�!�حS6m$V�j�Bz�6�կ���۴�~e�B����5_�m��|!��_�xl�D)�,�)�mˮ�";'mUO����2-�q�8����1��
i6��B�a�V��Щ�ZD_�����?��yz�r^ʟ�����[uϤ�6q�$/�Q�!0�& *Ӥ�Y9K'�f*0F�%6�)�-�UN���A�a��Z�5�laX�&�VE-f�FGZ�L��ZJ���X�J�W�W��X����Lx0[���j!�{f���eȋy6y1�0��,�b`[h�^����8���I�=��gj����IYh� �9�|���4��+�� �y���k�� ݴ�Eʬ��9�Qݬl%����f�X����<�R��E�RBW�T�Hq]d�Ɍc�5��j�M�e���d�^-q�L����}Ŝ�N�2��+z/�%�����)����F��e���X4 �{x/qd鹠e�PG��t�d�a���C�0���>" ���?Ԇ�#6�qUqHC^�ڼ�y��^��qI#$��T��!j�^����e�6��më�����>n�_��g�V����usñ�T-��k!����P����P��P�B,
�A�b��\�Yw����-PR.r��9 o�c�T`�V>���0�K���1$��^&��!*����t�&˰�	C,P�D�J��-�u(���iMS#]��ke��Х<^�b��r�Ψ���S�Ȳ��i7����n�ӱzӮ�Ō@=�eU$i���Bm�U�I[�����U���Bm�U��
�b�V��vj�h�X�R��U1k��"v̌[�[�.�`�I:�4d�@�F2�?~={�O�'�L�>^��B%H�]O
|�N�J���?�G$16����`�pa�l��t�җ�;�Y�;�?@�z˰�CT�)ã�;'pt�h7�JG7F*U��ڷxt#r�v��fĺͣ���nL��W���ë�э�m[G7����*G7&*��nL�bW��qwy���wV����E�أ��ɣ0���e%!:�G�G��Sg�`�K�=ȫ�
�<���Z
(eٝ��{�1m���p��,�,�C�ͣOY��0Tl��2-��\*�e��pS�am;�1b�ҀUwc��v�Ơ��tC�ڜ��ev���l28����j��¯�>~xGc�PKc�ZH��j��v�Fݳ��������?,ʸѾ�;*�6E��J�ϣ�����ۻ��?��R��	cgV����x��4<l���3�S�x��$=�l���B��x0Mc���P��/xIA�d8�u�v���ĳޘf˩H�MhT��64� �F�S��M	�ǭ�sSʕSf�bf٢
ü�@6-�0,xHl�or���ˍЏ�l�;�h�CH�.��U�%SsQL�'sr	��SK@m�X�g��L�'��Z=�`��	%��	����$sJ5M4�<�ds�3H8�(�I�_9���)�J:a��%�S��Dt����N�j�ū��^���R��2w�B��`H����ap8�1�k)    � -Do@���H����6 �R�D�x]&-P.أ_��'�&\��k��;7^��u���kO�U
�N�&�<>�H@��� >���|�Pw 	q�Q+'��w�l��6Xl�����69l��B7���o�=Z۔���9�<�xĊ�|[���B�l@3+�@����F�l�3��H�d��n�lO;���_�΋�������iA�W��Bο�>{��6�6�-l��W�w���^^u·[�R�]�mr*��y��1�m��N�,��-�[�v�lc��3�6F������Rj��x�J���u0�QJ�R/�`���W�T^�ީ��Wp沜\�\��K�e%���W�4���@�T�4ey�*d
KWlG��W���w���d ��7� ��K/��w676�6ol<
E��`��/���x0<{&�@�Bƀ����o�K��7W��[�×y#;���[�^/2�\?ӛoD�b��� ��b��\>��]q���]"�[��=�+eZѺR��ڕ�l�])͎��5�eE��p�ZeO
�Ʈ0"m���M�g�s���ߜ�%W@��>�������ʸ�mP<�M���<C���'������Hw�#��r5n𷶏�ڞ>ZO�\��C�I��e짡@�eU��P��3���|0V��B8F1�U7�"�|Ú 	ZӖ�X���13]��Bַ ��	P�{1���:�L���%0t/'V��lݥ%*�4j�Ip�fr$sp)������/᯼�E��qve��W�i�R�G�_����}Z�ಏa�͠ ̤�Tl�}� ƨ� 5�vz��O���*�����6ޅי�@џ=���S��;.\���/]�����?z���ږ4I�Cn��,��D*�+���� [9�r��gV�I҅ξ5Y��;���*.c�.?��{���VB��Eo�v�J���iH7��T�6�Է�D�V�t'�At�.��e�.�Ĝ��f�h��R�AQ�˔�b�R�s�־y1x\��?7�{/���wp���u#G����u~ ����H�F�qR%����S�X=X���BzT��̴O%?ZpN��wO�����<�C(��_� #,	�p��9O�n�ZR�h=ڝ=�'�D4%x��.<�~j�]]���:�'�go~�~����[i�����9�3X��3n��cM�?�Ċ-�x�A(h��GV���L�A��>�X6��S�����ك6v����o��`����{~�U�����q�i�	0Q�11=�ڱ7�#_����-�]#ܕ	��"5h*/�e )c(#e,f"�c*��G�\2j+*`}i߿|�y٨>�;vD�Dy���@�����L�.�u9:��焉���S�B &�Mb�TA-�	ߗ�f��J�@�s-����C*��
����H#�X0�b��I�*�D1��$�Q�&Q�nE���I��D\rݬ��3�w�-:4�#����NW�tlBt��"�&���%��n-�2X@�~�'��--/���Hh�ѫ_߿��=�,�,����J�*e��AJ�t��&+���J闲X� �MV:R�I��z��E�6B�@�P���E+/aV#f!��a�z���dYM�M$^�'o�e�H΂1@A��\�:�}}�tݿ�4�]�B����B�A�yЂ���5M>sN�,��O���sg<�<���*h֐JUe�0JUb�0ʗ`րJ_�0J�[�0��YրP5Y���}��g�mϝ]Im�ῄ7�z���%�V<�l��B�l������2V�J���C��e��JQ^��;��E���^BG	�S�c�	n��H7�qY/
4)�EYKxQ�A�.�2*�EaU�tQ�Ii.��U�'���.��)������	�dҨ��T*ٔ.!�IJ�
�k`i}�[wg_]�隂z�n�gt�|UX�$�Q��˕Dw�E0�|��_�5�^�hi�� ���P�s�Wq+����������GѺ&�IΤ:mg�=H���2��E���T�I��BS����V 2H�SaFq*�j2�J2ɃSim�]v�q�]��l�	�kc�Mh�i-��F����:�������e�}>�7�d̨E�8�[��Ճ@��.�[P8���?���;�FK�c��[�*ȴ�SA��ZI���P� �P��(*�hY����U�t�\����ϋ�$%�3�544}����x�֤JD�g?��v�u�ޓ�%�܎�:���)M�HZ�  H������L�㸱|��IGtLԾ;f��s��DT�,�L��T�ƦN�n��-�aK�Lʶ,�&m�Z��&������ Ȫ�|�a<*F�2��[w7G����CG�i�hN+x�An���q���(��Y=@�b�W�N�>;������fgr�����q,d>�WN���0�u�kqG�4a���nT����h��^��9��vW
� \��	%���" �@��u�>/�L�'��b��T�o�S$�F���@8�ޔ�3��ޔ�2��]7�7��57�XN��N�u"r$�*�h�����y�R�ig@��\���o�A1L�)G[FƋ��bq��ᘠL�Ea�#(�A!�N
�&»�2�O��c���@������t����O�,����ȕd�� ?"Oz&�²3�$g�b�̈́V\j& ��L`�Z9uf��%����r�=ל����q�"��)"��h�׀d4.d92yMFF㼶"�q!#�A@;k:i^
?z���Z����  �iH,�P��j�`��ф��GX�(����403y�n�E!Q\��0T��8H[� 1��$p�
�b&�J�98����o�8߼r�������VZ�އ�0W�'m�'H��_$���[.y�-�b���=��c᰸+����$D���+�X���5��}+���AB���-,�f�CS�ݜ�L���R1���j�{!Z95\�=H�ix\R���Bʋ2�y��m+���1�-`�x���E#ڼ�[ڡ ��B�[]�N�T����{���=�\Q-�!{�I���f�M�S����Tn��f���3��c�@_k΀�[yˈ�"z[��m�Ű������׫�;w��o]�2_ҙϵ�0�/���u�%P_/��\w	��SԚ�U� �.����̈_�}uC�d��PL��5�-��-�+�yњ�Ԯ�&��Ӧ�e���!L��C'�N"J��_�[Ӻ��N�P����୯eq�^�F��Gw��؟��I �]��'���W�z��'�PM�
�K!6c^.Y����̽p��g��= �R�M��_Ö����zͻ��z���E����{2y�[B�?)Bn�S¿���������$��0�/��DrW�Ic��\&��.LgU�$�0i�VĚ�,�wi=F+I@!SL�	��������:	��|�
��N1�ltz�K.v��3ؓ?��>|6���p�����ȧ(f����N�,�xlv�����t���\Pb�n'K��@tV�/��O����0`�����0Xl����0@\o�.�T��-˫.穕��c�Fd�ֵR��Z�x�l�û�L�:��9�)���5��"מ0�]PM�tX����<��-�{�n`ú< �Z9p<�u����`j�@
��{Z5����bO��?'W^8ě��j�M�bU�߽5CL
��9)�ѽ|�k�&תdS��Zu`��z�m_8�<l݀�m�@�o�@�Q��E���j~�#"]�G���������a0��mV�mZ�_���hs������'/w�K8�7/��L:�D�	fX�3�LC~&�m��$s���P�@&�v
���6G���niw9�߹P���tѦ"�a�����g��������G�p�3��U�9�
1(K�XҴ7�2�����ѥ��25����ݽ%èZy%��E�6�����˛�Da��K:���P0�AEGk�dN�m^�<�����p㞂����I�_���mT�yV�p��"�H�TǷO����ϭ���("p��RV7z�|�1���>��'�����    �M���l^am��b�lS�e��lO�e�o�x���Kl���}yc��S�����B�1#�c&kg�*-�3o�+�}ly��[��MW��������7��O�]�N��TE�[ᶚm��R��"&�-dBy�b&�,hBq�&�)lBX5nqʣ���������u��p?��*��)��O
�X��`?�x�ݻ%j����ы�L���K]��g�D/e'\n
�Q��Ac֥p�%*l�U;�5q����-St��謂�u�)��P��l'G<�M"�A���A���sF����!�̟��&��=l�e✝�c��;��ݎ3|\Z�.��ӆe����<9EבR��<SB�Ґ֌�Ȃ6z��#yZ�͖Be�.A��]�э�}t�}t���@V�G7�hH7�S�It$7g� �R�q��V�'0��3��g��P����R]4��BnA�]���.��w1~��p��_�&<��qW�k��U���;�D�7>M3���PʎZ�ԃ
�E5�X\����P	*�u���U���E�X�U��n����ePgj�r���L�[�`�]�ʯ6�%�hR��4C	�Vq��Z�h�wP-�?���\{�zPܝ?��zQ\` Wm�Y>���Ge���[a�a^��MY0�*
 �ކ-��Y���}
lz&\�/�{aB!6�<24�k�g_V{6k�z�*�y����NQ���X�InݝlnSV7�3�Lj9͕�$iK|J�����>�ڮ��z� ̇�8L� <Xz ��� �e'fT|Xt��f�;����P�d�Cd%�U,��_<\7$��u�����3ng��p���i�zZ*�M���Ҁ:��8�b.[rqr��t����ᓌ���$��F�1 S:q|q��%�Fzd�ૃ��Fd���I��]j$���<�19tֽw.U5�P'�p���� �+����z��я�
��U���v�?�xIﭭ;^���|����k#_C�����OQ�8{M��k�s����Z�ܑ���mU�v����N�qsoץ��w1r��k(��e�H�e� �e�@>��D1���a(�eN�0}�b��G�GuV��1���G"���\�Y��(��[��E,
�O0�Y��x(;���jϸ���h�4V'�Y���,^�Ɖ��q"��sue8���̕�s�dEk��G���߷E���)&�
~�o�:�A������Bv�$N)g�ׇ�?�����	�k�,��D��d�n+5�d�����J�n��!-]0�����w*��w�:riM�F�d�cC����#��;��%g��zA�·eվ�mY�*fs�*� t=�v�1���T�[�b������)X�l
q��!.�q�3��h*u�?{yo���^`�=��sm��X���7Û_X����x���Kx��&��$Fxa�� v�w��$~�n�wMj��/�g�Y?�i�p�-͠x�r0��r;���p����Y��B�Og��O�[<&W���2F�8�3��(e���=H�V&J����rF�un��i�V2z���y{�N뵚ѫ#�E�^k�z�e�j�w��Z��k=�׶��F3�����2����
��������h��'FY�4�CהrL�;�v���<�J"ʶ��i)��6�%Β��0t��e�ȧ��J+/G�3�'*�I����W���}���{}�r���ѳ�����������a/���GV�<ݢ J������Dڅ>y������^�ь�ԧti3����1V�1�����7uK��E�sCB��_G�������& ���^����!2��J��F�&��'4<9��9�@њc�x)j,Q�bƂb��ah� f�b	a-�N�bI�)��:���)39�q���J!N!?��p#�y)�r�c�(
�])7	�.&���x_耫	J ��Z&o������^��ͣ��y�^T۪�K�ǽZ�=���J`ܬA	��$(A0s%v
�����0�	~
���W�ǿ}"��=�|3�����0�i��_@�S������OF��ώw@���.3�J��7��.4�I�R"�q�D����2j�&<���_|;ܹ�$�;�Z�A��y���Q�����#�8y���+���j���/��<�����/��P:���5:��1�y��%�����Tk����@k���њJE�)��T�n>{Y��ģ'
ݾ6�}E��}����V�}������X��}49�u������S�v��F��Ԑ&�7�ǋ�:Z�r�˪�UB
k�t�SXy�,���0�T\O�<���5�Sm���x�����Qh�݅� �;�p[w �fʿOFY@zk��V%˄��%"zu�@B���"#�Q�Q���"D,N!�pC*k��_;$0s��D�T����Xt���-b�>x>��w~��R�%(�hJ&Z6���/�S�^�g����Ő��)?#[~F,���0\����e(�풷M��x�Oo:��fѮO���h)����H͞�n�9ʏ/�`�JS������{绳7[R�k<�v�/� ݏ�%�񸱭ňjEf<+"�#YSV�Ê0��U�2������k5aԀ!��b�	�h-��[!�rPY��5�	'����B�M�j����<y�K&�JʓS�d��%����ыl.U���.�y�M&��XK���Rc.%M"N�������R��J�Ca�_�>{�4A
q5�>oX�	�b�4�\c�A�%M�8i��FJ�1V�$��Ҥ�K1��h��p��?�-Ÿ����LLQ�� �9b�̙�t���r��yY��H̯%U/���*n���A���؊��(n���A���@Ź�����謶���IC^Q@���)��<
ͧ��V��I�<��$K��K�$�n�o\�/��4MF���C�Hl��ؕlvvN)��rJ�t��(q�藣����;��}��*�t�+����&>Xx�n/*9�s�F���u@r����u�
8.`/��`b}�L"�`�<�`��e�Dr�&�Ǖ�$rn���W� ������j�I�o��9$e�{�ە|r��^���CԖ����4yNY+�N���xe?�(��!�%�ZvX�\����������7�ً���7��f���٣m����2/xt�B�iࢴ��4�8
����O"�S2z��(�N�0>.%
��V�`�k��x��(�(�5� h��`��� ͬ�أ8�wʀ�ɥph���orxT�����f���g�9R�&c���z�%F<�;1B1<���T�Hl�b��#׻�Z��3��mM�/����7��L�5�:v�}��MCZ�d��@O2��@N2�"n�E)̏�1��}�	��LP\od��$ �/����ɄG=,���w�MdZ�.2����,���ƀ#:�X�s<^�=�">���̰��M�P�����L�H�,���I�1en�X�"�b�YCT�[BS�|� � �F�@�����Hl�'����l�M�)q>T���TuJ�� U��6%��Ҕ�LI��9Ʉ�a�Bwl�s�=�u�Nn����V<�[���[Q<LpI�z��ŝ�
�c�+��Hc(_���{�߾��[��g���[���v���7 l����5�fi�.��J�-�bg�i��=�'��o�]Q���t�7�����۷�L�����,�U�����m���M���u|��
�k��2V=4��bEn�$�2Ӹ"tf_���!ժ�8�dz��t��a��a((#&��ch:��hM'���r�8�І���3WZ�]�NG*�P�e*��qh��l���C���i�[B��[z@Y�0V�C����[�"���T��l+�+%��7��,H�<A.@L-L��8��7G��b���9���O0������;�8�Mm�<h������p^O �:T���<��D�}h6��Q��|�sLӋe�L��ڽU1�CƠi�g���J�mc���(��s`��:����+R��u�VȚ�l2��BL�?i�>��N7��iR��¡5�rH�~�

�M��    x>T	���DP8���8P,o*�c�	Bs�B`~�\@�ڬ���h�Y�j�P�Ig%*��
��G@���M[�؝W���z�o��f�U����qe�@�9�$���OGÛ���w�*9��ӭ��4��t�Oeq����p8�HR'�FN���>Z�C�3��Hn�f�aԄ��E�@#[��]Ϻ��L�ɏ��7Ľή��\��L����<�^;�\-O^O�Y���Q'��ű��s�r �d\�2���.e�2���"(�������h������$�,��	1>w )v��waǱ}��e�e��f�)��S�y�f�G{n�(��9�rY@������v����KN�W�͐��E��q�X٥��V���U��8��)�"��Qu2Ύ6G����.�rKL���s��V-�dgQ,nf�adeQfFEagc��*'�Bp��()a
�؟�:���8��H�?�'��B9W�V|y	L�N�Nq���C��D)�~�!���a��2b���=/�q�w	�q�S�Q8���q	�sK�{[���)�=N����/i���x˃�.t� /
��B���4�߄�����K�}(�jŜ�b�}��C�$S���q�� ��������{��o���em��~��ټM�@6��dռ�6_[��h^�U��x�T	�p$U`�P%f�T�)7�xS	�`6�	ͭ<<��}H@kccU�z���x�?Ӽ_�=5���ޡ;�d6��&0n(`�a�&f`�a��% N�_����%=��*��VD�%[Y�ٗ׵n!m�%�VO�z)m��Cٚ�t=ݾu��}�}��;��-D�؛^Jc*�.��0�b*�"����a*��Bpa*��-�Ա���ݭ�7��?ixK-�u�W��ѤI�"쑭f��L�8�'��_Ԣ��l�]W��%�;�/W��fPw5sh��;+����wz�Qm4���-��ˠy�ȳ���<W8�"���,3��ƳP�X<�[`u	�Q�M�9�J
�S�%]�y#GVc��[����鲾��j�ǐ���v��T���2#%T��UƳ��\���jUxЦYL�V��֮Y$��͢1�m��f�?�P<훅�x��Ue�~ �L�p�0�Z��ֲx�����r����6�{)�y$r�P�2���,�H���)��0ܲ�E
��_��h\O^/mt�%~���S��ӭB��������!^2`9[���,�~v��U�R^�A�KUb�����*ܩ�I���!̉�A�y�Q�i�)�Y�IzR�d�W?�|�I|ʜ��Α)"��g��F� "���'����T�ĸ��O��_8|��#lg�P"���Yc������IH��jz{�ĄW&��f<���,8��b��I<�乛,3�nn���+�E(/�90����	:0�����):0���ql�d^.b�Ф��|��ٛ-�O�X[� � �ۤ&,٥��ߚ\)�j�U˽J]+4�֦0�M��)C-���xZ�S�����=����/����H��ޠq��T�Z��vo�X|�Ķ��WLHݏ����Js�q�s5���݀�f���k�*�f�Bpk�*�f��j�*�f��0X�F���|�dxm/�SZ��h� c�K�� V�o鋖ŵrT%T�Ɯ�҉���~Dj{*� l����%�)���j���Fq��j
���&���j���ư��jT�Hss�/��ڷ���&C9;y *����1�M;�q��˪t�w�� ��9�VY*���&?�j��;��gv�� t6��cYu`��St%ѽ9�١O��~�I�Y)	_Ni�������V"��1��n�T�*��{0�0/��T��!v|eN�\
Bz �Z�dĹԑ������F`����>��ۧ�["�
 z�^�\Tl��S�Wpxr�a
&����҅�z��b ר�Y�.�0͹Ŷ妰V�e������#TG�����Ou��` ���|�h��K�
@-����3�tG�� �]�)1���+8���dP�z-V�MR�@�%F���O�P ��rv�<�l�*l@k@�2����;�>�_T�
�W�'-[)������}o�C�ފG����3M�xBC���g�����l��ҎI�4܌:�Ac#�N �.@�Խ 6���Q�r8��?{us��	����W~<�rh����Ӎ̉��'m���[���i�l������~�� �i2M(��>�M�# �4>�J�#�=�b%�9�u������h疕�'�o�!
���B��9�i�V>�(mg�r�ë��k{����+L��O�脃p�:�65x/�y�d�ODC۫������x,�T��xUrQ��ԲP�ԥ�	d[��R��FM �X$?���ZdѪ�W����[����^aO=o,d��Z*��\�y���x����%���nt�����_��p%@�U)�C�kD㥻F��ɮ���Zsj%�(�����F^�k�GCo}��捱�t���k5zH˝��@2M�͕���x�*`%/9��fr��0�o6'�|V$n�U�Ŝ�	�ìNP(,IĆ=�_��������։���-��I�9#�`�/%Չ�!I�h��^ �w!� 䒇G3~qp�������V��d`�0\���ۤkQ��1R6�;ФS��i�
^��P��i��M�RBÊG�M�Y��4B�&�-Ixv��h�M|�L.�w�tM��{�6��V�Ҹ>U)��P�2��T)��J��8~T	��u�JAF��xc�cg��d|pc|㪫K���(�	��p�6����_v�������8��R4$l�3-o��d��kRt�TS�e�m�06�����ʵ��'���P*'�D��	'��hR�X	&��XRq�$(�w/��!i�A��mC���3��:�EK'���~��|�,Ze=�oB�Mr+<�M/�*a1�<���ě�fl��|:�K�X�|��,.�H^	��x�'���g��B���h'3��L������^M��h��WH+�طHǹH�$�]ҤUL�5�P2�K��W�4�S7%�񋛐�0s<A��T�C@v�;��ԹCn�;�*3'�	c��Cv�;�*<š1sv"5���3/N��D5\�)�I]�H׼6u	!��9��v��z�骬��5��P{�lmy�B끣9���W�2��7h��%�F��'j�i���G��%ζ�K�i��\	!��(������ѕ��2/Ǽ���U�k0���d�%��맚byo���%�=�ܶ�j�r�w��5�{��9z4�C1H��Y�=G8�"��Os��\���V�Wv�i/#�T1I��oo�X� }�,y$[j�@��@���Lב�������%|�ׇ:,E}����BR�9�A[���(`|���XM��_MvGQ�	^4A��M����NN�Æ�Yؚ����+��_�n���v�W�{�Bp]��8��y�D�	�"�TLmeS�K�I�U;s�&w�B��P ��K�d�G�>��8�ֆqe'˰���>�ڱ���6��>;1��ғ��4��p���F�0f�r�{;>s���̨	�����^�c 7<f1R�c3/<F���#X��!s�i�1��w��W1��{Rܚ�=HQ�� �K��4�) օc���컧�OL��]�$/άȮ[�Y�V�a��b���8����uxŬ�ߝ%=���՜"<�bh-�{ŷ=m:��*y��(�l��'��=�;���D�e4e���G�Շ��f�a�su���(��8F)��2J�"�Q(WR�<"e������(Ћ4G�8���:��3u����E��jQ��TEZЌ��5����>�q�~^&b5�&LD���|L�lW��)���7�+�j��76������+�������5j\�H?�9F�+�O;h�j�'���y������ǟ��}�Ǒ��0c ԧ���>Q\�:�T�W�a���j�(d
�z�Ʈ��hР_S��FC���J"�d�:���!�1����DƏk���׉��z��L&�Hɭ����.�۴�1&�g�*R�E��"U$ח*Wg�jR� �   E���Tw��.R}�� 5\$/.�u!�,��0]����w0��B�9\�2���yO����<�TD���r�S�M�@M��)1�B��l��qv
���>:%�<���s���P�qp��S6$�+�i�"��^�x� �b�X 
3���a��	��v���?�����?{x�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     