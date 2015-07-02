DROP MATERIALIZED VIEW IF EXISTS points_projected CASCADE;

DROP SEQUENCE IF EXISTS points_projected_guid_seq;
CREATE SEQUENCE points_projected_guid_seq START 1;

CREATE MATERIALIZED VIEW points_projected AS
SELECT

  nextval('points_projected_guid_seq') AS guid,

  getProjectedPointOnRespectiveRoute(geom, respondent, 'name') AS geom,
  respondent,
  true AS experience_point

FROM experience_points_raw;

DROP INDEX IF EXISTS points_projected_guid;
CREATE UNIQUE INDEX points_projected_guid
ON points_projected (guid);

DROP INDEX IF EXISTS points_projected_respondent;
CREATE UNIQUE INDEX points_projected_respondent
ON points_projected (respondent);

DROP INDEX IF EXISTS gidx_points_projected;
CREATE INDEX gidx_points_projected ON points_projected USING GIST (geom);
