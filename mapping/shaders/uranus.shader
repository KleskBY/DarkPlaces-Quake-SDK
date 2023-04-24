textures/chili_skies/darkdeepspace
{
	qer_editorimage env/ctf_vdl/vdl_up.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm sky
	skyParms env/ctf_vdl/vdl 2048 -
}

textures/chili_sfx/irc_screen
{
    qer_editorimage textures/chili_sfx/irc.tga
    surfaceparm nolightmap
    {
        map textures/effects/tinfx3.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
    {
        map textures/chili_sfx/irc.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen wave noise 0.7 0.1 0.2 -8
    }
}

textures/chili_sfx/screen3
{
    qer_editorimage textures/chili_sfx/screen3.tga
    surfaceparm nolightmap
    {
        map textures/effects/tinfx3.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
    {
        map textures/chili_sfx/screen3.tga
        blendFunc GL_ONE GL_SRC_ALPHA
    }
}

textures/chili_decals/smear01
{ 
   surfaceparm trans 
   surfaceparm nomarks 
   polygonOffset
   cull none
   qer_trans 0.5 
   sort 6 
   { 
      map textures/chili_decals/smear01.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR 
      rgbGen identity 
   } 
}

textures/chili_decals/splat06
{ 
   surfaceparm trans 
   surfaceparm nomarks 
   polygonOffset
   cull none
   qer_trans 0.5 
   sort 6 
   { 
      map textures/chili_decals/splat06.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR 
      rgbGen identity 
   } 
}

textures/chili_decals/bloodstain_1
{ 
   surfaceparm trans 
   surfaceparm nomarks 
   polygonOffset
   cull none
   qer_trans 0.5 
   sort 6 
   { 
      map textures/chili_decals/bloodstain_1.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR 
      rgbGen identity 
   } 
}

textures/chili_decals/bloodstain_hand
{ 
   surfaceparm trans 
   surfaceparm nomarks 
   polygonOffset
   cull none
   qer_trans 0.5 
   sort 6 
   { 
      map textures/chili_decals/bloodstain_hand.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR 
      rgbGen identity 
   } 
}

textures/chili_sfx/holo_sign_reactor
{
	qer_editorimage textures/chili_sfx/reactor.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	nomipmaps
	q3map_surfacelight 50
	{
		map textures/chili_sfx/reactor.tga
		blendfunc add
	}
	{
		map textures/chili_sfx/detail_strip.tga
		blendfunc gl_dst_color gl_src_color
		rgbGen identity
		tcMod scroll 0 -0.6
	}
	{
		map textures/chili_sfx/reactor.tga
		blendfunc add
		rgbGen wave noise 0.7 0.1 0.2 -8 
	}
}

textures/chili_sfx/holo_sign_coolance
{
	qer_editorimage textures/chili_sfx/coolance.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	nomipmaps
	q3map_surfacelight 50
	{
		map textures/chili_sfx/coolance.tga
		blendfunc add
	}
	{
		map textures/chili_sfx/detail_strip.tga
		blendfunc gl_dst_color gl_src_color
		rgbGen identity
		tcMod scroll 0 -0.6
	}
	{
		map textures/chili_sfx/coolance.tga
		blendfunc add
		rgbGen wave noise 0.7 0.1 0.2 -8 
	}
}

textures/chili_sfx/energy_glassed
{
      qer_editorimage textures/chili_sfx/energy.tga
	surfaceparm nolightmap
	tessSize 128
	qer_trans 0.5
	{
		map textures/chili_sfx/energy.tga
		tcMod scale 0.6 0.6
		tcMod rotate -9
		tcMod scroll 0.1 0.3
	}
	{
		map textures/chili_sfx/energy.tga
		blendfunc filter
		tcMod scale 0.05 0.05
		tcMod rotate 10
	}
	{
		map textures/chili_sfx/energy.tga
		blendfunc add
		tcMod scale 0.7 0.7
		tcMod rotate 15
		tcMod scroll -0.3 -0.1
	}
	{
		map textures/effects/tinfx2.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/chili_glas/frostglas.tga
		blendfunc filter
	}
}

textures/chili_skies/icemoon
{
      qer_editorimage textures/chili_skies/icemoon.tga
	cull disable
      surfaceparm nolightmap
	{
		clampmap textures/chili_skies/icemoon.tga
            alphaFunc GE128
	}
}

textures/chili_skies/blackhole
{
	qer_editorimage textures/chili_skies/blackhole.tga
	surfaceparm noimpact
      surfaceparm trans
	surfaceparm nolightmap
	surfaceparm nomarks
      cull none
      q3map_nonplanar
	{
		map textures/chili_skies/blackhole2.tga
		blendfunc add
		tcMod rotate 7
	}
	{
		map textures/chili_skies/blackhole.tga
		blendfunc filter
		tcMod rotate -5
	}
}

textures/chili_decals/attention_explosive
{
	qer_editorimage textures/chili_decals/attention_explosive.tga
      nomipmaps
	surfaceparm nomarks
      surfaceparm nonsolid
	{
		map textures/chili_decals/attention_explosive.tga
		alphaFunc GE128
	}
}

textures/chili_glas/glass_7
{
	qer_editorimage textures/chili_glas/envmap_7.tga
	surfaceparm nolightmap
	surfaceparm trans
	cull disable
	tessSize 128
	qer_trans 0.5
	{
		map textures/chili_glas/envmap_7.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/chili_glas/frostglas.tga
		blendfunc filter
	}
}

textures/chili_glas/glass_8
{
	qer_editorimage textures/chili_glas/envmap_8.tga
	surfaceparm nolightmap
	surfaceparm trans
	cull disable
	tessSize 128
	qer_trans 0.5
	{
		map textures/chili_glas/envmap_8.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/chili_glas/frostglas.tga
		blendfunc filter
	}
}

textures/chili_sfx/energy
{
	surfaceparm nolightmap
	//q3map_surfacelight 1500
	{
		map textures/chili_sfx/energy.tga
		tcMod scale 0.6 0.6
		tcMod rotate -9
		tcMod scroll 0.1 0.3
	}
	{
		map textures/chili_sfx/energy.tga
		blendfunc filter
		tcMod scale 0.05 0.05
		tcMod rotate 10
	}
	{
		map textures/chili_sfx/energy.tga
		blendfunc add
		tcMod scale 0.7 0.7
		tcMod rotate 15
		tcMod scroll -0.3 -0.1
	}
}

textures/chili_sfx/holo_sign_notausgang
{
	qer_editorimage textures/chili_sfx/notausgang.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	nomipmaps
	q3map_surfacelight 50
	{
		map textures/chili_sfx/notausgang.tga
		blendfunc add
	}
	{
		map textures/chili_sfx/detail_strip.tga
		blendfunc gl_dst_color gl_src_color
		rgbGen identity
		tcMod scroll 0 -0.6
	}
	{
		map textures/chili_sfx/notausgang_glow.tga
		blendfunc add
		rgbGen wave noise 0.7 0.1 0.2 -8 
	}
}

textures/chili_sfx/holo_sign_scheisshaus
{
	qer_editorimage textures/chili_sfx/wc.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	nomipmaps
	q3map_surfacelight 50
	{
		map textures/chili_sfx/wc.tga
		blendfunc add
	}
	{
		map textures/chili_sfx/detail_strip.tga
		blendfunc gl_dst_color gl_src_color
		rgbGen identity
		tcMod scroll 0 -0.6
	}
	{
		map textures/chili_sfx/wc.tga
		blendfunc add
		rgbGen wave noise 0.7 0.1 0.2 -8 
	}
}

textures/chili_sfx/weapon
{
	qer_editorimage textures/chili_sfx/circle.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	cull disable
	{
		clampmap textures/chili_sfx/circle.tga
		rgbGen identity
		alphaFunc GE128
	}
	{
		clampmap textures/chili_sfx/circle.tga
		rgbGen identity
		tcMod stretch sin 0.8 0.2 0 0.1 
		alphaFunc GE128
	}
}

textures/chili_decals/x_grate_fan_shadow
{
	qer_editorimage textures/chili_decals/x_grate_shadow.tga
       surfaceparm nolightmap
       surfaceparm trans	
       surfaceparm nomarks	
	 cull none
       nopicmip
       polygonoffset
       q3map_nonplanar

	{
		clampmap textures/chili_decals/fan_shadow.tga
		tcMod rotate 256 
		blendFunc filter
		//rgbGen exactVertex
            //depthWrite
	}
	{
		clampmap textures/chili_decals/x_grate_shadow.tga
		blendFunc filter
		//rgbGen exactVertex
            //depthWrite
	}
}

textures/chili_decals/attention_electro
{
	qer_editorimage textures/chili_decals/attention_electro.tga
      nomipmaps
	surfaceparm nomarks
      surfaceparm nonsolid
	 
	{
		map textures/chili_decals/attention_electro.tga
		alphaFunc GE128
	}
}
textures/chili_decals/attention_electro1
{
	qer_editorimage textures/chili_decals/attention_electro1.tga
      nomipmaps
	surfaceparm nomarks
      surfaceparm nonsolid
	 
	{
		map textures/chili_decals/attention_electro1.tga
		alphaFunc GE128
	}
}
textures/chili_decals/attention_electro2
{
	qer_editorimage textures/chili_decals/attention_electro2.tga
      nomipmaps
	surfaceparm nomarks
      surfaceparm nonsolid
	 
	{
		map textures/chili_decals/attention_electro2.tga
		alphaFunc GE128
	}
}

textures/chili_floor/gfloor3
{
	qer_editorimage textures/chili_floor/gfloor.tga
      nomipmaps
	//surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	 
	{
		map textures/chili_floor/gfloor.tga
		alphaFunc GE128
	}
}

textures/chili_floor/gfloor2
{       
      {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/chili_floor/gfloor2.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
      {
		map textures/effects/tinfx.tga
            tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	} 
      {
		map textures/chili_floor/gfloor2.tga
	      //blendFunc GL_ONE GL_ONE
            blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}           
}


textures/chili_floor/x_grate_dark
{
	qer_editorimage textures/chili_floor/x_grate.tga
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	{
		map textures/chili_floor/x_grate.tga
		alphaFunc GE128
	}
}

textures/chili_floor/x_grate_2
{
	qer_editorimage textures/chili_floor/x_grate_2.tga
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	{
		map textures/chili_floor/x_grate_2.tga
		alphaFunc GE128
	}
}


textures/chili_glas/milchglas
{
	qer_editorimage textures/colors/greygreen.tga
      surfaceparm trans
      qer_trans 0.5

	{
		map textures/colors/greygreen.tga
		blendfunc add
	}
	{
		map textures/chili_sfx/env1.tga
		blendfunc filter
		tcGen environment 
	}
	{
		map textures/colors/greygreen.tga
		blendfunc filter
	}
	{
		map textures/colors/greygreen.tga
		blendfunc blend
	}
}

textures/chili_glas/greenglas
{
	qer_editorimage textures/colors/greygreen.tga
      surfaceparm trans
      qer_trans 0.5

	{
		map textures/colors/greygreen.tga
		blendfunc add
	}
	{
		map textures/chili_sfx/env1.tga
		blendfunc filter
		tcGen environment 
	}
	{
		map textures/chili_glas/frostglas.tga
		blendfunc filter
	}
}

textures/chili_glas/greenglas_frost
{
	qer_editorimage textures/colors/greygreen.tga
      surfaceparm trans
      qer_trans 0.5

	{
		map textures/chili_sfx/env1.tga
		blendfunc add
		tcGen environment 
	}
	{
		map textures/colors/greygreen.tga
		blendfunc filter
	}
}

textures/chili_glas/glass_nolightmap_dark
{
	qer_editorimage textures/base_wall/shiny3.tga
	surfaceparm nolightmap
	surfaceparm trans
	cull disable
	tessSize 128
	qer_trans 0.5
	{
		map textures/effects/tinfx3.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
}

textures/chili_glas/glass_1
{
	qer_editorimage textures/chili_sfx/frames.tga
	surfaceparm trans
	 
	tessSize 128
	qer_trans 0.5
	{
		map textures/chili_sfx/frames.tga
		blendfunc blend
	}
	{
		map textures/chili_glas/envmap_2.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/chili_glas/glass_2
{
	qer_editorimage textures/chili_glas/envmap_3.tga
	surfaceparm trans
	cull disable
	tessSize 128
	qer_trans 0.5
	{
		map textures/chili_glas/envmap_3.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/chili_glas/glass_3
{
	qer_editorimage textures/chili_sfx/frames.tga
	surfaceparm trans
	 
	tessSize 128
	qer_trans 0.5
	{
		map textures/chili_sfx/frames.tga
		blendfunc blend
	}
	{
		map textures/chili_glas/envmap_5.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/chili_glas/glass_4
{
	qer_editorimage textures/chili_sfx/frames.tga
	surfaceparm trans
	cull disable
	tessSize 128
	qer_trans 0.5
	{
		map textures/chili_sfx/frames.tga
		blendfunc blend
	}
	{
		map textures/chili_glas/envmap_4.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/chili_glas/glass_5
{
	qer_editorimage textures/chili_sfx/frames.tga
	surfaceparm trans
	cull disable
	tessSize 128
	qer_trans 0.5
	{
		map textures/chili_sfx/frames.tga
		blendfunc blend
	}
	{
		map textures/chili_glas/envmap_6.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/chili_glas/glass_nolightmap
{
	qer_editorimage textures/base_wall/shiny3.tga
	surfaceparm nolightmap
	surfaceparm trans
	cull disable
	tessSize 128
	qer_trans 0.5
	{
		map textures/effects/tinfx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
}

textures/chili_glas/glass_tess128
{
	qer_editorimage textures/base_wall/shiny3.tga
	surfaceparm trans
	cull disable
	tessSize 128
	qer_trans 0.5
	{
		map textures/effects/tinfx2.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/chili_glas/frostglas
{
	qer_editorimage textures/chili_glas/frostglas.tga
	surfaceparm nolightmap
	surfaceparm trans
	cull disable
	tessSize 128
	qer_trans 0.5
	{
		map textures/effects/tinfx2.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/chili_glas/frostglas.tga
		blendfunc filter
	}
}


textures/chili_light/beam
{
      surfaceparm trans	
      surfaceparm nomarks	
      surfaceparm nonsolid
	surfaceparm nolightmap
	cull none

	{
		map textures/chili_light/beam.tga
            tcMod Scroll .1 0
            blendFunc add
      }
}

textures/chili_light/proto_lightyellow
{
	q3map_lightimage textures/chili_light/proto_lightyellow.tga
	surfaceparm nomarks
	q3map_surfacelight 700
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chili_light/proto_lightyellow.tga
		rgbGen identity
	}
      {
		map textures/chili_light/proto_lightyellow.tga
		blendFunc filter
            rgbGen wave noise 0.7 0.1 0.2 -8
	}
	
}

textures/chili_light/proto_lightblue
{
	q3map_lightimage textures/chili_light/proto_lightblue.tga
	surfaceparm nomarks
	q3map_surfacelight 700
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chili_light/proto_lightblue.tga
		rgbGen identity
	}
      {
		map textures/chili_light/proto_lightblue.tga
		blendFunc filter
            rgbGen wave noise 0.7 0.1 0.2 -8
	}
	
}

textures/chili_light/proto_lightgreen
{
	q3map_lightimage textures/chili_light/proto_lightgreen.tga
	surfaceparm nomarks
	q3map_surfacelight 700
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chili_light/proto_lightgreen.tga
		rgbGen identity
	}
      {
		map textures/chili_light/proto_lightgreen.tga
		blendFunc filter
            rgbGen wave noise 0.7 0.1 0.2 -8
	}
	
}

textures/chili_light/proto_lightred
{
	q3map_lightimage textures/chili_light/proto_lightred.tga
	surfaceparm nomarks
	q3map_surfacelight 700
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chili_light/proto_lightred.tga
		rgbGen identity
	}
      {
		map textures/chili_light/proto_lightred.tga
		blendFunc filter
            rgbGen wave noise 0.7 0.1 0.2 -8
	}
	
}

textures/chili_light/light_base
{
	qer_editorimage textures/chili_light/light_base.tga
	surfaceparm nolightmap
	surfaceparm nomarks

	{
		map textures/chili_light/light_base.tga
		rgbGen identity
	}
}

textures/chili_light/neonlight
{
	qer_editorimage textures/chili_light/neonlight.tga
      q3map_lightimage textures/chili_light/neonlight_lightimage.tga

	surfaceparm nomarks
      surfaceparm nolightmap
	q3map_surfacelight 100

	{
		map textures/chili_light/neonlight.tga
	}
	{	
		map textures/chili_light/neonlight_blend.tga
		blendfunc GL_one gl_one
		rgbgen wave sawtooth .6 .1 0 7
	}
}

textures/chili_light/light_blue
{
	qer_editorimage textures/chili_light/light_blue.tga
	surfaceparm nomarks
	q3map_surfacelight 1500

	{
		map textures/chili_light/light_blue.tga
		rgbGen identity
	}
	{
		map textures/chili_light/light_blue.tga
		blendfunc add
	}
}

textures/chili_light/neonroerhe
{
	qer_editorimage textures/chili_light/bulb.tga
	surfaceparm nomarks

	{
		map textures/effects/tinfx.tga
		rgbGen identity
		tcGen environment
	}
	{
		map textures/chili_light/bulb.tga
		blendfunc blend
	}
}

textures/chili_light/neonroerhe_flackernd
{
	qer_editorimage textures/chili_light/bulb.tga
	surfaceparm nomarks

	{
		map textures/effects/tinfx.tga
		rgbGen identity
		tcGen environment
	}
	{
		map textures/chili_light/bulb.tga
            rgbGen wave noise 0.8 0.5 0 20
		blendfunc blend
	}
}

textures/chili_light/pulse_blue
{
	q3map_lightimage textures/chili_light/lightimage_blue.tga
	q3map_surfacelight 2000

	{
		map textures/chili_light/pulse_blue.tga
		tcMod scale 0.035 1
		tcMod scroll -0.65 0
	}
}

textures/chili_light/white
{
	qer_editorimage textures/colors/white.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans

	{
		map textures/colors/white.tga
	}
}

textures/chili_light/spot
{
	qer_editorimage textures/chili_light/ceil1_34.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chili_light/ceil1_34.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/chili_light/ceil1_34.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/chili_sfx/bulbflare
{
	qer_editorimage textures/chili_sfx/bulbflare.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes autosprite2
	{
		clampmap textures/chili_sfx/bulbflare.tga
		blendfunc add
	}
}

textures/chili_sfx/leuchtfeuer
{
	qer_editorimage textures/chili_sfx/leuchtfeuer.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	{
		clampmap textures/chili_sfx/leuchtfeuer.tga
		blendfunc add
	}
}

textures/chili_sfx/screen_1
{
      qer_editorimage textures/chili_sfx/screen_1.tga
      surfaceparm nolightmap
	surfaceparm noimpact
	nopicmip
	nomipmaps
	surfaceparm nonsolid
	surfaceparm nomarks
      cull none
    
      {
		map textures/chili_sfx/screen_1.tga
            blendFunc add
	}
      {
		map textures/chili_sfx/detail_strip.tga
            blendFunc GL_DST_COLOR GL_SRC_COLOR
            tcMod scroll .0 -0.6
		rgbgen identity
	}
      {
		map textures/chili_sfx/screen_1_glow.tga
            blendFunc add
            rgbGen wave noise 0.7 0.1 0.2 -8
	}
}

textures/chili_sfx/screen_2
{
      qer_editorimage textures/chili_sfx/screen_2.tga
      surfaceparm nolightmap
	surfaceparm noimpact
	nopicmip
	nomipmaps
	surfaceparm nonsolid
	surfaceparm nomarks
      cull none
    
      {
		map textures/chili_sfx/screen_2.tga
            blendFunc add
	}
      {
		map textures/chili_sfx/detail_strip.tga
            blendFunc GL_DST_COLOR GL_SRC_COLOR
            tcMod scroll .0 -0.6
		rgbgen identity
	}
      {
		map textures/chili_sfx/screen_2_glow.tga
            blendFunc add
            rgbGen wave noise 0.7 0.1 0.2 -8
	}
}

textures/chili_sfx/holo_sign_command
{
      qer_editorimage textures/chili_sfx/command.tga
      surfaceparm nolightmap
	surfaceparm noimpact
	nopicmip
	nomipmaps
	surfaceparm nonsolid
	surfaceparm nomarks
	cull none
	q3map_surfacelight 50

	{
		map textures/chili_sfx/command.tga
		blendfunc add
	}
      {
		map textures/chili_sfx/detail_strip.tga
            blendFunc GL_DST_COLOR GL_SRC_COLOR
            tcMod scroll .0 -0.6
		rgbgen identity
	}
	{
		map textures/chili_sfx/command.tga
		blendfunc add
            rgbGen wave noise 0.7 0.1 0.2 -8
	}
}

textures/chili_sfx/holo_sign_arrows
{
      qer_editorimage textures/chili_sfx/arrows_blue.tga
      surfaceparm nolightmap
	surfaceparm noimpact
	nopicmip
	nomipmaps
	surfaceparm nonsolid
	surfaceparm nomarks
	cull none
	q3map_surfacelight 50

	{
		animMap .25 textures/chili_sfx/command.tga textures/chili_sfx/arrows_blue.tga
		blendfunc add
	}
      {
		map textures/chili_sfx/detail_strip.tga
            blendFunc GL_DST_COLOR GL_SRC_COLOR
            tcMod scroll .0 -0.6
		rgbgen identity
	}
	{
		animMap .25 textures/chili_sfx/command.tga textures/chili_sfx/arrows_blue.tga
		blendfunc add
            rgbGen wave noise 0.7 0.1 0.2 -8
	}
}

textures/chili_sfx/holo_sign_arrows_backwards
{
      qer_editorimage textures/chili_sfx/arrows_blue.tga
      surfaceparm nolightmap
	surfaceparm noimpact
	nopicmip
	nomipmaps
	surfaceparm nonsolid
	surfaceparm nomarks
	cull none
	q3map_surfacelight 50

	{
		animMap .25 textures/chili_sfx/command_backwards.tga textures/chili_sfx/arrows_blue.tga
		blendfunc add
	}
      {
		map textures/chili_sfx/detail_strip.tga
            blendFunc GL_DST_COLOR GL_SRC_COLOR
            tcMod scroll .0 -0.6
		rgbgen identity
	}
	{
		animMap .25 textures/chili_sfx/command_backwards.tga textures/chili_sfx/arrows_blue.tga
		blendfunc add
            rgbGen wave noise 0.7 0.1 0.2 -8
	}
}

textures/chili_sfx/holo_keyboard
{
      qer_editorimage textures/chili_sfx/keyboard.tga
      surfaceparm nolightmap
	surfaceparm noimpact
	nopicmip
	nomipmaps
	surfaceparm nonsolid
	surfaceparm nomarks
      cull none
    
      {
		map textures/chili_sfx/keyboard.tga
            blendFunc add
	}
      {
		map textures/chili_sfx/detail_strip.tga
            blendFunc GL_DST_COLOR GL_SRC_COLOR
            tcMod scroll .0 -0.6
		rgbgen identity
	}
      {
		map textures/chili_sfx/keyboard_glow.tga
            blendFunc add
            rgbGen wave noise 0.7 0.1 0.2 -8
	}
}

textures/chili_sfx/black
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	{
		map textures/colors/black.tga
	}
}

textures/chili_sfx/jet_blue
{
	qer_editorimage textures/chili_sfx/b_flame1.tga
	q3map_lightimage textures/chili_sfx/b_flame7.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes wave 100 sin 4 3 0 0.3 
	q3map_surfacelight 350
	{
		animmap 10 textures/chili_sfx/b_flame1.tga textures/chili_sfx/b_flame2.tga textures/chili_sfx/b_flame3.tga textures/chili_sfx/b_flame4.tga textures/chili_sfx/b_flame5.tga textures/chili_sfx/b_flame6.tga textures/chili_sfx/b_flame7.tga textures/chili_sfx/b_flame8.tga 
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0 10 
	}
	{
		animmap 10 textures/chili_sfx/b_flame2.tga textures/chili_sfx/b_flame3.tga textures/chili_sfx/b_flame4.tga textures/chili_sfx/b_flame5.tga textures/chili_sfx/b_flame6.tga textures/chili_sfx/b_flame7.tga textures/chili_sfx/b_flame8.tga textures/chili_sfx/b_flame1.tga 
		blendfunc add
		rgbGen wave sawtooth 0 1 0 10 
	}
}

textures/chili_skies/uranus_ring
{
	qer_editorimage textures/chili_skies/uranus_ring.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	{
		map textures/chili_skies/uranus_ring.tga
		blendfunc add
		tcMod rotate 3
	}
}

textures/chili_skies/uranus
{
	qer_editorimage textures/chili_skies/uranus.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	{
		map textures/chili_skies/uranus.tga
		//tcMod rotate 0.05
	}
}

textures/chili_skies/sun
{
      qer_editorimage textures/chili_sfx/sun.tga
	cull disable
	{
		clampmap textures/chili_sfx/sun.tga
		blendfunc add
                tcMod rotate -10
	}
      {
		clampmap textures/chili_sfx/sun.tga
		blendfunc add
                tcMod rotate 15
	}
      {
		clampmap textures/chili_sfx/sun.tga
		blendfunc add
                tcMod rotate -5
	}
}

textures/chili_wall/blackmetal_shiny

{
	qer_editorimage textures/chili_floor/blackmetal.tga
      q3map_forcemeta

      //{
      //      map $lightmap
      //      tcGen lightmap
      //      rgbGen identity
      //}
	{
		map textures/base_wall/chrome_env2.tga
	      rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/chili_floor/blackmetal.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
            tcGen lightmap
		rgbGen identity
	}
}

textures/chili_wall/bluemetal_pipe
{
	qer_editorimage textures/chili_wall/bluemetal_pipe.tga

	{
		map textures/base_wall/chrome_env2.tga
		rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	{
		map textures/chili_wall/bluemetal_pipe.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}
textures/chili_wall/forge_panel
{
	qer_editorimage textures/chili_wall/forge_panel.tga

	{
		map textures/base_wall/chrome_env2.tga
		rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	{
		map textures/chili_wall/forge_panel.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}
textures/chili_wall/forge_panel2
{
	qer_editorimage textures/chili_wall/forge_panel2.tga

	{
		map textures/base_wall/chrome_env2.tga
		rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	{
		map textures/chili_wall/forge_panel2.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}
textures/chili_wall/forge_panel1
{
	qer_editorimage textures/chili_wall/forge_panel1.tga

	{
		map textures/base_wall/chrome_env2.tga
		rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	{
		map textures/chili_wall/forge_panel1
.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}

textures/chili_wall/monitor_text_1
{
      qer_editorimage textures/chili_wall/monitor.tga      
      {
		map textures/chili_sfx/text_1.tga
            tcMod scroll 0 -0.3
	}
      {
		map textures/chili_sfx/detail_strip.tga
            blendFunc GL_DST_COLOR GL_SRC_COLOR
            tcMod scroll .0 -0.6
		rgbgen identity
	}
      {
		map textures/chili_sfx/text_1.tga
            tcMod scroll 0 -0.3
            blendfunc add
            rgbGen wave noise 0.7 0.1 0.2 -8
	}
	{
		map textures/chili_wall/monitor.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/chili_wall/monitor_binary
{
      qer_editorimage textures/chili_wall/monitor.tga      
      {
		map textures/chili_sfx/binary.tga
            tcMod scroll 0 -0.3
	}
      {
		map textures/chili_sfx/detail_strip.tga
            blendFunc GL_DST_COLOR GL_SRC_COLOR
            tcMod scroll .0 -0.6
		rgbgen identity
	}
      {
		map textures/chili_sfx/binary.tga
            tcMod scroll 0 -0.3
            blendfunc add
            rgbGen wave noise 0.7 0.1 0.2 -8
	}
	{
		map textures/chili_wall/monitor.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

