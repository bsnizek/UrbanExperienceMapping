CREATE OR REPLACE FUNCTION getValueFromNearestFeatureVarchar(dot geometry, indicator_table_name varchar, field_name varchar)
  RETURNS VARCHAR AS
  $BODY$DECLARE

    ae VARCHAR;
    q char := '''';
    s varchar;

  BEGIN

    s := 'SELECT ' || field_name || ' from (' ||
            'select ' || field_name || ',' ||
            'ST_Distance_Sphere(ST_SetSRID(ST_Point(' || ST_X(dot) ||
            ',' || ST_Y(dot) ||'),4326), ST_SetSRID(geom, 4326)) AS dist' ||
            ' from ' || indicator_table_name ||
            ' ORDER BY dist ASC LIMIT 1) AS ' || field_name;

    -- RAISE NOTICE '%', s;

    EXECUTE s INTO ae;

    RETURN ae;

  END;$BODY$
LANGUAGE plpgsql VOLATILE
COST 1;