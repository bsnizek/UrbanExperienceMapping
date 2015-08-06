DROP TABLE IF EXISTS experiences_valued CASCADE;
CREATE TABLE experiences_valued
(
  image_id varchar,
  tags varchar,
  val_julie int
)
WITH (
OIDS=FALSE
);

COPY experiences_valued
FROM '/Users/besn/Projects/UrbanExperienceMapping/tables/experiences_valued.csv'
WITH (FORMAT csv,
DELIMITER ';',
HEADER);