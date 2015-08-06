#!/usr/bin/env bash

rm sql_data/p_terrain_slope.sql
raster2pgsql -s 4236 rasters/take2/slope.tif p_terrain_slope > sql_data/p_terrain_slope.sql
psql -f sql_data/p_terrain_slope.sql quito
rm sql_data/p_terrain_slope.sql

rm sql_data/p_terrain_topo.sql
raster2pgsql -s 4236 rasters/take2/topo.tif p_terrain_topo > sql_data/p_terrain_topo.sql
psql -f sql_data/p_terrain_topo.sql quito
rm sql_data/p_terrain_topo.sql