SET client_min_messages TO WARNING;
DROP MATERIALIZED VIEW take_two;

DROP SEQUENCE IF EXISTS take_two_guid_seq;
CREATE SEQUENCE take_two_guid_seq START 1;

CREATE  MATERIALIZED VIEW take_two AS
SELECT

  nextval('take_two_guid_seq') AS guid,
  ST_MakePoint(X, Y),
  name

FROM experience_points_raw_take_two;