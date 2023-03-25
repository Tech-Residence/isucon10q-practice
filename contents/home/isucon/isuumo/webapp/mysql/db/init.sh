#!/bin/bash
set -xe
set -o pipefail

CURRENT_DIR=$(cd $(dirname $0);pwd)
export ESTATE_MYSQL_HOST=${ESTATE_MYSQL_HOST:-127.0.0.1}
export ESTATE_MYSQL_PORT=${ESTATE_MYSQL_PORT:-3306}
export ESTATE_MYSQL_USER=${ESTATE_MYSQL_USER:-isucon}
export ESTATE_MYSQL_DBNAME=${ESTATE_MYSQL_DBNAME:-estate}
export ESTATE_MYSQL_PWD=${ESTATE_MYSQL_PASS:-isucon}
export CHAIR_MYSQL_HOST=${CHAIR_MYSQL_HOST:-127.0.0.1}
export CHAIR_MYSQL_PORT=${CHAIR_MYSQL_PORT:-3306}
export CHAIR_MYSQL_USER=${CHAIR_MYSQL_USER:-isucon}
export CHAIR_MYSQL_DBNAME=${CHAIR_MYSQL_DBNAME:-chair}
export CHAIR_MYSQL_PWD=${CHAIR_MYSQL_PASS:-isucon}
export LANG="C.UTF-8"
cd $CURRENT_DIR

cat 01_EstateSchema.sql 1_DummyEstateData.sql | mysql --defaults-file=/dev/null -h $ESTATE_MYSQL_HOST -P $ESTATE_MYSQL_PORT -u $ESTATE_MYSQL_USER $ESTATE_MYSQL_DBNAME
cat 02_ChairSchema.sql 2_DummyChairData.sql | mysql --defaults-file=/dev/null -h $CHAIR_MYSQL_HOST -P $CHAIR_MYSQL_PORT -u $CHAIR_MYSQL_USER $CHAIR_MYSQL_DBNAME
