drop schema public CASCADE;
create schema public;

CREATE TYPE public.candidate_status_enums AS ENUM (
    'graduated',
    'studying',
    'graduating'
);
CREATE SEQUENCE public.candidates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.candidates (
    id integer DEFAULT nextval('public.candidates_id_seq'::regclass) NOT NULL,
    university text,
    study_completion_timeframe text,
    status public.candidate_status_enums
);
CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.clients (
    id integer DEFAULT nextval('public.clients_id_seq'::regclass) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now(),
    business_name text NOT NULL,
    year_founded text,
    employee_count integer,
    services_provided jsonb,
    terms_signed timestamp with time zone,
    user_id integer,
    sf_account text
);
CREATE TABLE public.jobs (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    title text,
    contract_type text NOT NULL,
    team_id integer
);
CREATE SEQUENCE public.jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
CREATE SEQUENCE public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.teams (
    id integer DEFAULT nextval('public.teams_id_seq'::regclass) NOT NULL,
    tenant_id integer,
    name text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
CREATE SEQUENCE public.tenants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.tenants (
    id integer DEFAULT nextval('public.tenants_id_seq'::regclass) NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    enabled boolean NOT NULL,
    uid text NOT NULL,
    owner_id integer,
    domain text
);
CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.users (
    id integer DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now(),
    email text NOT NULL,
    auth0_uid text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    mobile text NOT NULL,
    client_id integer,
    candidate_id integer,
    tenant_id integer
);
CREATE SEQUENCE public.usersteams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE TABLE public.users_teams (
    id integer DEFAULT nextval('public.usersteams_id_seq'::regclass) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    team_id integer NOT NULL,
    user_id integer NOT NULL,
    deleted_at timestamp with time zone
);
ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
ALTER TABLE ONLY public.users_teams
    ADD CONSTRAINT "UsersTeams_team_id_user_id_key" UNIQUE (team_id, user_id);
ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_sf_account_key UNIQUE (sf_account);
ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_domain_key UNIQUE (domain);
ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_uid_key UNIQUE (uid);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_auth0_uid_key UNIQUE (auth0_uid);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX "Candidates_pkey" ON public.candidates USING btree (id);
CREATE UNIQUE INDEX "Clients_pkey" ON public.clients USING btree (id);
CREATE UNIQUE INDEX "Teams_pkey" ON public.teams USING btree (id);
CREATE UNIQUE INDEX "Tenants_pkey" ON public.tenants USING btree (id);
CREATE UNIQUE INDEX "Tenants_uid_key" ON public.tenants USING btree (uid);
CREATE UNIQUE INDEX "Users_auth0_uid_key" ON public.users USING btree (auth0_uid);
CREATE UNIQUE INDEX "Users_email_key" ON public.users USING btree (email);
CREATE UNIQUE INDEX "Users_pkey" ON public.users USING btree (id);
ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES public.candidates(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.users_teams
    ADD CONSTRAINT users_teams_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.users_teams
    ADD CONSTRAINT users_teams_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
