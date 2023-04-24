//=-=-=-=-=-=-=-=//
//=-=-=-=-=-=-=-=//
//WVWQ3DM7 SHADER//
//=-=-=-=-=-=-=-=//

//**FOG VOLUME**//

textures/wvwq3dm7/foghull/wvw7fog
{
	qer_editorimage textures/sfx/fog_green.tga
	surfaceparm fog
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	qer_trans 0.4
	fogparms ( 0.14902 0.286275 0.25490 ) 1024
}

//gray    0.419608 0.494118 0.486275
//orange  0.607843 0.513726 0.309804
//yellow  0.588235 0.627451 0.392157
//blue    0.203922 0.286275 0.305882
//green   0.14902 0.286275 0.25098

//**FOGHULL**//

textures/wvwq3dm7/foghull/wvw7hull
{
	qer_editorimage textures/wvwq3dm7/foghull/wvw7hull_ft.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_skylight 50 3
	q3map_sun 0.266667 0.376471 0.541176 200 360 60
	skyParms textures/wvwq3dm7/foghull/wvw7hull 0 -
}

//**TREE MODEL SHADER**//

textures/wvwq3dm7/branch2_tex
{
	qer_editorimage textures/wvwq3dm7/branch2.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	sort 10
	cull disable
	{
		clampmap textures/wvwq3dm7/branch2.tga
		blendfunc gl_zero gl_one_minus_src_color
	}
}

models/mapobjects/wvw_tree/branch2
{
	qer_editorimage textures/wvwq3dm7/branch2.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	sort 10
	cull disable
	{
		clampmap textures/wvwq3dm7/branch2.tga
		blendfunc gl_zero gl_one_minus_src_color
	}
}

models/mapobjects/tree2/branch2
{
	qer_editorimage textures/wvwq3dm7/branch2.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	sort 10
	cull disable
	{
		clampmap textures/wvwq3dm7/branch2.tga
		blendfunc gl_zero gl_one_minus_src_color
	}
}

models/mapobjects/wvw_tree/trunk_id
{
	qer_editorimage textures/wvwq3dm7/wvw_tree.tga
	surfaceparm nonsolid
	{
		map textures/wvwq3dm7/wvw_tree.tga
	}
}

models/mapobjects/GR_trees/tree6
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/tree6.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

//**CROW**//

textures/wvwq3dm7/crow2a
{
	qer_editorimage textures/wvwq3dm7/crow1.tga
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes move 1 0.3 0.5 sin 0 72 0 0.08 
	{
		map textures/wvwq3dm7/crow1.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
		depthFunc equal
	}
}
//**ORGANIC SURFACES**//

