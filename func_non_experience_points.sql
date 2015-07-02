-- --
-- getProjectedPointOnRespectiveRoute(point_record RECORD)
--
--
---
-- DROP FUNCTION getnonexperiencepoints();

CREATE OR REPLACE FUNCTION getNonExperiencePoints()
  RETURNS SETOF points_projected AS
  $BODY$DECLARE

    s varchar := '';
    q char := '''';
    g geometry;
    l float;
    r routes;
    pp points_projected;
    distance float := 100.0;
    i integer:=0;
    d float;
    x float := 0.0;
    dot_area geometry;
    ppp geometry;
    cntr int2:=0;
    route_as_line geometry;

  BEGIN

    FOR r IN SELECT * FROM routes LOOP

      x:=0.0;

      SELECT ST_Length_Spheroid(r.geom, 'SPHEROID["WGS 84",6378137,298.257223563]') INTO l;
      SELECT ST_Buffer(geom, (distance/2)-0.001) FROM points_projected WHERE respondent = r.name INTO dot_area;

      d := l / distance;
      route_as_line := ST_MakeLine(ST_LineMerge(r.geom));

      -- take first point here

      WHILE x < l LOOP
        cntr := cntr +1;
        x := x + distance;
        IF x < l
        THEN
          IF x/d <= 100.0 THEN
            ppp = ST_LineInterpolatePoint(route_as_line, x/d/100);
            -- RAISE NOTICE '%', ppp;
            IF ST_contains(dot_area,ppp)
            THEN
              pp.guid = cntr;
              pp.geom = ppp;
              pp.respondent = r.name;
              pp.experience_point = false;
              RETURN NEXT pp;
            END IF;
          END IF;
        END IF;
      END LOOP;

    END LOOP;

    RETURN;
  END;$BODY$
LANGUAGE plpgsql VOLATILE
COST 1;


