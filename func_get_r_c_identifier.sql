
CREATE OR REPLACE FUNCTION getRCIdentifier(r varchar, c varchar)
  RETURNS varchar AS
  $BODY$DECLARE

    rr varchar;
    cc varchar;

  BEGIN

    rr = split_part(r, '.', 1);
    cc = split_part(c, '.', 1);

    if char_length(rr) = 1 THEN
      rr := '0' || rr;
    END IF;

    if char_length(cc) = 1 THEN
      cc := '0' || cc;
    END IF;

    RETURN 'C' || cc || '-RO' || rr;


  END;$BODY$
LANGUAGE plpgsql VOLATILE
COST 1;