textures/wvwq3dm7/grass1
{
	qer_editorimage textures/wvwq3dm7/grass1.jpg
	q3map_nonplanar
	q3map_shadeangle 179
	{	
		map textures/wvwq3dm7/grass1.jpg
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}



textures/wvwq3dm7/rock04
{
	qer_editorimage textures/wvwq3dm7/rock04.jpg
	q3map_nonplanar
	q3map_shadeangle 179
	{	
		map textures/wvwq3dm7/rock04.jpg
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}




textures/wvwq3dm7/dirt
{
	qer_editorimage textures/wvwq3dm7/dirt.jpg
	q3map_nonplanar
	q3map_shadeangle 179
	{	
		map textures/wvwq3dm7/dirt.jpg
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}

textures/wvwq3dm7/rock2dirt
{
	qer_editorimage textures/wvwq3dm7/rock2dirt.jpg
	q3map_nonplanar
	q3map_shadeangle 179
	{	
		map textures/wvwq3dm7/rock2dirt.jpg
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}

	//TREES//
textures/wvwq3dm7/bark1
{
	qer_editorimage textures/wvwq3dm7/bark1.jpg
	q3map_nonplanar
	q3map_shadeangle 135
	{	
		map textures/wvwq3dm7/bark1.jpg
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}

textures/wvwq3dm7/bark8
{
	qer_editorimage textures/wvwq3dm7/bark8.jpg
	q3map_nonplanar
	q3map_shadeangle 135
	{	
		map textures/wvwq3dm7/bark8.jpg
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}

textures/wvwq3dm7/bark15
{
	qer_editorimage textures/wvwq3dm7/bark15.jpg
	q3map_nonplanar
	q3map_shadeangle 135
	{	
		map textures/wvwq3dm7/bark15.jpg
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}

textures/wvwq3dm7/wvw_tree
{
	qer_editorimage textures/wvwq3dm7/wvw_tree.tga
	q3map_nonplanar
	q3map_shadeangle 135
	{	
		map textures/wvwq3dm7/wvw_tree.tga
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}


//**WATER**//

textures/wvwq3dm7/clear_calm1
{
	qer_editorimage textures/liquids/pool3d_3e.tga
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm water
	cull disable
	deformVertexes wave 64 sin 0.25 0.25 0 0.5 
	q3map_globaltexture
	{
		map textures/liquids/pool3d_5e.tga
		blendfunc gl_dst_color gl_one
		rgbGen identity
		tcMod scale 0.5 0.5
		tcMod scroll 0.025 0.01
	}
	{
		map textures/liquids/pool3d_3e.tga
		blendfunc gl_dst_color gl_one
		tcMod scale -0.5 -0.5
		tcMod scroll 0.025 0.025
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/wvwq3dm7/water04
{
	surfaceparm nonsolid
	surfaceparm nolightmap
	cull disable
	deformVertexes wave 100 sin 0 1 0 1.5 
	{
		map textures/wvwq3dm7/water04.tga
		blendfunc blend
		rgbGen Vertex
		tcMod scroll 0 -1.5
		alphaGen Vertex
	}
}

textures/wvwq3dm7/water_crrek
{
	surfaceparm nonsolid
	surfaceparm nolightmap
	cull disable
	deformVertexes wave 100 sin 0 1 0 1.5 
	{
		map textures/wvwq3dm7/water_crrek.tga
		blendfunc blend
		rgbGen Vertex
		tcMod scroll 0 -0.4
		alphaGen Vertex
	}
}

v_axe
{
	surfaceparm nonsolid
	surfaceparm nolightmap
	cull disable
	deformVertexes wave 100 sin 0 1 0 1.5 
	{
		map models/water04.tga
		blendfunc blend
		rgbGen Vertex
		tcMod scroll 0 -1.5
		alphaGen Vertex
	}
}



//**PARTICLES/LIGHT**//

textures/wvwq3dm7/wvw7_weapflare
{
	qer_editorimage textures/wvwq3dm7/wvw7_weapflare.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	{
		map textures/wvwq3dm7/wvw7_weapflare.tga
		blendfunc add
	}
}


// This file was automatically created by Particle Designer.
// For more information about particle designer, please
// visit http://www.quake3stuff.com/freebrief
textures/wvwq3dm7/wvw_splash_1
{
	qer_editorimage textures/wvwq3dm7/wvw_splash.tga
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	deformVertexes move 15.2671 0 21.0681 sawtooth 0 1 0 0.99758 
	{
		clampmap textures/wvwq3dm7/wvw_splash.tga
		blendfunc add
		rgbGen wave sawtooth 1 -0.75 0 0.99758 
		tcMod rotate 0
		tcMod stretch sawtooth 1 0 0 0.99758 
		alphaGen wave sawtooth 0.6 -0.6 0 0.99758 
	}
}

textures/wvwq3dm7/wvw_splash_2
{
	qer_editorimage textures/wvwq3dm7/wvw_splash.tga
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	deformVertexes move 27.9806 0 14.5417 sawtooth 0 1 0 1.00822 
	{
		clampmap textures/wvwq3dm7/wvw_splash.tga
		blendfunc add
		rgbGen wave sawtooth 1 -0.75 0 1.00822 
		tcMod rotate 0
		tcMod stretch sawtooth 1 0 0 1.00822 
		alphaGen wave sawtooth 0.6 -0.6 0 1.00822 
	}
}

textures/wvwq3dm7/wvw_splash_3
{
	qer_editorimage textures/wvwq3dm7/wvw_splash.tga
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	deformVertexes move -23.5294 0 24.9054 sawtooth 0 1 0 0.922809 
	{
		clampmap textures/wvwq3dm7/wvw_splash.tga
		blendfunc add
		rgbGen wave sawtooth 1 -0.75 0 0.922809 
		tcMod rotate 0
		tcMod stretch sawtooth 1 0 0 0.922809 
		alphaGen wave sawtooth 0.6 -0.6 0 0.922809 
	}
}

textures/wvwq3dm7/wvw_splash_4
{
	qer_editorimage textures/wvwq3dm7/wvw_splash.tga
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	deformVertexes move 12.4378 0 31.5161 sawtooth 0 1 0 1.02932 
	{
		clampmap textures/wvwq3dm7/wvw_splash.tga
		blendfunc add
		rgbGen wave sawtooth 1 -0.75 0 1.02932 
		tcMod rotate 0
		tcMod stretch sawtooth 1 0 0 1.02932 
		alphaGen wave sawtooth 0.6 -0.6 0 1.02932 
	}
}

textures/wvwq3dm7/wvw_splash_5
{
	qer_editorimage textures/wvwq3dm7/wvw_splash.tga
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	deformVertexes move -34.8016 0 9.76785 sawtooth 0 1 0 0.958803 
	{
		clampmap textures/wvwq3dm7/wvw_splash.tga
		blendfunc add
		rgbGen wave sawtooth 1 -0.75 0 0.958803 
		tcMod rotate 0
		tcMod stretch sawtooth 1 0 0 0.958803 
		alphaGen wave sawtooth 0.6 -0.6 0 0.958803 
	}
}

//**TERRAIN**//

textures/wvwq3dm7/terrain_0
{
	q3map_lightmapsamplesize 64
	q3map_lightmapaxis z
	q3map_texturesize 256 256
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	q3map_nonplanar
	q3map_shadeangle 179
	{
		map textures/wvwq3dm7/rock04.jpg
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/wvwq3dm7/terrain_1
{
	q3map_lightmapsamplesize 64
	q3map_lightmapaxis z
	q3map_texturesize 256 256
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	q3map_nonplanar
	q3map_shadeangle 179
	{
		map textures/wvwq3dm7/dirt.jpg
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/wvwq3dm7/terrain_2
{
	q3map_lightmapsamplesize 64
	q3map_lightmapaxis z
	q3map_texturesize 256 256
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	q3map_nonplanar
	q3map_shadeangle 179

	{
		map textures/wvwq3dm7/grass1.jpg		
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/wvwq3dm7/terrain_0to1
{
	q3map_lightmapsamplesize 64
	q3map_lightmapaxis z
	q3map_texturesize 256 256
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	q3map_nonplanar
	q3map_shadeangle 179
	
	{
		map textures/wvwq3dm7/rock04.jpg		
	}
	{
		map textures/wvwq3dm7/dirt.jpg
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA		
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/wvwq3dm7/terrain_0to2
{
	q3map_lightmapsamplesize 64
	q3map_lightmapaxis z
	q3map_texturesize 256 256
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	q3map_nonplanar
	q3map_shadeangle 179
	
	{
		map textures/wvwq3dm7/rock04.jpg		
	}
	{
		map textures/wvwq3dm7/grass1.jpg
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA		
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/wvwq3dm7/terrain_1to2
{
	q3map_lightmapsamplesize 64
	q3map_lightmapaxis z
	q3map_texturesize 256 256
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	q3map_nonplanar
	q3map_shadeangle 179
	
	{
		map textures/wvwq3dm7/dirt.jpg		
	}
	{
		map textures/wvwq3dm7/grass1.jpg
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA		
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/wvwq3dm7/terrain.vertex
{
	{
		map textures/wvwq3dm7/rock04.jpg
		rgbGen vertex
	}
}

textures/wvwq3dm7/terrain2_0
{
	q3map_lightmapsamplesize 64
	q3map_lightmapaxis z
	q3map_texturesize 256 256
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	{
		map textures/wvwq3dm7/rock04.jpg
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/wvwq3dm7/terrain2_1
{
	q3map_lightmapsamplesize 64
	q3map_lightmapaxis z
	q3map_texturesize 256 256
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	{
		map textures/wvwq3dm7/grass1.jpg
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/wvwq3dm7/terrain2_0to1
{
	q3map_lightmapsamplesize 64
	q3map_lightmapaxis z
	q3map_texturesize 256 256
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	
	{
		map textures/wvwq3dm7/rock04.jpg
	}
	{
		map textures/wvwq3dm7/grass1.jpg
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/wvwq3dm7/terrain2.vertex
{
	{
		map textures/wvwq3dm7/rock04.jpg
		rgbGen vertex
	}
}


