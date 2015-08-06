SET client_min_messages TO WARNING;
DROP MATERIALIZED VIEW IF EXISTS dots_vector;
CREATE MATERIALIZED VIEW dots_vector AS
  SELECT
    guid,
    geom,
    ST_X(geom) AS x,
    ST_Y(geom) AS y,

    is_experience,
    image_name,
    route_id,

    getDistanceToOnePoint(geom, 'a_centrality') AS dist_center,

    getDistanceToNearest(geom, 'b_bike_parking') AS dist_bike_parking,
    countFeaturesWithinBuffer(geom, 49.999, 'b_bike_parking') AS n_bike_parking,

    getValueFromNearestFeatureVarchar(geom, 'c_highways', 'highway')::varchar AS highway_class,

    getDistanceToNearest(geom, 'd_bike_stations') AS dist_est_biciq,
    countFeaturesWithinBuffer(geom, 49.999, 'd_bike_stations') AS n_est_biciq,

    getDistanceToNearest(geom, 'e_bike_roads') AS dist_ciclovia,

    countFeaturesWithinBuffer(geom, 49.999, 'f_intersections') AS n_intersect,
    getDistanceToNearest(geom, 'f_intersections') AS dist_intersect,

    countFeaturesWithinBuffer(geom, 49.999, 'g_bus_stops') AS n_busstops,
    getDistanceToNearest(geom, 'g_bus_stops') AS dist_busstop,

    countFeaturesWithinBuffer(geom, 49.999, 'h_accidents') AS n_accidents,
    getDistanceToNearest(geom, 'h_accidents') AS dist_accident,

    countFeaturesWithinBuffer(geom, 49.999, 'i_accidents_deadly') AS n_deadly_accidents,
    getDistanceToNearest(geom, 'i_accidents_deadly') AS dist_deadly_accident,


    getDistanceToNearest(geom, 'j_brts') AS dist_brt_corr,

    countFeaturesWithinBuffer(geom, 49.999, 'k_zebra_crossings') AS n_zebra_crossings,
    getDistanceToNearest(geom, 'k_zebra_crossings') AS dist_zebra_crossings,

    countFeaturesWithinBuffer(geom, 49.999, 'l_speedbumps') AS n_speedbumps,
    getDistanceToNearest(geom, 'l_speedbumps') AS dist_speedbumps,

    countFeaturesWithinBuffer(geom, 49.999, 'm_traffic_signals') AS n_traffic_signals,
    getDistanceToNearest(geom, 'm_traffic_signals') AS dist_traffic_signals,

    getOverlapWithinBuffer(geom, 49.999, 'o_green_areas') as frac_green_areas,
    getDistanceToNearest(geom, 'o_green_areas') AS dist_green_area,
    -- add lateral squares here
    -- getRasterValue(geom, 'p_terrain_slope') AS slope,
    -- getRasterValue(geom, 'p_terrain_topo') AS elevation,

    countFeaturesWithinBuffer(geom, 49.999, 'q_parking') AS n_parking,
    getDistanceToNearest(geom, 'q_parking') AS dist_parking,

    getDistanceToNearest(geom, 'r_oneways') AS dist_oneway,

    countFeaturesWithinBuffer(geom, 49.999, 's_shops') AS n_shopss,
    getDistanceToNearest(geom, 's_shops') AS dist_shop,

    getValueFromNearestFeatureVarchar(geom, 't_land_use', 'land_use')::varchar AS land_use,

    countFeaturesWithinBuffer(geom, 49.999, 'u_education') AS n_education,
    getDistanceToNearest(geom, 'u_education') AS dist_education

  FROM raw_dots;

DROP INDEX IF EXISTS gidx_dots_vector;
CREATE INDEX gidx_dots ON dots_vector USING GIST (geom);

DROP INDEX IF EXISTS dots_vector_guid;
CREATE UNIQUE INDEX dots_vector_guid
ON dots_vector (guid);