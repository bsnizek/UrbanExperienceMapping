
-- --
-- getOverlapWithinBuffer(dot, radius, table)
--
-- Given the geometry of the dot it calculates how much of the goemtry of <table> overlaps within a buffer given
-- by <radius>.
-- Result: float 0..1
-- --

CREATE OR REPLACE FUNCTION getOverlapWithinBuffer(dot geometry, radius float, indicator_table_name varchar)
  RETURNS float AS
  $BODY$DECLARE

    fraction float := 0.0;
    r geometry;
    buffer_area float := radius*radius*pi();
    intersection float := 0.0;
    b geometry;
    sss varchar;
    ar float;

  BEGIN

    b := ST_Buffer(ST_SetSRID(dot, 4326)::geography, radius)::geometry;

    --     RAISE NOTICE 'Area (%) = %', radius, ST_Area(b::geography);

        -- select all geometry within a distance of <radius>

    sss := 'SELECT geom FROM ' || indicator_table_name || ' WHERE ' ||
           'ST_Distance(ST_SetSRID(ST_Point(' || ST_X(dot) || ', ' || ST_Y(dot) || '), 4326)::geography, ' ||
           'ST_SetSRID(geom, 4326)::geography)::float < ' || radius;

    --     RAISE NOTICE '%', sss;

    FOR r IN EXECUTE sss LOOP

      ar := ST_Area(ST_Intersection(b, ST_SetSRID(r, 4326))::geography);

      --       RAISE NOTICE '%', ar;

      intersection := intersection + ar;

    END LOOP;

    RETURN intersection / buffer_area;


  END;$BODY$
LANGUAGE plpgsql VOLATILE
COST 1;