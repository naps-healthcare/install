#! /bin/bash

export PGPASSWORD=$POSTGRESQL_PASSWORD

SCRIPT_DIR=''
pushd "$(dirname "$(readlink -f "$BASH_SOURCE")")" > /dev/null && {
    SCRIPT_DIR="$PWD"
    popd > /dev/null
}   

psql -h $POSTGRESQL_SERVICE -d $POSTGRESQL_DATABASE -U $POSTGRESQL_USER -w < ${SCRIPT_DIR}/patient_with_data.sql
