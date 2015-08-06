#!/usr/bin/env bash

psql -U postgres -c "DROP DATABASE quito;"
psql -U postgres -c "CREATE DATABASE quito WITH owner postgres TEMPLATE template0"
psql -c "CREATE EXTENSION IF NOT EXISTS postgis;" quito

./import_layers.sh
./import_rasters.sh
./import_geometry.sh

echo "Quito: geodata imported"

psql -f func_count_features_within_buffer.sql quito
psql -f func_get_closest_geometry.sql quito
psql -f func_get_distance_to_nearest.sql quito
psql -f func_get_distance_to_one_point.sql quito
psql -f func_get_length_inside_buffer.sql quito
psql -f func_get_overlap_within_buffer.sql quito
psql -f func_get_raster_value.sql quito
psql -f func_get_value_from_nearest_feature.sql quito

psql -f func_get_r_c_identifier.sql quito
psql -f view_experience_points_raw.sql quito
psql -f func_get_projected_point_on_respective_route.sql quito
psql -f view_points_projected.sql quito
psql -f func_get_non_experience_points.sql quito
psql -f view_non_experience_points.sql quito
psql -f view_raw_dots.sql quito
psql -f view_dots_raster.sql quito
psql -f view_dots_vector.sql quito
psql -f view_dots.sql quito

echo "Quito: import and db buildup finished"

