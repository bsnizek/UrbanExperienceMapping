SET CLIENT_ENCODING TO UTF8;
SET STANDARD_CONFORMING_STRINGS TO ON;
BEGIN;
CREATE TABLE "d_bike_stations" (gid serial,
"objectid_1" numeric(10,0),
"objectid_2" numeric(10,0),
"objectid" numeric(10,0),
"id" numeric(10,0),
"nombre" varchar(75),
"tipo" varchar(80),
"etapa" int4);
ALTER TABLE "d_bike_stations" ADD PRIMARY KEY (gid);
SELECT AddGeometryColumn('','d_bike_stations','geom','900913','POINT',2);
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('1','1','1','0','Plaza de las Américas','Punto Bici','0','010100002031BF0D00ECC5EC6C759F53C000A08D7A2063C6BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('2','2','2','0','La Y','Punto Bici','1','010100002031BF0D00E0829622179F53C000C8FD9D39E0C4BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('3','3','3','0','Santo Domingo','Punto Bici','1','010100002031BF0D00AC3E44C1D1A053C000C836F58995CCBF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('4','4','4','0','Santa Teresita','Punto Bici','1','010100002031BF0D009433EA40A79F53C000A080FBD40DCABF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('5','5','5','0','Estadio Olímpico','Punto Bici','1','010100002031BF0D0040DEFE9EB09E53C00090A104DFAFC6BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('6','6','6','0','Admin. Eugenio Espejo','Punto Bici','1','010100002031BF0D008462974D059F53C000E0F57838F9C5BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('7','7','7','0','Portugal','Punto Bici','1','010100002031BF0D00985727C7DA9E53C0005889610339C7BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('8','8','8','0','San Gabriel','Punto Bici','0','010100002031BF0D00D820A971AE9F53C00020BC55EE7DC7BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('9','9','9','0','Las Cámaras','Punto Bici','1','010100002031BF0D00DC52C6A6329F53C0001895DE0EFFC7BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('10','10','10','0','NNUU','Punto Bici','1','010100002031BF0D0094F75428F49E53C00018A2DE4786C6BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('11','11','11','0','Cruz del Papa','Punto Bici','1','010100002031BF0D00C0C2CC1B209F53C000A0EE6ABC2BC7BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('12','12','12','0','Univ. Central','Punto Bici','0','010100002031BF0D0058983BE913A053C0008075EC98E1C9BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('13','13','13','0','Ministerio de Agricultura','Punto Bici','1','010100002031BF0D00F86E41563A9F53C00058A1A0F897C8BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('14','14','14','0','Seminario Mayor','Punto Bici','0','010100002031BF0D0068E6DA61FD9F53C00090202EC919C9BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('15','15','15','0','Flacso','Punto Bici','1','010100002031BF0D00644AFD52059F53C000E0EC66DE1BC9BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('16','16','16','0','La Mariscal','Punto Bici','1','010100002031BF0D00D0899A6E4D9F53C00098920B7FDAC9BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('17','17','17','0','Universidad Católica','Punto Bici','1','010100002031BF0D00C8931309609F53C000B8F7BFA2A9CABF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('18','18','19','0','Colegio Militar','Punto Bici','1','010100002031BF0D00EC3CF856529F53C000981A065E33C9BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('19','19','20','0','El Ejido','Punto Bici','1','010100002031BF0D00F4A4604ECF9F53C000C0A92EC490CABF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('20','20','21','0','Plaza Grande','Punto Bici','1','010100002031BF0D0000F13EB7A5A053C00060E4D33322CCBF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('21','21','22','0','Alameda','Punto Bici','1','010100002031BF0D005CE7465B4CA053C00080B663EAAECBBF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('22','22','23','0','IESS','Punto Bici','1','010100002031BF0D003C39497408A053C00090857F76DFCABF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('23','23','24','0','Asamblea Nacional','Punto Bici','1','010100002031BF0D00387FE0180CA053C000D8DD715A55CBBF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('24','24','25','0','Plaza de Toros','Punto Bici','1','010100002031BF0D0060330423F69E53C000C072993A12C5BF');
INSERT INTO "d_bike_stations" ("objectid_1","objectid_2","objectid","id","nombre","tipo","etapa",geom) VALUES ('25','25','4','0','Santa Clara','Punto Bici','1','010100002031BF0D0070AD4CB1D09F53C000C0E46732C2C9BF');
COMMIT;
