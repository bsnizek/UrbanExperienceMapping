SET client_min_messages TO WARNING;
DROP MATERIALIZED VIEW IF EXISTS dots_patch;
CREATE MATERIALIZED VIEW dots_patch AS
  SELECT
    guid,
    route_id
  FROM raw_dots;

DROP INDEX IF EXISTS dots_patch_guid;
CREATE UNIQUE INDEX dots_patch_guid
ON dots_patch (guid);