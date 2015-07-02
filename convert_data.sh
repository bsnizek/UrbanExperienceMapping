#!/usr/bin/env bash

psql -U postgres -c "DROP DATABASE quito;"
psql -U postgres -c "CREATE DATABASE quito WITH owner postgres TEMPLATE template0"
psql -c "CREATE EXTENSION IF NOT EXISTS postgis;" quito

psql -f sql_data/experience_points_raw.sql quito
psql -f sql_data/routes.sql quito

echo "socialgpsnetworks: import and db buildup finished"