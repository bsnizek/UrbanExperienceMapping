SET client_min_messages TO WARNING;
DROP MATERIALIZED VIEW IF EXISTS dots CASCADE;

CREATE MATERIALIZED VIEW dots AS

  SELECT

    dots_vector.*,
    dots_raster.slope,
    dots_raster.elevation,
    experiences_valued.val_julie as pos_neg,
    experiences_valued.tags

  FROM

    dots_vector

    LEFT OUTER JOIN dots_raster ON (dots_vector.guid = dots_raster.guid)
    LEFT OUTER JOIN experiences_valued ON (dots_vector.image_name = experiences_valued.image_id);

--     ,
--
--
--   WHERE
--
--     dots_vector.guid = dots_raster.guid;