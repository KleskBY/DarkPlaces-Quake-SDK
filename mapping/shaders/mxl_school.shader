textures/sch_fx/mxl_black
{
	qer_editorimage textures/sch_fx/black.tga
	surfaceparm noimpact
	surfaceparm nolightmap

	{
	map	textures/sch_fx/black.tga
	}
}

textures/sch_fx/mxl_noc
{
	skyparms env/03/mxlnoc 512 -

	q3map_lightImage env/03/mxlnoc_up.tga

	q3map_sunExt 0.23 0.51 0.82 5 234 38 3 16	//red green blue intensity degrees elevation
	q3map_lightmapFilterRadius 0 8			//self other
	q3map_skyLight 10 3 // 100 3, 25 3

	surfaceparm sky
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nodlight

	nopicmip
	nomipmaps

	qer_editorimage textures/sch_fx/mxl_noc.tga

}




textures/sch_fx/mxl_sklo
{
	//qer_trans 0.5
	qer_editorimage textures/sch_fx/sklo2.tga

//	q3map_cloneShader textures/sch_fx/mxl_sklo_back
	q3map_lightmapBrightness 99.9
//	q3map_lightRGB 1 1 1
//	q3map_surfacelight 100
//	q3map_lightSubdivide 32
	cull none

	surfaceparm trans

	{
		map textures/sch_fx/sklo2.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map textures/sch_fx/tinfx3.tga
		blendFunc GL_ONE GL_ONE
		rgbGen identity
		tcMod scale 2.0 2.0
		tcGen environment 
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}

}

textures/sch_fx/mxl_sklo_sklenik
{
	//qer_trans 0.5
	qer_editorimage textures/sch_fx/sklo2.tga

//	q3map_cloneShader textures/sch_fx/mxl_sklo_back
	q3map_lightmapBrightness 6.0
//	q3map_lightRGB 1 1 1
//	q3map_surfacelight 100
//	q3map_lightSubdivide 32
	cull none
	nopicmip

	surfaceparm trans

	{
		map textures/sch_fx/sklo2.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map textures/sch_fx/tinfx3.tga
		blendFunc GL_ONE GL_ONE
		rgbGen identity
		tcMod scale 2.0 2.0
		tcGen environment 
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}

}

textures/sch_fx/mxl_sklo_off
{
	qer_editorimage textures/sch_fx/sklo2.tga
	surfaceparm trans
	cull none
	
	{
		map textures/sch_fx/tinfx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/sch_fx/sklo2.tga
		blendfunc blend
		rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}
}


textures/sch_fx/mxl_sklo_telo
{
	qer_editorimage textures/sch_fx/sklo_pruhy.tga
	surfaceparm trans
	cull none
	nopicmip
	
	{
		map textures/sch_fx/tinfx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/sch_fx/sklo_pruhy.tga
		blendfunc blend
		rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}
}


textures/sch_fx/mxl_sklo_blind
{
	qer_editorimage textures/sch_fx/sklo_blind.tga
	q3map_lightmapBrightness 0.7

	{
		map textures/sch_iner/posil_2.tga
	}
	{
		map textures/sch_fx/tinfx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
		tcMod scale 2.0 2.0
	}
	{
		map textures/sch_fx/sklo2.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
//		tcGen lightmap 
	}
}


textures/sch_fx/mxl_sklo_kantyn
{
	qer_editorimage textures/sch_fx/sklo_pruhy.tga
	q3map_lightmapBrightness 0.7

	{
		map textures/sch_fx/tinfx.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/sch_fx/sklo_pruhy.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
//		tcGen lightmap 
	}
}



textures/sch_fx/mxl_sklo_back
{
	//qer_trans 0.5
	
	q3map_invert
	q3map_lightImage textures/sch_fx/sklo2.tga
	q3map_lightmapBrightness 2.0
	//q3map_lightRGB 1 0 0
	surfaceparm trans

	{
		map textures/sch_fx/sklo2.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map textures/sch_fx/tinfx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}
}


textures/sch_fx/mxl_sklo_out
{
	qer_editorimage textures/sch_tga/outdoor_skloa.tga
	//q3map_lightimage textures/sch_fx/orange_l.tga
	//q3map_surfacelight 150
	surfaceparm trans
	cull disable
	qer_trans 0.5
	{
		map textures/sch_fx/tinfx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/sch_tga/outdoor_skloa.tga
		blendfunc blend
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
//		tcGen lightmap 
	}
}

