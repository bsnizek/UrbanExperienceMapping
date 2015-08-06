-- --
-- getClosestGeometry(g geometry, v varchar)
--
-- Returns the closest geometry of table v for geometry g.
--
-- (c) Bernhard Snizek, informal.city, b@snizek.com
--
--  --
SET client_min_messages TO WARNING;

DROP TYPE IF EXISTS geometry_distance CASCADE;

CREATE TYPE geometry_distance AS (
  geom geometry,
  dist float
);

CREATE OR REPLACE FUNCTION getClosestGeometry(g1 geometry, feature varchar)
  RETURNS geometry AS

  $BODY$DECLARE

    r geometry_distance%rowtype;
    s varchar := '';
    nextline varchar := e'\r';
    q varchar := '''';

  BEGIN

    s := s || 'SELECT geom,' || nextline ||
         'ST_Distance_Sphere(' || nextline ||
         'ST_SetSRID(geom, 4326),' || nextline ||
         'ST_SetSRID(ST_PointFromText(' || q || ST_AsText(g1) || q || ')::geometry, 4326))' || nextline ||
         'AS dist' || nextline ||
         'FROM routes' || nextline ||
         'ORDER BY dist ASC' || nextline ||
         'LIMIT 1';

    EXECUTE s INTO r;

    RETURN r.geom;

  END;$BODY$
LANGUAGE plpgsql VOLATILE
COST 1;