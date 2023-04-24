textures/Q_shaders/terrain_snow
{
    q3map_lightImage textures/nature/snowa1.tga
    
    q3map_forceMeta
    q3map_nonplanar
    q3map_shadeAngle 179
    
    q3map_lightmapAxis z
    
    q3map_tcGen ivector ( 2048 0 0 ) ( 0 2048 0 )
    q3map_tcMod rotate 33
    
    q3map_alphagen dotProduct2scale ( 0 0 1 0.250 0.85 )
    q3map_clipModel
    
    q3map_lightmapSampleSize 64
    
    q3map_globalTexture
    
    {
        map textures/nature/cliffa1.tga
        rgbGen identity
    }
    {
        map textures/nature/snowa2.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
     //   alphaFunc GE128
        rgbGen identity
        alphaGen vertex
        tcMod scale 7 7
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}
textures/Q_shaders/terrain_grass
{
    q3map_lightImage textures/nature/snowa1.tga
    
    q3map_forceMeta
    q3map_nonplanar
    q3map_shadeAngle 179
    
    q3map_lightmapAxis z
    
    q3map_tcGen ivector ( 2048 0 0 ) ( 0 2048 0 )
    q3map_tcMod rotate 33
    
    q3map_alphagen dotProduct2scale ( 0 0 1 0.250 0.85 )
    q3map_clipModel
    
    q3map_lightmapSampleSize 64
    
    q3map_globalTexture
    
    {
        map textures/nature/cliffa1.tga
        rgbGen identity
    }
    {
        map textures/nature/snowa1.tga
        blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
     //   alphaFunc GE128
        rgbGen identity
        alphaGen vertex
        tcMod scale 7 7
    }
    {
        map $lightmap
        blendFunc GL_DST_COLOR GL_ZERO
        rgbGen identity
    }
}