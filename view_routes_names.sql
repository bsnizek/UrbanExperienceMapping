SET client_min_messages TO WARNING;
CREATE MATERIALIZED VIEW route_names AS
  SELECT * FROM routes;