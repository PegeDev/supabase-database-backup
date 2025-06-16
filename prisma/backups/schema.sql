

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




ALTER SCHEMA "public" OWNER TO "postgres";


CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE TYPE "public"."ROLE" AS ENUM (
    'super_admin',
    'admin',
    'user'
);


ALTER TYPE "public"."ROLE" OWNER TO "postgres";


CREATE TYPE "public"."TemplateType" AS ENUM (
    'transaction_update',
    'otp_message'
);


ALTER TYPE "public"."TemplateType" OWNER TO "postgres";


CREATE TYPE "public"."TransactionStatus" AS ENUM (
    'scheduled',
    'pickup_successful',
    'on_progress_washing',
    'on_progress_drying',
    'on_progress_ironing',
    'scheduled_for_delivery',
    'delivered',
    'cancelled',
    'out_for_delivery',
    'delivery_failed',
    'pickup_failed'
);


ALTER TYPE "public"."TransactionStatus" OWNER TO "postgres";


CREATE TYPE "public"."TypeService" AS ENUM (
    'META_CLOUD',
    'FONNTE'
);


ALTER TYPE "public"."TypeService" OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."ChatTemplate" (
    "id" "text" NOT NULL,
    "name" "text" NOT NULL,
    "content" "text" NOT NULL,
    "category" "public"."TransactionStatus",
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdBy" "text" NOT NULL,
    "variables" "text"[],
    "type" "public"."TemplateType" DEFAULT 'transaction_update'::"public"."TemplateType" NOT NULL
);


