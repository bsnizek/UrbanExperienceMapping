CREATE OR REPLACE FUNCTION getRasterValue(dot geometry, indicator_table_name varchar)
  RETURNS float AS
  $BODY$DECLARE
    v float;
  BEGIN
    EXECUTE 'SELECT ST_Value(ST_SetSRID(rast, 4326), ST_SetSRID(ST_Point(' ||
            ST_X(dot) || ',' ||
            ST_Y(dot) || '), 4326))::float FROM ' ||
            indicator_table_name INTO v;
    RETURN v;
  END;$BODY$
LANGUAGE plpgsql VOLATILE
COST 1;