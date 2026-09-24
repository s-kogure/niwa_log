#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE ROLE authenticator LOGIN PASSWORD '$AUTHENTICATOR_PASSWORD' NOINHERIT;
  GRANT authenticated TO authenticator;
EOSQL