ALTER TABLE "public"."ChatTemplate" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."PhoneChangeRequest" (
    "id" "text" NOT NULL,
    "userId" "text" NOT NULL,
    "newPhone" "text" NOT NULL,
    "otp" "text",
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE "public"."PhoneChangeRequest" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."Service" (
    "id" "text" NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "banner" "text" NOT NULL,
    "price" integer NOT NULL,
    "unitType" "text" DEFAULT 'kg'::"text"
);


ALTER TABLE "public"."Service" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."_prisma_migrations" (
    "id" character varying(36) NOT NULL,
    "checksum" character varying(64) NOT NULL,
    "finished_at" timestamp with time zone,
    "migration_name" character varying(255) NOT NULL,
    "logs" "text",
    "rolled_back_at" timestamp with time zone,
    "started_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "applied_steps_count" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "public"."_prisma_migrations" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."api_services" (
    "id" "text" NOT NULL,
    "type" "public"."TypeService" NOT NULL,
    "data" "jsonb" NOT NULL,
    "isActive" boolean DEFAULT false
);


ALTER TABLE "public"."api_services" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."delivery_proofs" (
    "id" "text" NOT NULL,
    "transactionId" "text" NOT NULL,
    "image" "text" NOT NULL,
    "receivedBy" "text" NOT NULL,
    "receivedAt" timestamp(3) without time zone NOT NULL,
    "notes" "text",
    "signature" "text",
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE "public"."delivery_proofs" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."payment_methods" (
    "id" "text" NOT NULL,
    "name" "text" NOT NULL
);


ALTER TABLE "public"."payment_methods" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."phone_verified_tokens" (
    "id" "text" NOT NULL,
    "userId" "text" NOT NULL,
    "token" "text" NOT NULL,
    "expiredAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE "public"."phone_verified_tokens" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."sessions" (
    "id" "text" NOT NULL,
    "userId" "text" NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE "public"."sessions" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."status_histories" (
    "id" "text" NOT NULL,
    "transaction_id" "text" NOT NULL,
    "status" "public"."TransactionStatus" NOT NULL,
    "notes" "text",
    "changedBy" "text",
    "metadata" "jsonb",
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE "public"."status_histories" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."transactions" (
    "id" "text" NOT NULL,
    "code" "text" NOT NULL,
    "service_id" "text" NOT NULL,
    "payment_id" "text",
    "amount" integer NOT NULL,
    "userId" "text",
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "typeUnit" "text" NOT NULL,
    "actualUnit" double precision,
    "estimatedUnit" double precision NOT NULL,
    "schedulePickup" timestamp(3) without time zone,
    "currentStatus" "public"."TransactionStatus" DEFAULT 'scheduled'::"public"."TransactionStatus" NOT NULL,
    "scheduleDelivery" timestamp(3) without time zone,
    "customer" "jsonb",
    "rescheduleCount" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "public"."transactions" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."users" (
    "id" "text" NOT NULL,
    "username" "text" NOT NULL,
    "fullName" "text" NOT NULL,
    "password" "text",
    "avatar" "text",
    "phone" "text" NOT NULL,
    "role" "public"."ROLE" DEFAULT 'user'::"public"."ROLE" NOT NULL,
    "phoneVerified" boolean DEFAULT false NOT NULL,
    "address" "text",
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE "public"."users" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."whatsapp_configs" (
    "id" "text" NOT NULL,
    "name" "text" NOT NULL,
    "value" "text",
    "valueJson" "jsonb",
    "valueArray" "jsonb"[],
    "isActive" boolean NOT NULL
);


ALTER TABLE "public"."whatsapp_configs" OWNER TO "postgres";


ALTER TABLE ONLY "public"."ChatTemplate"
    ADD CONSTRAINT "ChatTemplate_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."PhoneChangeRequest"
    ADD CONSTRAINT "PhoneChangeRequest_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."Service"
    ADD CONSTRAINT "Service_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."_prisma_migrations"
    ADD CONSTRAINT "_prisma_migrations_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."api_services"
    ADD CONSTRAINT "api_services_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."delivery_proofs"
    ADD CONSTRAINT "delivery_proofs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."payment_methods"
    ADD CONSTRAINT "payment_methods_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."phone_verified_tokens"
    ADD CONSTRAINT "phone_verified_tokens_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."sessions"
    ADD CONSTRAINT "sessions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."status_histories"
    ADD CONSTRAINT "status_histories_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."transactions"
    ADD CONSTRAINT "transactions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."whatsapp_configs"
    ADD CONSTRAINT "whatsapp_configs_pkey" PRIMARY KEY ("id");



CREATE INDEX "ChatTemplate_category_idx" ON "public"."ChatTemplate" USING "btree" ("category");



CREATE INDEX "ChatTemplate_isActive_idx" ON "public"."ChatTemplate" USING "btree" ("isActive");



CREATE INDEX "ChatTemplate_type_idx" ON "public"."ChatTemplate" USING "btree" ("type");



CREATE UNIQUE INDEX "PhoneChangeRequest_newPhone_key" ON "public"."PhoneChangeRequest" USING "btree" ("newPhone");



CREATE INDEX "PhoneChangeRequest_userId_idx" ON "public"."PhoneChangeRequest" USING "btree" ("userId");



CREATE UNIQUE INDEX "PhoneChangeRequest_userId_key" ON "public"."PhoneChangeRequest" USING "btree" ("userId");



CREATE UNIQUE INDEX "delivery_proofs_transactionId_key" ON "public"."delivery_proofs" USING "btree" ("transactionId");



CREATE UNIQUE INDEX "phone_verified_tokens_userId_key" ON "public"."phone_verified_tokens" USING "btree" ("userId");



CREATE UNIQUE INDEX "transactions_code_key" ON "public"."transactions" USING "btree" ("code");



CREATE UNIQUE INDEX "users_phone_key" ON "public"."users" USING "btree" ("phone");



CREATE UNIQUE INDEX "users_username_key" ON "public"."users" USING "btree" ("username");



CREATE UNIQUE INDEX "whatsapp_configs_name_key" ON "public"."whatsapp_configs" USING "btree" ("name");



ALTER TABLE ONLY "public"."PhoneChangeRequest"
    ADD CONSTRAINT "PhoneChangeRequest_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."delivery_proofs"
    ADD CONSTRAINT "delivery_proofs_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "public"."transactions"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."phone_verified_tokens"
    ADD CONSTRAINT "phone_verified_tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."sessions"
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."status_histories"
    ADD CONSTRAINT "status_histories_transaction_id_fkey" FOREIGN KEY ("transaction_id") REFERENCES "public"."transactions"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."transactions"
    ADD CONSTRAINT "transactions_payment_id_fkey" FOREIGN KEY ("payment_id") REFERENCES "public"."payment_methods"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."transactions"
    ADD CONSTRAINT "transactions_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."Service"("id") ON UPDATE CASCADE ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."transactions"
    ADD CONSTRAINT "transactions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;





ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


REVOKE USAGE ON SCHEMA "public" FROM PUBLIC;
























































































































































































































RESET ALL;
