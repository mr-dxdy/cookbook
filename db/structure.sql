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

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: dishes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dishes (
    id bigint NOT NULL,
    name character varying NOT NULL,
    author_id bigint NOT NULL,
    servings_number integer NOT NULL,
    cooking_time integer NOT NULL,
    comment character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: TABLE dishes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.dishes IS 'Блюда';


--
-- Name: COLUMN dishes.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.dishes.name IS 'Название';


--
-- Name: COLUMN dishes.author_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.dishes.author_id IS 'Автор';


--
-- Name: COLUMN dishes.servings_number; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.dishes.servings_number IS 'Количество порций';


--
-- Name: COLUMN dishes.cooking_time; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.dishes.cooking_time IS 'Время готовки, в минутах';


--
-- Name: COLUMN dishes.comment; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.dishes.comment IS 'Примечание';


--
-- Name: dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dishes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dishes_id_seq OWNED BY public.dishes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: tag_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tag_links (
    id bigint NOT NULL,
    target_type character varying NOT NULL,
    target_id bigint NOT NULL,
    tag_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: TABLE tag_links; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.tag_links IS 'Ссылки на теги';


--
-- Name: COLUMN tag_links.target_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.tag_links.target_id IS 'Ссылка на сущность. Полиморфная связь';


--
-- Name: COLUMN tag_links.tag_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.tag_links.tag_id IS 'Ссылка на тег';


--
-- Name: tag_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tag_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tag_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tag_links_id_seq OWNED BY public.tag_links.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name character varying NOT NULL,
    color character varying NOT NULL,
    author_id bigint NOT NULL,
    context character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: TABLE tags; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.tags IS 'Теги';


--
-- Name: COLUMN tags.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.tags.name IS 'Название';


--
-- Name: COLUMN tags.color; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.tags.color IS 'Цвет';


--
-- Name: COLUMN tags.author_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.tags.author_id IS 'Автор';


--
-- Name: COLUMN tags.context; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.tags.context IS 'Контекст';


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: COLUMN users.email; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.users.email IS 'Почта';


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: dishes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dishes ALTER COLUMN id SET DEFAULT nextval('public.dishes_id_seq'::regclass);


--
-- Name: tag_links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_links ALTER COLUMN id SET DEFAULT nextval('public.tag_links_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tag_links tag_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag_links
    ADD CONSTRAINT tag_links_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_dishes_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dishes_on_author_id ON public.dishes USING btree (author_id);


--
-- Name: index_tag_links_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tag_links_on_tag_id ON public.tag_links USING btree (tag_id);


--
-- Name: index_tag_links_on_target; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tag_links_on_target ON public.tag_links USING btree (target_type, target_id);


--
-- Name: index_tag_links_on_target_id_and_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tag_links_on_target_id_and_tag_id ON public.tag_links USING btree (target_id, tag_id);


--
-- Name: index_tags_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tags_on_author_id ON public.tags USING btree (author_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: dishes fk_rails_a0b05cb66a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT fk_rails_a0b05cb66a FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- Name: tags fk_rails_c074e4ce5b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT fk_rails_c074e4ce5b FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20211017125635'),
('20211117082734'),
('20211117112952');


