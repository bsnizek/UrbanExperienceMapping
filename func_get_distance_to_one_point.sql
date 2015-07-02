
-- --
--
-- getDistanceToOnePoint(dot geometry, layer_name varchar)
--
-- Returns the distance between the dot and the geometry of the first row in the table <layer_name>.
-- The returned value is in metres.
--
-- --
CREATE OR REPLACE FUNCTION getDistanceToOnePoint(dot geometry, indicator_table_name varchar)
  RETURNS float AS
  $BODY$DECLARE

    g geometry;

  BEGIN

    EXECUTE 'SELECT geom from ' || indicator_table_name || ' LIMIT 1;' INTO g;
    return ST_Distance_Sphere(ST_SetSRID(g,4326), ST_SetSRID(dot,4326));

  END;$BODY$
LANGUAGE plpgsql VOLATILE
COST 1;