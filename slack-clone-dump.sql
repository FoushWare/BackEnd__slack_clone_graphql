PGDMP                         x            slack-clone    12.2 (Debian 12.2-2.pgdg100+1)    12.2 (Debian 12.2-2.pgdg100+1) :    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    slack-clone    DATABASE     }   CREATE DATABASE "slack-clone" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
    DROP DATABASE "slack-clone";
                postgres    false            �            1259    24742    channel_member    TABLE     �   CREATE TABLE public.channel_member (
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    channel_id integer NOT NULL
);
 "   DROP TABLE public.channel_member;
       public         heap    postgres    false            �            1259    24696    channels    TABLE     �   CREATE TABLE public.channels (
    id integer NOT NULL,
    name character varying(255),
    public boolean DEFAULT true,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    team_id integer
);
    DROP TABLE public.channels;
       public         heap    postgres    false            �            1259    24694    channels_id_seq    SEQUENCE     �   CREATE SEQUENCE public.channels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.channels_id_seq;
       public          postgres    false    207            �           0    0    channels_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.channels_id_seq OWNED BY public.channels.id;
          public          postgres    false    206            �            1259    32863    direct_messages    TABLE       CREATE TABLE public.direct_messages (
    id integer NOT NULL,
    text character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    team_id integer,
    receiver_id integer,
    sender_id integer
);
 #   DROP TABLE public.direct_messages;
       public         heap    postgres    false            �            1259    32861    direct_messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.direct_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.direct_messages_id_seq;
       public          postgres    false    213            �           0    0    direct_messages_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.direct_messages_id_seq OWNED BY public.direct_messages.id;
          public          postgres    false    212            �            1259    24726    members    TABLE     �   CREATE TABLE public.members (
    admin boolean DEFAULT false,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    team_id integer NOT NULL
);
    DROP TABLE public.members;
       public         heap    postgres    false            �            1259    24710    messages    TABLE     �   CREATE TABLE public.messages (
    id integer NOT NULL,
    text character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    channel_id integer,
    user_id integer
);
    DROP TABLE public.messages;
       public         heap    postgres    false            �            1259    24708    messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.messages_id_seq;
       public          postgres    false    209            �           0    0    messages_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;
          public          postgres    false    208            �            1259    24686    teams    TABLE     �   CREATE TABLE public.teams (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.teams;
       public         heap    postgres    false            �            1259    24684    teams_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.teams_id_seq;
       public          postgres    false    205            �           0    0    teams_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;
          public          postgres    false    204            �            1259    24671    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    password character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24669    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    203            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    202            �
           2604    24699    channels id    DEFAULT     j   ALTER TABLE ONLY public.channels ALTER COLUMN id SET DEFAULT nextval('public.channels_id_seq'::regclass);
 :   ALTER TABLE public.channels ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207                        2604    32866    direct_messages id    DEFAULT     x   ALTER TABLE ONLY public.direct_messages ALTER COLUMN id SET DEFAULT nextval('public.direct_messages_id_seq'::regclass);
 A   ALTER TABLE public.direct_messages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �
           2604    24713    messages id    DEFAULT     j   ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);
 :   ALTER TABLE public.messages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            �
           2604    24689    teams id    DEFAULT     d   ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);
 7   ALTER TABLE public.teams ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            �
           2604    24674    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �          0    24742    channel_member 
   TABLE DATA           U   COPY public.channel_member (created_at, updated_at, user_id, channel_id) FROM stdin;
    public          postgres    false    211            �          0    24696    channels 
   TABLE DATA           U   COPY public.channels (id, name, public, created_at, updated_at, team_id) FROM stdin;
    public          postgres    false    207            �          0    32863    direct_messages 
   TABLE DATA           l   COPY public.direct_messages (id, text, created_at, updated_at, team_id, receiver_id, sender_id) FROM stdin;
    public          postgres    false    213            �          0    24726    members 
   TABLE DATA           R   COPY public.members (admin, created_at, updated_at, user_id, team_id) FROM stdin;
    public          postgres    false    210            �          0    24710    messages 
   TABLE DATA           Y   COPY public.messages (id, text, created_at, updated_at, channel_id, user_id) FROM stdin;
    public          postgres    false    209            �          0    24686    teams 
   TABLE DATA           A   COPY public.teams (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    205            �          0    24671    users 
   TABLE DATA           V   COPY public.users (id, username, email, password, created_at, updated_at) FROM stdin;
    public          postgres    false    203            �           0    0    channels_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.channels_id_seq', 2, true);
          public          postgres    false    206            �           0    0    direct_messages_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.direct_messages_id_seq', 102, true);
          public          postgres    false    212            �           0    0    messages_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.messages_id_seq', 11, true);
          public          postgres    false    208            �           0    0    teams_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.teams_id_seq', 2, true);
          public          postgres    false    204            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 6, true);
          public          postgres    false    202                       2606    24746 "   channel_member channel_member_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.channel_member
    ADD CONSTRAINT channel_member_pkey PRIMARY KEY (user_id, channel_id);
 L   ALTER TABLE ONLY public.channel_member DROP CONSTRAINT channel_member_pkey;
       public            postgres    false    211    211                       2606    24702    channels channels_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.channels
    ADD CONSTRAINT channels_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.channels DROP CONSTRAINT channels_pkey;
       public            postgres    false    207                       2606    32868 $   direct_messages direct_messages_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.direct_messages
    ADD CONSTRAINT direct_messages_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.direct_messages DROP CONSTRAINT direct_messages_pkey;
       public            postgres    false    213                       2606    24731    members members_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (user_id, team_id);
 >   ALTER TABLE ONLY public.members DROP CONSTRAINT members_pkey;
       public            postgres    false    210    210                       2606    24715    messages messages_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
       public            postgres    false    209                       2606    24693    teams teams_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.teams DROP CONSTRAINT teams_name_key;
       public            postgres    false    205            
           2606    24691    teams teams_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.teams DROP CONSTRAINT teams_pkey;
       public            postgres    false    205                       2606    24683    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    203                       2606    24679    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    203                       2606    24681    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    203                       2606    24752 -   channel_member channel_member_channel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.channel_member
    ADD CONSTRAINT channel_member_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channels(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.channel_member DROP CONSTRAINT channel_member_channel_id_fkey;
       public          postgres    false    211    207    2828                       2606    24747 *   channel_member channel_member_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.channel_member
    ADD CONSTRAINT channel_member_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.channel_member DROP CONSTRAINT channel_member_user_id_fkey;
       public          postgres    false    2820    211    203                       2606    24703    channels channels_team_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.channels
    ADD CONSTRAINT channels_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.channels DROP CONSTRAINT channels_team_id_fkey;
       public          postgres    false    2826    207    205                       2606    32874 0   direct_messages direct_messages_receiver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.direct_messages
    ADD CONSTRAINT direct_messages_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.direct_messages DROP CONSTRAINT direct_messages_receiver_id_fkey;
       public          postgres    false    213    203    2820                       2606    32879 .   direct_messages direct_messages_sender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.direct_messages
    ADD CONSTRAINT direct_messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.direct_messages DROP CONSTRAINT direct_messages_sender_id_fkey;
       public          postgres    false    213    2820    203                       2606    32869 ,   direct_messages direct_messages_team_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.direct_messages
    ADD CONSTRAINT direct_messages_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.direct_messages DROP CONSTRAINT direct_messages_team_id_fkey;
       public          postgres    false    213    2826    205                       2606    24737    members members_team_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.members DROP CONSTRAINT members_team_id_fkey;
       public          postgres    false    205    210    2826                       2606    24732    members members_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.members DROP CONSTRAINT members_user_id_fkey;
       public          postgres    false    210    2820    203                       2606    24716 !   messages messages_channel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channels(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_channel_id_fkey;
       public          postgres    false    2828    207    209                       2606    24721    messages messages_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_user_id_fkey;
       public          postgres    false    209    2820    203            �      x������ � �      �   N   x�3�LO�K-J��,�4202�50�54V04�26�2��32�60�#c�e��#SCs+S3+#S=C#Sd#�Iq��qqq $#!      �   �  x����r�6���S��԰�/�!/�c.���r��ݮ)�}@�� :[>��GA�N�ǩ;ܧ��y�w���|�߅QF}W��N�R�M��2��M�����B�d�~N�p�w���_�׫�FuF�J�>K�����*Z+d�Mo����X�]h�֒����=����v�v�����wkWZk׫(ut0�l�c��?;	?���#�:�s����}�eݦ���gq�����W���E7�wIz�ݬ%��M�u��һ�)	))�pηM���+'�єE$d�Ș�(�5�Eb{���KM$��
i�'�ސ6�j-!j�4�ohdJk'Uf�"R��l���=�w�O�dlDB�31�e�!X����SC-]�!u(�l"U+v���ǳ{�?ÑN�A++�e�M$��U�CC�;-3�DB�����F�a��4-�l$䄆{l�B�T���ېX�sr,j����I5��j�*�aKE$K�6�$���k�T	����V` �eLl[	9,v�,�.J�p�Z�Ag͗�H0s�i`�rl���M����X���'0�[���H��8>硁t�"��2�I%	�����(��x���7^:�p�FBLjn���U������Q��A*�<.՝��k����eԁc6b�*�Q[]R�	��YK��ܠ8##9S������Զ���s����-S���\B�GL���� J��YK����%j�8�h���L�]&�֖����
B�䫙m(��mÿ	9KC�K�c����58k�r���4�%1(-�a�$R��~�hm��װ�$[���#3�RS�k��=!"!g	���+;���D�9ûu�F�}9f$"!��nI��8�~�?DBN���z���Y��"�H��x9O�6ְ�U9�e��HJuVS�>���j;A���D$DAtO?�{%�/��b�;k�$"��jS�f��!�� �*5���� �?�ÃZ����j�j#!���9ݯ�����mzv��ʊp� ϊ��2�^��H����a.UbI$D9�
��Z������cD��|	�˕R� �g�Z����ZoP�b+c`ّHȀT}��e�^�2�K�H4n�ϳ4���Hy���Q�}t�ٞHey�Kd1��%:�͆Hp>�^?&���ԅ2��i�Q�8P�r��R�M'E%�X�yu�v��?��	A%D8�b6ߓ���O%��o,��o�1�>���v�?�u�i���J��m���
5�"�	9��ȗ
�Yi[a"!b��n�@�G�j�%%nSW���G[��t�=�8����~8u�����,C%�@��0��D�L�%DX~Q[��Ry�T�/TB�kܯf�򁱧نJu/$��c�5�?�y	A�n��Yo�+-s.�j�������珴.�@A����FBp��z9�.�x�]���@�R ��B�H���y?�OD�ԗ��ģ�H���x<���Z�+��`#!DM&���H�1|�������a#!����������>ntR���s�J5��MH*�"GztQ	!����e�S[��H�BB;�BV����Zo$�D1���pٍ���p��6�H���C$�A@��;����e��|=��)���Y�T=DTG_o����_7-'A���<�i�h|3���}��Jg����]���J5]���P��-_^^��qk�      �   z   x�}�1!kx}t�wc䷤���
R�J=;_�J=����.t�T�!$��=�B,�b��b�I-�1�k����Auﲎ��֝�p�{`ւ&X�i�s��=�
�uFmTߒs�PA�      �   )  x�}��n�0E��+f_Ś��|K7T��BTQ��v��Dݰ9��kR];|���]S�̰��V12�( ��(�����?D�*�[�axD��E!�)�g��-F-?p�����vl�f'$a��_�QZ5�!979#.�}��@Y�T�Csj��/� Q����v�ؑ���~X�e��|7�aj��)���Jg��4<���6q#�	������V��Wʛ�`�֛3��s�R/����mG�3�Պ���v����u���i��>���f!u|���X�c��(K�uUU��8��      �   S   x�3�tL���K-*�4202�50�54V04�26�2��342�60�#�e�Y�Z\�ZWcd�`hnejfed�g`d��S�+F��� �2      �   �  x�}��r�@�5<E��ҧ�EY�	F!*5�"*7AD|����hj�NW�����Ɯ�'�4(��?yYµ�mah�f�E�)�S-�����c�ʼ�В�?�h�ӣ�x}y�ʸ�@ �Q`��<`,AO�u�!��x����<Os��t]u�Y�`��3��	zC�a!�ڣ����ш�v��Cv�I��Wϻ�&�uɷ�Kē3�Sg\;�$��,�t]e�q�5�f�"��k��68�Ɗ��02M��!M�Q�˘��:.OτO9;ȵ��۾U9ո�2]"G}]�:	�q5��
C(�s�C�<|���b�5m��>� aQ��;�#�qaV�Q������}P�Ot<������h�V��ym�8SUc���z�V���|�ֿZ�	�$P��t�n���_�{�RzC[vGs�$����<|Gk_&!�bM)O�!�6�IӋ�U1��å�%֑��=vM�������_���     