// ciel
textures/pr4/kingdomskyfix
{
	qer_editorimage textures/pr4/kingdomskyfix.jpg

	q3map_backsplash 0 0
	q3map_sunExt 248 232 190 450 130 55 3 16
	q3map_skylight 325 3
	q3map_lightRGB 248 232 190
	q3map_lightmapFilterRadius 0 64
	
	surfaceparm sky
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nodlight
	surfaceparm nomarks

	nopicmip
	nomipmaps

	skyparms env/kingdomsky3/runycielcorio 512 -
	
}




//montagne
textures/pr5/mont01
{     
	  cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow
	  sort banner

        {
                map textures/pr5/mont01.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
         }
}



//herbesmodel
textures/runy8/runherbemodel002
{     
	  cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow
	  surfaceparm trans
	  sort banner

        {
                map textures/runy8/runherbemodel002.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
         }
}


textures/runy8/runherbemodel003
{
  
	  cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow
	  surfaceparm trans
        sort banner

        {
                map textures/runy8/runherbemodel003.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
         }
}

//---------------------------------------------



//grille new
textures/pr4/grille01
{ 
	surfaceparm alphashadow
	cull none  
	surfaceparm trans
	//surfaceparm nonsolid
	//surfaceparm nomarks
      sort banner
	nopicmip 
	nomipmaps

	{ 
   		
            map textures/pr4/grille01.tga
   		alphaFunc GE128  
   		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA 
   		depthwrite   
	} 
	{
		map $lightmap 
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
		rgbGen vertex
	}


}


textures/pr4/objet_torche3
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow
        sort banner

        {
                map textures/pr4/objet_torche3.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
                
        }
}




textures/pr4/balc1
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow
        sort banner
        {
                map textures/pr4/balc1.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
                
        }
}


//Lierre2
textures/pr5/lierre02
{ 
	surfaceparm alphashadow
	cull none
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm nomarks 
	nopicmip
      deformVertexes wave 50 sin 0 .3 0 .3
	{ 
   		
            map textures/pr5/lierre02.tga
 		rgbGen vertex
		depthWrite
		alphaFunc GE128
	} 

}

//Lierre3
textures/pr5/lierre03
{ 
	surfaceparm alphashadow
	cull none
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm nomarks 
	nopicmip
      deformVertexes wave 50 sin 0 .3 0 .3
	{ 
   		
            map textures/pr5/lierre03.tga
 		rgbGen vertex
		depthWrite
		alphaFunc GE128
	} 

}


//Lierre4
textures/pr5/lierre04
{ 
	surfaceparm alphashadow
	cull none
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm nomarks 
	nopicmip
      deformVertexes wave 50 sin 0 .3 0 .3
	{ 
   		
            map textures/pr5/lierre04.tga
 		rgbGen vertex
		depthWrite
		alphaFunc GE128
	} 

}


textures/pr5/coro1
{
	deformVertexes autoSprite
	q3map_surfacelight 200
	q3map_lightRGB 1 0 0
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
      {
      	clampmap textures/pr5/coro1.jpg
            blendFunc GL_ONE GL_ONE
	}
}

textures/common/invisible
{
	surfaceparm nolightmap			
        {
                map textures/common/invisible.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
}




//drapeau lion long
textures/pr5/draplionlong01
{ 
	surfaceparm alphashadow
	cull none  
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm nomarks
	nopicmip 
	nomipmaps
	tessSize 64
	deformVertexes wave 100 sin 0 3 0 .7
      sort banner


	{ 
   		
            map textures/pr5/draplionlong01.tga
   		alphaFunc GE128  
   		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA 
   		depthwrite   
	} 
	{
		map $lightmap 
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
		rgbGen vertex
	}


}


//drapeau sanglier long
textures/pr5/drapsanglierlong01
{ 
	surfaceparm alphashadow
	cull none  
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm nomarks
	nopicmip 
	nomipmaps
	tessSize 64
	deformVertexes wave 100 sin 0 3 0 .7
      sort banner

	{ 
   		
            map textures/pr5/drapsanglierlong01.tga
   		alphaFunc GE128  
   		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA 
   		depthwrite   
	} 
	{
		map $lightmap 
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
		rgbGen vertex
	}


}

//-------
//liquids fontaine
//-------

textures/pr5/eaufontaine01
	{
		qer_editorimage textures/pr5/eaufontaine01.tga
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
	
		cull disable
		deformVertexes wave 64 sin .5 .5 0 .5	
		
		{ 
			map textures/pr5/pool3d_5.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 1.5 0 1.5 1 1 2
			tcmod scroll -.05 .001
		}
	
		{ 
			map textures/pr5/pool3d_6.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 0 1.5 1 1.5 2 1
			tcmod scroll .025 -.001
		}

		{ 
			map textures/pr5/pool3d_3.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .25 .5
			tcmod scroll .001 .025
		}
	
		{
			map $lightmap
			blendFunc GL_dst_color GL_zero
			rgbgen identity		
		}
	

}


textures/ut_prague/fs_rain2
{
        surfaceparm trans	
        surfaceparm nomarks	
	surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
	{
		map textures/ut_prague/fs_rain2.tga
                tcMod Scroll .3 2      //rain used to be going backwards (!!!)
                blendFunc GL_ONE GL_ONE
        }
}


textures/pr4/drap_lion
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow
	  tessSize 64
	    deformVertexes wave 100 sin 0 3 0 .7
          //deformVertexes normal 0.2 2
		sort banner
        {
                map textures/pr4/drap_lion.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
         }
}

textures/pr4/drap_sanglier
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow
        tessSize 64
	    deformVertexes wave 100 sin 0 3 0 .7
            //deformVertexes normal 0.2 2
		sort banner
        {
                map textures/pr4/drap_sanglier.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
                
        }
}

textures/pr4/grille01
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow

        {
                map textures/pr4/grille01.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
                
        }
}

textures/pr/objet_torche3
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow

        {
                map textures/pr/objet_torche3.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
                
        }
}

textures/pr4/prot01
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow

        {
                map textures/pr4/prot01.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
                
        }
}

textures/pr4/balc1
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow

        {
                map textures/pr4/balc1.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
                
        }
}


//Tree1
models/mapobjects/trees_sm/branch_t
{
   surfaceparm trans
   surfaceparm nonsolid
   surfaceparm nolightmap
   surfaceparm noimpact
   cull none
   nopicmip
   
    deformVertexes wave 5 sin 0 .3 0 .3
   {
      map models/mapobjects/trees_sm/branch_t.tga
      alphaFunc GE128
      rgbGen vertex
   }
}