textures/sch_fx/mxl_lux
{
	qer_editorimage textures/sch_tga/lux.tga
	surfaceparm trans
	cull disable
	qer_trans 0.5
	{
		map textures/sch_fx/tinfx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/sch_tga/lux.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
	}
}

textures/sch_fx/mxl_lux-xx
{
	qer_editorimage textures/sch_tga/lux.tga
	surfaceparm trans
	cull back
	qer_trans 0.5
	{
		map textures/sch_fx/tinfx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/sch_tga/lux.tga
		blendfunc blend
		//rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
//		tcGen lightmap 
	}
}


textures/sch_fx/mxl_lux222
{
	qer_editorimage textures/sch_tga/lux.tga
	{
		map textures/base_floor/metfloor1.tga
		rgbGen identity
	}
	{
		map textures/sch_fx/tinfx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/sch_tga/lux.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
//		tcGen lightmap 
	}
}



textures/sch_tga/bush00
{
	qer_editorimage textures/sch_tga/bush00.tga
	surfaceparm alphashadow
	surfaceparm trans
	cull disable
	nopicmip
	{
		map textures/sch_tga/bush00.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		depthFunc equal
	}
}

textures/sch_tga/grfield_a
{
	surfaceparm alphashadow
	surfaceparm trans
	cull disable
	nopicmip
	{
		map textures/sch_tga/grfield_a.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
//		tcGen lightmap 
		depthFunc equal
	}
}

textures/sch_tga/bush01
{
	surfaceparm alphashadow
	surfaceparm trans
	cull disable
	nopicmip
	{
		map textures/sch_tga/bush01.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		depthFunc equal
	}
}

textures/sch_tga/rklec1
{
	surfaceparm alphashadow
	surfaceparm trans
	cull disable
	nopicmip
	{
		map textures/sch_tga/rklec1.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
//		tcGen lightmap 
		depthFunc equal
	}
}

textures/sch_tga/agrass4
{
	surfaceparm alphashadow
	surfaceparm trans
	cull disable
	nopicmip
	{
		map textures/sch_tga/agrass4.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
//		tcGen lightmap 
		depthFunc equal
	}
}

textures/sch_tga/flower01
{
	surfaceparm alphashadow
	surfaceparm trans
	cull disable
	nopicmip
	{
		map textures/sch_tga/flower01.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
//		tcGen lightmap 
		depthFunc equal
	}
}

textures/sch_tga/it_truhlik
{
	surfaceparm alphashadow
	surfaceparm trans
	cull disable
	nopicmip
	{
		map textures/sch_tga/it_truhlik.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
//		tcGen lightmap 
		depthFunc equal
	}
}

textures/sch_tga/rker1
{
	surfaceparm alphashadow
	surfaceparm trans
	cull disable
	nopicmip
	{
		map textures/sch_tga/rker1.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
//		tcGen lightmap 
		depthFunc equal
	}
}

textures/sch_fx/corona
{
	qer_editorimage textures/sch_fx/corona.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	{
		clampmap textures/sch_fx/corona.tga
		blendfunc add
	}
}



models/mapobjects/mxl_tgm/rsbulb01
{
	{
		map $lightmap 
		rgbGen identity
//		tcGen lightmap 
	}
	{
		map models/mapobjects/rsbulb01.tga
		blendfunc filter
		rgbGen identity
	}
	{
		map models/mapobjects/rsbulb01.tga
		blendfunc add
	}
}

textures/sch_tgm/pletivo
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
//	sort 10
	cull disable
	{
		map textures/sch_tgm/pletivo.tga
		blendfunc gl_zero gl_one_minus_src_color
	}
}

textures/sch_tgm/pletivo_velky
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
//	sort 10
	cull disable
	{
		map textures/sch_tgm/pletivo_velky.tga
		blendfunc gl_zero gl_one_minus_src_color
	}
}

textures/sch_tgm/sprusle
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
//	sort 10
	cull disable
	{
		map textures/sch_tgm/sprusle.tga
		blendfunc gl_zero gl_one_minus_src_color
	}
}


models/mapobjects/mxl_tgm/classdesk
{
	qer_editorimage models/mapobjects/mxl_tgm/classdesk.tga
	//q3map_lightimage models/mapobjects/mxl_tgm/classdesk.tga
	//q3map_clipModel
	//q3map_vertexshadows
	//q3map_lightmapsamplesize 24
	//surfaceparm metalsteps

	{
		map models/mapobjects/mxl_tgm/classdesk.tga
		rgbGen exactVertex
	}

}

