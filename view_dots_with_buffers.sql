DROP MATERIALIZED VIEW IF EXISTS buffers;
CREATE MATERIALIZED VIEW buffers AS
  SELECT
    guid,
    ST_SetSRID(ST_Buffer(ST_SetSRID(geom, 4326)::geography, 49.999)::geometry, 900913) as geom

  FROM raw_dots;
