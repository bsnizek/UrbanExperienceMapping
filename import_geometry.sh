#!/usr/bin/env bash

shp2pgsql -s 4326 gis_data/experience_locations.shp > sql_data/experience_locations.sql
shp2pgsql -s 4326 gis_data/routes.shp > sql_data/routes.sql

psql -f sql_data/experience_locations.sql quito
psql -f sql_data/routes.sql quito