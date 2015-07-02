
CREATE OR REPLACE FUNCTION getLengthInsideBuffer(dot geometry, radius float, indicator_table_name varchar)
  RETURNS float AS
  $BODY$DECLARE

    b float;
    sss varchar;
    r geometry;
    intersection float;

  BEGIN

    b := ST_Buffer(ST_SetSRID(dot, 4326)::geography, radius)::geometry;

    sss := 'SELECT geom FROM ' || indicator_table_name || ' WHERE ' ||
           'ST_Distance(ST_SetSRID(ST_Point(' || ST_X(dot) || ', ' || ST_Y(dot) || '), 4326)::geography, ' ||
           'ST_SetSRID(geom, 4326)::geography)::float < ' || radius;

    FOR r IN EXECUTE sss LOOP
      intersection := intersection + ST_Area(ST_Intersection(b, ST_SetSRID(r, 4326))::geography);
    END LOOP;

    RETURN 0.0;

  END;$BODY$
LANGUAGE plpgsql VOLATILE
COST 1;