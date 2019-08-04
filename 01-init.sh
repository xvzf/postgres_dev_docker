#!/bin/bash
set -eu

MULTI_CREATE="rocketlan_test rocketlan_user rocketlan_api random"

# Creates a database and a user (same name as db) without a password (!!!)
function create_db_and_user() {
	local to_create=$1
	echo "[+] Creating user and database '$to_create'"
	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-eosql
	    CREATE USER $to_create;
	    CREATE DATABASE $to_create;
	    GRANT ALL PRIVILEGES ON DATABASE $to_create TO $to_create;
eosql
}

for to_create in $MULTI_CREATE; do
    create_db_and_user $to_create
done
