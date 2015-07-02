# UrbanExperienceMapping


##Experience Analysis Fucnctions

1) countFeaturesWithinBuffer

        SELECT * FROM countFeaturesWithinBuffer('layer_name', 49.99)
        
    Returns int8.
    
2) getDistanceToNearest

       SELECT * FROM getDistanceToNearest(geom, 'layer_name’)
        
        ###geom :: the geometry field of the dot theme
        
        layer_name:: the name of the layer we measure the distance to 

3) getDistanceToSinglePointFeature


        SELECT * FROM getDistanceToSinglePointFeature(geom, 'layername')
        
        ###geom :: the geometry field of the dot theme
        
        layer_name:: the name of the layer we measure the distance to 
        

4) getPolygonCover



5) getRasterValue

        SELECT * FROM getDistanceToSinglePointFeature(geom, 'layername')

6) getValueFromNearestFeature