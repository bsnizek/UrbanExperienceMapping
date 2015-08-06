SET client_min_messages TO WARNING;
DROP MATERIALIZED VIEW IF EXISTS experience_points_raw CASCADE;

CREATE MATERIALIZED VIEW experience_points_raw AS
SELECT

  geom,
  name as image_name,
  getRCIdentifier(trip_id, cyclist_id) AS name

FROM experience_locations ORDER BY image_name;