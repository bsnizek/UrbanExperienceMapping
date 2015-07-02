-- --
-- getDistanceToNearest(dot geometry, layer_name varchar)
-- --
CREATE OR REPLACE FUNCTION getDistanceToNearest(dot geometry, indicator_table_name varchar)
  RETURNS float AS
  $BODY$DECLARE

    s varchar;
    d float;
    q char := '''';


  BEGIN

    s := 'SELECT ST_Distance_Sphere(ST_SetSRID(geom, 4326), ST_SetSRID(ST_Point(' ||
         ST_X(dot) || ',' || ST_Y(dot) ||'), 4326)) AS dist FROM ' ||
         indicator_table_name || ' ORDER BY dist ASC LIMIT 1';

    EXECUTE s INTO d;

    RETURN d;

  END;$BODY$
LANGUAGE plpgsql VOLATILE
COST 1;



