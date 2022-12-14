PGDMP                         z            CernAtHome1    15.1    15.1 <    T           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            U           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            V           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            W           1262    33372    CernAtHome1    DATABASE     ?   CREATE DATABASE "CernAtHome1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Croatian_Croatia.1252';
    DROP DATABASE "CernAtHome1";
                postgres    false            ?            1259    33374    accelerators    TABLE     r   CREATE TABLE public.accelerators (
    acceleratorid integer NOT NULL,
    name character varying(30) NOT NULL
);
     DROP TABLE public.accelerators;
       public         heap    postgres    false            ?            1259    33373    accelerators_acceleratorid_seq    SEQUENCE     ?   ALTER TABLE public.accelerators ALTER COLUMN acceleratorid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accelerators_acceleratorid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            ?            1259    33389    acceleratorsprojects    TABLE     _   CREATE TABLE public.acceleratorsprojects (
    acceleratorid integer,
    projectid integer
);
 (   DROP TABLE public.acceleratorsprojects;
       public         heap    postgres    false            ?            1259    33417    cities    TABLE     |   CREATE TABLE public.cities (
    cityid integer NOT NULL,
    name character varying(30) NOT NULL,
    countryid integer
);
    DROP TABLE public.cities;
       public         heap    postgres    false            ?            1259    33416    cities_cityid_seq    SEQUENCE     ?   ALTER TABLE public.cities ALTER COLUMN cityid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_cityid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            ?            1259    33410 	   countries    TABLE     ?   CREATE TABLE public.countries (
    countryid integer NOT NULL,
    name character varying(30) NOT NULL,
    population integer NOT NULL,
    ppp integer,
    CONSTRAINT countries_ppp_check CHECK ((ppp > 0))
);
    DROP TABLE public.countries;
       public         heap    postgres    false            ?            1259    33409    countries_countryid_seq    SEQUENCE     ?   ALTER TABLE public.countries ALTER COLUMN countryid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.countries_countryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            ?            1259    33428    hotels    TABLE     p   CREATE TABLE public.hotels (
    hotelid integer NOT NULL,
    capacity integer NOT NULL,
    cityid integer
);
    DROP TABLE public.hotels;
       public         heap    postgres    false            ?            1259    33427    hotels_hotelid_seq    SEQUENCE     ?   ALTER TABLE public.hotels ALTER COLUMN hotelid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hotels_hotelid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            ?            1259    33403    professions    TABLE     ?  CREATE TABLE public.professions (
    professionid integer NOT NULL,
    name character varying(30) NOT NULL,
    CONSTRAINT professions_name_check CHECK ((((name)::text = 'engineer'::text) OR ((name)::text = 'programmer'::text) OR ((name)::text = 'physicist'::text) OR ((name)::text = 'material scientist'::text)))
);
    DROP TABLE public.professions;
       public         heap    postgres    false            ?            1259    33402    professions_professionid_seq    SEQUENCE     ?   ALTER TABLE public.professions ALTER COLUMN professionid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.professions_professionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            ?            1259    33382    projects    TABLE     j   CREATE TABLE public.projects (
    projectid integer NOT NULL,
    name character varying(30) NOT NULL
);
    DROP TABLE public.projects;
       public         heap    postgres    false            ?            1259    33381    projects_projectid_seq    SEQUENCE     ?   ALTER TABLE public.projects ALTER COLUMN projectid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.projects_projectid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            ?            1259    33461    researchpapers    TABLE       CREATE TABLE public.researchpapers (
    researchpaperid integer NOT NULL,
    title character varying NOT NULL,
    quoted integer,
    projectid integer,
    dateofissue timestamp without time zone NOT NULL,
    CONSTRAINT reasearchpapers_quoted_check CHECK ((quoted >= 0))
);
 "   DROP TABLE public.researchpapers;
       public         heap    postgres    false            ?            1259    33460 $   reasearchpapers_reasearchpaperid_seq    SEQUENCE     ?   ALTER TABLE public.researchpapers ALTER COLUMN researchpaperid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reasearchpapers_reasearchpaperid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            ?            1259    33439 
   scientists    TABLE       CREATE TABLE public.scientists (
    scientistid integer NOT NULL,
    firstname character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL,
    birthdate timestamp without time zone NOT NULL,
    countryid integer,
    gender character varying(30) NOT NULL,
    professionid integer,
    hotelid integer,
    CONSTRAINT scientists_gender_check CHECK ((((gender)::text = 'Male'::text) OR ((gender)::text = 'Female'::text) OR ((gender)::text = 'Not known'::text) OR ((gender)::text = 'not applicable'::text)))
);
    DROP TABLE public.scientists;
       public         heap    postgres    false            ?            1259    33438    scientists_scientistid_seq    SEQUENCE     ?   ALTER TABLE public.scientists ALTER COLUMN scientistid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.scientists_scientistid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            ?            1259    33474    scientistswork    TABLE     ]   CREATE TABLE public.scientistswork (
    researchpaperid integer,
    scientistid integer
);
 "   DROP TABLE public.scientistswork;
       public         heap    postgres    false            A          0    33374    accelerators 
   TABLE DATA           ;   COPY public.accelerators (acceleratorid, name) FROM stdin;
    public          postgres    false    215   ?J       D          0    33389    acceleratorsprojects 
   TABLE DATA           H   COPY public.acceleratorsprojects (acceleratorid, projectid) FROM stdin;
    public          postgres    false    218   K       J          0    33417    cities 
   TABLE DATA           9   COPY public.cities (cityid, name, countryid) FROM stdin;
    public          postgres    false    224   NK       H          0    33410 	   countries 
   TABLE DATA           E   COPY public.countries (countryid, name, population, ppp) FROM stdin;
    public          postgres    false    222   ?K       L          0    33428    hotels 
   TABLE DATA           ;   COPY public.hotels (hotelid, capacity, cityid) FROM stdin;
    public          postgres    false    226   -M       F          0    33403    professions 
   TABLE DATA           9   COPY public.professions (professionid, name) FROM stdin;
    public          postgres    false    220   ?M       C          0    33382    projects 
   TABLE DATA           3   COPY public.projects (projectid, name) FROM stdin;
    public          postgres    false    217   ?M       P          0    33461    researchpapers 
   TABLE DATA           `   COPY public.researchpapers (researchpaperid, title, quoted, projectid, dateofissue) FROM stdin;
    public          postgres    false    230   gN       N          0    33439 
   scientists 
   TABLE DATA           {   COPY public.scientists (scientistid, firstname, lastname, birthdate, countryid, gender, professionid, hotelid) FROM stdin;
    public          postgres    false    228   Y       Q          0    33474    scientistswork 
   TABLE DATA           F   COPY public.scientistswork (researchpaperid, scientistid) FROM stdin;
    public          postgres    false    231   ?^       X           0    0    accelerators_acceleratorid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.accelerators_acceleratorid_seq', 9, true);
          public          postgres    false    214            Y           0    0    cities_cityid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.cities_cityid_seq', 12, true);
          public          postgres    false    223            Z           0    0    countries_countryid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.countries_countryid_seq', 17, true);
          public          postgres    false    221            [           0    0    hotels_hotelid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hotels_hotelid_seq', 21, true);
          public          postgres    false    225            \           0    0    professions_professionid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.professions_professionid_seq', 4, true);
          public          postgres    false    219            ]           0    0    projects_projectid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.projects_projectid_seq', 12, true);
          public          postgres    false    216            ^           0    0 $   reasearchpapers_reasearchpaperid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.reasearchpapers_reasearchpaperid_seq', 65, true);
          public          postgres    false    229            _           0    0    scientists_scientistid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.scientists_scientistid_seq', 67, true);
          public          postgres    false    227            ?           2606    33380 "   accelerators accelerators_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.accelerators
    ADD CONSTRAINT accelerators_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.accelerators DROP CONSTRAINT accelerators_name_key;
       public            postgres    false    215            ?           2606    33378    accelerators accelerators_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.accelerators
    ADD CONSTRAINT accelerators_pkey PRIMARY KEY (acceleratorid);
 H   ALTER TABLE ONLY public.accelerators DROP CONSTRAINT accelerators_pkey;
       public            postgres    false    215            ?           2606    33421    cities cities_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (cityid);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    224            ?           2606    33415    countries countries_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (countryid);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    222            ?           2606    33432    hotels hotels_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (hotelid);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public            postgres    false    226            ?           2606    33408    professions professions_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.professions
    ADD CONSTRAINT professions_pkey PRIMARY KEY (professionid);
 F   ALTER TABLE ONLY public.professions DROP CONSTRAINT professions_pkey;
       public            postgres    false    220            ?           2606    33388    projects projects_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_name_key;
       public            postgres    false    217            ?           2606    33386    projects projects_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (projectid);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public            postgres    false    217            ?           2606    33468 #   researchpapers reasearchpapers_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.researchpapers
    ADD CONSTRAINT reasearchpapers_pkey PRIMARY KEY (researchpaperid);
 M   ALTER TABLE ONLY public.researchpapers DROP CONSTRAINT reasearchpapers_pkey;
       public            postgres    false    230            ?           2606    33444    scientists scientists_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_pkey PRIMARY KEY (scientistid);
 D   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_pkey;
       public            postgres    false    228            ?           2606    33392 <   acceleratorsprojects acceleratorsprojects_acceleratorid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acceleratorsprojects
    ADD CONSTRAINT acceleratorsprojects_acceleratorid_fkey FOREIGN KEY (acceleratorid) REFERENCES public.accelerators(acceleratorid);
 f   ALTER TABLE ONLY public.acceleratorsprojects DROP CONSTRAINT acceleratorsprojects_acceleratorid_fkey;
       public          postgres    false    218    3223    215            ?           2606    33397 8   acceleratorsprojects acceleratorsprojects_projectid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acceleratorsprojects
    ADD CONSTRAINT acceleratorsprojects_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(projectid);
 b   ALTER TABLE ONLY public.acceleratorsprojects DROP CONSTRAINT acceleratorsprojects_projectid_fkey;
       public          postgres    false    217    3227    218            ?           2606    33422    cities cities_countryid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid);
 F   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_countryid_fkey;
       public          postgres    false    3231    224    222            ?           2606    33433    hotels hotels_cityid_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_cityid_fkey FOREIGN KEY (cityid) REFERENCES public.cities(cityid);
 C   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_cityid_fkey;
       public          postgres    false    224    3233    226            ?           2606    33469 -   researchpapers reasearchpapers_projectid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.researchpapers
    ADD CONSTRAINT reasearchpapers_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(projectid);
 W   ALTER TABLE ONLY public.researchpapers DROP CONSTRAINT reasearchpapers_projectid_fkey;
       public          postgres    false    230    217    3227            ?           2606    33445 $   scientists scientists_countryid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid);
 N   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_countryid_fkey;
       public          postgres    false    228    3231    222            ?           2606    33455 "   scientists scientists_hotelid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_hotelid_fkey FOREIGN KEY (hotelid) REFERENCES public.hotels(hotelid);
 L   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_hotelid_fkey;
       public          postgres    false    226    3235    228            ?           2606    33450 '   scientists scientists_professionid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_professionid_fkey FOREIGN KEY (professionid) REFERENCES public.professions(professionid);
 Q   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_professionid_fkey;
       public          postgres    false    220    3229    228            ?           2606    33477 2   scientistswork scientistswork_researchpaperid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientistswork
    ADD CONSTRAINT scientistswork_researchpaperid_fkey FOREIGN KEY (researchpaperid) REFERENCES public.researchpapers(researchpaperid);
 \   ALTER TABLE ONLY public.scientistswork DROP CONSTRAINT scientistswork_researchpaperid_fkey;
       public          postgres    false    3239    231    230            ?           2606    33482 .   scientistswork scientistswork_scientistid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientistswork
    ADD CONSTRAINT scientistswork_scientistid_fkey FOREIGN KEY (scientistid) REFERENCES public.scientists(scientistid);
 X   ALTER TABLE ONLY public.scientistswork DROP CONSTRAINT scientistswork_scientistid_fkey;
       public          postgres    false    228    231    3237            A   k   x?3???p?2???t????qq?2????KL6?2?Vp??/.I-?2??I?,?2?.-H-R(?/??S??K? 2?????9?}\??,8?HZr????9r??qqq ??!?      D   =   x?%???0?0LTl'Mv??s+???@?0i??0=T˼?Z??߷e{??NH????	?      J   ?   x??;?0E???*X??$)?????XшXv???^??;??U8?p6???-????????1??}Q??7?n	~EK-.?7+?BS?)E??z??ò?7j:bb?;e??4???
zR
?$?Gq??e???מ?~?}'      H   8  x?%QMo1=??
~???N????K?ʕK?F????쬪??ǔ???g_??m?:?Vv??Z%?͘???fgqN0?椸˩??0KR?97???i????b??P?I???T?s??$Nd??6??NR4?C?j%|????A??E??Ks??oc=?eG?Y?Z#?T????????R?%L?X??x^??a$?iqb??9??5?&?ŠaeĂǱ???? ????K&V|}??OO???{??ދS??Sg<\?>f?V-?A$?rn?????$g????7ܯ}9Xf???i_qw?_??h-&S?Jl??3?qHf/      L   j   x?%N?0:?0}b???t?9??	Q>
r???ݰ ????vp??B{h?s?2???9tE???6f?P]3???۩?ɨ?n??????????R??!?'?      F   B   x?3?L?K??KM-?2?,(?O/J??r?92*?3?3?K?L8sKR?2s??3S?J@?1z\\\ ??m      C   ^   x??;?@?z?0?9rD?jC?%w??y?3(׷8?/<A#U<?[???*6^???????G}D??T?9h?mUmB?Ŭ??@?k`?      P   ?
  x??X˒??]c?ˤj?I=]???[3ө??%???"!	6I? ?y??????Ϗ?#?%9 )?{?$U]ݭ???{.b???U?d??LY[?F??r???8T?Q?+Y??-?Yi?{m?Ue?}??X?_I?f?(??ї??U??gZ?:?Q5?x΍>Ȋ?F??ŉ<?Fi?????(??i?O?Yh??Ǜ_?{????U?U]?fcT<?F?(]??ك?5???;??:??d?$????⓴d??~Q(?J#n???|1J?V~?Y<b?O>F???	[?P?^??w7+~WU????@Eٜm#K???#<?Re?gJ-???t???#*?(????퓎jJ???2Z?
vp????Q?f?ш???????????m????g?R?J?f???߿?a?????(_?ٖ??$?????t[r[??QI2??A??P+?z??*???	e]??I?B/L`(?q`?Qup7g?K?ș"/U???*??T+?dD?׻h??r6Io8٠,8??&;?6ȅ???G??E??L?]??W???;m?d??R%?Z?3???????~/?t??a?
?q?۪?ڋ???5????J??{??ߩ???Mp??k?I??m {.K?W???P7ۈ???h?4?u?QkY??õ??Ѿ'X)d?
%?Ga-ݼ??&>??@*N?ZT?*?}?Ff?ژ6sE%?
??(??@Gu8F
˖??L???(?~?a򕮌?	?_?Ue??-#a??>8μ:z????[??????IO??6zG?8????^?L?W?m???/!??-Z~?(?4?S?w?nG~B?????[:n
<??J??xp>??$p>?}??_n?f`y???_dp'KS?^?q<?{ί??
??Iϫ<W?_f4?iev???@)???ѭkX?}???j~???hb:Ȑ??9?4m????R?ď?5???X?pP?K?>?(Y>??(?x?e@f???I?m?3޷x??M>?S0laOt??M???QZ???b????6??m?e-,?6?Ѯ????̙?)??)?0?D???嗞?˴??? \?????3?|???8????????t?]???)??%?^"?h?P??YT?,???m?????,?eHI??~???s???D??>?ޘ?=?h2ao?yZ??w????ǫiK?Йt?frE?ɔ=??#??????p?ql<i ??6~??v?]?c㹷?p	??????????Ɏt??X??U?r??o?\?Qv????]X??????w?hib?F????O??)醔@2
$Y?G?զȟ????7??ۆ ?Ψ?4?{xF???t?.h.5???????f;???򻏄????dmF???R??1?????zM<F??
M??!>Q?s?i?T??:1?\?!}???q??|=(??XY???O=e?5???(u????c??-:??W??}?D?Q?ێ?|/SM?????Q?????d8@gj?L??????9???+???dU??Z?D?~??{i?????6~?<\?Sx&q???L??&?<d??.P????Sv??da??OPa??????ˀ???c?{hJ#.???䊹?/|???嵕m?ڋ?G???9u0
?I:go??ڨ?$_???????(L??P???dez?????v?Bz\9??%?Y?D????0"-??A?ѼV6l]?"W:??cl???8I:;?x?#u?-@?????kmG???D?Wpv?d?+l99?Z?y;u???f?>?V+?(	??N?ZC]?$@?T???GQ?>>?"?a?????W?X?ɂ?޽?? ??=⭚???ԑ??{ ?qʶ8?NOf2??~????????????d?A}?E????dG?}??>?c?H?)'D?O!)?dܶ;z?Rx???\?(??`?.?{?O?&P??t???ݵ?&_?????@?4?7?0???^ZsA?]YSIQލ?#. ?ϙMX?){??-??q?os??{E???R?c\?%#L??A???t?e??] 䖿p/?K??? t?&'?9??	J6??1????y?????I?? 0踲 ?Z?-????Ea?茹?)?cOB? 鹎?z"?b????H??(<??åH?,?6jt ?P8?I?*????Jْa\??,???A?|G?5???T??q??n??f??)Ip??A?4???6:)??bД? ?? ???W????VZu????5?oX"???A??O?n???O]??4???k?y?"???E?|?Ѐ???h)k?-?I??=#rŷ7??ȕ????_??	F???}?$f	e?简??Ǉ?r?	?????E곺M??N?h?#???7??.?%ȅܣh?˾??^??
xj2e}ƶF?/9??ddQ ?
{?u???&3?JJ?kL??u??K?<????>?٤??g?L?yx)???v:??@??5???O|?$???
???׃x????#?N?N???(l?????O??/?#?>?-M4t?i^*?g??LZ??]?P8;y&&??ۧA: @&?Ώ?????J??W??u??U??u3E|}?<?o??ML?įht??n?ա?.}uKJ@?e{|???){K?v??n1??M??@????????LH??:?ԃ?1ӝ???????K????װ????$ ?t?V??L?U'49I?%?&}b?	????^???!r?      N   ?  x?uW?n?8|&?"?
DR?}sҤ?$],?b?B?\??L??l??;??e	v??腣s??s"?˾????x׵ume?(?8?E$˛8?=?b9??k??r?????-?^??w?:??Q,#Q?!"a??n??[mWz	?`?+?bڣ??b?w??GE?,2R????$?<a?zi?Z??V??]H??b
8???G?#?b	O?b?ٷ?uijo??03P?????G߬{iKo??"??d??	!$g?M?7?e??2}_d??Y?Z?m?o?9???ָ?0q$?Y!?m?k?Ky?o???놀޴+?	S??9r?M?D???!kC?$ ?P?Z?????6?F-?'?F%,?|^??%$?_|?"??:hཊ??ukZKbO????B???????WY???{?88??w?u[?l	6P?"?1???Ug.?0????	?й??=???^??chw^??ֳ??h?sN?,??"gں?y??vB,?j;??????[??C\?ՀF@5??!????DnQB?m????Z???&9???O?%\????֛????f??EC?(?н9k?v.??7;??4??N܃A?((???m?v?{?B?%gX?T?????6?q?܌?S??˄-???????ځ????A?eqaa??i@u?_ث?{?7<?ev??
.!eۭ?????U???]L!NC?Xe?^?^?j?????? ?J??#?~3????A?E$???TN?	?P!???v~zF?%?8????=??!-2?d?*q?? 
?9?m?b?k?]?(P??U4Jf/!?=????Z??U????V_'?Fw\)v??ԩ}??Q??
{H?*?hVۛ?[?[?m?{ۓ??U\Y-???I?*l{????\?X8?J?I?q??H??	?:͸?'????????%-)
%??"컭k?w??n!?A
s?ɳ|T???؝?z??i?dj???3?İ???~??]?mC
??9???????'?=5[GB??o^??}$??I?ێ}???w?b?u5?DѸ]??߆l??I1ߍ??????~???y:)??o~??x?o?~ǗL??'????ܫ?5?????Lc%?`9??Y??OƯ?vX??L???eI???΁?????1ߨ??)I????f??-CS?䓥???vlq???h???ǒ?~*??????T?bԦT????n4??܅frM???8?X??(\QSN?gH??1????????b?_?_??SȈJ??x"-6??b?"?i??a5??t8??q?n"??GMp??? O5?_S?????U????E??}?oG?9?cR{9??K??f?mžW셮??_h6$??}??u?xg??0???̶?1??gt	?m??\G??HL?;;d
?ɉ??6]???????%??J????f???? vʕ?[??|??v?z?M????Oi?M?|l]?3??#?0??l?Nt^??gY?݁?Ig<??+$b?r,o?<??\?D?ن;?&???r???;>?      Q   z  x?5??uD!C׸??zI?uD?L6??B6??W???G\?6??L?I?V&??zeNaCPv??]:.?Ǫ??Y0????!s???>?P???<???)?y?K@?)nү??#??*?˷?i0???[??H_%???K?Z|0?CG??????^Ub[̪?ő~?c?w??!r???c?|39??d?_??,ku???????m9?0?:ҏ???#???J????<?k?nq???`?K?+>V??D'?Ą?,X?SkR,)??r?N[~MK">?y????\?|?z?<?|?ٚ?<???zȃnP?K3?fl??$ީ?1?X?n???!q:?7?wt?	Zc?q?t???j??̝;4?????X??}??FW???~???P?Y     