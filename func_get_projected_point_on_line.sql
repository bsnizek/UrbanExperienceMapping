-- --
-- getProjectedPointOnLine(p geometry, )
-- --
CREATE OR REPLACE FUNCTION getProjectedPointOnLine(dot geometry, ln geometry)
  RETURNS geometry AS
  $BODY$DECLARE

    route_row record;
    p geometry;

  BEGIN


    p := ST_ClosestPoint(dot, ln);


    RETURN p;

  END;$BODY$
LANGUAGE plpgsql VOLATILE
COST 1;