SET client_min_messages TO WARNING;
DROP MATERIALIZED VIEW IF EXISTS dots_raster;
CREATE MATERIALIZED VIEW dots_raster AS
  SELECT

    guid,

    getRasterValue(geom, 'p_terrain_slope') AS slope,

    getRasterValue(geom, 'p_terrain_topo') AS elevation

  FROM raw_dots;