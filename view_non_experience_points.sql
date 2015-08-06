SET client_min_messages TO WARNING;
DROP MATERIALIZED VIEW IF EXISTS non_experience_points;

DROP SEQUENCE IF EXISTS non_experience_points_guid_seq;
CREATE SEQUENCE non_experience_points_guid_seq START 1;

CREATE MATERIALIZED VIEW non_experience_points AS
  SELECT
    nextval('non_experience_points_guid_seq') AS guid,
    geom,
    name AS route_id,
    false AS experience_point
  --
  --     Geometry(ST_SetSRID(geom,4326)) AS geom
  FROM getNonExperiencePoints();