models/mapobjects/mxl_tgm/classchair
{
	qer_editorimage models/mapobjects/mxl_tgm/classchair.tga
	//q3map_clipModel
	//q3map_vertexshadows
	//q3map_lightmapsamplesize 24

	{
		map models/mapobjects/mxl_tgm/classchair.tga
		rgbGen exactVertex
	}

}

models/mapobjects/mxl_tgm/board_desk
{
	qer_editorimage models/mapobjects/mxl_tgm/board_desk.tga
	//q3map_clipModel
	//q3map_vertexshadows
	//q3map_lightmapsamplesize 24

	{
		map models/mapobjects/mxl_tgm/board_desk.tga
		rgbGen exactVertex
	}

}

models/mapobjects/mxl_tgm/board_bottom
{
	qer_editorimage models/mapobjects/mxl_tgm/board_bottom.tga
	//q3map_clipModel
	//q3map_vertexshadows
	//q3map_lightmapsamplesize 24

	{
		map models/mapobjects/mxl_tgm/board_bottom.tga
		rgbGen exactVertex
	}

}



models/mapobjects/mxl_tgm/l01c
{

	surfaceparm alphashadow
	cull disable
	nopicmip

	{
		map models/mapobjects/mxl_tgm/l01c.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}


models/mapobjects/mxl_tgm/rklec1
{
	surfaceparm alphashadow
	cull disable
	nopicmip
	{
		map models/mapobjects/mxl_tgm/rklec1.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/mxl_tgm/bush01
{
	surfaceparm alphashadow
	cull disable
	nopicmip
	{
		map models/mapobjects/mxl_tgm/bush01.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}


textures/sch_fx/corona_y
{
    deformVertexes autoSprite
    surfaceparm trans
    surfaceparm nomarks
    surfaceparm nolightmap
    cull none
	nopicmip
          {
            clampmap textures/sch_fx/mxl_corona_y.tga
            blendFunc GL_ONE GL_ONE
          }
}


models/mapobjects/mxl_tgm/corona
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	nopicmip
	{
		clampmap models/mapobjects/mxl_tgm/corona.tga
		blendfunc add
	}
}

models/mapobjects/mxl_tgm/bulb
{
	surfaceparm nomarks
	q3map_surfacelight 100
	{
		map $lightmap 
		rgbGen identity
//		tcGen lightmap 
	}
	{
		map models/mapobjects/mxl_tgm/bulb.tga
		blendfunc filter
		rgbGen identity
	}
	{
		map models/mapobjects/mxl_tgm/bulb.tga
		blendfunc add
	}
}


models/mapobjects/mxl_tgm/schlampg
{
	surfaceparm trans
	cull disable
	qer_trans 0.5
	nopicmip
	//{
	//	map textures/sch_fx/sklo.tga
	//	blendfunc gl_dst_color gl_src_color
	//	rgbGen identity
	//}
	{
		map textures/sch_fx/tinfx.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
//		tcGen lightmap 
	}
}

textures/sch_fx/mraky
{
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm nolightmap
	surfaceparm nomarks

	{
	map textures/sch_fx/mraky.tga
	blendfunc blend
	}
}

//___________________BASKET_KOS_________________________________

models/mapobjects/mxl_tgm/ram_modra
{
	//qer_editorimage models/mapobjects/mxl_tgm/board_desk.tga
	//q3map_clipModel

	//q3map_lightmapsamplesize 4
	q3map_lightmapBrightness 2.0

	{
		map models/mapobjects/mxl_tgm/ram_modra.tga
		rgbGen exactVertex
	}
}

models/mapobjects/mxl_tgm/ram_bila
{
	//q3map_clipModel

	//q3map_lightmapsamplesize 4
	q3map_lightmapBrightness 2.0

	{
		map models/mapobjects/mxl_tgm/ram_bila.tga
		rgbGen exactVertex
	}

}

models/mapobjects/mxl_tgm/ram_oranzova
{
	//q3map_clipModel

	//q3map_lightmapsamplesize 4
	q3map_lightmapBrightness 2.0

	{
		map models/mapobjects/mxl_tgm/ram_oranzova.tga
		rgbGen exactVertex
	}

}

models/mapobjects/mxl_tgm/zavazi
{
	//q3map_clipModel

	//q3map_lightmapsamplesize 4
	q3map_lightmapBrightness 2.0

	{
		map models/mapobjects/mxl_tgm/zavazi.tga
		rgbGen exactVertex
	}

}

models/mapobjects/mxl_tgm/chranic
{
	//q3map_clipModel

	//q3map_lightmapsamplesize 4
	q3map_lightmapBrightness 2.0

	{
		map models/mapobjects/mxl_tgm/chranic.tga
		rgbGen exactVertex
	}

}

models/mapobjects/mxl_tgm/kolo
{
	//q3map_clipModel

	//q3map_lightmapsamplesize 4
	q3map_lightmapBrightness 2.0

	{
		map models/mapobjects/mxl_tgm/kolo.tga
		rgbGen exactVertex
	}

}


models/mapobjects/mxl_tgm/plexi
{

	//q3map_cloneShader textures/sch_fx/mxl_sklo_back
	q3map_lightmapBrightness 9.9
	//q3map_clipModel

	//q3map_lightmapsamplesize 4

	surfaceparm trans
	surfaceparm alphashadow
	cull disable
	
	{
		map textures/sch_fx/tinfx.tga
		blendfunc add
		tcGen environment 
	}
	{
		map textures/sch_fx/sklo2.tga
		blendfunc blend
		rgbGen exactVertex
	}
        {
		map $lightmap
		blendFunc filter
	}
}


models/mapobjects/mxl_tgm/sitka
{
	//q3map_clipModel

	//q3map_lightmapsamplesize 4
	q3map_lightmapBrightness 3.0

	surfaceparm trans
	surfaceparm alphashadow
	cull disable
	nopicmip
	{
		map models/mapobjects/mxl_tgm/sitka.tga
		blendfunc blend
		rgbGen exactVertex
	}
}

//___________________BASKET_KOS_END____________________________


models/mapobjects/mxl_tgm/popelnice
{

	{
		map models/mapobjects/mxl_tgm/popelnice.tga
		rgbGen exactVertex
	}

}


textures/sch_tgm/sitka_hala
{
	qer_editorimage textures/sch_tgm/hala_sitka2.tga

	surfaceparm nolightmap	// important!
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nonsolid
	surfaceparm nomarks
	cull disable
	sort 10
	nopicmip

	{
		map textures/sch_tgm/hala_sitka2.tga
		blendfunc blend
		rgbGen identity

	}

}


textures/sch_iner/svetlo_kula_off
{

	{
		map textures/sch_iner/svetlo_kula.tga
		rgbGen exactvertex
	}
}


textures/sch_iner/svetlo_kula
{
	surfaceparm nomarks
	q3map_surfacelight 100
	{
		map $lightmap 
		rgbGen identity
//		tcGen lightmap 
	}
	{
		map textures/sch_iner/svetlo_kula.tga
		blendfunc filter
		rgbGen identity
	}
	{
		map textures/sch_iner/svetlo_kula.tga
		blendfunc add
	}
}


textures/sch_iner/svetlo_placek_off
{

	{
		map textures/sch_iner/svetlo_placek2.tga
		rgbGen exactvertex
	}

}


textures/sch_iner/svetlo_placek
{
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm nolightmap
	q3map_surfacelight 200 // 100

	{
		map textures/sch_iner/svetlo_placek.tga
		rgbGen identity
	}
	{
		map textures/sch_iner/svetlo_placek.tga
		blendfunc add
	}
}

textures/sch_fx/mxl_corona
{
    deformVertexes autoSprite
    surfaceparm trans
    surfaceparm nomarks
    surfaceparm nolightmap
    cull none
	nopicmip
          {
            clampmap textures/sch_fx/mxl_corona.tga
            blendFunc GL_ONE GL_ONE
          }
}

textures/sch_fx/corona_cod
{
    deformVertexes autoSprite
    surfaceparm trans
    surfaceparm nomarks
    surfaceparm nolightmap
    cull none
	nopicmip
          {
            clampmap textures/sch_fx/mxl_corona.tga
            blendFunc GL_ONE GL_ONE
          }
}


textures/sch_fx/corona_tgm
{
    deformVertexes autoSprite
    surfaceparm trans
    surfaceparm nomarks
    surfaceparm nolightmap
    cull none
	nopicmip
          {
            clampmap textures/sch_fx/corona_tgm.tga
            blendFunc GL_ONE GL_ONE
          }
}


textures/sch_fx/corona_slp
{
    deformVertexes autoSprite
    surfaceparm trans
    surfaceparm nomarks
    surfaceparm nolightmap
    cull none
	nopicmip
          {
            clampmap textures/sch_fx/corona_slp.tga
            blendFunc GL_ONE GL_ONE
          }
}



textures/sch_fx/corona
{
    deformVertexes autoSprite
    surfaceparm trans
    surfaceparm nomarks
    surfaceparm nolightmap
    cull none
	nopicmip
          {
            clampmap textures/sch_fx/corona.tga
            blendFunc GL_ONE GL_ONE
          }
}



models/mapobjects/mxl_tgm/hajzl_a2
{
	qer_editorimage models/mapobjects/mxl_tgm/hajzl_a.tga

	//q3map_clipModel

	//q3map_lightmapsamplesize 0.5

	{
		map models/mapobjects/mxl_tgm/hajzl_a.tga
		rgbGen exactVertex
	}

}

models/mapobjects/mxl_tgm/hajzl_b2
{
	qer_editorimage models/mapobjects/mxl_tgm/hajzl_b.tga

	//q3map_clipModel

	//q3map_lightmapsamplesize 0.5

	{
		map models/mapobjects/mxl_tgm/hajzl_b.tga
		rgbGen exactVertex
	}

}


textures/sch_tgm/drevo_svetly_mod
{
	qer_editorimage textures/sch_tgm/drevo_svetly.tga

	//q3map_clipModel

	//q3map_lightmapsamplesize 0.5

	{
		map textures/sch_tgm/drevo_svetly.tga
		rgbGen exactVertex
	}

}


textures/sch_tgm/hala_cary2
{
	qer_trans 0.75
	
	q3map_nonplanar
	q3map_shadeAngle 179	// for most efficient rendering
	q3map_noTJunc
	
	surfaceparm nonsolid
	surfaceparm nomarks
	surfaceparm nolightmap	// important!
	surfaceparm trans
	
	polygonOffset
	nopicmip
	
	{
		map textures/sch_tgm/hala_cary2.tga
		blendfunc add
//		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR	// *invert* the texture, this is for correct fogging
		rgbGen identity
	}
}



models/mapobjects/mxl_tgm/bar_zidla
{
	qer_editorimage models/mapobjects/mxl_tgm/bar_zidla.tga
	
	//q3map_clipModel

	//q3map_lightmapsamplesize 24

	{
		map models/mapobjects/mxl_tgm/bar_zidla.tga
		rgbGen exactVertex
	}

}

models/mapobjects/mxl_tgm/hasicak
{
	qer_editorimage models/mapobjects/mxl_tgm/hasicak.tga
	
	//q3map_clipModel

	//q3map_lightmapsamplesize 24

	{
		map models/mapobjects/mxl_tgm/hasicak.tga
		rgbGen exactVertex
	}

}

models/mapobjects/mxl_tgm/porcel
{
	qer_editorimage models/mapobjects/mxl_tgm/porcel.tga
	
	//q3map_clipModel

	//q3map_lightmapsamplesize 0.5

	{
		map models/mapobjects/mxl_tgm/porcel.tga
		rgbGen exactVertex
	}
}

models/mapobjects/mxl_tgm/porcel_odtok
{
	qer_editorimage models/mapobjects/mxl_tgm/porcel_odtok.tga
	
	//q3map_clipModel

	//q3map_lightmapsamplesize 0.5

	{
		map models/mapobjects/mxl_tgm/porcel_odtok.tga
		rgbGen exactVertex
	}
}

textures/sch_fx/chrom
{
	//q3map_clipModel


	{
		map textures/sch_fx/chrome_env.tga
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/sch_fx/chrome_metal.tga
		blendfunc add
		rgbGen exactVertex
		//rgbGen identity
		tcMod scale 0.0693 0.0712
		detail
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen exactVertex
	//	//rgbGen identity
//		tcGen lightmap 
	}
}

textures/sch_iner/tv
{

	{
		map textures/sch_fx/tinfx.tga
		blendfunc blend
		rgbGen exactVertex
		tcGen environment 
	}
	{
		map textures/sch_iner/tv.tga
		blendfunc blend
		rgbGen exactVertex
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
	}
}

//-------------------------Les_horizont------------------------

textures/sch_tga/lesy_horizont
{


	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	q3map_vertexshadows
	//q3map_lightmapsamplesize 24
	nopicmip

	{
		map textures/sch_tga/lesy_horizont.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}



textures/sch_tga/lesy_horizont2
{

	surfaceparm trans
	surfaceparm alphashadow
	nopicmip

	{
		map textures/sch_tga/lesy_horizont.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_ALPHA
	}
	{
		map textures/sch_tga/lesy_horizont.tga
		blendFunc GL_SRC_ALPHA GL_ONE
		rgbGen vertex
	}
}






//-------------------------Mesic------------------------


textures/sch_fx/mesic

{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	nopicmip
	{
		map textures/sch_fx/mesic.tga
		alphaFunc GE128
	}
}