--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 14.2 (Ubuntu 14.2-1.pgdg20.04+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
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
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
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
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
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
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: backoffice_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backoffice_profile (
    id integer NOT NULL,
    unit_number character varying(100) NOT NULL,
    street_address character varying(100) NOT NULL,
    tel_number character varying(11),
    pin_code character varying(6) NOT NULL,
    city character varying(40) NOT NULL,
    state smallint NOT NULL,
    user_id integer NOT NULL,
    user_position character varying(40)
);


ALTER TABLE public.backoffice_profile OWNER TO postgres;

--
-- Name: backoffice_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backoffice_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backoffice_profile_id_seq OWNER TO postgres;

--
-- Name: backoffice_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backoffice_profile_id_seq OWNED BY public.backoffice_profile.id;


--
-- Name: backoffice_usercredentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backoffice_usercredentials (
    id integer NOT NULL,
    user_type smallint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.backoffice_usercredentials OWNER TO postgres;

--
-- Name: backoffice_usercredentials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backoffice_usercredentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backoffice_usercredentials_id_seq OWNER TO postgres;

--
-- Name: backoffice_usercredentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backoffice_usercredentials_id_seq OWNED BY public.backoffice_usercredentials.id;


--
-- Name: bizcred_aadhar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_aadhar (
    id integer NOT NULL,
    aadhar_number character varying(12) NOT NULL,
    aadhar_card character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_aadhar OWNER TO postgres;

--
-- Name: bizcred_aadhar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_aadhar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_aadhar_id_seq OWNER TO postgres;

--
-- Name: bizcred_aadhar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_aadhar_id_seq OWNED BY public.bizcred_aadhar.id;


--
-- Name: bizcred_additionalcompanydetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_additionalcompanydetails (
    id integer NOT NULL,
    pan_number character varying(10) NOT NULL,
    pan_card character varying(100) NOT NULL,
    gst_number character varying(15),
    gst_proof character varying(100),
    udyog_aadhar_number character varying(16) NOT NULL,
    udyog_aadhar_card character varying(100) NOT NULL,
    shop_license character varying(100),
    rent_agreement character varying(100) NOT NULL,
    constitution_docs character varying(100) NOT NULL,
    authorization_resolution character varying(100) NOT NULL,
    shareholder_list character varying(100),
    reject_reason text,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_additionalcompanydetails OWNER TO postgres;

--
-- Name: bizcred_additionalcompanydetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_additionalcompanydetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_additionalcompanydetails_id_seq OWNER TO postgres;

--
-- Name: bizcred_additionalcompanydetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_additionalcompanydetails_id_seq OWNED BY public.bizcred_additionalcompanydetails.id;


--
-- Name: bizcred_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_address (
    id integer NOT NULL,
    unit_number character varying(100) NOT NULL,
    street_address character varying(100) NOT NULL,
    tel_number character varying(11),
    pin_code character varying(6) NOT NULL,
    city character varying(40) NOT NULL,
    state smallint NOT NULL,
    effective_year smallint NOT NULL,
    effective_month smallint NOT NULL,
    proof character varying(100) NOT NULL,
    reject_reason text,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_address OWNER TO postgres;

--
-- Name: bizcred_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_address_id_seq OWNER TO postgres;

--
-- Name: bizcred_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_address_id_seq OWNED BY public.bizcred_address.id;


--
-- Name: bizcred_authadditionalcompanydetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_authadditionalcompanydetails (
    id integer NOT NULL,
    pan_number character varying(10) NOT NULL,
    pan_card character varying(100) NOT NULL,
    aadhar_number character varying(12) NOT NULL,
    aadhar_card character varying(100) NOT NULL,
    din_number character varying(12) NOT NULL,
    reject_reason text,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_authadditionalcompanydetails OWNER TO postgres;

--
-- Name: bizcred_authadditionalcompanydetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_authadditionalcompanydetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_authadditionalcompanydetails_id_seq OWNER TO postgres;

--
-- Name: bizcred_authadditionalcompanydetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_authadditionalcompanydetails_id_seq OWNED BY public.bizcred_authadditionalcompanydetails.id;


--
-- Name: bizcred_b2creport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_b2creport (
    id integer NOT NULL,
    orderid integer NOT NULL,
    data jsonb NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_b2creport OWNER TO postgres;

--
-- Name: bizcred_b2creport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_b2creport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_b2creport_id_seq OWNER TO postgres;

--
-- Name: bizcred_b2creport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_b2creport_id_seq OWNED BY public.bizcred_b2creport.id;


--
-- Name: bizcred_bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_bank (
    id integer NOT NULL,
    ifsc_code character varying(11) NOT NULL,
    branch_name character varying(100) NOT NULL,
    bank_name character varying(100) NOT NULL,
    bank_address character varying(200) NOT NULL,
    bank_acc_type smallint NOT NULL,
    account_no character varying(20) NOT NULL,
    branch_manager_name character varying(50) NOT NULL,
    branch_manager_email character varying(50) NOT NULL,
    branch_manager_phone_number character varying(10) NOT NULL,
    cancel_cheque character varying(100) NOT NULL,
    reject_reason text,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_bank OWNER TO postgres;

--
-- Name: bizcred_bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_bank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_bank_id_seq OWNER TO postgres;

--
-- Name: bizcred_bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_bank_id_seq OWNED BY public.bizcred_bank.id;


--
-- Name: bizcred_bankstatement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_bankstatement (
    id integer NOT NULL,
    year smallint NOT NULL,
    month text NOT NULL,
    statement character varying(100) NOT NULL,
    is_complete boolean NOT NULL,
    reject_reason text,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_bankstatement OWNER TO postgres;

--
-- Name: bizcred_bankstatement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_bankstatement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_bankstatement_id_seq OWNER TO postgres;

--
-- Name: bizcred_bankstatement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_bankstatement_id_seq OWNED BY public.bizcred_bankstatement.id;


--
-- Name: bizcred_businessfinancial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_businessfinancial (
    id integer NOT NULL,
    finance_year character varying(10) NOT NULL,
    turnover_revenue integer NOT NULL,
    profit_befor_interest integer NOT NULL,
    interest_expense integer NOT NULL,
    depreciate integer NOT NULL,
    tax integer NOT NULL,
    profite_after_tax integer NOT NULL,
    capital_reserves integer NOT NULL,
    total_borrowing integer NOT NULL,
    current_assets integer NOT NULL,
    current_liablities integer NOT NULL,
    balance_sheet character varying(100) NOT NULL,
    pnl_statement character varying(100) NOT NULL,
    certified_audit_report character varying(100),
    is_complete boolean NOT NULL,
    is_auto_gen boolean NOT NULL,
    reject_reason text,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_businessfinancial OWNER TO postgres;

--
-- Name: bizcred_businessfinancial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_businessfinancial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_businessfinancial_id_seq OWNER TO postgres;

--
-- Name: bizcred_businessfinancial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_businessfinancial_id_seq OWNED BY public.bizcred_businessfinancial.id;


--
-- Name: bizcred_companydetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_companydetails (
    id integer NOT NULL,
    org_name character varying(30) NOT NULL,
    org_website character varying(100),
    org_type smallint NOT NULL,
    company_register_no character varying(21),
    soc character varying(20),
    year smallint NOT NULL,
    month smallint NOT NULL,
    reject_reason text,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_companydetails OWNER TO postgres;

--
-- Name: bizcred_companydetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_companydetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_companydetails_id_seq OWNER TO postgres;

--
-- Name: bizcred_companydetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_companydetails_id_seq OWNED BY public.bizcred_companydetails.id;


--
-- Name: bizcred_employmentdetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_employmentdetail (
    id integer NOT NULL,
    employment_industry smallint NOT NULL,
    company_name character varying(30),
    designation character varying(30),
    working_years_in_company numeric(4,1),
    work_experience numeric(4,1),
    appointment_letter character varying(100),
    salary_slip character varying(100),
    is_auto_gen boolean NOT NULL,
    reject_reason text,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_employmentdetail OWNER TO postgres;

--
-- Name: bizcred_employmentdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_employmentdetail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_employmentdetail_id_seq OWNER TO postgres;

--
-- Name: bizcred_employmentdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_employmentdetail_id_seq OWNED BY public.bizcred_employmentdetail.id;


--
-- Name: bizcred_financeofferdetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_financeofferdetail (
    id integer NOT NULL,
    sanction_amount numeric(10,2) NOT NULL,
    lender_interest_rate numeric(7,2) NOT NULL,
    veloce_margin numeric(7,2) NOT NULL,
    effective_interest_rate numeric(7,2) NOT NULL,
    emi_amount numeric(8,2) NOT NULL,
    overdue_interest_rate numeric(8,2) NOT NULL,
    veloce_margin_payer smallint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_financeofferdetail OWNER TO postgres;

--
-- Name: bizcred_financeofferdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_financeofferdetail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_financeofferdetail_id_seq OWNER TO postgres;

--
-- Name: bizcred_financeofferdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_financeofferdetail_id_seq OWNED BY public.bizcred_financeofferdetail.id;


--
-- Name: bizcred_general; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_general (
    id integer NOT NULL,
    father_husband_no character varying(50),
    org_name character varying(30),
    pos_in_company character varying(40),
    birthdate date NOT NULL,
    gender integer NOT NULL,
    marital_status smallint NOT NULL,
    dependents character varying(2),
    net_monthly_income smallint NOT NULL,
    education_level smallint NOT NULL,
    associated_professional_institute character varying(50),
    registration_number character varying(15),
    reject_reason text,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_general OWNER TO postgres;

--
-- Name: bizcred_general_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_general_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_general_id_seq OWNER TO postgres;

--
-- Name: bizcred_general_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_general_id_seq OWNED BY public.bizcred_general.id;


--
-- Name: bizcred_gstregistration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_gstregistration (
    id integer NOT NULL,
    gst_number character varying(15) NOT NULL,
    gst_proof character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_gstregistration OWNER TO postgres;

--
-- Name: bizcred_gstregistration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_gstregistration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_gstregistration_id_seq OWNER TO postgres;

--
-- Name: bizcred_gstregistration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_gstregistration_id_seq OWNED BY public.bizcred_gstregistration.id;


--
-- Name: bizcred_identification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_identification (
    id integer NOT NULL,
    din character varying(8),
    pan_number character varying(10) NOT NULL,
    pan_card character varying(100) NOT NULL,
    aadhar_number character varying(12) NOT NULL,
    aadhar_card character varying(100) NOT NULL,
    gst_number character varying(15),
    gst_proof character varying(100),
    passport_no character varying(8),
    passport_expiry_date date,
    passport character varying(100),
    driving_license_no character varying(15),
    driving_license_expiry_date date,
    driving_license character varying(100),
    voter_id character varying(100),
    utility_bill character varying(100),
    reject_reason text,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_identification OWNER TO postgres;

--
-- Name: bizcred_identification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_identification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_identification_id_seq OWNER TO postgres;

--
-- Name: bizcred_identification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_identification_id_seq OWNED BY public.bizcred_identification.id;


--
-- Name: bizcred_incometaxreturn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_incometaxreturn (
    id integer NOT NULL,
    year character varying(10) NOT NULL,
    tax_return character varying(100) NOT NULL,
    is_complete boolean NOT NULL,
    reject_reason text,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_incometaxreturn OWNER TO postgres;

--
-- Name: bizcred_incometaxreturn_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_incometaxreturn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_incometaxreturn_id_seq OWNER TO postgres;

--
-- Name: bizcred_incometaxreturn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_incometaxreturn_id_seq OWNED BY public.bizcred_incometaxreturn.id;


--
-- Name: bizcred_lenderdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_lenderdetails (
    id integer NOT NULL,
    banking_license_no character varying(20) NOT NULL,
    banking_license character varying(100) NOT NULL,
    noc character varying(100) NOT NULL,
    manager_remark text,
    reject_reason text,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_lenderdetails OWNER TO postgres;

--
-- Name: bizcred_lenderdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_lenderdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_lenderdetails_id_seq OWNER TO postgres;

--
-- Name: bizcred_lenderdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_lenderdetails_id_seq OWNED BY public.bizcred_lenderdetails.id;


--
-- Name: bizcred_levelemail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_levelemail (
    id integer NOT NULL,
    level smallint NOT NULL,
    is_approved boolean NOT NULL,
    sent_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_levelemail OWNER TO postgres;

--
-- Name: bizcred_levelemail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_levelemail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_levelemail_id_seq OWNER TO postgres;

--
-- Name: bizcred_levelemail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_levelemail_id_seq OWNED BY public.bizcred_levelemail.id;


--
-- Name: bizcred_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_metadata (
    id integer NOT NULL,
    account_type smallint NOT NULL,
    org_name character varying(50),
    updated_at date NOT NULL,
    changelog integer NOT NULL,
    completion integer NOT NULL,
    profile_reviewed integer NOT NULL,
    profile_verified integer NOT NULL,
    is_crif_generated boolean NOT NULL,
    reject_reason text NOT NULL,
    password_code text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_metadata OWNER TO postgres;

--
-- Name: bizcred_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_metadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_metadata_id_seq OWNER TO postgres;

--
-- Name: bizcred_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_metadata_id_seq OWNED BY public.bizcred_metadata.id;


--
-- Name: bizcred_pan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_pan (
    id integer NOT NULL,
    pan_number character varying(10) NOT NULL,
    pan_card character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_pan OWNER TO postgres;

--
-- Name: bizcred_pan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_pan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_pan_id_seq OWNER TO postgres;

--
-- Name: bizcred_pan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_pan_id_seq OWNED BY public.bizcred_pan.id;


--
-- Name: bizcred_phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_phone (
    id integer NOT NULL,
    phone_number character varying(10) NOT NULL,
    otp character varying(6) NOT NULL,
    is_complete boolean NOT NULL,
    expiry_date timestamp with time zone NOT NULL,
    reject_reason text,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_phone OWNER TO postgres;

--
-- Name: bizcred_phone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_phone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_phone_id_seq OWNER TO postgres;

--
-- Name: bizcred_phone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_phone_id_seq OWNED BY public.bizcred_phone.id;


--
-- Name: bizcred_relatedcompanyinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_relatedcompanyinfo (
    id integer NOT NULL,
    related_website character varying(100),
    related_company character varying(100) NOT NULL,
    related_company_address character varying(150),
    related_company_gstin character varying(15),
    is_complete boolean NOT NULL,
    reject_reason text,
    company_details_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_relatedcompanyinfo OWNER TO postgres;

--
-- Name: bizcred_relatedcompanyinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_relatedcompanyinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_relatedcompanyinfo_id_seq OWNER TO postgres;

--
-- Name: bizcred_relatedcompanyinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_relatedcompanyinfo_id_seq OWNED BY public.bizcred_relatedcompanyinfo.id;


--
-- Name: bizcred_sanctionedloan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_sanctionedloan (
    id integer NOT NULL,
    sanction_date date,
    loan_amount numeric(12,2),
    loan_tenure integer,
    loan_emi numeric(12,2),
    letter character varying(100),
    lender_noc character varying(100),
    is_complete boolean NOT NULL,
    reject_reason text,
    user_id integer NOT NULL,
    CONSTRAINT bizcred_sanctionedloan_loan_tenure_check CHECK ((loan_tenure >= 0))
);


ALTER TABLE public.bizcred_sanctionedloan OWNER TO postgres;

--
-- Name: bizcred_sanctionedloan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_sanctionedloan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_sanctionedloan_id_seq OWNER TO postgres;

--
-- Name: bizcred_sanctionedloan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_sanctionedloan_id_seq OWNED BY public.bizcred_sanctionedloan.id;


--
-- Name: bizcred_velocescore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_velocescore (
    id integer NOT NULL,
    veloce_rating smallint NOT NULL,
    start character varying(10) NOT NULL,
    "end" character varying(10) NOT NULL
);


ALTER TABLE public.bizcred_velocescore OWNER TO postgres;

--
-- Name: bizcred_velocescore_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_velocescore_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_velocescore_id_seq OWNER TO postgres;

--
-- Name: bizcred_velocescore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_velocescore_id_seq OWNED BY public.bizcred_velocescore.id;


--
-- Name: bizcred_velocescoreapprovalmatrix; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_velocescoreapprovalmatrix (
    id integer NOT NULL,
    dealer_finance_amount integer NOT NULL,
    borrower_finance_amount integer NOT NULL,
    tenure_months character varying(2) NOT NULL,
    rate_of_interest numeric(5,2) NOT NULL,
    processing_fees numeric(5,2) NOT NULL,
    veloce_score_id integer NOT NULL
);


ALTER TABLE public.bizcred_velocescoreapprovalmatrix OWNER TO postgres;

--
-- Name: bizcred_velocescoreapprovalmatrix_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_velocescoreapprovalmatrix_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_velocescoreapprovalmatrix_id_seq OWNER TO postgres;

--
-- Name: bizcred_velocescoreapprovalmatrix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_velocescoreapprovalmatrix_id_seq OWNED BY public.bizcred_velocescoreapprovalmatrix.id;


--
-- Name: bizcred_velocescoremaster; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bizcred_velocescoremaster (
    id integer NOT NULL,
    crif_score numeric(22,2),
    mca_default boolean NOT NULL,
    gst_default boolean NOT NULL,
    criminal_civil_case boolean NOT NULL,
    is_address_checked boolean NOT NULL,
    own_house boolean NOT NULL,
    de_ratio numeric(7,2),
    current_ratio numeric(7,2),
    ebitda_percentage numeric(7,2),
    int_cov_ratio numeric(7,2),
    credit_rating character varying(5),
    is_pan_verified boolean NOT NULL,
    is_gst_verified boolean NOT NULL,
    is_adhaar_verified boolean NOT NULL,
    cheque_bounced boolean NOT NULL,
    bank_comfort_letter boolean NOT NULL,
    credit_manage_score numeric(22,2),
    total_score numeric(22,2),
    user_id integer NOT NULL
);


ALTER TABLE public.bizcred_velocescoremaster OWNER TO postgres;

--
-- Name: bizcred_velocescoremaster_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bizcred_velocescoremaster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bizcred_velocescoremaster_id_seq OWNER TO postgres;

--
-- Name: bizcred_velocescoremaster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bizcred_velocescoremaster_id_seq OWNED BY public.bizcred_velocescoremaster.id;


--
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
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
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
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: veloce_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_address (
    id integer NOT NULL,
    address_type smallint NOT NULL,
    house_type smallint NOT NULL,
    unit_number character varying(30),
    street_address character varying(30) NOT NULL,
    state smallint NOT NULL,
    city character varying(40) NOT NULL,
    pin_code character varying(6) NOT NULL,
    effective_since date NOT NULL,
    proof character varying(100) NOT NULL,
    veloce_user_id integer NOT NULL
);


ALTER TABLE public.veloce_address OWNER TO postgres;

--
-- Name: veloce_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_address_id_seq OWNER TO postgres;

--
-- Name: veloce_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_address_id_seq OWNED BY public.veloce_address.id;


--
-- Name: veloce_applicationpaymentstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_applicationpaymentstatus (
    id integer NOT NULL,
    payment_info jsonb NOT NULL,
    payment_request_id character varying(255),
    payment_id character varying(255),
    application_id integer
);


ALTER TABLE public.veloce_applicationpaymentstatus OWNER TO postgres;

--
-- Name: veloce_applicationpaymentstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_applicationpaymentstatus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_applicationpaymentstatus_id_seq OWNER TO postgres;

--
-- Name: veloce_applicationpaymentstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_applicationpaymentstatus_id_seq OWNED BY public.veloce_applicationpaymentstatus.id;


--
-- Name: veloce_applicationspecialvelocemarkup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_applicationspecialvelocemarkup (
    id integer NOT NULL,
    markup_percentage numeric(6,2),
    markup_payment_by character varying(1) NOT NULL,
    loan_application_no_id integer NOT NULL
);


ALTER TABLE public.veloce_applicationspecialvelocemarkup OWNER TO postgres;

--
-- Name: veloce_applicationspecialvelocemarkup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_applicationspecialvelocemarkup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_applicationspecialvelocemarkup_id_seq OWNER TO postgres;

--
-- Name: veloce_applicationspecialvelocemarkup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_applicationspecialvelocemarkup_id_seq OWNED BY public.veloce_applicationspecialvelocemarkup.id;


--
-- Name: veloce_applicationstep1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_applicationstep1 (
    id integer NOT NULL,
    borrower_email character varying(32),
    bill_no character varying(20),
    bill_amount integer,
    bill_date date,
    billing_party_name character varying(50),
    inquired_by character varying(50),
    down_payment numeric(12,2),
    required_loan_amount numeric(12,2) NOT NULL,
    loan_reason smallint,
    emi_on_past_finance integer NOT NULL,
    current_loan_emi numeric(12,2) NOT NULL,
    total_emi numeric(12,2) NOT NULL,
    dealers_given_finance_scheme character varying(20),
    application_id integer NOT NULL,
    coborrower_id integer,
    CONSTRAINT veloce_applicationstep1_bill_amount_check CHECK ((bill_amount >= 0))
);


ALTER TABLE public.veloce_applicationstep1 OWNER TO postgres;

--
-- Name: veloce_applicationstep1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_applicationstep1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_applicationstep1_id_seq OWNER TO postgres;

--
-- Name: veloce_applicationstep1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_applicationstep1_id_seq OWNED BY public.veloce_applicationstep1.id;


--
-- Name: veloce_applicationstep2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_applicationstep2 (
    id integer NOT NULL,
    bank_account_number character varying(25) NOT NULL,
    ifsc_code character varying(50) NOT NULL,
    bank_name character varying(50) NOT NULL,
    borrower_bank_account_number character varying(25) NOT NULL,
    borrower_ifsc_code character varying(50) NOT NULL,
    borrower_bank_name character varying(50) NOT NULL,
    application_id integer NOT NULL
);


ALTER TABLE public.veloce_applicationstep2 OWNER TO postgres;

--
-- Name: veloce_applicationstep2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_applicationstep2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_applicationstep2_id_seq OWNER TO postgres;

--
-- Name: veloce_applicationstep2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_applicationstep2_id_seq OWNED BY public.veloce_applicationstep2.id;


--
-- Name: veloce_dealerspecialvelocemarkup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_dealerspecialvelocemarkup (
    id integer NOT NULL,
    markup_percentage numeric(6,2),
    markup_payment_by character varying(1) NOT NULL,
    dealer_id integer NOT NULL
);


ALTER TABLE public.veloce_dealerspecialvelocemarkup OWNER TO postgres;

--
-- Name: veloce_dealerspecialvelocemarkup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_dealerspecialvelocemarkup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_dealerspecialvelocemarkup_id_seq OWNER TO postgres;

--
-- Name: veloce_dealerspecialvelocemarkup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_dealerspecialvelocemarkup_id_seq OWNED BY public.veloce_dealerspecialvelocemarkup.id;


--
-- Name: veloce_employmentinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_employmentinfo (
    id integer NOT NULL,
    employment_type smallint NOT NULL,
    employment_industry smallint NOT NULL,
    company_name character varying(50) NOT NULL,
    designation character varying(50) NOT NULL,
    time_at_current_company smallint NOT NULL,
    total_work_experience smallint NOT NULL,
    veloce_user_id integer NOT NULL
);


ALTER TABLE public.veloce_employmentinfo OWNER TO postgres;

--
-- Name: veloce_employmentinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_employmentinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_employmentinfo_id_seq OWNER TO postgres;

--
-- Name: veloce_employmentinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_employmentinfo_id_seq OWNED BY public.veloce_employmentinfo.id;


--
-- Name: veloce_financeschemeconfig; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_financeschemeconfig (
    id integer NOT NULL,
    interest_percentage numeric(6,2)
);


ALTER TABLE public.veloce_financeschemeconfig OWNER TO postgres;

--
-- Name: veloce_financeschemeconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_financeschemeconfig_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_financeschemeconfig_id_seq OWNER TO postgres;

--
-- Name: veloce_financeschemeconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_financeschemeconfig_id_seq OWNED BY public.veloce_financeschemeconfig.id;


--
-- Name: veloce_generalinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_generalinfo (
    id integer NOT NULL,
    marital_status smallint NOT NULL,
    dependents smallint NOT NULL,
    net_monthly_income smallint NOT NULL,
    education_level smallint NOT NULL,
    veloce_user_id integer NOT NULL
);


ALTER TABLE public.veloce_generalinfo OWNER TO postgres;

--
-- Name: veloce_generalinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_generalinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_generalinfo_id_seq OWNER TO postgres;

--
-- Name: veloce_generalinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_generalinfo_id_seq OWNED BY public.veloce_generalinfo.id;


--
-- Name: veloce_generalvelocemarkup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_generalvelocemarkup (
    id integer NOT NULL,
    markup_percentage numeric(6,2),
    markup_payment_by character varying(1) NOT NULL
);


ALTER TABLE public.veloce_generalvelocemarkup OWNER TO postgres;

--
-- Name: veloce_generalvelocemarkup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_generalvelocemarkup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_generalvelocemarkup_id_seq OWNER TO postgres;

--
-- Name: veloce_generalvelocemarkup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_generalvelocemarkup_id_seq OWNED BY public.veloce_generalvelocemarkup.id;


--
-- Name: veloce_instutioninfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_instutioninfo (
    id integer NOT NULL,
    company_name character varying(50) NOT NULL,
    company_age smallint NOT NULL,
    gross_annual_turnover smallint NOT NULL,
    gst_number character varying(30) NOT NULL,
    gst_proof character varying(100) NOT NULL,
    firm_pan character varying(10) NOT NULL,
    pan_card_proof character varying(100) NOT NULL,
    veloce_user_id integer NOT NULL
);


ALTER TABLE public.veloce_instutioninfo OWNER TO postgres;

--
-- Name: veloce_instutioninfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_instutioninfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_instutioninfo_id_seq OWNER TO postgres;

--
-- Name: veloce_instutioninfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_instutioninfo_id_seq OWNED BY public.veloce_instutioninfo.id;


--
-- Name: veloce_invoicestep1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_invoicestep1 (
    id integer NOT NULL,
    invoice_amount integer NOT NULL,
    downpayment_amount integer NOT NULL,
    tenure character varying(2) NOT NULL,
    invoice_proof character varying(100) NOT NULL,
    application_id integer NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.veloce_invoicestep1 OWNER TO postgres;

--
-- Name: veloce_invoicestep1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_invoicestep1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_invoicestep1_id_seq OWNER TO postgres;

--
-- Name: veloce_invoicestep1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_invoicestep1_id_seq OWNED BY public.veloce_invoicestep1.id;


--
-- Name: veloce_kycdocuments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_kycdocuments (
    id integer NOT NULL,
    aadhar_number character varying(12) NOT NULL,
    aadhar_card character varying(100) NOT NULL,
    pan_number character varying(10) NOT NULL,
    pan_card character varying(100) NOT NULL,
    veloce_user_id integer NOT NULL
);


ALTER TABLE public.veloce_kycdocuments OWNER TO postgres;

--
-- Name: veloce_kycdocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_kycdocuments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_kycdocuments_id_seq OWNER TO postgres;

--
-- Name: veloce_kycdocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_kycdocuments_id_seq OWNED BY public.veloce_kycdocuments.id;


--
-- Name: veloce_lender; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_lender (
    id integer NOT NULL,
    loan_amount numeric(7,0) NOT NULL,
    loan_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.veloce_lender OWNER TO postgres;

--
-- Name: veloce_lender_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_lender_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_lender_id_seq OWNER TO postgres;

--
-- Name: veloce_lender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_lender_id_seq OWNED BY public.veloce_lender.id;


--
-- Name: veloce_loan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_loan (
    id integer NOT NULL,
    loan_amount integer NOT NULL,
    sanctioned_loan_amount numeric(12,2),
    disbursement_amount numeric(12,2),
    dealer_scheme_roi numeric(8,2),
    dealer_scheme_emi numeric(12,2),
    loan_tenure smallint NOT NULL,
    interest_rate numeric(4,2) NOT NULL,
    lender_amount_after_veloce_roi numeric(12,2),
    lender_roi_after_veloce_roi numeric(8,4),
    veloce_amount numeric(12,2),
    veloce_roi numeric(8,2),
    is_accepted boolean NOT NULL,
    is_coaccepted boolean NOT NULL,
    created_at date NOT NULL,
    accepted_at date NOT NULL,
    app_reviewed_by_id integer,
    application_id integer NOT NULL,
    CONSTRAINT veloce_loan_loan_amount_check CHECK ((loan_amount >= 0))
);


ALTER TABLE public.veloce_loan OWNER TO postgres;

--
-- Name: veloce_loan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_loan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_loan_id_seq OWNER TO postgres;

--
-- Name: veloce_loan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_loan_id_seq OWNED BY public.veloce_loan.id;


--
-- Name: veloce_reviewedveloceapplication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_reviewedveloceapplication (
    id integer NOT NULL,
    is_reviewed boolean NOT NULL,
    is_approved boolean NOT NULL,
    is_rejected boolean NOT NULL,
    reject_reason text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    rejected_by_id integer,
    reviewed_by_id integer,
    veloce_app_id integer NOT NULL
);


ALTER TABLE public.veloce_reviewedveloceapplication OWNER TO postgres;

--
-- Name: veloce_reviewedveloceapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_reviewedveloceapplication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_reviewedveloceapplication_id_seq OWNER TO postgres;

--
-- Name: veloce_reviewedveloceapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_reviewedveloceapplication_id_seq OWNED BY public.veloce_reviewedveloceapplication.id;


--
-- Name: veloce_veloceapplication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veloce_veloceapplication (
    id integer NOT NULL,
    application_type smallint NOT NULL,
    inquiry_id integer,
    is_reviewed boolean NOT NULL,
    is_approved boolean NOT NULL,
    is_rejected boolean NOT NULL,
    reject_reason text NOT NULL,
    current_step smallint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    rejected_by_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.veloce_veloceapplication OWNER TO postgres;

--
-- Name: veloce_veloceapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veloce_veloceapplication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veloce_veloceapplication_id_seq OWNER TO postgres;

--
-- Name: veloce_veloceapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veloce_veloceapplication_id_seq OWNED BY public.veloce_veloceapplication.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: backoffice_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backoffice_profile ALTER COLUMN id SET DEFAULT nextval('public.backoffice_profile_id_seq'::regclass);


--
-- Name: backoffice_usercredentials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backoffice_usercredentials ALTER COLUMN id SET DEFAULT nextval('public.backoffice_usercredentials_id_seq'::regclass);


--
-- Name: bizcred_aadhar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_aadhar ALTER COLUMN id SET DEFAULT nextval('public.bizcred_aadhar_id_seq'::regclass);


--
-- Name: bizcred_additionalcompanydetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_additionalcompanydetails ALTER COLUMN id SET DEFAULT nextval('public.bizcred_additionalcompanydetails_id_seq'::regclass);


--
-- Name: bizcred_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_address ALTER COLUMN id SET DEFAULT nextval('public.bizcred_address_id_seq'::regclass);


--
-- Name: bizcred_authadditionalcompanydetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_authadditionalcompanydetails ALTER COLUMN id SET DEFAULT nextval('public.bizcred_authadditionalcompanydetails_id_seq'::regclass);


--
-- Name: bizcred_b2creport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_b2creport ALTER COLUMN id SET DEFAULT nextval('public.bizcred_b2creport_id_seq'::regclass);


--
-- Name: bizcred_bank id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_bank ALTER COLUMN id SET DEFAULT nextval('public.bizcred_bank_id_seq'::regclass);


--
-- Name: bizcred_bankstatement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_bankstatement ALTER COLUMN id SET DEFAULT nextval('public.bizcred_bankstatement_id_seq'::regclass);


--
-- Name: bizcred_businessfinancial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_businessfinancial ALTER COLUMN id SET DEFAULT nextval('public.bizcred_businessfinancial_id_seq'::regclass);


--
-- Name: bizcred_companydetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_companydetails ALTER COLUMN id SET DEFAULT nextval('public.bizcred_companydetails_id_seq'::regclass);


--
-- Name: bizcred_employmentdetail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_employmentdetail ALTER COLUMN id SET DEFAULT nextval('public.bizcred_employmentdetail_id_seq'::regclass);


--
-- Name: bizcred_financeofferdetail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_financeofferdetail ALTER COLUMN id SET DEFAULT nextval('public.bizcred_financeofferdetail_id_seq'::regclass);


--
-- Name: bizcred_general id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_general ALTER COLUMN id SET DEFAULT nextval('public.bizcred_general_id_seq'::regclass);


--
-- Name: bizcred_gstregistration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_gstregistration ALTER COLUMN id SET DEFAULT nextval('public.bizcred_gstregistration_id_seq'::regclass);


--
-- Name: bizcred_identification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_identification ALTER COLUMN id SET DEFAULT nextval('public.bizcred_identification_id_seq'::regclass);


--
-- Name: bizcred_incometaxreturn id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_incometaxreturn ALTER COLUMN id SET DEFAULT nextval('public.bizcred_incometaxreturn_id_seq'::regclass);


--
-- Name: bizcred_lenderdetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_lenderdetails ALTER COLUMN id SET DEFAULT nextval('public.bizcred_lenderdetails_id_seq'::regclass);


--
-- Name: bizcred_levelemail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_levelemail ALTER COLUMN id SET DEFAULT nextval('public.bizcred_levelemail_id_seq'::regclass);


--
-- Name: bizcred_metadata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_metadata ALTER COLUMN id SET DEFAULT nextval('public.bizcred_metadata_id_seq'::regclass);


--
-- Name: bizcred_pan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_pan ALTER COLUMN id SET DEFAULT nextval('public.bizcred_pan_id_seq'::regclass);


--
-- Name: bizcred_phone id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_phone ALTER COLUMN id SET DEFAULT nextval('public.bizcred_phone_id_seq'::regclass);


--
-- Name: bizcred_relatedcompanyinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_relatedcompanyinfo ALTER COLUMN id SET DEFAULT nextval('public.bizcred_relatedcompanyinfo_id_seq'::regclass);


--
-- Name: bizcred_sanctionedloan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_sanctionedloan ALTER COLUMN id SET DEFAULT nextval('public.bizcred_sanctionedloan_id_seq'::regclass);


--
-- Name: bizcred_velocescore id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_velocescore ALTER COLUMN id SET DEFAULT nextval('public.bizcred_velocescore_id_seq'::regclass);


--
-- Name: bizcred_velocescoreapprovalmatrix id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_velocescoreapprovalmatrix ALTER COLUMN id SET DEFAULT nextval('public.bizcred_velocescoreapprovalmatrix_id_seq'::regclass);


--
-- Name: bizcred_velocescoremaster id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_velocescoremaster ALTER COLUMN id SET DEFAULT nextval('public.bizcred_velocescoremaster_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: veloce_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_address ALTER COLUMN id SET DEFAULT nextval('public.veloce_address_id_seq'::regclass);


--
-- Name: veloce_applicationpaymentstatus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationpaymentstatus ALTER COLUMN id SET DEFAULT nextval('public.veloce_applicationpaymentstatus_id_seq'::regclass);


--
-- Name: veloce_applicationspecialvelocemarkup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationspecialvelocemarkup ALTER COLUMN id SET DEFAULT nextval('public.veloce_applicationspecialvelocemarkup_id_seq'::regclass);


--
-- Name: veloce_applicationstep1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationstep1 ALTER COLUMN id SET DEFAULT nextval('public.veloce_applicationstep1_id_seq'::regclass);


--
-- Name: veloce_applicationstep2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationstep2 ALTER COLUMN id SET DEFAULT nextval('public.veloce_applicationstep2_id_seq'::regclass);


--
-- Name: veloce_dealerspecialvelocemarkup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_dealerspecialvelocemarkup ALTER COLUMN id SET DEFAULT nextval('public.veloce_dealerspecialvelocemarkup_id_seq'::regclass);


--
-- Name: veloce_employmentinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_employmentinfo ALTER COLUMN id SET DEFAULT nextval('public.veloce_employmentinfo_id_seq'::regclass);


--
-- Name: veloce_financeschemeconfig id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_financeschemeconfig ALTER COLUMN id SET DEFAULT nextval('public.veloce_financeschemeconfig_id_seq'::regclass);


--
-- Name: veloce_generalinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_generalinfo ALTER COLUMN id SET DEFAULT nextval('public.veloce_generalinfo_id_seq'::regclass);


--
-- Name: veloce_generalvelocemarkup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_generalvelocemarkup ALTER COLUMN id SET DEFAULT nextval('public.veloce_generalvelocemarkup_id_seq'::regclass);


--
-- Name: veloce_instutioninfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_instutioninfo ALTER COLUMN id SET DEFAULT nextval('public.veloce_instutioninfo_id_seq'::regclass);


--
-- Name: veloce_invoicestep1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_invoicestep1 ALTER COLUMN id SET DEFAULT nextval('public.veloce_invoicestep1_id_seq'::regclass);


--
-- Name: veloce_kycdocuments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_kycdocuments ALTER COLUMN id SET DEFAULT nextval('public.veloce_kycdocuments_id_seq'::regclass);


--
-- Name: veloce_lender id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_lender ALTER COLUMN id SET DEFAULT nextval('public.veloce_lender_id_seq'::regclass);


--
-- Name: veloce_loan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_loan ALTER COLUMN id SET DEFAULT nextval('public.veloce_loan_id_seq'::regclass);


--
-- Name: veloce_reviewedveloceapplication id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_reviewedveloceapplication ALTER COLUMN id SET DEFAULT nextval('public.veloce_reviewedveloceapplication_id_seq'::regclass);


--
-- Name: veloce_veloceapplication id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_veloceapplication ALTER COLUMN id SET DEFAULT nextval('public.veloce_veloceapplication_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
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
25	Can add profile	7	add_profile
26	Can change profile	7	change_profile
27	Can delete profile	7	delete_profile
28	Can view profile	7	view_profile
29	Can add general	8	add_general
30	Can change general	8	change_general
31	Can delete general	8	delete_general
32	Can view general	8	view_general
33	Can add association	9	add_association
34	Can change association	9	change_association
35	Can delete association	9	delete_association
36	Can view association	9	view_association
37	Can add code	10	add_code
38	Can change code	10	change_code
39	Can delete code	10	delete_code
40	Can view code	10	view_code
41	Can add nonce	11	add_nonce
42	Can change nonce	11	change_nonce
43	Can delete nonce	11	delete_nonce
44	Can view nonce	11	view_nonce
45	Can add user social auth	12	add_usersocialauth
46	Can change user social auth	12	change_usersocialauth
47	Can delete user social auth	12	delete_usersocialauth
48	Can view user social auth	12	view_usersocialauth
49	Can add partial	13	add_partial
50	Can change partial	13	change_partial
51	Can delete partial	13	delete_partial
52	Can view partial	13	view_partial
53	Can add auth user	18	add_authuser
54	Can change auth user	18	change_authuser
55	Can delete auth user	18	delete_authuser
56	Can view auth user	18	view_authuser
57	Can add veloce score approval matrix	34	add_velocescoreapprovalmatrix
58	Can change veloce score approval matrix	34	change_velocescoreapprovalmatrix
59	Can delete veloce score approval matrix	34	delete_velocescoreapprovalmatrix
60	Can view veloce score approval matrix	34	view_velocescoreapprovalmatrix
61	Can add veloce score	35	add_velocescore
62	Can change veloce score	35	change_velocescore
63	Can delete veloce score	35	delete_velocescore
64	Can view veloce score	35	view_velocescore
65	Can add metadata	14	add_metadata
66	Can change metadata	14	change_metadata
67	Can delete metadata	14	delete_metadata
68	Can view metadata	14	view_metadata
69	Can add income tax return	36	add_incometaxreturn
70	Can change income tax return	36	change_incometaxreturn
71	Can delete income tax return	36	delete_incometaxreturn
72	Can view income tax return	36	view_incometaxreturn
73	Can add lender details	37	add_lenderdetails
74	Can change lender details	37	change_lenderdetails
75	Can delete lender details	37	delete_lenderdetails
76	Can view lender details	37	view_lenderdetails
77	Can add pan	38	add_pan
78	Can change pan	38	change_pan
79	Can delete pan	38	delete_pan
80	Can view pan	38	view_pan
81	Can add aadhar	39	add_aadhar
82	Can change aadhar	39	change_aadhar
83	Can delete aadhar	39	delete_aadhar
84	Can view aadhar	39	view_aadhar
85	Can add employment detail	40	add_employmentdetail
86	Can change employment detail	40	change_employmentdetail
87	Can delete employment detail	40	delete_employmentdetail
88	Can view employment detail	40	view_employmentdetail
89	Can add phone	15	add_phone
90	Can change phone	15	change_phone
91	Can delete phone	15	delete_phone
92	Can view phone	15	view_phone
93	Can add sanctioned loan	41	add_sanctionedloan
94	Can change sanctioned loan	41	change_sanctionedloan
95	Can delete sanctioned loan	41	delete_sanctionedloan
96	Can view sanctioned loan	41	view_sanctionedloan
97	Can add finance offer detail	42	add_financeofferdetail
98	Can change finance offer detail	42	change_financeofferdetail
99	Can delete finance offer detail	42	delete_financeofferdetail
100	Can view finance offer detail	42	view_financeofferdetail
101	Can add b2c report	43	add_b2creport
102	Can change b2c report	43	change_b2creport
103	Can delete b2c report	43	delete_b2creport
104	Can view b2c report	43	view_b2creport
105	Can add bank	44	add_bank
106	Can change bank	44	change_bank
107	Can delete bank	44	delete_bank
108	Can view bank	44	view_bank
109	Can add additional company details	23	add_additionalcompanydetails
110	Can change additional company details	23	change_additionalcompanydetails
111	Can delete additional company details	23	delete_additionalcompanydetails
112	Can view additional company details	23	view_additionalcompanydetails
113	Can add company details	45	add_companydetails
114	Can change company details	45	change_companydetails
115	Can delete company details	45	delete_companydetails
116	Can view company details	45	view_companydetails
117	Can add veloce score master	46	add_velocescoremaster
118	Can change veloce score master	46	change_velocescoremaster
119	Can delete veloce score master	46	delete_velocescoremaster
120	Can view veloce score master	46	view_velocescoremaster
121	Can add auth additional company details	31	add_authadditionalcompanydetails
122	Can change auth additional company details	31	change_authadditionalcompanydetails
123	Can delete auth additional company details	31	delete_authadditionalcompanydetails
124	Can view auth additional company details	31	view_authadditionalcompanydetails
125	Can add level email	47	add_levelemail
126	Can change level email	47	change_levelemail
127	Can delete level email	47	delete_levelemail
128	Can view level email	47	view_levelemail
129	Can add business financial	48	add_businessfinancial
130	Can change business financial	48	change_businessfinancial
131	Can delete business financial	48	delete_businessfinancial
132	Can view business financial	48	view_businessfinancial
133	Can add gst registration	49	add_gstregistration
134	Can change gst registration	49	change_gstregistration
135	Can delete gst registration	49	delete_gstregistration
136	Can view gst registration	49	view_gstregistration
137	Can add related company info	50	add_relatedcompanyinfo
138	Can change related company info	50	change_relatedcompanyinfo
139	Can delete related company info	50	delete_relatedcompanyinfo
140	Can view related company info	50	view_relatedcompanyinfo
141	Can add identification	51	add_identification
142	Can change identification	51	change_identification
143	Can delete identification	51	delete_identification
144	Can view identification	51	view_identification
145	Can add address	16	add_address
146	Can change address	16	change_address
147	Can delete address	16	delete_address
148	Can view address	16	view_address
149	Can add bank statement	52	add_bankstatement
150	Can change bank statement	52	change_bankstatement
151	Can delete bank statement	52	delete_bankstatement
152	Can view bank statement	52	view_bankstatement
153	Can add auth user	19	add_authuser
154	Can change auth user	19	change_authuser
155	Can delete auth user	19	delete_authuser
156	Can view auth user	19	view_authuser
157	Can add category	29	add_category
158	Can change category	29	change_category
159	Can delete category	29	delete_category
160	Can view category	29	view_category
161	Can add sub category	53	add_subcategory
162	Can change sub category	53	change_subcategory
163	Can delete sub category	53	delete_subcategory
164	Can view sub category	53	view_subcategory
165	Can add product	17	add_product
166	Can change product	17	change_product
167	Can delete product	17	delete_product
168	Can view product	17	view_product
169	Can add price structure	54	add_pricestructure
170	Can change price structure	54	change_pricestructure
171	Can delete price structure	54	delete_pricestructure
172	Can view price structure	54	view_pricestructure
173	Can add product media	55	add_productmedia
174	Can change product media	55	change_productmedia
175	Can delete product media	55	delete_productmedia
176	Can view product media	55	view_productmedia
177	Can add product rating	56	add_productrating
178	Can change product rating	56	change_productrating
179	Can delete product rating	56	delete_productrating
180	Can view product rating	56	view_productrating
181	Can add product inquiry	30	add_productinquiry
182	Can change product inquiry	30	change_productinquiry
183	Can delete product inquiry	30	delete_productinquiry
184	Can view product inquiry	30	view_productinquiry
185	Can add packaging delivery details	57	add_packagingdeliverydetails
186	Can change packaging delivery details	57	change_packagingdeliverydetails
187	Can delete packaging delivery details	57	delete_packagingdeliverydetails
188	Can view packaging delivery details	57	view_packagingdeliverydetails
189	Can add sale	58	add_sale
190	Can change sale	58	change_sale
191	Can delete sale	58	delete_sale
192	Can view sale	58	view_sale
193	Can add voucher	59	add_voucher
194	Can change voucher	59	change_voucher
195	Can delete voucher	59	delete_voucher
196	Can view voucher	59	view_voucher
197	Can add dealers given finance scheme	21	add_dealersgivenfinancescheme
198	Can change dealers given finance scheme	21	change_dealersgivenfinancescheme
199	Can delete dealers given finance scheme	21	delete_dealersgivenfinancescheme
200	Can view dealers given finance scheme	21	view_dealersgivenfinancescheme
201	Can add book sale	60	add_booksale
202	Can change book sale	60	change_booksale
203	Can delete book sale	60	delete_booksale
204	Can view book sale	60	view_booksale
205	Can add book sale details	20	add_booksaledetails
206	Can change book sale details	20	change_booksaledetails
207	Can delete book sale details	20	delete_booksaledetails
208	Can view book sale details	20	view_booksaledetails
209	Can add general reward points	61	add_generalrewardpoints
210	Can change general reward points	61	change_generalrewardpoints
211	Can delete general reward points	61	delete_generalrewardpoints
212	Can view general reward points	61	view_generalrewardpoints
213	Can add special reward points	62	add_specialrewardpoints
214	Can change special reward points	62	change_specialrewardpoints
215	Can delete special reward points	62	delete_specialrewardpoints
216	Can view special reward points	62	view_specialrewardpoints
217	Can add transaction reward details	63	add_transactionrewarddetails
218	Can change transaction reward details	63	change_transactionrewarddetails
219	Can delete transaction reward details	63	delete_transactionrewarddetails
220	Can view transaction reward details	63	view_transactionrewarddetails
221	Can add dealer selection	64	add_dealerselection
222	Can change dealer selection	64	change_dealerselection
223	Can delete dealer selection	64	delete_dealerselection
224	Can view dealer selection	64	view_dealerselection
225	Can add select product by dealer	65	add_selectproductbydealer
226	Can change select product by dealer	65	change_selectproductbydealer
227	Can delete select product by dealer	65	delete_selectproductbydealer
228	Can view select product by dealer	65	view_selectproductbydealer
229	Can add question answer	66	add_questionanswer
230	Can change question answer	66	change_questionanswer
231	Can delete question answer	66	delete_questionanswer
232	Can view question answer	66	view_questionanswer
233	Can add veloce user	33	add_veloceuser
234	Can change veloce user	33	change_veloceuser
235	Can delete veloce user	33	delete_veloceuser
236	Can view veloce user	33	view_veloceuser
237	Can add recently visited	67	add_recentlyvisited
238	Can change recently visited	67	change_recentlyvisited
239	Can delete recently visited	67	delete_recentlyvisited
240	Can view recently visited	67	view_recentlyvisited
241	Can add profile	32	add_profile
242	Can change profile	32	change_profile
243	Can delete profile	32	delete_profile
244	Can view profile	32	view_profile
245	Can add auth user	24	add_authuser
246	Can change auth user	24	change_authuser
247	Can delete auth user	24	delete_authuser
248	Can view auth user	24	view_authuser
249	Can add profile	28	add_profile
250	Can change profile	28	change_profile
251	Can delete profile	28	delete_profile
252	Can view profile	28	view_profile
253	Can add finance scheme config	68	add_financeschemeconfig
254	Can change finance scheme config	68	change_financeschemeconfig
255	Can delete finance scheme config	68	delete_financeschemeconfig
256	Can view finance scheme config	68	view_financeschemeconfig
257	Can add general veloce markup	69	add_generalvelocemarkup
258	Can change general veloce markup	69	change_generalvelocemarkup
259	Can delete general veloce markup	69	delete_generalvelocemarkup
260	Can view general veloce markup	69	view_generalvelocemarkup
261	Can add veloce application	70	add_veloceapplication
262	Can change veloce application	70	change_veloceapplication
263	Can delete veloce application	70	delete_veloceapplication
264	Can view veloce application	70	view_veloceapplication
265	Can add reviewed veloce application	71	add_reviewedveloceapplication
266	Can change reviewed veloce application	71	change_reviewedveloceapplication
267	Can delete reviewed veloce application	71	delete_reviewedveloceapplication
268	Can view reviewed veloce application	71	view_reviewedveloceapplication
269	Can add loan	72	add_loan
270	Can change loan	72	change_loan
271	Can delete loan	72	delete_loan
272	Can view loan	72	view_loan
273	Can add lender	27	add_lender
274	Can change lender	27	change_lender
275	Can delete lender	27	delete_lender
276	Can view lender	27	view_lender
277	Can add kyc documents	73	add_kycdocuments
278	Can change kyc documents	73	change_kycdocuments
279	Can delete kyc documents	73	delete_kycdocuments
280	Can view kyc documents	73	view_kycdocuments
281	Can add invoice step1	74	add_invoicestep1
282	Can change invoice step1	74	change_invoicestep1
283	Can delete invoice step1	74	delete_invoicestep1
284	Can view invoice step1	74	view_invoicestep1
285	Can add institution info	75	add_institutioninfo
286	Can change institution info	75	change_institutioninfo
287	Can delete institution info	75	delete_institutioninfo
288	Can view institution info	75	view_institutioninfo
289	Can add general info	76	add_generalinfo
290	Can change general info	76	change_generalinfo
291	Can delete general info	76	delete_generalinfo
292	Can view general info	76	view_generalinfo
293	Can add employment info	77	add_employmentinfo
294	Can change employment info	77	change_employmentinfo
295	Can delete employment info	77	delete_employmentinfo
296	Can view employment info	77	view_employmentinfo
297	Can add dealer special veloce markup	78	add_dealerspecialvelocemarkup
298	Can change dealer special veloce markup	78	change_dealerspecialvelocemarkup
299	Can delete dealer special veloce markup	78	delete_dealerspecialvelocemarkup
300	Can view dealer special veloce markup	78	view_dealerspecialvelocemarkup
301	Can add application step2	79	add_applicationstep2
302	Can change application step2	79	change_applicationstep2
303	Can delete application step2	79	delete_applicationstep2
304	Can view application step2	79	view_applicationstep2
305	Can add application step1	26	add_applicationstep1
306	Can change application step1	26	change_applicationstep1
307	Can delete application step1	26	delete_applicationstep1
308	Can view application step1	26	view_applicationstep1
309	Can add application special veloce markup	80	add_applicationspecialvelocemarkup
310	Can change application special veloce markup	80	change_applicationspecialvelocemarkup
311	Can delete application special veloce markup	80	delete_applicationspecialvelocemarkup
312	Can view application special veloce markup	80	view_applicationspecialvelocemarkup
313	Can add application payment status	25	add_applicationpaymentstatus
314	Can change application payment status	25	change_applicationpaymentstatus
315	Can delete application payment status	25	delete_applicationpaymentstatus
316	Can view application payment status	25	view_applicationpaymentstatus
317	Can add address	81	add_address
318	Can change address	81	change_address
319	Can delete address	81	delete_address
320	Can view address	81	view_address
321	Can add user credentials	82	add_usercredentials
322	Can change user credentials	82	change_usercredentials
323	Can delete user credentials	82	delete_usercredentials
324	Can view user credentials	82	view_usercredentials
325	Can add generate bill img upload	83	add_generatebillimgupload
326	Can change generate bill img upload	83	change_generatebillimgupload
327	Can delete generate bill img upload	83	delete_generatebillimgupload
328	Can view generate bill img upload	83	view_generatebillimgupload
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
61	pbkdf2_sha256$180000$PEAnBGNu1E0b$58IioMYCaMqt57e3UXT0hlZBzQ5eq68JFfAn6P4rNQY=	\N	f	123@gmail.com	Cheril	Lencers	123@gmail.com	f	t	2022-02-15 12:48:17.596659+05:30
1	pbkdf2_sha256$180000$qZiKEMFHhWhV$RTTe3Os+OtRb4iHIox83PS473/xyE/jD2wREb+uKpyU=	2022-02-21 14:34:35.820989+05:30	t	admin	admin		admin@gmail.com	t	t	2021-12-29 14:03:59+05:30
50	pbkdf2_sha256$180000$z02gxTSbT1w2$dkZZH5Fx4SE5/ShJffxBimYh4AHd0tMC5Ys59NWwy6A=	2022-02-04 12:10:55.735142+05:30	f	drjoy@kirtihealthcare.com	Dr.Joy	Shah	drjoy@kirtihealthcare.com	f	t	2022-02-04 12:10:35.589913+05:30
37	pbkdf2_sha256$180000$MpSSLvpSOIAo$xq2ol5OZaYXOEnJ6D14tfWl/NLlEv6R4TtlfX9+N+H4=	2022-02-23 15:23:25.719666+05:30	f	ravichovatiya120@gmail.com	ravi	patel	ravichovatiya120@gmail.com	f	t	2022-01-07 11:45:30+05:30
49	pbkdf2_sha256$180000$xKyPynwS8QZP$nmv5ToNth50LeKU4a9oMDTDi16kdFAQzS2V3qYDbrSE=	2022-02-05 13:33:10.889365+05:30	f	hiteshlad@kirtii.com	Hitesh	Lad	hiteshlad@kirtii.com	f	t	2022-02-04 11:15:51.389837+05:30
51	pbkdf2_sha256$180000$ir2c92LvD9nF$CmsWI5ry1Lqr4HKoFMiFL98aiLH/MCgnWSc2By8L/3M=	2022-02-04 16:09:16.65105+05:30	f	hiteshi@kirtii.com	Hiteshi	Panchal	hiteshi@kirtii.com	f	t	2022-02-04 12:13:32.879163+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: backoffice_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backoffice_profile (id, unit_number, street_address, tel_number, pin_code, city, state, user_id, user_position) FROM stdin;
36	318 Greeen Elina	A/2, India Colony, B/H Gayatri Nagar, Eru Road, Vijalpore, Navsari - 396445	9265096459	396445	Navsari	12	61	HR
26	319	Green Elina, Anand Mahal Road	9033116404	395009	Surat	12	51	HR
25	319	Green Elina, Anand Mahal Road	9825112899	395009	Surat	12	50	OWNER
24	319	Anand Mahal Road, Adajan	9825255318	396521	Surat	12	49	Head in IT
16	76 green alina	varachha road surat	9578452158	395009	Surat	12	37	Developer in IT
\.


--
-- Data for Name: backoffice_usercredentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backoffice_usercredentials (id, user_type, user_id) FROM stdin;
2	1	37
10	1	49
11	1	50
12	1	51
22	1	61
\.


--
-- Data for Name: bizcred_aadhar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_aadhar (id, aadhar_number, aadhar_card, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_additionalcompanydetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_additionalcompanydetails (id, pan_number, pan_card, gst_number, gst_proof, udyog_aadhar_number, udyog_aadhar_card, shop_license, rent_agreement, constitution_docs, authorization_resolution, shareholder_list, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_address (id, unit_number, street_address, tel_number, pin_code, city, state, effective_year, effective_month, proof, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_authadditionalcompanydetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_authadditionalcompanydetails (id, pan_number, pan_card, aadhar_number, aadhar_card, din_number, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_b2creport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_b2creport (id, orderid, data, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_bank (id, ifsc_code, branch_name, bank_name, bank_address, bank_acc_type, account_no, branch_manager_name, branch_manager_email, branch_manager_phone_number, cancel_cheque, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_bankstatement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_bankstatement (id, year, month, statement, is_complete, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_businessfinancial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_businessfinancial (id, finance_year, turnover_revenue, profit_befor_interest, interest_expense, depreciate, tax, profite_after_tax, capital_reserves, total_borrowing, current_assets, current_liablities, balance_sheet, pnl_statement, certified_audit_report, is_complete, is_auto_gen, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_companydetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_companydetails (id, org_name, org_website, org_type, company_register_no, soc, year, month, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_employmentdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_employmentdetail (id, employment_industry, company_name, designation, working_years_in_company, work_experience, appointment_letter, salary_slip, is_auto_gen, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_financeofferdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_financeofferdetail (id, sanction_amount, lender_interest_rate, veloce_margin, effective_interest_rate, emi_amount, overdue_interest_rate, veloce_margin_payer, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_general; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_general (id, father_husband_no, org_name, pos_in_company, birthdate, gender, marital_status, dependents, net_monthly_income, education_level, associated_professional_institute, registration_number, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_gstregistration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_gstregistration (id, gst_number, gst_proof, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_identification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_identification (id, din, pan_number, pan_card, aadhar_number, aadhar_card, gst_number, gst_proof, passport_no, passport_expiry_date, passport, driving_license_no, driving_license_expiry_date, driving_license, voter_id, utility_bill, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_incometaxreturn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_incometaxreturn (id, year, tax_return, is_complete, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_lenderdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_lenderdetails (id, banking_license_no, banking_license, noc, manager_remark, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_levelemail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_levelemail (id, level, is_approved, sent_time, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_metadata (id, account_type, org_name, updated_at, changelog, completion, profile_reviewed, profile_verified, is_crif_generated, reject_reason, password_code, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_pan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_pan (id, pan_number, pan_card, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_phone (id, phone_number, otp, is_complete, expiry_date, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_relatedcompanyinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_relatedcompanyinfo (id, related_website, related_company, related_company_address, related_company_gstin, is_complete, reject_reason, company_details_id, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_sanctionedloan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_sanctionedloan (id, sanction_date, loan_amount, loan_tenure, loan_emi, letter, lender_noc, is_complete, reject_reason, user_id) FROM stdin;
\.


--
-- Data for Name: bizcred_velocescore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_velocescore (id, veloce_rating, start, "end") FROM stdin;
\.


--
-- Data for Name: bizcred_velocescoreapprovalmatrix; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_velocescoreapprovalmatrix (id, dealer_finance_amount, borrower_finance_amount, tenure_months, rate_of_interest, processing_fees, veloce_score_id) FROM stdin;
\.


--
-- Data for Name: bizcred_velocescoremaster; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bizcred_velocescoremaster (id, crif_score, mca_default, gst_default, criminal_civil_case, is_address_checked, own_house, de_ratio, current_ratio, ebitda_percentage, int_cov_ratio, credit_rating, is_pan_verified, is_gst_verified, is_adhaar_verified, cheque_bounced, bank_comfort_letter, credit_manage_score, total_score, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-01-04 10:30:39.957922+05:30	1	ravichovatiya120@gmail.com	3		7	1
2	2022-01-04 10:33:22.646757+05:30	2	ravichovatiya120@gmail.com	3		4	1
3	2022-01-04 10:34:04.576946+05:30	2	ravichovatiya120@gmail.com	3		4	1
4	2022-01-04 10:34:54.216051+05:30	1	ravichovatiya120@gmail.com	3		12	1
5	2022-01-04 10:36:31.427748+05:30	2	ravichovatiya120@gmail.com	3		4	1
6	2022-01-04 10:38:12.75741+05:30	3	ravichovatiya120@gmail.com	1	[{"added": {}}]	4	1
7	2022-01-04 10:38:31.994713+05:30	3	ravichovatiya120@gmail.com	2	[{"changed": {"fields": ["password"]}}]	4	1
8	2022-01-04 10:38:59.447159+05:30	3	ravichovatiya120@gmail.com	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
9	2022-01-05 11:17:47.631086+05:30	3	ravichovatiya120@gmail.com	3		4	1
10	2022-01-05 15:21:12.953811+05:30	4	ravichovatiya120@gmail.com	3		4	1
11	2022-01-05 15:28:04.628986+05:30	5	ravichovatiya120@gmail.com	3		4	1
12	2022-01-05 15:30:35.125002+05:30	6	ravichovatiya120@gmail.com	3		4	1
13	2022-01-05 15:33:19.453132+05:30	7	ravichovatiya120@gmail.com	3		4	1
14	2022-01-05 15:33:52.267758+05:30	8	ravichovatiya120@gmail.com	3		4	1
15	2022-01-05 15:38:36.24045+05:30	9	ravichovatiya120@gmail.com	3		4	1
16	2022-01-05 15:40:23.647667+05:30	10	ravichovatiya120@gmail.com	3		4	1
17	2022-01-05 15:41:45.949063+05:30	11	ravichovatiya120@gmail.com	3		4	1
18	2022-01-05 15:43:00.032676+05:30	12	ravichovatiya120@gmail.com	3		4	1
19	2022-01-05 15:44:32.50598+05:30	13	ravichovatiya120@gmail.com	3		4	1
20	2022-01-05 15:45:11.526014+05:30	14	ravichovatiya120@gmail.com	3		4	1
21	2022-01-05 15:48:27.076698+05:30	15	ravichovatiya120@gmail.com	3		4	1
22	2022-01-05 15:50:20.988996+05:30	16	ravichovatiya120@gmail.com	3		4	1
23	2022-01-05 15:54:01.619766+05:30	17	ravichovatiya120@gmail.com	3		4	1
24	2022-01-05 15:55:35.51283+05:30	18	ravichovatiya120@gmail.com	3		4	1
25	2022-01-05 15:56:03.539697+05:30	19	ravichovatiya120@gmail.com	3		4	1
26	2022-01-05 15:56:52.578089+05:30	20	ravichovatiya120@gmail.com	3		4	1
27	2022-01-05 15:58:19.645066+05:30	21	ravichovatiya120@gmail.com	3		4	1
28	2022-01-05 15:59:29.620371+05:30	22	ravichovatiya120@gmail.com	3		4	1
29	2022-01-05 16:00:44.441689+05:30	23	ravichovatiya120@gmail.com	3		4	1
30	2022-01-05 16:01:30.41983+05:30	24	ravichovatiya120@gmail.com	3		4	1
31	2022-01-05 16:02:27.637627+05:30	25	ravichovatiya120@gmail.com	3		4	1
32	2022-01-05 16:03:39.048328+05:30	5	ravichovatiya120@gmail.com	3		7	1
33	2022-01-05 16:03:56.027214+05:30	26	ravichovatiya120@gmail.com	3		4	1
34	2022-01-05 16:04:55.793591+05:30	27	ravichovatiya120@gmail.com	3		4	1
35	2022-01-05 16:11:56.355654+05:30	28	ravichovatiya120@gmail.com	3		4	1
36	2022-01-05 16:12:46.977231+05:30	29	ravichovatiya120@gmail.com	2	[{"changed": {"fields": ["Active"]}}]	4	1
37	2022-01-05 17:12:07.567628+05:30	1	admin	2	[{"changed": {"fields": ["First name"]}}]	4	1
38	2022-01-07 10:27:56.616163+05:30	30	cherilgandhi@gmail.com	3		4	1
39	2022-01-07 10:31:04.153115+05:30	31	cherilgandhi@gmail.com	3		4	1
40	2022-01-07 10:33:57.493548+05:30	32	cherilgandhi@gmail.com	2	[{"changed": {"fields": ["password"]}}]	4	1
41	2022-01-07 10:36:29.835991+05:30	32	cherilgandhi@gmail.com	3		4	1
42	2022-01-07 10:49:53.053727+05:30	33	cherilgandhi@gmail.com	2	[{"changed": {"fields": ["password"]}}]	4	1
43	2022-01-07 10:50:26.664241+05:30	33	cherilgandhi@gmail.com	3		4	1
44	2022-01-07 11:37:02.536532+05:30	35	utsavpatel@gmail.com	3		4	1
45	2022-01-07 11:44:24.855851+05:30	34	cherilgandhi@gmail.com	3		4	1
46	2022-01-07 11:44:24.857642+05:30	29	ravichovatiya120@gmail.com	3		4	1
47	2022-01-10 16:35:04.122305+05:30	37	ravichovatiya120@gmail.com	2	[{"changed": {"fields": ["Active"]}}]	4	1
48	2022-01-10 16:35:16.941123+05:30	38	cherilgandhi@gmail.com	2	[{"changed": {"fields": ["Active"]}}]	4	1
49	2022-01-10 16:40:08.380459+05:30	38	cherilgandhi@gmail.com	2	[{"changed": {"fields": ["Active"]}}]	4	1
50	2022-01-10 17:13:26.771687+05:30	38	cherilgandhi@gmail.com	2	[{"changed": {"fields": ["Active"]}}]	4	1
51	2022-01-11 10:19:01.753641+05:30	93	cherilgandhi78@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	18	1
52	2022-01-11 10:19:57.89301+05:30	98	ta7.cheril.171130116018@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	18	1
53	2022-01-11 10:21:19.679126+05:30	93	cherilgandhi78@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	18	1
54	2022-01-11 10:21:35.949103+05:30	93	cherilgandhi78@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	18	1
55	2022-01-11 10:22:19.032177+05:30	98	ta7.cheril.171130116018@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	18	1
56	2022-01-11 10:22:25.630741+05:30	98	ta7.cheril.171130116018@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	18	1
57	2022-01-11 10:22:45.675982+05:30	98	ta7.cheril.171130116018@gmail.com	2	[{"changed": {"fields": ["Is staff", "Is active"]}}]	18	1
58	2022-01-11 14:05:15.254961+05:30	93	cherilgandhi78@gmail.com	3		4	1
59	2022-01-11 14:05:15.256436+05:30	98	ta7.cheril.171130116018@gmail.com	3		4	1
60	2022-01-11 14:06:33.57189+05:30	93	cherilgandhi78@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	18	1
61	2022-01-11 14:06:57.764895+05:30	93	cherilgandhi78@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	18	1
62	2022-01-11 14:07:40.439148+05:30	93	cherilgandhi78@gmail.com	3		4	1
63	2022-01-11 14:08:23.685866+05:30	96	ravipatel407@gmail.com	2	[{"changed": {"fields": ["Username"]}}]	18	1
64	2022-01-11 14:09:11.841372+05:30	96	ravipatel407@gmail.com	3		4	1
65	2022-01-11 14:10:02.318265+05:30	96	ravipatel4075@gmail.com	2	[{"changed": {"fields": ["Is staff"]}}]	18	1
66	2022-01-11 14:10:30.261095+05:30	96	ravipatel4075@gmail.com	2	[{"changed": {"fields": ["Is staff"]}}]	18	1
67	2022-01-11 14:11:24.408716+05:30	108	ravii.kirt@gmail.com	2	[{"changed": {"fields": ["Username"]}}]	18	1
68	2022-01-11 14:11:50.91427+05:30	108	ravii.kirtii@gmail.com	2	[{"changed": {"fields": ["Username"]}}]	18	1
69	2022-01-11 14:11:58.18371+05:30	108	ravii.kirtii@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	18	1
70	2022-01-11 14:13:02.870614+05:30	105	drjoyshah@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	18	1
71	2022-01-11 14:13:23.434059+05:30	108	ravii.kirtii@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	18	1
72	2022-01-11 14:13:28.580696+05:30	105	drjoyshah@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	18	1
73	2022-01-11 14:14:07.6321+05:30	36	utsavpatel@gmail.com	2	[{"changed": {"fields": ["Active"]}}]	4	1
74	2022-01-11 14:14:21.987978+05:30	36	utsavpatel@gmail.com	2	[{"changed": {"fields": ["Active"]}}]	4	1
75	2022-01-11 14:27:30.731818+05:30	38	cherilgandhi@gmail.com	2	[{"changed": {"fields": ["Active"]}}]	4	1
76	2022-01-12 16:37:36.84895+05:30	39	ravichovatiya121@gmail.com	3		4	1
77	2022-01-13 11:02:36.399571+05:30	40	ravichovatiya122@gmail.com	3		4	1
78	2022-01-13 11:02:36.401813+05:30	41	ravichovatiya123@gmail.com	3		4	1
79	2022-01-13 11:35:06.389836+05:30	42	ravichovatiya122@gmail.com	3		4	1
80	2022-01-13 14:20:24.211273+05:30	44	ravichovatiya121@gmail.com	3		4	1
81	2022-01-13 14:20:24.213812+05:30	43	ravichovatiya122@gmail.com	3		4	1
82	2022-01-13 14:21:56.47314+05:30	45	ravichovatiya121@gmail.com	3		4	1
83	2022-01-13 14:24:55.904187+05:30	46	ravichovatiya121@gmail.com	3		4	1
84	2022-01-15 10:24:35.432847+05:30	38	cherilgandhi@gmail.com	2	[{"changed": {"fields": ["Active"]}}]	4	1
85	2022-01-15 13:32:35.088049+05:30	57	mark@q2.com	3		18	1
86	2022-01-15 13:32:35.089612+05:30	51	priyank@gmail.com	3		18	1
87	2022-01-15 13:33:00.07057+05:30	57	mark@q2.com	3		18	1
88	2022-01-15 13:33:19.859915+05:30	51	priyank@gmail.com	3		18	1
89	2022-01-15 13:33:42.967928+05:30	51	priyank@gmail.com	3		18	1
90	2022-01-15 13:33:54.455706+05:30	51	priyank@gmail.com	3		18	1
91	2022-01-15 13:34:40.748654+05:30	51	priyank@gmail.com	3		18	1
92	2022-01-15 13:36:29.192176+05:30	51	priyank@gmail.com	3		18	1
93	2022-01-18 12:14:01.805631+05:30	105	ravichovatiya125@gmail.com	3		14	1
94	2022-01-18 12:15:13.45996+05:30	109	ravichovatiya125@gmail.com	3		18	1
95	2022-02-03 16:11:38.134893+05:30	38	cherilgandhi@gmail.com	2	[{"changed": {"fields": ["Active"]}}]	4	1
96	2022-02-04 11:26:06.80857+05:30	48	dummy@gmail.com	3		4	1
97	2022-02-04 11:26:06.811563+05:30	47	ravichovatiya121@gmail.com	3		4	1
98	2022-02-04 11:26:06.812517+05:30	36	utsavpatel@gmail.com	3		4	1
99	2022-02-04 15:49:59.963435+05:30	52	cherilgandhi78@gmail.com	3		4	1
100	2022-02-04 15:51:16.593792+05:30	53	cherilgandhi78@gmail.com	3		4	1
101	2022-02-04 15:52:19.274+05:30	54	cherilgandhi78@gmail.com	3		4	1
102	2022-02-04 15:53:55.277485+05:30	31	ta7.cheril.171130116018@gmail.com	3		7	1
103	2022-02-04 15:53:55.281603+05:30	30	cherilgandhi78@gmail.com	3		7	1
104	2022-02-04 16:07:32.393548+05:30	55	cherilgandhi78@gmail.com	3		4	1
105	2022-02-04 16:07:32.396971+05:30	56	ta7.cheril.171130116018@gmail.com	3		4	1
106	2022-02-04 16:10:51.712966+05:30	57	cherilgandhi78@gmail.com	3		4	1
107	2022-02-04 16:12:33.443485+05:30	58	cherilgandhi78@gmail.com	3		4	1
108	2022-02-04 16:15:31.731137+05:30	59	cherilgandhi78@gmail.com	3		4	1
109	2022-02-04 16:22:07.47709+05:30	60	cherilgandhi78@gmail.com	3		4	1
110	2022-02-04 17:53:08.184257+05:30	38	cherilgandhi@gmail.com	3		4	1
111	2022-02-10 15:10:41.838769+05:30	30	RAVI	3		60	1
112	2022-02-10 15:11:38.541536+05:30	34	Hello There	2	[{"changed": {"fields": ["Is product bill generated"]}}]	30	1
113	2022-02-10 15:14:47.433102+05:30	31	Test 1	2	[{"changed": {"fields": ["Upload Bill"]}}]	60	1
114	2022-02-10 17:21:46.500602+05:30	34	moov	3		60	1
115	2022-02-10 17:21:54.593999+05:30	33	xgxffg	3		60	1
116	2022-02-10 17:22:54.082006+05:30	38	132456498678663122132	2	[{"changed": {"fields": ["Is product bill generated"]}}]	30	1
117	2022-02-10 17:22:59.796274+05:30	37	yir biy breuinbrriryrytrtbyitytybbtybiyei	2	[{"changed": {"fields": ["Is product bill generated"]}}]	30	1
118	2022-02-10 17:36:46.866211+05:30	38	132456498678663122132	3		30	1
119	2022-02-10 17:36:46.869591+05:30	37	yir biy breuinbrriryrytrtbyitytybbtybiyei	3		30	1
120	2022-02-10 17:36:46.873349+05:30	36	This is product	3		30	1
121	2022-02-10 17:36:46.876082+05:30	35	Date :- 11/01/2022	3		30	1
122	2022-02-10 17:36:46.879848+05:30	34	Hello There	3		30	1
123	2022-02-10 17:36:46.882549+05:30	29	26-nov-2021 (2)	3		30	1
124	2022-02-10 17:36:46.886339+05:30	27	25-nov-2021	3		30	1
125	2022-02-10 17:36:46.888949+05:30	25	inq2	3		30	1
126	2022-02-10 17:36:46.892491+05:30	24	want second product all level completed	3		30	1
127	2022-02-11 15:06:39.827711+05:30	37	003	3		60	1
128	2022-02-11 15:07:13.164932+05:30	41	i want this product 3	2	[{"changed": {"fields": ["Is product bill generated"]}}]	30	1
129	2022-02-14 16:01:03.619958+05:30	25	drjoy@kirtihealthcare.com	2	[]	7	1
130	2022-02-14 16:05:11.900426+05:30	26	hiteshi@kirtii.com	2	[{"changed": {"fields": ["User position"]}}]	7	1
131	2022-02-14 16:05:32.458293+05:30	26	hiteshi@kirtii.com	2	[{"changed": {"fields": ["User position"]}}]	7	1
132	2022-02-14 16:05:40.339153+05:30	25	drjoy@kirtihealthcare.com	2	[{"changed": {"fields": ["User position"]}}]	7	1
133	2022-02-14 16:05:49.252606+05:30	24	hiteshlad@kirtii.com	2	[{"changed": {"fields": ["User position"]}}]	7	1
134	2022-02-14 16:07:11.394044+05:30	16	ravichovatiya120@gmail.com	2	[{"changed": {"fields": ["User position"]}}]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	backoffice	profile
8	bizcred	general
9	social_django	association
10	social_django	code
11	social_django	nonce
12	social_django	usersocialauth
13	social_django	partial
14	bizcred	metadata
15	bizcred	phone
16	bizcred	address
17	veloce	product
18	bizcred	authuser
19	veloce	authuser
20	veloce	booksaledetails
21	veloce	dealersgivenfinancescheme
22	veloce	authuser1
23	bizcred	additionalcompanydetails
24	veloces	authuser
25	veloces	applicationpaymentstatus
26	veloces	applicationstep1
27	veloces	lender
28	veloces	profile
29	veloce	category
30	veloce	productinquiry
31	bizcred	authadditionalcompanydetails
32	veloce	profile
33	veloce	veloceuser
34	bizcred	velocescoreapprovalmatrix
35	bizcred	velocescore
36	bizcred	incometaxreturn
37	bizcred	lenderdetails
38	bizcred	pan
39	bizcred	aadhar
40	bizcred	employmentdetail
41	bizcred	sanctionedloan
42	bizcred	financeofferdetail
43	bizcred	b2creport
44	bizcred	bank
45	bizcred	companydetails
46	bizcred	velocescoremaster
47	bizcred	levelemail
48	bizcred	businessfinancial
49	bizcred	gstregistration
50	bizcred	relatedcompanyinfo
51	bizcred	identification
52	bizcred	bankstatement
53	veloce	subcategory
54	veloce	pricestructure
55	veloce	productmedia
56	veloce	productrating
57	veloce	packagingdeliverydetails
58	veloce	sale
59	veloce	voucher
60	veloce	booksale
61	veloce	generalrewardpoints
62	veloce	specialrewardpoints
63	veloce	transactionrewarddetails
64	veloce	dealerselection
65	veloce	selectproductbydealer
66	veloce	questionanswer
67	veloce	recentlyvisited
68	veloces	financeschemeconfig
69	veloces	generalvelocemarkup
70	veloces	veloceapplication
71	veloces	reviewedveloceapplication
72	veloces	loan
73	veloces	kycdocuments
74	veloces	invoicestep1
75	veloces	institutioninfo
76	veloces	generalinfo
77	veloces	employmentinfo
78	veloces	dealerspecialvelocemarkup
79	veloces	applicationstep2
80	veloces	applicationspecialvelocemarkup
81	veloces	address
82	backoffice	usercredentials
83	backoffice	generatebillimgupload
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-12-29 14:03:14.817567+05:30
2	auth	0001_initial	2021-12-29 14:03:14.851233+05:30
3	admin	0001_initial	2021-12-29 14:03:14.898142+05:30
4	admin	0002_logentry_remove_auto_add	2021-12-29 14:03:14.910294+05:30
5	admin	0003_logentry_add_action_flag_choices	2021-12-29 14:03:14.917406+05:30
6	contenttypes	0002_remove_content_type_name	2021-12-29 14:03:14.928229+05:30
7	auth	0002_alter_permission_name_max_length	2021-12-29 14:03:14.932306+05:30
8	auth	0003_alter_user_email_max_length	2021-12-29 14:03:14.937436+05:30
9	auth	0004_alter_user_username_opts	2021-12-29 14:03:14.94339+05:30
10	auth	0005_alter_user_last_login_null	2021-12-29 14:03:14.948784+05:30
11	auth	0006_require_contenttypes_0002	2021-12-29 14:03:14.951213+05:30
12	auth	0007_alter_validators_add_error_messages	2021-12-29 14:03:14.956467+05:30
13	auth	0008_alter_user_username_max_length	2021-12-29 14:03:14.967183+05:30
14	auth	0009_alter_user_last_name_max_length	2021-12-29 14:03:14.973997+05:30
15	auth	0010_alter_group_name_max_length	2021-12-29 14:03:14.980179+05:30
16	auth	0011_update_proxy_permissions	2021-12-29 14:03:14.987681+05:30
17	backoffice	0001_initial	2021-12-29 14:03:14.99921+05:30
18	sessions	0001_initial	2021-12-29 14:03:15.007813+05:30
19	default	0001_initial	2021-12-29 14:03:15.05198+05:30
20	social_auth	0001_initial	2021-12-29 14:03:15.05274+05:30
21	default	0002_add_related_name	2021-12-29 14:03:15.0717+05:30
22	social_auth	0002_add_related_name	2021-12-29 14:03:15.072449+05:30
23	default	0003_alter_email_max_length	2021-12-29 14:03:15.076467+05:30
24	social_auth	0003_alter_email_max_length	2021-12-29 14:03:15.077147+05:30
25	default	0004_auto_20160423_0400	2021-12-29 14:03:15.082224+05:30
26	social_auth	0004_auto_20160423_0400	2021-12-29 14:03:15.082927+05:30
27	social_auth	0005_auto_20160727_2333	2021-12-29 14:03:15.08858+05:30
28	social_django	0006_partial	2021-12-29 14:03:15.097034+05:30
29	social_django	0007_code_timestamp	2021-12-29 14:03:15.105494+05:30
30	social_django	0008_partial_timestamp	2021-12-29 14:03:15.111388+05:30
31	social_django	0009_auto_20191118_0520	2021-12-29 14:03:15.124369+05:30
32	social_django	0010_uid_db_index	2021-12-29 14:03:15.135528+05:30
33	social_django	0001_initial	2021-12-29 14:03:15.138956+05:30
34	social_django	0002_add_related_name	2021-12-29 14:03:15.140127+05:30
35	social_django	0005_auto_20160727_2333	2021-12-29 14:03:15.142179+05:30
36	social_django	0003_alter_email_max_length	2021-12-29 14:03:15.143238+05:30
37	social_django	0004_auto_20160423_0400	2021-12-29 14:03:15.145309+05:30
38	bizcred	0001_initial	2022-01-04 10:29:36.036766+05:30
39	bizcred	0002_aadhar_additionalcompanydetails_address_authadditionalcompanydetails_b2creport_bank_bankstatement_bu	2022-01-04 10:29:36.625816+05:30
40	backoffice	0002_delete_profile	2022-01-05 11:13:38.921606+05:30
41	bizcred	0003_auto_20220105_0533	2022-01-05 11:13:39.450418+05:30
42	veloces	0001_initial	2022-01-05 11:13:39.69025+05:30
43	backoffice	0003_profile	2022-01-05 11:16:33.380508+05:30
44	backoffice	0004_usercredentials	2022-01-07 10:11:28.123391+05:30
45	backoffice	0002_generatebillimgupload	2022-02-11 14:34:28.491938+05:30
46	backoffice	0003_delete_generatebillimgupload	2022-02-11 16:12:37.438805+05:30
47	backoffice	0004_profile_user_position	2022-02-14 16:02:12.541491+05:30
48	backoffice	0005_auto_20220214_1036	2022-02-14 16:06:55.345382+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
8vsgxzehld8j4drwntn1txz3tk454mvk	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-01-12 14:04:29.573032+05:30
0snn3wruxprwkbxihtqize416it15ndk	MDIxYjhjZTBhNmQ2ZDlmMGFhNTJkN2EzZGZkZDEwYzkwYzZiOTcyZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYmFja29mZmljZS5vYXV0aC5WZWxvY2VPQXV0aDIiLCJfYXV0aF91c2VyX2hhc2giOiI5ZjNiYzAyNjA5ZDYwMmVhY2YwYjAyOGMyZTk4ODA0MzM1Y2RhZmRkIiwic29jaWFsX2F1dGhfbGFzdF9sb2dpbl9iYWNrZW5kIjoidmF1dGgifQ==	2022-01-12 14:04:58.184946+05:30
xo5ipxo71f6jymoo83zm1miq8016590d	MDIxYjhjZTBhNmQ2ZDlmMGFhNTJkN2EzZGZkZDEwYzkwYzZiOTcyZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYmFja29mZmljZS5vYXV0aC5WZWxvY2VPQXV0aDIiLCJfYXV0aF91c2VyX2hhc2giOiI5ZjNiYzAyNjA5ZDYwMmVhY2YwYjAyOGMyZTk4ODA0MzM1Y2RhZmRkIiwic29jaWFsX2F1dGhfbGFzdF9sb2dpbl9iYWNrZW5kIjoidmF1dGgifQ==	2022-01-12 16:39:45.187837+05:30
s32h10j1hpt5xdfrreyt66zgakolple9	MDIxYjhjZTBhNmQ2ZDlmMGFhNTJkN2EzZGZkZDEwYzkwYzZiOTcyZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYmFja29mZmljZS5vYXV0aC5WZWxvY2VPQXV0aDIiLCJfYXV0aF91c2VyX2hhc2giOiI5ZjNiYzAyNjA5ZDYwMmVhY2YwYjAyOGMyZTk4ODA0MzM1Y2RhZmRkIiwic29jaWFsX2F1dGhfbGFzdF9sb2dpbl9iYWNrZW5kIjoidmF1dGgifQ==	2022-01-12 16:39:57.588268+05:30
1qf6qvkjwrcy0x60je8q7vk3ncj1yxav	MDc1MjMyYWE3Mjc1OGQzMTBhMTYxZTkyMjI3MjQ3YjRkMTc1M2EyNjp7Il9hdXRoX3VzZXJfaWQiOiIzOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzkzNWFhODEzODI1M2ZhNDI0MWZlNjYzNGVkOWQxZTg3OGUyY2E0OCJ9	2022-01-22 10:03:44.052728+05:30
mu4f5aqomkmdpdwh9bxoo8x4t327niix	MDc1MjMyYWE3Mjc1OGQzMTBhMTYxZTkyMjI3MjQ3YjRkMTc1M2EyNjp7Il9hdXRoX3VzZXJfaWQiOiIzOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzkzNWFhODEzODI1M2ZhNDI0MWZlNjYzNGVkOWQxZTg3OGUyY2E0OCJ9	2022-01-22 10:10:27.540277+05:30
rbzfid09jkrvt5gzr9eo0oystjba24n2	MDIxYjhjZTBhNmQ2ZDlmMGFhNTJkN2EzZGZkZDEwYzkwYzZiOTcyZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYmFja29mZmljZS5vYXV0aC5WZWxvY2VPQXV0aDIiLCJfYXV0aF91c2VyX2hhc2giOiI5ZjNiYzAyNjA5ZDYwMmVhY2YwYjAyOGMyZTk4ODA0MzM1Y2RhZmRkIiwic29jaWFsX2F1dGhfbGFzdF9sb2dpbl9iYWNrZW5kIjoidmF1dGgifQ==	2022-01-13 16:26:56.468879+05:30
h54ndcshd60840zop6mh26ow33bk20g3	MDc1MjMyYWE3Mjc1OGQzMTBhMTYxZTkyMjI3MjQ3YjRkMTc1M2EyNjp7Il9hdXRoX3VzZXJfaWQiOiIzOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzkzNWFhODEzODI1M2ZhNDI0MWZlNjYzNGVkOWQxZTg3OGUyY2E0OCJ9	2022-01-22 11:33:52.577884+05:30
8vas0gfeyk1x3tacdfdc1ouig3hu6jd2	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-01-31 10:12:17.187797+05:30
4h561q39ij9gm731t4i61gi8hpgcnb4o	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-01-24 17:54:41.822869+05:30
ioy95zynkeamfr1k0uk8ouiaxuyons4n	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-01-27 17:09:23.852808+05:30
qxnam4exkjirnyyd7uwtokgnzk6hdbrg	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-01-25 11:50:59.601833+05:30
yj5ssn5zvfrrxoz4d4wkwjo6pc40bz8p	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-01-19 17:11:14.670246+05:30
zox7i9hxhx3te10y863brue375isrpty	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-01-20 10:24:56.207908+05:30
9dnsigwg0q4xok51fn95dcyir21wf5dw	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-01-20 10:30:06.028511+05:30
tyzvpmzx9eotykwhu9clphikizqamu1l	MDc1MjMyYWE3Mjc1OGQzMTBhMTYxZTkyMjI3MjQ3YjRkMTc1M2EyNjp7Il9hdXRoX3VzZXJfaWQiOiIzOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzkzNWFhODEzODI1M2ZhNDI0MWZlNjYzNGVkOWQxZTg3OGUyY2E0OCJ9	2022-01-25 15:29:53.007923+05:30
fsko1i9xcywv3w6zv0vi8pdpn909zvpc	MzdhNzNjMmU0ODI3NTU4MGMwMzM0ZTNjM2VlYjU3ZDY2MGM1MWUwYjp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWJmYzNiNzEyNjNiMTBlYzE2M2Y2MTMzYjY5YjBlYmQ2MjZkYWRiNSJ9	2022-01-20 14:15:05.69374+05:30
3ct8sg5xf13gkt44bqxjc2u58rkrnrnh	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-01-29 10:24:17.875689+05:30
70ehiodpz6nhx1l7pbmb17a79sn1g6p7	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-01-26 16:37:26.292344+05:30
a5xgpogfhbr0igdmpp7hedzb49fwnk5s	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-01-21 15:49:24.978611+05:30
92yo1tw8dasdzisslk8fc3x0cshugpif	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-01-27 11:35:00.616162+05:30
pqz2yey6dbtale5nhrsa49mjj3i6ppuf	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-01-21 10:49:53.060008+05:30
tl3ckjoruyo60f4vd3hebmoxnztbxi17	MDc1MjMyYWE3Mjc1OGQzMTBhMTYxZTkyMjI3MjQ3YjRkMTc1M2EyNjp7Il9hdXRoX3VzZXJfaWQiOiIzOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzkzNWFhODEzODI1M2ZhNDI0MWZlNjYzNGVkOWQxZTg3OGUyY2E0OCJ9	2022-01-29 15:01:22.729061+05:30
nq34itxshr46gaya8hfqpqcifq62tfb9	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-25 10:05:25.253435+05:30
b8fsh5twnzbq0k0q0vdup6seg615jvdc	MDc1MjMyYWE3Mjc1OGQzMTBhMTYxZTkyMjI3MjQ3YjRkMTc1M2EyNjp7Il9hdXRoX3VzZXJfaWQiOiIzOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzkzNWFhODEzODI1M2ZhNDI0MWZlNjYzNGVkOWQxZTg3OGUyY2E0OCJ9	2022-01-29 15:06:18.987396+05:30
m25y2ksk8j2clliwkh3k3ht9kax5q6pb	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-25 10:12:27.710122+05:30
xdf1hm8xb7o8hc7jmc7kn9g6vhrk8n3h	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-05 11:21:20.429812+05:30
q0iltnq95i2kjzcphaekoug517u35i7g	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-09 12:58:59.019071+05:30
49u9uu2dagcu2pw9834sag51z5qf1aku	MDc1MjMyYWE3Mjc1OGQzMTBhMTYxZTkyMjI3MjQ3YjRkMTc1M2EyNjp7Il9hdXRoX3VzZXJfaWQiOiIzOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzkzNWFhODEzODI1M2ZhNDI0MWZlNjYzNGVkOWQxZTg3OGUyY2E0OCJ9	2022-01-29 15:09:30.218526+05:30
qn29io2tangz11tvb1l6477z82q1h5lm	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-05 12:26:30.007667+05:30
hu59k1hy4jl4tzc2ew1kx5obrwl58t80	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-21 12:44:54.437846+05:30
4kksz5bvtbdbwdp3jzset6xu6rql70dy	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-09 15:23:25.72105+05:30
kney62stzh9ch0hibct4kfua0fv7ey2p	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-22 10:11:32.783037+05:30
vnec2m92nswr8f9kbt71jpip95s21cn6	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-23 15:51:25.567986+05:30
j4o1udynuy10f2yiv8ig7b2qkfpv28kj	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-02-01 12:13:41.955969+05:30
4utjdoybk29c18tnzyuaztr1c5546wc0	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-18 16:08:59.950797+05:30
erjflcz3oxvsmu6qmwckibm5i0a4dmhi	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-22 10:12:06.29831+05:30
6zabe6hkquwre98nbmamdsjcd0ablbe1	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-05 12:41:22.5692+05:30
dii441dnk8gmj7mj562hjxqtsxinzm59	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-23 16:28:02.995842+05:30
ekyuaaawb5epae1yli39far8maoy3x0b	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-02-01 15:41:40.450576+05:30
g42elo2m6sjkm5ngytuuyf3gvpxeavz2	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-02-25 12:12:26.981717+05:30
nb7i2sgkfky7kc06r8gv2ws41dp37xt3	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-05 14:37:42.770899+05:30
rw7s8w73ltkqyayfwzobgkc094ducdq2	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-23 16:50:07.326018+05:30
qwcjpyagsguk8fef88h0m9pv1evng78r	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-01 17:32:26.418202+05:30
xyz2pcpo5a3a6687ve403livar8zkzph	OWUwYTk0OGFkZjFmNDE4MGJiNTUwODJiOTBhN2Y2NTZkZTlkNDZhMzp7Il9hdXRoX3VzZXJfaWQiOiI1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDdjMjJiYmI0Mjk1Njc4YjlmMWY5ZTM3N2ViZjUyOTRlNTk1YWE1ZCJ9	2022-02-18 16:09:16.65249+05:30
glf2sq77xdfmdjqrw4es6lnvmhp3fkbj	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-22 14:33:24.755671+05:30
4ixmiwspalwzsap7f6fy9tob8var34vr	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-05 15:15:24.751501+05:30
smenajvty7clkwlhpo519tcq0305rc2v	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-03 16:20:47.43881+05:30
hd1usmi4p6q7un3mcwdcsbybcwrjiaye	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-25 13:15:23.451809+05:30
jfosx5hc0e8i653q2mmtroi3hdppe20u	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-22 15:13:06.173822+05:30
i53jo993iyabc5aba6mj2pwzc1oh8nqs	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-07 12:04:36.47625+05:30
ug6exe4rj3xomfd2fz4juqi1pwikevwt	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-23 17:13:53.5341+05:30
h9ivj181ukfp1drn94qk3uvhy5e10wtw	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-03 17:55:28.511351+05:30
l8c5my2ube3j5vdhqf2yl3h4rn20ixi7	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-25 14:29:21.731627+05:30
rj23likcsuh14o00o7vx3d0qr26axe9a	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-23 17:27:56.832015+05:30
jlnazoutxtqzwugq1ss64jcjtq321gbx	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-05 12:07:07.891271+05:30
3odpkwjmfv3gn03s0w5lzwsh2v50nx3q	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-07 12:15:48.250947+05:30
ngsbt7j0s3y4srxjvxeht7a1ym8fva9b	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-22 15:21:28.818006+05:30
rrznf0uivqh0jkf73vctkf3emu5jmo2z	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-05 13:08:00.977281+05:30
ycmdkfaji40vbbh2dw1jpkiuh9uwn5az	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-25 15:00:44.405533+05:30
9pq8yvrgn91vytu4xi6e2aleddafva9a	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-22 15:47:30.326985+05:30
3hafw1i7nljfak6qlb2dwlo5ckafxaoi	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-24 10:17:50.509583+05:30
cv100agkmhcmcdjqpzj2hs6k4b3qkmwv	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-07 12:18:06.414043+05:30
2vqqcmjvntj9o7c8ybrcqk6vfwgdnub6	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-07 16:44:42.153367+05:30
0tg26iycyywn3vylzfu4tdo21ia1c9ni	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-22 15:58:53.700026+05:30
ao2lp70oj8ziifknpeeywgzw07n8qnki	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-03-07 12:31:23.048863+05:30
yo58sc1jqxsk9fx8e0t69idymv9mqs68	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-24 10:54:15.870028+05:30
8kn43zbftfmx3u51s8dnxvv4b28gqq7b	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-02-08 10:22:47.729339+05:30
0tcbwtxjhzqpq8ms2hr2lqc3fraobm8f	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-03-07 14:16:23.590484+05:30
ttfvffexothvoz0qqsi7pzof8v8efq7w	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-22 16:38:10.295696+05:30
fk3yrorr0ylunt40ie11n1imhp8zgztt	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-10 11:02:50.998131+05:30
oy4u0rn2ty244ku0or6x39zti8847x0s	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-22 17:21:45.886663+05:30
pzxdu7zevnnnpktx8ungxzmgwcgdl1mw	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-02-10 12:13:09.746499+05:30
lqjq82pu6bw37n4mc83nfub86f0u7k3r	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-22 17:23:31.604099+05:30
9jfn7lxx124pdl1bv3vu18idhncd5ul0	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-03-07 14:34:35.822284+05:30
w7hblvwp5a0uj8jssy3cvd5omwylzvvd	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-10 13:13:41.751336+05:30
9k9y3ztzwidyv3zms12k2556xz8if7xq	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-25 15:22:34.957368+05:30
vottx2rm5dcilucncdqwuqvn66v2mhnf	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-22 17:28:42.907927+05:30
nbz8m8dbi6mg5adnpxpgxz7xn66yumz2	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-07 14:36:34.945908+05:30
6bsvi7upkkv97oyu5d50oebwv5f3eedk	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-24 14:43:42.032879+05:30
hsfi4qmmfvhd8aog8e94hds0wmslmx9g	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-10 16:21:43.148867+05:30
9eegmp50ggxg813coh5jvrlp0vhbk9n8	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-25 17:19:29.744308+05:30
thfc2bd0ed3k923i2fiy0irrh4i4456r	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-23 09:59:01.747732+05:30
fucwx8fdp1u4jnevyd5robl66hw6ue83	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-24 14:48:21.085354+05:30
0q9k2mkjsluhps215bhkmzo3p8czu0hi	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-07 14:45:12.840206+05:30
d3qh68gsgf4wl3hwjur8qoyaksdhro64	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-11 10:14:08.440335+05:30
srrl9puhj0u91wo9onihkf469epxumsb	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-19 11:13:12.410248+05:30
suocmkxyglen33jhc8qv450pq66hw3fu	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-26 10:20:29.539468+05:30
gk8cvrhju38x6ewau43zmldvnxwzewk1	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-02-23 11:43:27.38303+05:30
bg9a12adahde5faneskuk8uxgfi6i0td	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-24 14:50:31.389752+05:30
f2j6zdhr4yzcomfb5yjovaivggx1zf2f	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-07 16:06:48.080175+05:30
bgnup5i1r73nuoko38bhyrootyl4rtma	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-02-12 14:22:23.242144+05:30
r7fhpwfpjie3dzmkgypsny17uvw8zql5	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-26 11:46:31.928584+05:30
6fts8q0vsota1ic7v6oqi4l8na4yjnnr	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-07 16:59:49.983652+05:30
6r2rx1xncqu6oenvzeskiiw78zl7icwz	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-14 11:45:06.104311+05:30
b87ou8dradvigfiqk98ehyopm6uq59jj	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-26 11:48:10.367788+05:30
bf014rd8m9xg3987gjccwfz7e94o7tgg	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-24 15:26:02.495393+05:30
7k8zlz6r37hsnek0qwi0ithkfd46lpzs	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-26 13:42:55.342012+05:30
0cvl1s5yfdvu9rqxsbdnt2mr9fwfxwu4	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-14 17:00:58.386096+05:30
872dgx7jayf89qqdiz5wt6cz6s96upga	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-26 13:50:46.571182+05:30
6g2fnv0fo3ys5u99xtge1q1f8evit0hc	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-15 10:12:41.083625+05:30
sowjmrsu7m0kr9v4q1y1ybiasjy84hux	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-19 15:55:50.977319+05:30
63ui0etke34qkwf24dpdo4xmd9nhh92n	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-15 11:02:43.491039+05:30
pzr7f2dill7oq94ulr4qr42h4gqh1lfh	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-19 15:58:38.747616+05:30
9ld5wl432bt8hh7l3dtpgf6qxjglm2mn	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-19 16:07:04.519823+05:30
cdasgkmvocgltfnbjpq9z7sm4tyu9qe1	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-19 16:08:02.679381+05:30
9h2f13oycl1h1bibvcl3i1yzybh4ywqj	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-02-28 16:04:46.151711+05:30
pxsnp8vmtb415uf5nomunezuf6fneeaf	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-19 16:10:53.628775+05:30
7ceyazjft6jv4t07hl26glqxnlhtz69o	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-01 10:34:41.353841+05:30
iskwdj7s9ibkge3bsekgiu24p0d5rorj	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-24 17:50:32.96131+05:30
6h4b4jtc7zufmzkxr9wlz7b0w0sq4f5u	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-19 16:11:56.194785+05:30
ssm22c4bogoxi571mr7cv0dx4o16y228	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-25 10:03:15.803135+05:30
pi4kwyd1b849sx8a3fmkg1gpjwhsgruo	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-25 10:03:29.688359+05:30
9kflhs82ymhq9m5swd1l675nbpuzzy62	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-03-01 12:24:05.363553+05:30
jjdiiqebjtupxmsmkt1pbmwfq82i9ja1	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-25 10:03:58.086552+05:30
ufwiqljntrty7fn8yv7t5msjkldnhklk	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-01 15:09:10.929076+05:30
1wp1m2yqrm8ngkl5htj1cfu90halr0pm	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-01 16:25:08.06147+05:30
5n24jqxw2msvi4u3eia1b799qqpduuy7	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-02 15:13:04.306533+05:30
une769xlt2s5naaenywriyj31vf7tkfj	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-02 17:11:12.712026+05:30
hdz7yjaxt77wg435yyaecpp7e64qhdho	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-02 17:15:30.603347+05:30
x46bjwsk32w2rb08jlns3ne3xz5fh1pc	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-02 17:19:34.933967+05:30
rujiashnnvz50a45fo3rfgfhc5fg2ykm	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-04 14:02:51.707982+05:30
bzsrpasi1fa4tmqkk207dab56sfwvggn	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-04 15:17:04.867063+05:30
lxoqihdebuu6vxwmla4nno4ufsujl5z9	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-16 10:19:51.360912+05:30
16qg7bgyhmkp6941gy01fazk8b8yy6y6	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-04 15:35:19.169877+05:30
75xsffapr1kxrrnosl8pbo3367cav8av	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-04 15:58:06.043438+05:30
iv844we4h3pv8jeakl6mt886s7eomtmz	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-04 15:59:31.581203+05:30
jcbu6rxorx3bezta05ocpxt73dn4tskn	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-04 16:00:08.290973+05:30
6428qqd78c85cvjht9vbq0e3brj3ho06	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-17 10:31:54.392862+05:30
g27uk03ini9yywytp6gpc63binxp05hj	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-04 16:00:34.544364+05:30
vzfpmqbunzjjt81gg7c1oofqpfi8gqdh	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-17 10:34:45.392228+05:30
1n8mqmanpizbh4uawnthdx3ir47hiwix	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-04 16:04:44.434992+05:30
h32w8nfwhjc2f85m2qfjj4uvarfe8svo	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-17 10:35:51.494749+05:30
vrcogl0paugs3cifukfpnnbzv9lkujyz	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-04 16:28:45.782995+05:30
01ggfrpkzy0yg93ntu2t55679t2bfkct	MDc1MjMyYWE3Mjc1OGQzMTBhMTYxZTkyMjI3MjQ3YjRkMTc1M2EyNjp7Il9hdXRoX3VzZXJfaWQiOiIzOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzkzNWFhODEzODI1M2ZhNDI0MWZlNjYzNGVkOWQxZTg3OGUyY2E0OCJ9	2022-02-17 11:02:55.438615+05:30
4m6ub0sxs2gv0xjqltxzpk8mo0k0dhb9	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-03-04 16:45:07.717094+05:30
gx3gv2xx4ju2wi29k6vxqiqbtyb0a8tg	YTU5NTkwOTAzOTk2M2IxNWNkZDZjMDY5MGNmNmZkNGZhMjJiYzZlMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjczOTFmMWVkNjdkODNlMDg0ZTYyOTYzOWQ4OGIzNWVhMDY1Y2JjIn0=	2022-02-17 15:15:10.319034+05:30
iaohuxaa5zrb9pz86ba578rw95828q9n	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-17 16:55:08.17704+05:30
t6anfuajulhfuztmuzphnlhxy8lvfe4n	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-18 11:14:47.809467+05:30
p0njvckoc2wvdfyuzdi04ucyuuop0hei	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-18 11:27:45.557903+05:30
6wd2z56hy71dupbpnnidga7h0wyrhx4y	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-18 11:49:45.362827+05:30
48d0vm2pfjkpziqnrlleklw6kj3sca76	YTEwMjU5MzVkMDQ3NWNmNDRkNzUxNTJjY2VlNzkwZjRjMGQ4ZmU1ODp7Il9hdXRoX3VzZXJfaWQiOiI0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWVkZDUyMmRhMzM4NTEyMzY5ZjEwNjNmYTJmOWRmNTFhZjlkMTk3OSJ9	2022-02-18 14:24:34.029811+05:30
69geknh04eq7zydg0mg408xlzzlznmaf	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-18 14:52:32.895745+05:30
bafrrhay49r4jqynhz5ifwbhih77h75u	ZGYzYTcyYmM0M2M1OGFiOWEwMDc0YjY3M2QxMmM4ZTJhYWFhNWRkMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2EwMzEzOTQyM2ZiNzg3NDJiOTA0ZGM5MjYxODk5NGE1ZGUwYzlmZSJ9	2022-02-18 15:34:00.305744+05:30
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
\.


--
-- Data for Name: veloce_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_address (id, address_type, house_type, unit_number, street_address, state, city, pin_code, effective_since, proof, veloce_user_id) FROM stdin;
\.


--
-- Data for Name: veloce_applicationpaymentstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_applicationpaymentstatus (id, payment_info, payment_request_id, payment_id, application_id) FROM stdin;
\.


--
-- Data for Name: veloce_applicationspecialvelocemarkup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_applicationspecialvelocemarkup (id, markup_percentage, markup_payment_by, loan_application_no_id) FROM stdin;
\.


--
-- Data for Name: veloce_applicationstep1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_applicationstep1 (id, borrower_email, bill_no, bill_amount, bill_date, billing_party_name, inquired_by, down_payment, required_loan_amount, loan_reason, emi_on_past_finance, current_loan_emi, total_emi, dealers_given_finance_scheme, application_id, coborrower_id) FROM stdin;
\.


--
-- Data for Name: veloce_applicationstep2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_applicationstep2 (id, bank_account_number, ifsc_code, bank_name, borrower_bank_account_number, borrower_ifsc_code, borrower_bank_name, application_id) FROM stdin;
\.


--
-- Data for Name: veloce_dealerspecialvelocemarkup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_dealerspecialvelocemarkup (id, markup_percentage, markup_payment_by, dealer_id) FROM stdin;
\.


--
-- Data for Name: veloce_employmentinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_employmentinfo (id, employment_type, employment_industry, company_name, designation, time_at_current_company, total_work_experience, veloce_user_id) FROM stdin;
\.


--
-- Data for Name: veloce_financeschemeconfig; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_financeschemeconfig (id, interest_percentage) FROM stdin;
\.


--
-- Data for Name: veloce_generalinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_generalinfo (id, marital_status, dependents, net_monthly_income, education_level, veloce_user_id) FROM stdin;
\.


--
-- Data for Name: veloce_generalvelocemarkup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_generalvelocemarkup (id, markup_percentage, markup_payment_by) FROM stdin;
\.


--
-- Data for Name: veloce_instutioninfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_instutioninfo (id, company_name, company_age, gross_annual_turnover, gst_number, gst_proof, firm_pan, pan_card_proof, veloce_user_id) FROM stdin;
\.


--
-- Data for Name: veloce_invoicestep1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_invoicestep1 (id, invoice_amount, downpayment_amount, tenure, invoice_proof, application_id, customer_id) FROM stdin;
\.


--
-- Data for Name: veloce_kycdocuments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_kycdocuments (id, aadhar_number, aadhar_card, pan_number, pan_card, veloce_user_id) FROM stdin;
\.


--
-- Data for Name: veloce_lender; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_lender (id, loan_amount, loan_id, user_id) FROM stdin;
\.


--
-- Data for Name: veloce_loan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_loan (id, loan_amount, sanctioned_loan_amount, disbursement_amount, dealer_scheme_roi, dealer_scheme_emi, loan_tenure, interest_rate, lender_amount_after_veloce_roi, lender_roi_after_veloce_roi, veloce_amount, veloce_roi, is_accepted, is_coaccepted, created_at, accepted_at, app_reviewed_by_id, application_id) FROM stdin;
\.


--
-- Data for Name: veloce_reviewedveloceapplication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_reviewedveloceapplication (id, is_reviewed, is_approved, is_rejected, reject_reason, created_at, updated_at, rejected_by_id, reviewed_by_id, veloce_app_id) FROM stdin;
\.


--
-- Data for Name: veloce_veloceapplication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veloce_veloceapplication (id, application_type, inquiry_id, is_reviewed, is_approved, is_rejected, reject_reason, current_step, created_at, updated_at, rejected_by_id, user_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 328, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 61, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: backoffice_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backoffice_profile_id_seq', 36, true);


--
-- Name: backoffice_usercredentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backoffice_usercredentials_id_seq', 22, true);


--
-- Name: bizcred_aadhar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_aadhar_id_seq', 1, false);


--
-- Name: bizcred_additionalcompanydetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_additionalcompanydetails_id_seq', 1, false);


--
-- Name: bizcred_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_address_id_seq', 1, false);


--
-- Name: bizcred_authadditionalcompanydetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_authadditionalcompanydetails_id_seq', 1, false);


--
-- Name: bizcred_b2creport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_b2creport_id_seq', 1, false);


--
-- Name: bizcred_bank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_bank_id_seq', 1, false);


--
-- Name: bizcred_bankstatement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_bankstatement_id_seq', 1, false);


--
-- Name: bizcred_businessfinancial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_businessfinancial_id_seq', 1, false);


--
-- Name: bizcred_companydetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_companydetails_id_seq', 1, false);


--
-- Name: bizcred_employmentdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_employmentdetail_id_seq', 1, false);


--
-- Name: bizcred_financeofferdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_financeofferdetail_id_seq', 1, false);


--
-- Name: bizcred_general_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_general_id_seq', 1, false);


--
-- Name: bizcred_gstregistration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_gstregistration_id_seq', 1, false);


--
-- Name: bizcred_identification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_identification_id_seq', 1, false);


--
-- Name: bizcred_incometaxreturn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_incometaxreturn_id_seq', 1, false);


--
-- Name: bizcred_lenderdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_lenderdetails_id_seq', 1, false);


--
-- Name: bizcred_levelemail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_levelemail_id_seq', 1, false);


--
-- Name: bizcred_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_metadata_id_seq', 1, false);


--
-- Name: bizcred_pan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_pan_id_seq', 1, false);


--
-- Name: bizcred_phone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_phone_id_seq', 1, false);


--
-- Name: bizcred_relatedcompanyinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_relatedcompanyinfo_id_seq', 1, false);


--
-- Name: bizcred_sanctionedloan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_sanctionedloan_id_seq', 1, false);


--
-- Name: bizcred_velocescore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_velocescore_id_seq', 1, false);


--
-- Name: bizcred_velocescoreapprovalmatrix_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_velocescoreapprovalmatrix_id_seq', 1, false);


--
-- Name: bizcred_velocescoremaster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bizcred_velocescoremaster_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 134, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 83, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 48, true);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, true);


--
-- Name: veloce_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_address_id_seq', 1, false);


--
-- Name: veloce_applicationpaymentstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_applicationpaymentstatus_id_seq', 1, false);


--
-- Name: veloce_applicationspecialvelocemarkup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_applicationspecialvelocemarkup_id_seq', 1, false);


--
-- Name: veloce_applicationstep1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_applicationstep1_id_seq', 1, false);


--
-- Name: veloce_applicationstep2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_applicationstep2_id_seq', 1, false);


--
-- Name: veloce_dealerspecialvelocemarkup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_dealerspecialvelocemarkup_id_seq', 1, false);


--
-- Name: veloce_employmentinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_employmentinfo_id_seq', 1, false);


--
-- Name: veloce_financeschemeconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_financeschemeconfig_id_seq', 1, false);


--
-- Name: veloce_generalinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_generalinfo_id_seq', 1, false);


--
-- Name: veloce_generalvelocemarkup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_generalvelocemarkup_id_seq', 1, false);


--
-- Name: veloce_instutioninfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_instutioninfo_id_seq', 1, false);


--
-- Name: veloce_invoicestep1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_invoicestep1_id_seq', 1, false);


--
-- Name: veloce_kycdocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_kycdocuments_id_seq', 1, false);


--
-- Name: veloce_lender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_lender_id_seq', 1, false);


--
-- Name: veloce_loan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_loan_id_seq', 1, false);


--
-- Name: veloce_reviewedveloceapplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_reviewedveloceapplication_id_seq', 1, false);


--
-- Name: veloce_veloceapplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veloce_veloceapplication_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: backoffice_profile backoffice_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backoffice_profile
    ADD CONSTRAINT backoffice_profile_pkey PRIMARY KEY (id);


--
-- Name: backoffice_profile backoffice_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backoffice_profile
    ADD CONSTRAINT backoffice_profile_user_id_key UNIQUE (user_id);


--
-- Name: backoffice_usercredentials backoffice_usercredentials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backoffice_usercredentials
    ADD CONSTRAINT backoffice_usercredentials_pkey PRIMARY KEY (id);


--
-- Name: backoffice_usercredentials backoffice_usercredentials_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backoffice_usercredentials
    ADD CONSTRAINT backoffice_usercredentials_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_aadhar bizcred_aadhar_aadhar_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_aadhar
    ADD CONSTRAINT bizcred_aadhar_aadhar_number_key UNIQUE (aadhar_number);


--
-- Name: bizcred_aadhar bizcred_aadhar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_aadhar
    ADD CONSTRAINT bizcred_aadhar_pkey PRIMARY KEY (id);


--
-- Name: bizcred_aadhar bizcred_aadhar_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_aadhar
    ADD CONSTRAINT bizcred_aadhar_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_additionalcompanydetails bizcred_additionalcompanydetails_pan_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_additionalcompanydetails
    ADD CONSTRAINT bizcred_additionalcompanydetails_pan_number_key UNIQUE (pan_number);


--
-- Name: bizcred_additionalcompanydetails bizcred_additionalcompanydetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_additionalcompanydetails
    ADD CONSTRAINT bizcred_additionalcompanydetails_pkey PRIMARY KEY (id);


--
-- Name: bizcred_additionalcompanydetails bizcred_additionalcompanydetails_udyog_aadhar_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_additionalcompanydetails
    ADD CONSTRAINT bizcred_additionalcompanydetails_udyog_aadhar_number_key UNIQUE (udyog_aadhar_number);


--
-- Name: bizcred_additionalcompanydetails bizcred_additionalcompanydetails_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_additionalcompanydetails
    ADD CONSTRAINT bizcred_additionalcompanydetails_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_address bizcred_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_address
    ADD CONSTRAINT bizcred_address_pkey PRIMARY KEY (id);


--
-- Name: bizcred_authadditionalcompanydetails bizcred_authadditionalcompanydetails_aadhar_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_authadditionalcompanydetails
    ADD CONSTRAINT bizcred_authadditionalcompanydetails_aadhar_number_key UNIQUE (aadhar_number);


--
-- Name: bizcred_authadditionalcompanydetails bizcred_authadditionalcompanydetails_pan_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_authadditionalcompanydetails
    ADD CONSTRAINT bizcred_authadditionalcompanydetails_pan_number_key UNIQUE (pan_number);


--
-- Name: bizcred_authadditionalcompanydetails bizcred_authadditionalcompanydetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_authadditionalcompanydetails
    ADD CONSTRAINT bizcred_authadditionalcompanydetails_pkey PRIMARY KEY (id);


--
-- Name: bizcred_authadditionalcompanydetails bizcred_authadditionalcompanydetails_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_authadditionalcompanydetails
    ADD CONSTRAINT bizcred_authadditionalcompanydetails_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_b2creport bizcred_b2creport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_b2creport
    ADD CONSTRAINT bizcred_b2creport_pkey PRIMARY KEY (id);


--
-- Name: bizcred_b2creport bizcred_b2creport_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_b2creport
    ADD CONSTRAINT bizcred_b2creport_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_bank bizcred_bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_bank
    ADD CONSTRAINT bizcred_bank_pkey PRIMARY KEY (id);


--
-- Name: bizcred_bank bizcred_bank_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_bank
    ADD CONSTRAINT bizcred_bank_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_bankstatement bizcred_bankstatement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_bankstatement
    ADD CONSTRAINT bizcred_bankstatement_pkey PRIMARY KEY (id);


--
-- Name: bizcred_businessfinancial bizcred_businessfinancial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_businessfinancial
    ADD CONSTRAINT bizcred_businessfinancial_pkey PRIMARY KEY (id);


--
-- Name: bizcred_companydetails bizcred_companydetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_companydetails
    ADD CONSTRAINT bizcred_companydetails_pkey PRIMARY KEY (id);


--
-- Name: bizcred_companydetails bizcred_companydetails_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_companydetails
    ADD CONSTRAINT bizcred_companydetails_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_employmentdetail bizcred_employmentdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_employmentdetail
    ADD CONSTRAINT bizcred_employmentdetail_pkey PRIMARY KEY (id);


--
-- Name: bizcred_employmentdetail bizcred_employmentdetail_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_employmentdetail
    ADD CONSTRAINT bizcred_employmentdetail_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_financeofferdetail bizcred_financeofferdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_financeofferdetail
    ADD CONSTRAINT bizcred_financeofferdetail_pkey PRIMARY KEY (id);


--
-- Name: bizcred_financeofferdetail bizcred_financeofferdetail_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_financeofferdetail
    ADD CONSTRAINT bizcred_financeofferdetail_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_general bizcred_general_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_general
    ADD CONSTRAINT bizcred_general_pkey PRIMARY KEY (id);


--
-- Name: bizcred_general bizcred_general_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_general
    ADD CONSTRAINT bizcred_general_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_gstregistration bizcred_gstregistration_gst_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_gstregistration
    ADD CONSTRAINT bizcred_gstregistration_gst_number_key UNIQUE (gst_number);


--
-- Name: bizcred_gstregistration bizcred_gstregistration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_gstregistration
    ADD CONSTRAINT bizcred_gstregistration_pkey PRIMARY KEY (id);


--
-- Name: bizcred_gstregistration bizcred_gstregistration_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_gstregistration
    ADD CONSTRAINT bizcred_gstregistration_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_identification bizcred_identification_aadhar_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_identification
    ADD CONSTRAINT bizcred_identification_aadhar_number_key UNIQUE (aadhar_number);


--
-- Name: bizcred_identification bizcred_identification_pan_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_identification
    ADD CONSTRAINT bizcred_identification_pan_number_key UNIQUE (pan_number);


--
-- Name: bizcred_identification bizcred_identification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_identification
    ADD CONSTRAINT bizcred_identification_pkey PRIMARY KEY (id);


--
-- Name: bizcred_identification bizcred_identification_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_identification
    ADD CONSTRAINT bizcred_identification_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_incometaxreturn bizcred_incometaxreturn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_incometaxreturn
    ADD CONSTRAINT bizcred_incometaxreturn_pkey PRIMARY KEY (id);


--
-- Name: bizcred_lenderdetails bizcred_lenderdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_lenderdetails
    ADD CONSTRAINT bizcred_lenderdetails_pkey PRIMARY KEY (id);


--
-- Name: bizcred_lenderdetails bizcred_lenderdetails_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_lenderdetails
    ADD CONSTRAINT bizcred_lenderdetails_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_levelemail bizcred_levelemail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_levelemail
    ADD CONSTRAINT bizcred_levelemail_pkey PRIMARY KEY (id);


--
-- Name: bizcred_metadata bizcred_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_metadata
    ADD CONSTRAINT bizcred_metadata_pkey PRIMARY KEY (id);


--
-- Name: bizcred_metadata bizcred_metadata_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_metadata
    ADD CONSTRAINT bizcred_metadata_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_pan bizcred_pan_pan_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_pan
    ADD CONSTRAINT bizcred_pan_pan_number_key UNIQUE (pan_number);


--
-- Name: bizcred_pan bizcred_pan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_pan
    ADD CONSTRAINT bizcred_pan_pkey PRIMARY KEY (id);


--
-- Name: bizcred_pan bizcred_pan_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_pan
    ADD CONSTRAINT bizcred_pan_user_id_key UNIQUE (user_id);


--
-- Name: bizcred_phone bizcred_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_phone
    ADD CONSTRAINT bizcred_phone_pkey PRIMARY KEY (id);


--
-- Name: bizcred_relatedcompanyinfo bizcred_relatedcompanyin_related_company_company__1fc3dab3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_relatedcompanyinfo
    ADD CONSTRAINT bizcred_relatedcompanyin_related_company_company__1fc3dab3_uniq UNIQUE (related_company, company_details_id);


--
-- Name: bizcred_relatedcompanyinfo bizcred_relatedcompanyinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_relatedcompanyinfo
    ADD CONSTRAINT bizcred_relatedcompanyinfo_pkey PRIMARY KEY (id);


--
-- Name: bizcred_sanctionedloan bizcred_sanctionedloan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_sanctionedloan
    ADD CONSTRAINT bizcred_sanctionedloan_pkey PRIMARY KEY (id);


--
-- Name: bizcred_velocescore bizcred_velocescore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_velocescore
    ADD CONSTRAINT bizcred_velocescore_pkey PRIMARY KEY (id);


--
-- Name: bizcred_velocescoreapprovalmatrix bizcred_velocescoreapprovalmatrix_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_velocescoreapprovalmatrix
    ADD CONSTRAINT bizcred_velocescoreapprovalmatrix_pkey PRIMARY KEY (id);


--
-- Name: bizcred_velocescoreapprovalmatrix bizcred_velocescoreapprovalmatrix_veloce_score_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_velocescoreapprovalmatrix
    ADD CONSTRAINT bizcred_velocescoreapprovalmatrix_veloce_score_id_key UNIQUE (veloce_score_id);


--
-- Name: bizcred_velocescoremaster bizcred_velocescoremaster_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_velocescoremaster
    ADD CONSTRAINT bizcred_velocescoremaster_pkey PRIMARY KEY (id);


--
-- Name: bizcred_velocescoremaster bizcred_velocescoremaster_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_velocescoremaster
    ADD CONSTRAINT bizcred_velocescoremaster_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: veloce_address veloce_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_address
    ADD CONSTRAINT veloce_address_pkey PRIMARY KEY (id);


--
-- Name: veloce_applicationpaymentstatus veloce_applicationpaymentstatus_application_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationpaymentstatus
    ADD CONSTRAINT veloce_applicationpaymentstatus_application_id_key UNIQUE (application_id);


--
-- Name: veloce_applicationpaymentstatus veloce_applicationpaymentstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationpaymentstatus
    ADD CONSTRAINT veloce_applicationpaymentstatus_pkey PRIMARY KEY (id);


--
-- Name: veloce_applicationspecialvelocemarkup veloce_applicationspecialvelocemarku_loan_application_no_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationspecialvelocemarkup
    ADD CONSTRAINT veloce_applicationspecialvelocemarku_loan_application_no_id_key UNIQUE (loan_application_no_id);


--
-- Name: veloce_applicationspecialvelocemarkup veloce_applicationspecialvelocemarkup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationspecialvelocemarkup
    ADD CONSTRAINT veloce_applicationspecialvelocemarkup_pkey PRIMARY KEY (id);


--
-- Name: veloce_applicationstep1 veloce_applicationstep1_application_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationstep1
    ADD CONSTRAINT veloce_applicationstep1_application_id_key UNIQUE (application_id);


--
-- Name: veloce_applicationstep1 veloce_applicationstep1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationstep1
    ADD CONSTRAINT veloce_applicationstep1_pkey PRIMARY KEY (id);


--
-- Name: veloce_applicationstep2 veloce_applicationstep2_application_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationstep2
    ADD CONSTRAINT veloce_applicationstep2_application_id_key UNIQUE (application_id);


--
-- Name: veloce_applicationstep2 veloce_applicationstep2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationstep2
    ADD CONSTRAINT veloce_applicationstep2_pkey PRIMARY KEY (id);


--
-- Name: veloce_dealerspecialvelocemarkup veloce_dealerspecialvelocemarkup_dealer_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_dealerspecialvelocemarkup
    ADD CONSTRAINT veloce_dealerspecialvelocemarkup_dealer_id_key UNIQUE (dealer_id);


--
-- Name: veloce_dealerspecialvelocemarkup veloce_dealerspecialvelocemarkup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_dealerspecialvelocemarkup
    ADD CONSTRAINT veloce_dealerspecialvelocemarkup_pkey PRIMARY KEY (id);


--
-- Name: veloce_employmentinfo veloce_employmentinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_employmentinfo
    ADD CONSTRAINT veloce_employmentinfo_pkey PRIMARY KEY (id);


--
-- Name: veloce_employmentinfo veloce_employmentinfo_veloce_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_employmentinfo
    ADD CONSTRAINT veloce_employmentinfo_veloce_user_id_key UNIQUE (veloce_user_id);


--
-- Name: veloce_financeschemeconfig veloce_financeschemeconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_financeschemeconfig
    ADD CONSTRAINT veloce_financeschemeconfig_pkey PRIMARY KEY (id);


--
-- Name: veloce_generalinfo veloce_generalinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_generalinfo
    ADD CONSTRAINT veloce_generalinfo_pkey PRIMARY KEY (id);


--
-- Name: veloce_generalinfo veloce_generalinfo_veloce_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_generalinfo
    ADD CONSTRAINT veloce_generalinfo_veloce_user_id_key UNIQUE (veloce_user_id);


--
-- Name: veloce_generalvelocemarkup veloce_generalvelocemarkup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_generalvelocemarkup
    ADD CONSTRAINT veloce_generalvelocemarkup_pkey PRIMARY KEY (id);


--
-- Name: veloce_instutioninfo veloce_instutioninfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_instutioninfo
    ADD CONSTRAINT veloce_instutioninfo_pkey PRIMARY KEY (id);


--
-- Name: veloce_instutioninfo veloce_instutioninfo_veloce_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_instutioninfo
    ADD CONSTRAINT veloce_instutioninfo_veloce_user_id_key UNIQUE (veloce_user_id);


--
-- Name: veloce_invoicestep1 veloce_invoicestep1_application_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_invoicestep1
    ADD CONSTRAINT veloce_invoicestep1_application_id_key UNIQUE (application_id);


--
-- Name: veloce_invoicestep1 veloce_invoicestep1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_invoicestep1
    ADD CONSTRAINT veloce_invoicestep1_pkey PRIMARY KEY (id);


--
-- Name: veloce_kycdocuments veloce_kycdocuments_pan_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_kycdocuments
    ADD CONSTRAINT veloce_kycdocuments_pan_number_key UNIQUE (pan_number);


--
-- Name: veloce_kycdocuments veloce_kycdocuments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_kycdocuments
    ADD CONSTRAINT veloce_kycdocuments_pkey PRIMARY KEY (id);


--
-- Name: veloce_kycdocuments veloce_kycdocuments_veloce_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_kycdocuments
    ADD CONSTRAINT veloce_kycdocuments_veloce_user_id_key UNIQUE (veloce_user_id);


--
-- Name: veloce_lender veloce_lender_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_lender
    ADD CONSTRAINT veloce_lender_pkey PRIMARY KEY (id);


--
-- Name: veloce_loan veloce_loan_application_id_app_reviewed_by_id_6bb99ab7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_loan
    ADD CONSTRAINT veloce_loan_application_id_app_reviewed_by_id_6bb99ab7_uniq UNIQUE (application_id, app_reviewed_by_id);


--
-- Name: veloce_loan veloce_loan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_loan
    ADD CONSTRAINT veloce_loan_pkey PRIMARY KEY (id);


--
-- Name: veloce_reviewedveloceapplication veloce_reviewedveloceapp_veloce_app_id_reviewed_b_f80e5e18_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_reviewedveloceapplication
    ADD CONSTRAINT veloce_reviewedveloceapp_veloce_app_id_reviewed_b_f80e5e18_uniq UNIQUE (veloce_app_id, reviewed_by_id);


--
-- Name: veloce_reviewedveloceapplication veloce_reviewedveloceapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_reviewedveloceapplication
    ADD CONSTRAINT veloce_reviewedveloceapplication_pkey PRIMARY KEY (id);


--
-- Name: veloce_reviewedveloceapplication veloce_reviewedveloceapplication_rejected_by_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_reviewedveloceapplication
    ADD CONSTRAINT veloce_reviewedveloceapplication_rejected_by_id_key UNIQUE (rejected_by_id);


--
-- Name: veloce_veloceapplication veloce_veloceapplication_id_inquiry_id_436dcdbf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_veloceapplication
    ADD CONSTRAINT veloce_veloceapplication_id_inquiry_id_436dcdbf_uniq UNIQUE (id, inquiry_id);


--
-- Name: veloce_veloceapplication veloce_veloceapplication_inquiry_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_veloceapplication
    ADD CONSTRAINT veloce_veloceapplication_inquiry_id_key UNIQUE (inquiry_id);


--
-- Name: veloce_veloceapplication veloce_veloceapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_veloceapplication
    ADD CONSTRAINT veloce_veloceapplication_pkey PRIMARY KEY (id);


--
-- Name: veloce_veloceapplication veloce_veloceapplication_rejected_by_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_veloceapplication
    ADD CONSTRAINT veloce_veloceapplication_rejected_by_id_key UNIQUE (rejected_by_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: bizcred_aadhar_aadhar_number_e64d63b7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_aadhar_aadhar_number_e64d63b7_like ON public.bizcred_aadhar USING btree (aadhar_number varchar_pattern_ops);


--
-- Name: bizcred_additionalcompan_udyog_aadhar_number_ddc504a5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_additionalcompan_udyog_aadhar_number_ddc504a5_like ON public.bizcred_additionalcompanydetails USING btree (udyog_aadhar_number varchar_pattern_ops);


--
-- Name: bizcred_additionalcompanydetails_pan_number_15f4c7a3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_additionalcompanydetails_pan_number_15f4c7a3_like ON public.bizcred_additionalcompanydetails USING btree (pan_number varchar_pattern_ops);


--
-- Name: bizcred_address_user_id_1f8a02b8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_address_user_id_1f8a02b8 ON public.bizcred_address USING btree (user_id);


--
-- Name: bizcred_authadditionalco_aadhar_number_1805c92b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_authadditionalco_aadhar_number_1805c92b_like ON public.bizcred_authadditionalcompanydetails USING btree (aadhar_number varchar_pattern_ops);


--
-- Name: bizcred_authadditionalcompanydetails_pan_number_207b8ca7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_authadditionalcompanydetails_pan_number_207b8ca7_like ON public.bizcred_authadditionalcompanydetails USING btree (pan_number varchar_pattern_ops);


--
-- Name: bizcred_bankstatement_user_id_8cd4d872; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_bankstatement_user_id_8cd4d872 ON public.bizcred_bankstatement USING btree (user_id);


--
-- Name: bizcred_businessfinancial_user_id_3c65382b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_businessfinancial_user_id_3c65382b ON public.bizcred_businessfinancial USING btree (user_id);


--
-- Name: bizcred_gstregistration_gst_number_7d56470f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_gstregistration_gst_number_7d56470f_like ON public.bizcred_gstregistration USING btree (gst_number varchar_pattern_ops);


--
-- Name: bizcred_identification_aadhar_number_f34ce7b5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_identification_aadhar_number_f34ce7b5_like ON public.bizcred_identification USING btree (aadhar_number varchar_pattern_ops);


--
-- Name: bizcred_identification_pan_number_a611b99c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_identification_pan_number_a611b99c_like ON public.bizcred_identification USING btree (pan_number varchar_pattern_ops);


--
-- Name: bizcred_incometaxreturn_user_id_34948e82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_incometaxreturn_user_id_34948e82 ON public.bizcred_incometaxreturn USING btree (user_id);


--
-- Name: bizcred_levelemail_user_id_15c6a4b3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_levelemail_user_id_15c6a4b3 ON public.bizcred_levelemail USING btree (user_id);


--
-- Name: bizcred_pan_pan_number_0b4d5a77_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_pan_pan_number_0b4d5a77_like ON public.bizcred_pan USING btree (pan_number varchar_pattern_ops);


--
-- Name: bizcred_phone_user_id_b58470ff; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_phone_user_id_b58470ff ON public.bizcred_phone USING btree (user_id);


--
-- Name: bizcred_relatedcompanyinfo_company_details_id_cf92cff5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_relatedcompanyinfo_company_details_id_cf92cff5 ON public.bizcred_relatedcompanyinfo USING btree (company_details_id);


--
-- Name: bizcred_relatedcompanyinfo_user_id_0f96d9e8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_relatedcompanyinfo_user_id_0f96d9e8 ON public.bizcred_relatedcompanyinfo USING btree (user_id);


--
-- Name: bizcred_sanctionedloan_user_id_a02ec2e9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bizcred_sanctionedloan_user_id_a02ec2e9 ON public.bizcred_sanctionedloan USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_uid_796e51dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);


--
-- Name: social_auth_usersocialauth_uid_796e51dc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: veloce_address_veloce_user_id_7bb0720b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veloce_address_veloce_user_id_7bb0720b ON public.veloce_address USING btree (veloce_user_id);


--
-- Name: veloce_applicationstep1_coborrower_id_7fc74f8e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veloce_applicationstep1_coborrower_id_7fc74f8e ON public.veloce_applicationstep1 USING btree (coborrower_id);


--
-- Name: veloce_invoicestep1_customer_id_fa0c3d10; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veloce_invoicestep1_customer_id_fa0c3d10 ON public.veloce_invoicestep1 USING btree (customer_id);


--
-- Name: veloce_kycdocuments_pan_number_0df1f24f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veloce_kycdocuments_pan_number_0df1f24f_like ON public.veloce_kycdocuments USING btree (pan_number varchar_pattern_ops);


--
-- Name: veloce_lender_loan_id_b3470ccc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veloce_lender_loan_id_b3470ccc ON public.veloce_lender USING btree (loan_id);


--
-- Name: veloce_lender_user_id_776bc5f3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veloce_lender_user_id_776bc5f3 ON public.veloce_lender USING btree (user_id);


--
-- Name: veloce_loan_app_reviewed_by_id_e332a118; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veloce_loan_app_reviewed_by_id_e332a118 ON public.veloce_loan USING btree (app_reviewed_by_id);


--
-- Name: veloce_loan_application_id_f82043d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veloce_loan_application_id_f82043d1 ON public.veloce_loan USING btree (application_id);


--
-- Name: veloce_reviewedveloceapplication_reviewed_by_id_ceaa84f4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veloce_reviewedveloceapplication_reviewed_by_id_ceaa84f4 ON public.veloce_reviewedveloceapplication USING btree (reviewed_by_id);


--
-- Name: veloce_reviewedveloceapplication_veloce_app_id_ae6730d0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veloce_reviewedveloceapplication_veloce_app_id_ae6730d0 ON public.veloce_reviewedveloceapplication USING btree (veloce_app_id);


--
-- Name: veloce_veloceapplication_user_id_7943b718; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veloce_veloceapplication_user_id_7943b718 ON public.veloce_veloceapplication USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backoffice_profile backoffice_profile_user_id_c625544a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backoffice_profile
    ADD CONSTRAINT backoffice_profile_user_id_c625544a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: backoffice_usercredentials backoffice_usercredentials_user_id_981d1ba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backoffice_usercredentials
    ADD CONSTRAINT backoffice_usercredentials_user_id_981d1ba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_aadhar bizcred_aadhar_user_id_cffc20cd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_aadhar
    ADD CONSTRAINT bizcred_aadhar_user_id_cffc20cd_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_additionalcompanydetails bizcred_additionalco_user_id_b91c6ea7_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_additionalcompanydetails
    ADD CONSTRAINT bizcred_additionalco_user_id_b91c6ea7_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_address bizcred_address_user_id_1f8a02b8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_address
    ADD CONSTRAINT bizcred_address_user_id_1f8a02b8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_authadditionalcompanydetails bizcred_authaddition_user_id_54390640_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_authadditionalcompanydetails
    ADD CONSTRAINT bizcred_authaddition_user_id_54390640_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_b2creport bizcred_b2creport_user_id_15042a90_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_b2creport
    ADD CONSTRAINT bizcred_b2creport_user_id_15042a90_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_bank bizcred_bank_user_id_9e61121f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_bank
    ADD CONSTRAINT bizcred_bank_user_id_9e61121f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_bankstatement bizcred_bankstatement_user_id_8cd4d872_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_bankstatement
    ADD CONSTRAINT bizcred_bankstatement_user_id_8cd4d872_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_businessfinancial bizcred_businessfinancial_user_id_3c65382b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_businessfinancial
    ADD CONSTRAINT bizcred_businessfinancial_user_id_3c65382b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_companydetails bizcred_companydetails_user_id_961334d7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_companydetails
    ADD CONSTRAINT bizcred_companydetails_user_id_961334d7_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_employmentdetail bizcred_employmentdetail_user_id_caf0584d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_employmentdetail
    ADD CONSTRAINT bizcred_employmentdetail_user_id_caf0584d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_financeofferdetail bizcred_financeofferdetail_user_id_c3324838_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_financeofferdetail
    ADD CONSTRAINT bizcred_financeofferdetail_user_id_c3324838_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_general bizcred_general_user_id_fcd6294d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_general
    ADD CONSTRAINT bizcred_general_user_id_fcd6294d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_gstregistration bizcred_gstregistration_user_id_974b2b6a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_gstregistration
    ADD CONSTRAINT bizcred_gstregistration_user_id_974b2b6a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_identification bizcred_identification_user_id_986e9130_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_identification
    ADD CONSTRAINT bizcred_identification_user_id_986e9130_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_incometaxreturn bizcred_incometaxreturn_user_id_34948e82_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_incometaxreturn
    ADD CONSTRAINT bizcred_incometaxreturn_user_id_34948e82_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_lenderdetails bizcred_lenderdetails_user_id_ea80d4f6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_lenderdetails
    ADD CONSTRAINT bizcred_lenderdetails_user_id_ea80d4f6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_levelemail bizcred_levelemail_user_id_15c6a4b3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_levelemail
    ADD CONSTRAINT bizcred_levelemail_user_id_15c6a4b3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_metadata bizcred_metadata_user_id_da29b5c6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_metadata
    ADD CONSTRAINT bizcred_metadata_user_id_da29b5c6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_pan bizcred_pan_user_id_966bb48d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_pan
    ADD CONSTRAINT bizcred_pan_user_id_966bb48d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_phone bizcred_phone_user_id_b58470ff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_phone
    ADD CONSTRAINT bizcred_phone_user_id_b58470ff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_relatedcompanyinfo bizcred_relatedcompa_company_details_id_cf92cff5_fk_bizcred_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_relatedcompanyinfo
    ADD CONSTRAINT bizcred_relatedcompa_company_details_id_cf92cff5_fk_bizcred_c FOREIGN KEY (company_details_id) REFERENCES public.bizcred_companydetails(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_relatedcompanyinfo bizcred_relatedcompanyinfo_user_id_0f96d9e8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_relatedcompanyinfo
    ADD CONSTRAINT bizcred_relatedcompanyinfo_user_id_0f96d9e8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_sanctionedloan bizcred_sanctionedloan_user_id_a02ec2e9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_sanctionedloan
    ADD CONSTRAINT bizcred_sanctionedloan_user_id_a02ec2e9_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_velocescoreapprovalmatrix bizcred_velocescorea_veloce_score_id_71b51df1_fk_bizcred_v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_velocescoreapprovalmatrix
    ADD CONSTRAINT bizcred_velocescorea_veloce_score_id_71b51df1_fk_bizcred_v FOREIGN KEY (veloce_score_id) REFERENCES public.bizcred_velocescore(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bizcred_velocescoremaster bizcred_velocescoremaster_user_id_299bedc1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bizcred_velocescoremaster
    ADD CONSTRAINT bizcred_velocescoremaster_user_id_299bedc1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_address veloce_address_veloce_user_id_7bb0720b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_address
    ADD CONSTRAINT veloce_address_veloce_user_id_7bb0720b_fk_auth_user_id FOREIGN KEY (veloce_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_applicationpaymentstatus veloce_applicationpa_application_id_b785f926_fk_veloce_ve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationpaymentstatus
    ADD CONSTRAINT veloce_applicationpa_application_id_b785f926_fk_veloce_ve FOREIGN KEY (application_id) REFERENCES public.veloce_veloceapplication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_applicationspecialvelocemarkup veloce_applicationsp_loan_application_no__d7c52ca6_fk_veloce_ve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationspecialvelocemarkup
    ADD CONSTRAINT veloce_applicationsp_loan_application_no__d7c52ca6_fk_veloce_ve FOREIGN KEY (loan_application_no_id) REFERENCES public.veloce_veloceapplication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_applicationstep1 veloce_applicationst_application_id_ec2e7ff8_fk_veloce_ve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationstep1
    ADD CONSTRAINT veloce_applicationst_application_id_ec2e7ff8_fk_veloce_ve FOREIGN KEY (application_id) REFERENCES public.veloce_veloceapplication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_applicationstep2 veloce_applicationst_application_id_fcc05526_fk_veloce_ve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationstep2
    ADD CONSTRAINT veloce_applicationst_application_id_fcc05526_fk_veloce_ve FOREIGN KEY (application_id) REFERENCES public.veloce_veloceapplication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_applicationstep1 veloce_applicationstep1_coborrower_id_7fc74f8e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_applicationstep1
    ADD CONSTRAINT veloce_applicationstep1_coborrower_id_7fc74f8e_fk_auth_user_id FOREIGN KEY (coborrower_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_dealerspecialvelocemarkup veloce_dealerspecial_dealer_id_3f87896d_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_dealerspecialvelocemarkup
    ADD CONSTRAINT veloce_dealerspecial_dealer_id_3f87896d_fk_auth_user FOREIGN KEY (dealer_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_employmentinfo veloce_employmentinfo_veloce_user_id_54cc332c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_employmentinfo
    ADD CONSTRAINT veloce_employmentinfo_veloce_user_id_54cc332c_fk_auth_user_id FOREIGN KEY (veloce_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_generalinfo veloce_generalinfo_veloce_user_id_14a4439f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_generalinfo
    ADD CONSTRAINT veloce_generalinfo_veloce_user_id_14a4439f_fk_auth_user_id FOREIGN KEY (veloce_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_instutioninfo veloce_instutioninfo_veloce_user_id_78d93308_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_instutioninfo
    ADD CONSTRAINT veloce_instutioninfo_veloce_user_id_78d93308_fk_auth_user_id FOREIGN KEY (veloce_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_invoicestep1 veloce_invoicestep1_application_id_af849268_fk_veloce_ve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_invoicestep1
    ADD CONSTRAINT veloce_invoicestep1_application_id_af849268_fk_veloce_ve FOREIGN KEY (application_id) REFERENCES public.veloce_veloceapplication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_invoicestep1 veloce_invoicestep1_customer_id_fa0c3d10_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_invoicestep1
    ADD CONSTRAINT veloce_invoicestep1_customer_id_fa0c3d10_fk_auth_user_id FOREIGN KEY (customer_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_kycdocuments veloce_kycdocuments_veloce_user_id_52a9e11b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_kycdocuments
    ADD CONSTRAINT veloce_kycdocuments_veloce_user_id_52a9e11b_fk_auth_user_id FOREIGN KEY (veloce_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_lender veloce_lender_loan_id_b3470ccc_fk_veloce_loan_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_lender
    ADD CONSTRAINT veloce_lender_loan_id_b3470ccc_fk_veloce_loan_id FOREIGN KEY (loan_id) REFERENCES public.veloce_loan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_lender veloce_lender_user_id_776bc5f3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_lender
    ADD CONSTRAINT veloce_lender_user_id_776bc5f3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_loan veloce_loan_app_reviewed_by_id_e332a118_fk_veloce_re; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_loan
    ADD CONSTRAINT veloce_loan_app_reviewed_by_id_e332a118_fk_veloce_re FOREIGN KEY (app_reviewed_by_id) REFERENCES public.veloce_reviewedveloceapplication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_loan veloce_loan_application_id_f82043d1_fk_veloce_ve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_loan
    ADD CONSTRAINT veloce_loan_application_id_f82043d1_fk_veloce_ve FOREIGN KEY (application_id) REFERENCES public.veloce_veloceapplication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_reviewedveloceapplication veloce_reviewedveloc_rejected_by_id_28852d53_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_reviewedveloceapplication
    ADD CONSTRAINT veloce_reviewedveloc_rejected_by_id_28852d53_fk_auth_user FOREIGN KEY (rejected_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_reviewedveloceapplication veloce_reviewedveloc_reviewed_by_id_ceaa84f4_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_reviewedveloceapplication
    ADD CONSTRAINT veloce_reviewedveloc_reviewed_by_id_ceaa84f4_fk_auth_user FOREIGN KEY (reviewed_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_reviewedveloceapplication veloce_reviewedveloc_veloce_app_id_ae6730d0_fk_veloce_ve; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_reviewedveloceapplication
    ADD CONSTRAINT veloce_reviewedveloc_veloce_app_id_ae6730d0_fk_veloce_ve FOREIGN KEY (veloce_app_id) REFERENCES public.veloce_veloceapplication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_veloceapplication veloce_veloceapplica_rejected_by_id_33b56e8f_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_veloceapplication
    ADD CONSTRAINT veloce_veloceapplica_rejected_by_id_33b56e8f_fk_auth_user FOREIGN KEY (rejected_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: veloce_veloceapplication veloce_veloceapplication_user_id_7943b718_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veloce_veloceapplication
    ADD CONSTRAINT veloce_veloceapplication_user_id_7943b718_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

