SET client_min_messages TO WARNING;
DROP MATERIALIZED VIEW IF EXISTS buffers;

CREATE MATERIALIZED VIEW buffers AS

  SELECT

    guid,
    ST_SetSRID(ST_Buffer(ST_SetSRID(geom, 4326)::geography, 49.999)::geometry, 4326) as geom,
    route_id

  FROM raw_dots;
