//--------------------------------------------------------------
//				FOREST ADDS
//--------------------------------------------------------------

models/mapobjects/mxl_tgm/l01c
{
	cull disable
	{
		map models/mapobjects/mxl_tgm/l01c.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}


models/mapobjects/mxl_tgm/rklec1
{
	cull disable
	{
		map models/mapobjects/mxl_tgm/rklec1.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/mxl_tgm/bush01
{
	cull disable
	{
		map models/mapobjects/mxl_tgm/bush01.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

//--------------------------------------------------------------
//				FOREST
//--------------------------------------------------------------
models/mapobjects/mxl_forest/TREE_06
{
	cull disable
	{
		map models/mapobjects/mxl_forest/TREE_06.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/mxl_forest/FLOWER_01
{
	cull disable
	{
		map models/mapobjects/mxl_forest/FLOWER_01.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/mxl_forest/FLOWER_03
{
	cull disable
	{
		map models/mapobjects/mxl_forest/FLOWER_03.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/mxl_forest/TREE_07
{
	cull disable
	{
		map models/mapobjects/mxl_forest/TREE_07.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/mxl_forest/TREE_08A
{
	cull disable
	{
		map models/mapobjects/mxl_forest/TREE_08A.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/mxl_forest/TREE_08B
{
	cull disable
	{
		map models/mapobjects/mxl_forest/TREE_08B.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/mxl_forest/TREE_08C
{
	cull disable
	{
		map models/mapobjects/mxl_forest/TREE_08C.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/mxl_forest/TREE_09A
{
	cull disable
	{
		map models/mapobjects/mxl_forest/TREE_09A.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/mxl_forest/TREE_09B
{
	cull disable
	{
		map models/mapobjects/mxl_forest/TREE_09B.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/mxl_forest/TREE_09C
{
	cull disable
	{
		map models/mapobjects/mxl_forest/TREE_09C.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/mxl_forest/TREE_11A
{
	cull disable
	{
		map models/mapobjects/mxl_forest/TREE_11A.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/mxl_forest/PLANT_11
{
	cull disable
	{
		map models/mapobjects/mxl_forest/PLANT_11.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}


// ------------------------------------------
// sky shader, uses a solid background color
// then cloud layer
// then masked off horizon line
// ------------------------------------------



textures/zlan03/zlanparty_flag
{
        tessSize 16
        deformVertexes wave 194 sin 0 3 0 .4
        //deformVertexes normal .3 .2
        deformVertexes normal .08 .08
        surfaceparm nomarks
        cull disable

        {
		map textures/zlan03/zlanparty_flag.tga
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		//blendFunc filter
		rgbGen identity
	}
        {

        	map textures/sfx/shadow.tga
                tcGen environment 
                //blendFunc GL_ONE GL_ONE            
                blendFunc GL_DST_COLOR GL_ZERO
               rgbGen identity
	}
}


textures/zlan03/sky
{
	qer_editorimage textures/slterra/sky_arc_masked.tga
	
	q3map_lightsubdivide 768
	q3map_surfacelight 104
	q3map_backsplash 0 0
	
	q3map_sun 1 .85 0.5 65 -32 56
	
	surfaceparm sky
	surfaceparm noimpact
	surfaceparm nolightmap
	
	skyparms textures/slterra/env/sky 512 -
	
	nopicmip
	nomipmaps
	
	{
		map textures/slterra/sky_clouds.tga
		tcMod scale 3 3
		tcMod scroll 0.005 -0.0125
		rgbGen identityLighting
	}
	{
		clampmap textures/slterra/sky_arc_masked.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		tcMod scale 0.956 0.956	// note for RTCW, this line should be commented out if the sky is knackered
		tcMod transform 1 0 0 1 -1 -1
		rgbGen identityLighting
	}
}

textures/slterra/sky_vx
{
	surfaceparm sky
	surfaceparm noimpact
	surfaceparm nolightmap
	
	skyparms textures/slterra/env/sky 512 -
	
	nopicmip
	nomipmaps
	
	{
		clampmap textures/slterra/sky_arc_masked.tga
		tcMod scale 0.956 0.956	// note for RTCW, this line should be commented out if the sky is knackered
		tcMod transform 1 0 0 1 -1 -1
		rgbGen identityLighting
	}
}



textures/zlan03/zedd
{	
	q3map_lightmapsamplesize 1
	qer_editorimage textures/zlan03/barstrop1.tga
	//q3map_tcgen ivector ( 192 0 0 ) ( 0 0 192 )
	{
		map textures/zlan03/barstrop1.tga
		//tcgen vector ( 0.0044 0 0 ) ( 0 0 0.0044 )
		rgbgen identity
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}


textures/zlan03/ds
{
    surfaceparm alphashadow
    surfaceparm trans
    nopicmip
    qer_editorimage textures/zlan03/ds.tga
    qer_lightimage textures/zlan03/ds.tga
	//lantern is runtime map, lantern_hires is compiletime
	q3map_lightmapsamplesize 1

    {
		map textures/zlan03/ds.tga
		alphafunc GE128
		depthwrite
		rgbgen exactVertex
	}

	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}



textures/zlan03/terraintex
{
	qer_editorimage textures/common/terrain.tga
	surfaceparm nodraw
	surfaceparm nomarks
	q3map_forcemeta
	//q3map_lightmapsamplesize 4
	q3map_shadeangle 179
	q3map_nonplanar
	q3map_indexed
	q3map_tcgen ivector ( 256 0 0 ) ( 0 256 0 )
}


//////////////////////////////////////////////////////////////////////
// TERRAIN METASHADER                                               //
//////////////////////////////////////////////////////////////////////
textures/zlan03/ground_0
{
	qer_editorimage textures/zlan03/sandyground1.tga
	surfaceparm nomarks
	//q3map_lightmapsamplesize 8
	q3map_shadeangle 179
	q3map_forcemeta
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_tcgen ivector ( 256 0 0 ) ( 0 256 0 )
	//q3map_normalimage textures/zlan03/terrainbump1.tga
	{
		map textures/zlan03/sandyground1.tga
		rgbgen identity
	}
	{
		map $lightmap
		tcGen lightmap
		blendfunc filter
	}
}

textures/zlan03/ground_1
{
	qer_editorimage textures/zlan03/sandyground1.tga
	surfaceparm nomarks
	//q3map_lightmapsamplesize 4
	q3map_shadeangle 179
	q3map_forcemeta
	//q3map_normalimage textures/zlan03/terrainbump1.tga
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_tcgen ivector ( 256 0 0 ) ( 0 256 0 )
	{
		map textures/zlan03/sandyground1.tga
		rgbGen const ( 0.7 0.7 0.7 )
		tcGen vector ( 0.0055 0 0 ) ( 0 0.0055 0 )
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}

textures/zlan03/ground_2
{
	qer_editorimage textures/zlan03/crackedground.tga
	surfaceparm nomarks
	//q3map_lightmapsamplesize 4
	q3map_shadeangle 179
	q3map_forcemeta
	//q3map_normalimage textures/zlan03/terrainbump1.tga
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_tcgen ivector ( 256 0 0 ) ( 0 256 0 )
	{
		map textures/zlan03/crackedground.tga
		tcGen vector ( 0.0065 0 0 ) ( 0 0.0065 0 )
		rgbgen identity
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}

textures/zlan03/ground_3
{
	qer_editorimage textures/zlan03/grassyground.tga
	surfaceparm nomarks
	//q3map_lightmapsamplesize 4
	q3map_shadeangle 179
	q3map_forcemeta
	//q3map_normalimage textures/zlan03/terrainbump1.tga
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_tcgen ivector ( 256 0 0 ) ( 0 256 0 )
	{
		map textures/zlan03/grassyground.tga
		tcGen vector ( 0.008 0 0 ) ( 0 0.008 0 )
		rgbgen identity
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}

textures/zlan03/ground_0to1
{
	qer_editorimage textures/zlan03/sandyground1.tga
	surfaceparm nomarks
	//q3map_lightmapsamplesize 4
	q3map_shadeangle 179
	q3map_forcemeta
	//q3map_normalimage textures/zlan03/terrainbump1.tga
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_tcgen ivector ( 256 0 0 ) ( 0 256 0 )
	{
		map textures/zlan03/sandyground1.tga
		rgbgen identity
	}
	{
		map textures/zlan03/sandyground1.tga
		blendfunc blend
		rgbGen const ( 0.7 0.7 0.7 )
		tcGen vector ( 0.0055 0 0 ) ( 0 0.0055 0 )
		alphaGen Vertex
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}

textures/zlan03/ground_0to2
{
	qer_editorimage textures/zlan03/sandyground1.tga
	surfaceparm nomarks
	//q3map_lightmapsamplesize 4
	q3map_shadeangle 179
	q3map_forcemeta
	//q3map_normalimage textures/zlan03/terrainbump1.tga
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_tcgen ivector ( 256 0 0 ) ( 0 256 0 )
	{
		map textures/zlan03/sandyground1.tga
		rgbgen identity
	}
	{
		map textures/zlan03/crackedground.tga
		rgbgen identity
		blendfunc blend
		tcGen vector ( 0.0065 0 0 ) ( 0 0.0065 0 )
		alphaGen Vertex
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}

textures/zlan03/ground_0to3
{
	qer_editorimage textures/zlan03/sandyground1.tga
	surfaceparm nomarks
	//q3map_lightmapsamplesize 4
	q3map_shadeangle 179
	q3map_forcemeta
	//q3map_normalimage textures/zlan03/terrainbump1.tga
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_tcgen ivector ( 256 0 0 ) ( 0 256 0 )
	{
		map textures/zlan03/sandyground1.tga
		rgbgen identity
	}
	{
		map textures/zlan03/grassyground.tga
		blendfunc blend
		tcGen vector ( 0.008 0 0 ) ( 0 0.008 0 )
		rgbgen identity
		alphaGen Vertex
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}

textures/zlan03/ground_1to2
{
	qer_editorimage textures/zlan03/sandyground1.tga
	surfaceparm nomarks
	//q3map_lightmapsamplesize 4
	q3map_shadeangle 179
	q3map_forcemeta
	//q3map_normalimage textures/zlan03/terrainbump1.tga
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_tcgen ivector ( 256 0 0 ) ( 0 256 0 )
	{
		map textures/zlan03/sandyground1.tga
		rgbGen const ( 0.7 0.7 0.7 )
		tcGen vector ( 0.0055 0 0 ) ( 0 0.0055 0 )
	}
	{
		map textures/zlan03/crackedground.tga
		blendfunc blend
		rgbgen identity
		tcGen vector ( 0.0065 0 0 ) ( 0 0.0065 0 )
		alphaGen Vertex
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}

textures/zlan03/ground_1to3
{
	qer_editorimage textures/zlan03/sandyground1.tga
	surfaceparm nomarks
	//q3map_lightmapsamplesize 4
	q3map_shadeangle 179
	q3map_forcemeta
	//q3map_normalimage textures/zlan03/terrainbump1.tga
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_tcgen ivector ( 256 0 0 ) ( 0 256 0 )
	{
		map textures/zlan03/sandyground1.tga
		rgbGen const ( 0.7 0.7 0.7 )
		rgbgen identity
		tcGen vector ( 0.0055 0 0 ) ( 0 0.0055 0 )
	}
	{
		map textures/zlan03/grassyground.tga
		blendfunc blend
		rgbgen identity
		tcGen vector ( 0.008 0 0 ) ( 0 0.008 0 )
		alphaGen Vertex
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}

textures/zlan03/ground_2to3
{
	qer_editorimage textures/zlan03/sandyground1.tga
	surfaceparm nomarks
	//q3map_lightmapsamplesize 4
	q3map_shadeangle 179
	q3map_forcemeta
	//q3map_normalimage textures/zlan03/terrainbump1.tga
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_tcgen ivector ( 256 0 0 ) ( 0 256 0 )
	{
		map textures/zlan03/crackedground.tga
		tcGen vector ( 0.0065 0 0 ) ( 0 0.0065 0 )
		rgbgen identity
	}
	{
		map textures/zlan03/grassyground.tga
		blendfunc blend
		tcGen vector ( 0.008 0 0 ) ( 0 0.008 0 )
		rgbgen identity
		alphaGen Vertex
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}