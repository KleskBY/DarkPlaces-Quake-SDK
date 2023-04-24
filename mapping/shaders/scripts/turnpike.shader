//Tub
textures/ut_turnpike/willsky
{
	qer_editorimage textures/austria/AustriaSkyImage.jpg

	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_sun .94 .91 .95 1100 180 60
	q3map_surfacelight 450
	q3map_lightsubdivide 512
        skyparms env/turnpike/tp_sky2 - -
	
}

textures/ut_turnpike/will_fence_chainlink
{
	surfaceparm trans		
	cull none
        nopicmip

	{
		map textures/ut_turnpike/will_fence_chainlink.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/ut_turnpike/golgotha_sign14
{
	q3map_surfacelight 400
	surfaceparm nomarks

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/ut_turnpike/golgotha_sign14.jpg
		rgbGen identity
	}
}
textures/ut_turnpike/will_window_shiny
{
	{	
		map textures/ut_turnpike/will_window_shiny.tga
	}
	{
		map textures/effects/tp_win_fx.tga
		tcgen environment
		blendFunc GL_ONE GL_ONE
	}

	{
		map textures/ut_turnpike/will_window_shiny.tga
   		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_src_color
	}
}

textures/ut_turnpike/will_window_shiny2
{
	{	
		map textures/ut_turnpike/will_window_shiny2.tga
	}
	{
		map textures/effects/tp_int_fx.tga
		tcgen environment
		blendFunc GL_ONE GL_ONE
	}

	{
		map textures/ut_turnpike/will_window_shiny2.tga
   		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_src_color
	}
}
textures/ut_turnpike/will_laptop_screen
{
	q3map_surfacelight 800
	surfaceparm nomarks

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/ut_turnpike/will_laptop_screen.tga
		rgbGen identity
	}
}

textures/ut_turnpike/glass_clear
{
	qer_editorimage textures/effects/tp_win_fx.tga
	qer_trans 0.5
	surfaceparm nolightmap
	surfaceparm trans
	surfaceparm nomarks
	{
		map textures/effects/tp_win_fx.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
	}
}


textures/ut_turnpike/pewter_spec
{
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/ut_turnpike/pewter_spec.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
      
}

//Tub
//Light eminating from the top of the lamp1.md3
models/mapobjects/br_turnpike/br_light1
{
	qer_editorimage models/mapobjects/br_turnpike/br_light1.tga
	q3map_surfacelight 6000
	surfaceparm nomarks

	{
		map $lightmap
		rgbGen identity
	}
	{
		map models/mapobjects/br_turnpike/br_light1.tga
		blendfunc GL_ONE GL_SRC_ALPHA
	}
	{
		map models/mapobjects/br_turnpike/br_light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	
}

//Tub
textures/ut_turnpike/turnpike_fluro
{
	qer_editorimage textures/ut_turnpike/turnpike_fluro.tga
	//light 1
	surfaceparm nomarks
	surfaceparm nolightmap
	q3map_surfacelight 8000
	{
		map textures/ut_turnpike/turnpike_fluro.tga
		rgbGen identity
	}
}


//Tub
textures/ut_turnpike/tub_uplight1
{
	qer_editorimage textures/ut_turnpike/tub_uplight1.tga
	q3map_lightimage textures/ut_turnpike/tub_uplight1.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/ut_turnpike/tub_uplight1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/ut_turnpike/tub_uplight1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//Tub
textures/ut_turnpike/tub_stainless_steel
{
	qer_editorimage textures/ut_turnpike/tub_stainless_steel.tga

    {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/ut_turnpike/tub_stainless_steel.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
    {
		map textures/effects/tp_ele_fx.tga
        tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
    {
		map textures/ut_turnpike/tub_stainless_steel.tga
        blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//Tub
textures/ut_turnpike/tub_pewter_new
{
	qer_editorimage textures/ut_turnpike/tub_pewter_new.tga

	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/ut_turnpike/tub_pewter_new.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
      
}

textures/ut_turnpike/fs_gate2
{
	qer_editorimage textures/ut_turnpike/fs_gate2.tga
    surfaceparm trans
	surfaceparm nomarks
	cull none
	nopicmip
	{
		map textures/ut_turnpike/fs_gate2.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/ut_turnpike/fs_ladder03inner
{
	qer_editorimage textures/ut_turnpike/fs_ladder03inner.tga
    surfaceparm trans
	cull none
    nopicmip
	{
		map textures/ut_turnpike/fs_ladder03inner.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}


//Wetwired
//Blue Windows
textures/ut_turnpike/ind-windows-1
{
	{	
		map textures/ut_turnpike/ind-windows-1.tga
	}
	{
		map textures/effects/tp_win_fx.tga
		tcgen environment
		blendFunc GL_ONE GL_ONE
	}

	{
		map textures/ut_turnpike/ind-windows-1.tga
   		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_src_color
	}
}