-- --
-- getProjectedPointOnRespectiveRoute(point_record RECORD)
--
--
-- --
CREATE OR REPLACE FUNCTION getProjectedPointOnRespectiveRoute(p geometry, dot_name varchar, route_id_field_name varchar)
  RETURNS geometry AS
  $BODY$DECLARE

    s varchar := '';
    q char := '''';
    g geometry;

  BEGIN

    s := s || 'SELECT geom FROM routes WHERE ' || route_id_field_name || ' = ' || q || dot_name || q || ' LIMIT 1';

    EXECUTE s INTO g;

    RETURN ST_ClosestPoint(ST_MakeLine(ST_LineMerge(g)), p);

  END;$BODY$
LANGUAGE plpgsql VOLATILE
COST 1;