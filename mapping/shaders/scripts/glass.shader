//animmap testing
textures/Q_shaders/test
{

	//  ***********************************************
	//  *    Blue Flame                               *
	//  *    July 20, 1999 Surface Light 1800         *
	//  *    Please Comment Changes                   *
	//  ***********************************************
	qer_editorimage textures/decals/+9Test.tga
	q3map_lightimage textures/decals/+9Test.tga
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	q3map_surfacelight 1800
	// texture changed to blue flame.... PAJ
	{
		animMap 10 textures/decals/+2Text.tga textures/decals/+3Text.tga
			textures/decals/+4Text.tga textures/decals/+5Text.tga
			textures/decals/+6Text.tga textures/decals/+7Text.tga
			textures/decals/+8Text.tga textures/decals/+9Text.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave inverseSawtooth 0 1 0 10
	}	
}

//water
textures/Q_shaders/watera1s
{
   qer_editorimage textures/hdtextures/watera1
   surfaceparm nodlight
   cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow
	  tessSize 64
	    deformVertexes wave 100 sin 0 3 0 .7
          //deformVertexes normal 0.2 2
        sort banner
        {
                map textures/hdtextures/watera1.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
         }
   alphaFunc GE128
	{
	  map textures/hdtextures/watera1.tga
	}
   {
	  map textures/Q_sky/cloudtop_bka
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/hdtextures/watera1a
      blendfunc blend
   }
   {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
   {
		map textures/hdtextures/watera1.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}


textures/Q_shaders/wooda3s
{
	qer_editorimage textures/hdtextures/wooda3.tga

	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/hdtextures/wooda3.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
      
}

//cloth wave effect
textures/Q_shaders/clotha3s
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow
	  tessSize 64
	    deformVertexes wave 100 sin 0 3 0 .7
          //deformVertexes normal 0.2 2
		sort banner
        {
                map textures/hdtextures/clotha3.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
         }
}
textures/Q_shaders/clotha2s
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow
	  tessSize 64
	    deformVertexes wave 100 sin 0 3 0 .7
          //deformVertexes normal 0.2 2
		sort banner
        {
                map textures/hdtextures/clotha2.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
         }
}
textures/Q_shaders/clotha1s
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow
	  tessSize 64
	    deformVertexes wave 100 sin 0 3 0 .7
          //deformVertexes normal 0.2 2
		sort banner
        {
                map textures/hdtextures/clotha1.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
         }
}
textures/Q_shaders/covrolinD1s
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow
	  tessSize 64
	    deformVertexes wave 100 sin 0 3 0 .7
          //deformVertexes normal 0.2 2
		sort banner
        {
                map textures/chrushevka/covrolinD1.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
         }
}
//alpha channel
textures/Q_shaders/puddlea3s
{
	qer_editorimage textures/decals/puddlea2.tga
	q3map_lightmapBrightness 2.0
	portal

//	{
//		map textures/decals/emptyalpha.tga
//		blendfunc blend
//		rgbGen identityLighting
//		depthWrite
//		alphaGen portal 70
//	}
	{
		map textures/sch_fx/tinfx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/decals/puddlea2.tga
		blendfunc gl_one gl_one_minus_src_alpha
		rgbGen identityLighting
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		depthWrite
		alphaGen portal 70
	}
}


textures/Q_shaders/puddlea2s
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map textures/decals/puddlea2.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
 qer_editorimage textures/decals/puddlea2
   surfaceparm nodlight
   surfaceparm trans
//   {
//   map textures/SckladTextureQ1/black
//}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthFunc equal
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
}



textures/Q_shaders/puddlea1s
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map textures/decals/puddlea1.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
 qer_editorimage textures/decals/puddlea1
   surfaceparm nodlight
   surfaceparm trans
//   {
//   map textures/SckladTextureQ1/black
//}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        depthFunc equal
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
}

textures/Q_shaders/leakage
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map textures/hdecals/leakage.tga
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

textures/Q_shaders/lesnaya
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map textures/hdtextures/lesnaya.tga
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


textures/Q_shaders/bloods
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map textures/hdecals/blood.tga
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

textures/Q_shaders/garbages
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map textures/hdecals/garbage.tga
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

