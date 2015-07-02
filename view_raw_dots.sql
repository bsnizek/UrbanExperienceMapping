DROP MATERIALIZED VIEW IF EXISTS raw_dots CASCADE;
DROP MATERIALIZED VIEW IF EXISTS pre_dots CASCADE;

DROP SEQUENCE IF EXISTS dots_guid_seq;
CREATE SEQUENCE dots_guid_seq START 1;

CREATE MATERIALIZED VIEW pre_dots AS
  SELECT
    geom::geometry,
    true::bool AS is_experience,
    respondent as route_id
  FROM points_projected
  UNION
  SELECT
    geom::geometry,
    false::bool AS is_experience,
    route_id AS route_id
  FROM non_experience_points;

CREATE MATERIALIZED VIEW raw_dots AS
  SELECT
    nextval('dots_guid_seq'::regclass) AS guid,
    *
  from pre_dots;

DROP INDEX IF EXISTS gidx_raw_dots;
CREATE INDEX gidx_raw_dots ON raw_dots USING GIST (geom);