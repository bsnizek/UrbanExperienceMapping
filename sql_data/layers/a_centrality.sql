SET CLIENT_ENCODING TO UTF8;
SET STANDARD_CONFORMING_STRINGS TO ON;
BEGIN;
CREATE TABLE "a_centrality" (gid serial,
"objectid" numeric(10,0),
"name" varchar(254),
"descriptio" varchar(254),
"timestamp" date,
"begin" date,
"end" date,
"altitudemo" varchar(254),
"tessellate" numeric,
"extrude" numeric,
"visibility" numeric,
"draworder" numeric,
"icon" varchar(254));
ALTER TABLE "a_centrality" ADD PRIMARY KEY (gid);
SELECT AddGeometryColumn('','a_centrality','geom','900913','POINT',4);
INSERT INTO "a_centrality" ("objectid","name","descriptio","timestamp","begin","end","altitudemo","tessellate","extrude","visibility","draworder","icon",geom) VALUES ('1','Plaza Grande',NULL,NULL,NULL,NULL,NULL,'-1.00000000000e+000','-1.00000000000e+000','-1.00000000000e+000','0.00000000000e+000',NULL,'01010000E031BF0D0014AF376DC6A053C000F872D9942BCCBF0000000000000000FFFFFFFFFFFFEFFF');
COMMIT;