textures/Q_shaders/graffitia1s
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map textures/decals/graffitia1.tga
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


textures/Q_shaders/citya1s
{
	surfaceparm trans		
	cull none
        nopicmip

	{
		map textures/hdtextures/citya1.tga
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


textures/Q_shaders/reshetkia2s
{
	surfaceparm trans		
	cull none
        nopicmip

	{
		map textures/hdtextures/reshetkia2.tga
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

textures/Q_shaders/reshetkia1s
{
	surfaceparm trans		
	cull none
        nopicmip

	{
		map textures/hdtextures/reshetkia1.tga
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

textures/Q_shaders/balconya1s
{
	surfaceparm trans		
	cull none
        nopicmip

	{
		map textures/hdtextures/balconya1.tga
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

textures/Q_shaders/fenceD1s
{
	surfaceparm trans		
	cull none
        nopicmip

	{
		map textures/chrushevka/fenceD1.tga
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

//PLANTS

models/props/bbush0.tga
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map models/props/bbush0.tga
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


models/props/bpine0.tga
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map models/props/bpine0.tga
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

models/props/bpine2.tga
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map models/props/bpine2.tga
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

models/props/bpine3.tga
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map models/props/bpine3.tga
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
models/props/cpine1.tga
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map models/props/cpine1.tga
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
models/props/gbush0.tga
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map models/props/gbush0.tga
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

models/props/grapevine1.tga
{
	surfaceparm trans		
	cull none
        nopicmip
        polygonOffset

	{
		map models/props/grapevine1.tga
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
//specular
textures/Q_shaders/wooda3s
{
	qer_editorimage textures/hdtextures/wooda3.tga

	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/hdtextures/wooda3.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
      
}

textures/Q_shaders/roofa1s
{
	qer_editorimage textures/hdtextures/roofa1.tga

	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/hdtextures/roofa1.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
      
}

textures/Q_shaders/shifers
{
	qer_editorimage textures/hdtextures/shifer.tga

	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/hdtextures/shifer.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
      
}

textures/Q_shaders/shifera2s
{
	qer_editorimage textures/hdtextures/shifera2.tga

	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/hdtextures/shifera2.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
      
}

textures/Q_shaders/schifferD1s
{
	qer_editorimage textures/chrushevka/schifferD1.tga

	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/chrushevka/schifferD1.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
      
}
textures/Q_shaders/chr_metal_kryshs
{
	qer_editorimage textures/SckladTextureQ1/chr_metal_krysh.tga

	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/SckladTextureQ1/chr_metal_krysh.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
      
}
textures/Q_shaders/glass01
{
   qer_editorimage textures/Q_glass/glass3
   qer_trans 0.6
   surfaceparm nolightmap
   surfaceparm nodlight
   alphaFunc GE128
   surfaceparm detail
   surfaceparm trans
   {
      map textures/Q_glass/glass3
      blendfunc filter
      rgbGen identity
	  tcGen environment
	  dp_reflect 0.1
   }
}
textures/Q_shaders/glass02
{
   qer_editorimage textures/Q_sky/Cloudy_reflect
   surfaceparm nodlight
   alphaFunc GE128
   surfaceparm detail
   surfaceparm trans
   {
      map textures/Q_sky/Cloudy_reflect
      blendfunc blend
      rgbGen identity
	  tcGen environment
	  dp_reflect 0.1
   }
}
textures/Q_shaders/glass02_1
{
qer_editorimage textures/q1textures/brick8
{
		map textures/q1textures/brick8
	rgbGen identity
	}
	{
		map textures/Q_sky/Cloudy_reflect
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
	}
	{
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}

textures/Q_shaders/glass_narcom
{
   qer_editorimage textures/hdtextures/glassa1.tga
   surfaceparm nodlight
   alphaFunc GE128
   q3map_notjunc
	q3map_nonplanar
 	q3map_shadeangle 179
	{
	  map textures/hdtextures/glassa1.tga
	}
   {
	  map textures/Q_sky/cloudtop_bka
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/hdtextures/glassa1_a.tga
      blendfunc blend
   }
   {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}

textures/Q_shaders/house8frames
{
   qer_editorimage textures/q1textures/house8
   surfaceparm nodlight
   alphaFunc GE128
	{
	  map textures/q1textures/house8
	}
   {
	  map textures/Q_sky/cloudtop_bka
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/q1textures/house8_a
      blendfunc blend
   }
   {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/house13frames
{
   qer_editorimage textures/q1textures/house13
   surfaceparm nodlight
   alphaFunc GE128
   {
	  map textures/q1textures/house13
	}
   {
	  map textures/Q_sky/cloudtop_bka
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/q1textures/house13_a
      blendfunc blend
   }
      {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/house9frames
{
   qer_editorimage textures/q1textures/house9
   surfaceparm nodlight
   alphaFunc GE128
   {
	  map textures/q1textures/house9
	  surfaceparm nolightmap
	}
   {
	  map textures/Q_sky/cloudtop_bka
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/q1textures/house9_a
      blendfunc blend
   }
      {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/house9frames_hd
{
   qer_editorimage textures/hdtextures/house9
   surfaceparm nodlight
   alphaFunc GE128
   {
	  map textures/hdtextures/house9
	  surfaceparm nolightmap
	}
   {
	  map textures/Q_sky/cloudtop_bka
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/hdtextures/house9_a
      blendfunc blend
   }
      {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/brick8frames
{
   qer_editorimage textures/q1textures/brick8
   surfaceparm nodlight
   alphaFunc GE128
   {
	  map textures/q1textures/brick8
	}
   {
	  map textures/Q_sky/cloudtop_bka
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/q1textures/brick8_a
      blendfunc blend
   }
      {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/shopwindows01
{
	qer_editorimage textures/Q_window/citylight_up.jpg

	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks

	skyparms textures/Q_window/citylight - - //farbox cloudheight nearbox
}
textures/Q_shaders/shopwindows02
{
   qer_editorimage textures/Q_glass/glass7
   {
      map textures/Q_glass/glass7
	  tcGen environment
	  q3map_surfaceLight 350
   }
}
textures/Q_shaders/brick8frame_hd
{
qer_editorimage textures/hdtextures/brick8
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/hdtextures/brick8_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/window9frame_hd
{
qer_editorimage textures/hdtextures/window9
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/hdtextures/window9_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/cleanglass
{
qer_editorimage textures/Q_sky/cloudtop_bk
   surfaceparm nodlight
   surfaceparm trans
{
	  map textures/Q_sky/cloudtop_bka
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
}
textures/Q_shaders/cleanglass2
{
qer_editorimage textures/q1textures/qglass2
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
}
textures/Q_shaders/house3frame_hd
{
qer_editorimage textures/hdtextures/house3
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/hdtextures/house3_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/house19frame_hd
{
qer_editorimage textures/hdtextures/house19
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/hdtextures/house19_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/window2frame_hd
{
qer_editorimage textures/q1textures/window2
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/q1textures/window2_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/window4frame_hd
{
qer_editorimage textures/q1textures/window4
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/q1textures/window4_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/window7frame_hd
{
qer_editorimage textures/q1textures/window7
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/q1textures/window7_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/window8frame_hd
{
qer_editorimage textures/q1textures/window8
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/q1textures/window8_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/guNAdetxrc0frame_hd
{
qer_editorimage textures/q1textures/guNAdetxrc0
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/q1textures/guNAdetxrc0_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/window6frame_hd
{
qer_editorimage textures/q1textures/window6
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/q1textures/window6_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/chrushevka_module_chr1frame_hd
{
qer_editorimage textures/SckladTextureQ1/chrushevka_module_chr1
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/SckladTextureQ1/chrushevka_module_chr1_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/house24frame_hd
{
qer_editorimage textures/hdtextures/house24
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/hdtextures/house24_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/house20frame_hd
{
qer_editorimage textures/hdtextures/house20
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/hdtextures/house20_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/house13frame_hd
{
qer_editorimage textures/hdtextures/house13
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/hdtextures/house13_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/house8frame_hd
{
qer_editorimage textures/hdtextures/house8
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/hdtextures/house8_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/chrushevka_dver_chr1frame_hd
{
	qer_editorimage textures/SckladTextureQ1/chrushevka_dver_chr1
   surfaceparm nodlight
   alphaFunc GE128
   {
   map textures/SckladTextureQ1/black
   }
   {
	  map textures/SckladTextureQ1/chrushevka_dver_chr1_m0
	rgbGen identity
	blendFunc GL_ONE GL_ONE
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
      {
    map textures/SckladTextureQ1/chrushevka_dver_chr1_m1
    blendfunc blend
   }
   
         {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/podezd2frame_hd
{
	qer_editorimage textures/q1textures/podezd2
   surfaceparm nodlight
   alphaFunc GE128
   {
   map textures/SckladTextureQ1/black
   }
   {
	  map textures/SckladTextureQ1/chrushevka_dver_chr1_m0
	rgbGen identity
	blendFunc GL_ONE GL_ONE
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
      {
    map textures/q1textures/podezd2_m1
    blendfunc blend
   }
   
         {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/door_chrframe_hd
{
qer_editorimage textures/SckladTextureQ1/door_chr
   surfaceparm nodlight
   alphaFunc GE128
   {
   map textures/SckladTextureQ1/black
   }
   {
	  map textures/SckladTextureQ1/chrushevka_dver_chr1_m0
	rgbGen identity
	blendFunc GL_ONE GL_ONE
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
      {
    map textures/SckladTextureQ1/door_chr_m1
    blendfunc blend
   }
   
         {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/shopwindows03
{
   qer_editorimage textures/Q_glass/glass8
   surfaceparm nolightmap
   q3map_surfaceLight 350
   {
      map textures/Q_glass/glass8
	  tcGen environment
	  surfaceparm nolightmap
	  q3map_surfaceLight 350
   }
}
textures/Q_shaders/glass02
{
   qer_editorimage textures/Q_glass/glass4
   qer_trans 0.6
   surfaceparm nolightmap
   surfaceparm nodlight
   alphaFunc GE128
   {
      map textures/Q_glass/glass4
      blendfunc filter
      rgbGen identity
	  tcGen environment
	  dp_reflect 0.1
   }
}
textures/Q_shaders/metall01
{
	qer_editorimage textures/Q_door/door6
	cull disable
	{
		map textures/Q_metal/reflect5
		blendfunc blend
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
	}
}
textures/Q_shaders/Lightcorona01
{
	qer_editorimage textures/Q_other/corona0.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	alphaFunc GE128
	surfaceparm nonsolid
	cull disable
	deformVertexes autosprite
	{
		clampmap textures/Q_other/corona0.tga
		blendfunc add
		rgbGen identity
	}
}
textures/Q_shaders/LightcoronaSUN
{
	qer_editorimage textures/Q_other/corona1.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	alphaFunc GE128
	surfaceparm nonsolid
	cull disable
	deformVertexes autosprite
	{
		clampmap textures/Q_other/corona1.tga
		blendfunc add
		rgbGen identity
	}
}
textures/Q_shaders/Window0
{
	qer_editorimage textures/Q_window/window0_0.tga
	cull disable

		{
		map textures/Q_window/window0_1
		}
				{
		map textures/Q_window/window0_0
		blendFunc blend
		alphaFunc GE128
		rgbGen identity
		}
		   {
      map textures/Q_glass/glass8
	  tcGen environment
	  surfaceparm nolightmap
	  q3map_surfaceLight 350
	  blendFunc add
   }
}
textures/Q_shaders/roadground
{
	qer_editorimage textures/Q_grass/grass4
	q3map_tcGen ivector ( 100 0 0 ) ( 0 100 0 )
	{
		map textures/Q_grass/grass4
	rgbGen identity
	}
	{
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/grassterr
{
	qer_editorimage textures/Q_grass/grass2
	q3map_tcGen ivector ( 100 0 0 ) ( 0 100 0 )
	{
		map textures/Q_grass/grass2
	rgbGen identity
	}
	{
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/groundtoroadsand
{
qer_editorimage textures/Q_grass/grass4 
q3map_tcGen ivector ( 100 0 0 ) ( 0 100 0 )
{
		map textures/Q_grass/grass2
	rgbGen identity
	}
	{
		map textures/Q_grass/grass4
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	}
	{
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/roadsandtobrick
{
qer_editorimage textures/Q_stone/stone3
{
		map textures/Q_grass/grass4
	rgbGen identity
	}
	{
		map textures/Q_stone/stone3
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	q3map_tcGen ivector ( 100 0 0 ) ( 0 100 0 )
	}
	{
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/roadsandtograss
{
qer_editorimage textures/Q_stone/stone3
q3map_tcGen ivector ( 100 0 0 ) ( 0 100 0 )
{
		map textures/Q_grass/grass4
	rgbGen identity
	}
	{
		map textures/Q_grass/grass2
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	}
	{
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
textures/Q_shaders/sky01
{
	qer_editorimage textures/Q_sky/bluesky_up.tga

	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks

	skyparms textures/Q_sky/bluesky - - //farbox cloudheight nearbox
}
textures/Q_shaders/skySunny22
{
	qer_editorimage textures/Q_sky/Sky0Sunny_up.tga

	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks

	skyparms textures/Q_sky/Sky0Sunny - - //farbox cloudheight nearbox
}
textures/Q_shaders/ely_cloudtop
{
	qer_editorimage env/ely_cloudtop/cloudtop_ft.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 256
	surfaceparm sky
	q3map_surfacelight 200
	q3map_sun 1 1 1 200 100 30
	skyparms textures/Q_sky/cloudtop - -
}
textures/Q_shaders/ely_cloudtop2
{
	qer_editorimage env/ely_cloudtop/cloudtop_ft.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
        q3map_skylight 50 3
	surfaceparm sky
	q3map_sun 1 1 1 200 100 30
	skyparms textures/Q_sky/cloudtop - -
}
textures/Q_shaders/ely_cloudtop3
{
	qer_editorimage env/ely_cloudtop/cloudtop_ft.tga 
//        surfaceparm trans
        surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
        q3map_skylight 50 3
	surfaceparm sky
	q3map_sun 1 1 1 200 100 30
	skyparms textures/Q_sky/cloudtop - -
}
textures/Q_shaders/ely_cloudtop_nl
{
	qer_editorimage env/ely_cloudtop/cloudtop_ft.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	surfaceparm sky
	skyparms cloudtop - -
}
//--------------TEXTURES WITH ALPHA-------------
lamp_0
	{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	dpmeshcollisions
		{
		map models/props/lamp_0.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
		}
}
lamp_1
	{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	dpmeshcollisions
		{
		map models/props/lamp_1.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
		}
}
cpine1
	{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	dpmeshcollisions
		{
		map models/props/cpine1.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
		}
}
grapevine1
	{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	dpmeshcollisions
		{
		map models/props/grapevine1.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
		}
}
gbush0
	{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	dpmeshcollisions
		{
		map models/props/gbush0.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
		}
}
cbush0
	{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	dpmeshcollisions
		{
		map models/props/cbush0.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
		}
}
bpine4
	{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	dpmeshcollisions
		{
		map models/props/bpine4.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
		}
}
bpine3
	{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	dpmeshcollisions
		{
		map models/props/bpine3.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
		}
}
bpine2
	{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	dpmeshcollisions
		{
		map models/props/bpine2.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
		}
}
bpine0
	{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	dpmeshcollisions
		{
		map models/props/bpine0.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
		}
			{
}
textures/bbush0.tga
	{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	dpmeshcollisions
		{
		map models/props/bbush0.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
		}
}
apine1
	{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	dpmeshcollisions
		{
		map models/props/apine1.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
		}
}
ladasp0
	{
   surfaceparm nodlight
   {
   map textures/SckladTextureQ1/black
}
{
	  map textures/Q_sky/cloudtop_bk
	rgbGen identity
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
    alphaGen vertex
	tcGen environment
	dp_reflect 0.1
   }
   {
      map textures/hdtextures/house8_a
      blendfunc blend
   }
            {
      map $lightmap
      blendFunc GL_DST_COLOR GL_ZERO
      rgbGen identity
   }
}
ladasp1
	{
	surfaceparm forcecollider
		{
		map textures/qmodel/ladasp1.tga
		}
		{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
		}
	}
ladasp2
	{
	surfaceparm forcecollider
		{
		map textures/qmodel/ladasp2.tga
		}
		{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
		}
	}
ladasp3
	{
	surfaceparm forcecollider
		{
		map textures/qmodel/ladasp3.tga
		}
		{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
		}
	}