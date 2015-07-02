CREATE OR REPLACE FUNCTION countFeaturesWithinBuffer(g1 geometry, buffer float, feature varchar)
  RETURNS int4 AS

  $BODY$DECLARE

    d int2;
    q varchar := '''';

  BEGIN

  EXECUTE 'SELECT count(geom) FROM ' ||
          feature ||
          ' WHERE ST_DWithin(ST_SetSRID(ST_PointFromText(' || q ||
          ST_AsText(g1) ||
          q ||
          '),4326)::geography, ST_SetSRID(geom, 4326)::geography, ' ||
          buffer ||
          ')' INTO d;

    RETURN d;

  END;$BODY$
LANGUAGE plpgsql VOLATILE
COST 1;