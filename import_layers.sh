#!/usr/bin/env bash

# shp2pgsql -s 900913 gis_data/experience_points_raw public.experience_points_raw > sql_data/experience_points_raw.sql
# shp2pgsql -s 900913 gis_data/routes public.routes > sql_data/routes.sql

shp2pgsql -s 900913 gis_data/layers/a_centrality.shp                >sql_data/layers/a_centrality.sql
shp2pgsql -s 900913 gis_data/layers/b_bike_parking.shp              >sql_data/layers/b_bike_parking.sql
shp2pgsql -s 900913 gis_data/layers/c_highways.shp                  >sql_data/layers/c_highways.sql
shp2pgsql -s 900913 gis_data/layers/d_bike_stations.shp             >sql_data/layers/d_bike_stations.sql
shp2pgsql -s 900913 gis_data/layers/e_bike_roads.shp                >sql_data/layers/e_bike_roads.sql
shp2pgsql -s 900913 gis_data/layers/f_intersections.shp             >sql_data/layers/f_intersections.sql
shp2pgsql -s 900913 gis_data/layers/g_bus_stops.shp                 >sql_data/layers/g_bus_stops.sql
shp2pgsql -s 900913 gis_data/layers/h_accidents.shp                 >sql_data/layers/h_accidents.sql
shp2pgsql -s 900913 gis_data/layers/i_accidents_deadly.shp          >sql_data/layers/i_accidents_deadly.sql
shp2pgsql -s 900913 gis_data/layers/j_brts.shp                      >sql_data/layers/j_brts.sql
shp2pgsql -s 900913 gis_data/layers/k_zebra_crossings.sql           >sql_data/layers/k_zebra_crossings.sql
shp2pgsql -s 900913 gis_data/layers/l_speedbumps.sql                >sql_data/layers/l_speedbumps.sql
shp2pgsql -s 900913 gis_data/layers/m_traffic_signals.sql           >sql_data/layers/m_traffic_signals.sql
shp2pgsql -s 900913 gis_data/layers/n_lateral_squares.sql           >sql_data/layers/n_lateral_squares.sql
shp2pgsql -s 900913 gis_data/layers/o_green_areas.sql               >sql_data/layers/o_green_areas.sql
shp2pgsql -s 900913 gis_data/layers/q_parking.sql                   >sql_data/layers/q_parking.sql
shp2pgsql -s 900913 gis_data/layers/r_oneways.sql                   >sql_data/layers/r_oneways.sql
shp2pgsql -s 900913 gis_data/layers/s_shops.sql                     >sql_data/layers/s_shops.sql
shp2pgsql -s 900913 gis_data/layers/t_land_use.sql                  >sql_data/layers/t_land_use.sql
shp2pgsql -s 900913 gis_data/layers/u_education.sql                  >sql_data/layers/u_education.sql

psql -f sql_data/layers/a_centrality.sql quito
psql -f sql_data/layers/b_bike_parking.sql quito
psql -f sql_data/layers/c_highways.sql quito
psql -f sql_data/layers/d_bike_stations.sql quito
psql -f sql_data/layers/e_bike_roads.sql quito
psql -f sql_data/layers/f_intersections.sql quito
psql -f sql_data/layers/g_bus_stops.sql quito
psql -f sql_data/layers/h_accidents.sql quito
psql -f sql_data/layers/i_accidents_deadly.sql quito
psql -f sql_data/layers/j_brts.sql quito
psql -f sql_data/layers/k_zebra_crossings.sql quito
psql -f sql_data/layers/l_speedbumps.sql quito
psql -f sql_data/layers/m_traffic_signals.sql quito
psql -f sql_data/layers/n_lateral_squares.sql quito
psql -f sql_data/layers/o_green_areas.sql quito
psql -f sql_data/layers/q_parking.sql quito
psql -f sql_data/layers/r_oneways.sql quito
psql -f sql_data/layers/s_shops.sql quito
psql -f sql_data/layers/t_land_use.sql quito
psql -f sql_data/layers/u_education.sql quito


