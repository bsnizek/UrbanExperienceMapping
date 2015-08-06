#!/usr/bin/env bash

psql -c "DROP MATERIALIZED VIEW dots;" quito
psql -c "DROP MATERIALIZED VIEW dots_vector CASCADE;" quito
psql -c "DROP MATERIALIZED VIEW dots_raster;" quito
psql -c "DROP MATERIALIZED VIEW raw_dots CASCADE;" quito
psql -c "DROP MATERIALIZED VIEW pre_dots CASCADE;" quito
psql -c "DROP MATERIALIZED VIEW non_experience_points;" quito
psql -c "DROP FUNCTION getNonExperiencePoints()" quito
psql -c "DROP MATERIALIZED VIEW points_projected CASCADE;" quito
psql -c "DROP FUNCTION getProjectedPointOnRespectiveRoute(p geometry, dot_name varchar, route_id_field_name varchar)" quito

psql -f func_count_features_within_buffer.sql quito
psql -f func_get_closest_geometry.sql quito
psql -f func_get_distance_to_nearest.sql quito
psql -f func_get_distance_to_one_point.sql quito
psql -f func_get_length_inside_buffer.sql quito
psql -f func_get_overlap_within_buffer.sql quito
psql -f func_get_raster_value.sql quito

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