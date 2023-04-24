models/mapobjects/rangarot/base2
{   
    
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/effects/base.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

models/mapobjects/rangarot/base4
{   
    
        {
                map textures/effects/base.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}   
  
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
models/mapobjects/rangarot/m_r.ASE
{
	surfaceparm alphashadow
	cull twosided
	nomipmaps
	{
         	map models/mapobjects/rangarot/m_r.jpg
		alphaFunc GE128
		depthWrite
//		rgbgen lightingDiffuse
		rgbgen vertex
	}
}
models/mapobjects/rangarot/cit_tree_leafa
{
	cull disable
	{
		map models/mapobjects/rangarot/cit_tree_leafa.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/decal_road_loading
{
	cull disable
	{
		map models/foundry_texture/decal_road_loading.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/decal_caution_loadingzone
{
	cull disable
	{
		map models/foundry_texture/decal_caution_loadingzone.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/decal_danger
{
	cull disable
	{
		map models/foundry_texture/decal_danger.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/decal_hazard_strip
{
	cull disable
	{
		map models/foundry_texture/decal_hazard_strip.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/decal_painted_variety
{
	cull disable
	{
		map models/foundry_texture/decal_painted_variety.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/decal_painted_variety_0_diffuse
{
	cull disable
	{
		map models/foundry_texture/decal_painted_variety_0_diffuse.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/decal_painted_variety_2_diffuse
{
	cull disable
	{
		map models/foundry_texture/decal_painted_variety_2_diffuse.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/decal_road_stripe_long
{
	cull disable
	{
		map models/foundry_texture/decal_road_stripe_long.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/decal_road_stripe_short
{
	cull disable
	{
		map models/foundry_texture/decal_road_stripe_short.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/decal_voi_factory_south_a
{
	cull disable
	{
		map models/foundry_texture/decal_voi_factory_south_a.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/decal_ware_floorstrip
{
	cull disable
	{
		map models/foundry_texture/decal_ware_floorstrip.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/glass_overhead_broken
{
	cull disable
	{
		map models/foundry_texture/glass_overhead_broken.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/ware_glass_crudglass
{
	cull disable
	{
		map models/foundry_texture/ware_glass_crudglass.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_texture/ware_grate
{
	cull disable
	{
		map models/foundry_texture/ware_grate.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128

	}
}
models/zanzibar/sr_palmbranch
{
	cull disable
	{
		map models/zanzibar/sr_palmbranch.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

textures/timberland/timberland_treesclump_filler
{
	cull disable
	{
		map textures/timberland/timberland_treesclump_filler.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/rangarot/m_r4
{
	surfaceparm alphashadow
	cull twosided
	nomipmaps
	{
         	map models/mapobjects/rangarot/dirt.jpg
		alphaFunc GE128
		depthWrite
//		rgbgen lightingDiffuse
		rgbgen vertex
	}
}
models/mapobjects/rangarot/m_r3
{
	surfaceparm alphashadow
	cull twosided
	nomipmaps
	{
         	map models/mapobjects/rangarot/pool2.jpg
		alphaFunc GE128
		depthWrite
//		rgbgen lightingDiffuse
		rgbgen vertex
	}
}
models/mapobjects/rangarot/pelican
{
	surfaceparm alphashadow
	cull twosided
	nomipmaps
	{
         	map models/mapobjects/rangarot/pelican.jpg
		alphaFunc GE128
		depthWrite
//		rgbgen lightingDiffuse
		rgbgen vertex
	}
}

models/mapobjects/rangarot/base_rangarot
{
	surfaceparm alphashadow
	cull twosided
	nomipmaps
	{
         	map models/mapobjects/rangarot/paredesreachblu.jpg
		alphaFunc GE128
		depthWrite
//		rgbgen lightingDiffuse
		rgbgen vertex
	}
}
models/mapobjects/rangarot/cit_tree_leafa2
{
	cull disable
	{
		map models/mapobjects/rangarot/cit_tree_leafa2.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/mapobjects/rangarot/plant_broadleaf_leaf
{
	cull disable
	{
		map models/mapobjects/rangarot/plant_broadleaf_leaf.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/cyclo/window_high_rise
{
	cull disable
	{
		map models/cyclo/window_high_rise.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/danger/tree_pine_bough
{
	cull disable
	{
		map models/danger/tree_pine_bough.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/cyclo/palm_frond_a
{
	cull disable
	{
		map models/cyclo/palm_frond_a.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}

models/mapobjects/rangarot/snowpine_leaf2
{
	cull disable
	{
		map models/mapobjects/rangarot/snowpine_leaf2.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/mapobjects/rangarot/tree_leafy_leaves
{
	cull disable
	{
		map models/mapobjects/rangarot/tree_leafy_leaves.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/mapobjects/rangarot/tree_leafydense_leaves
{
	cull disable
	{
		map models/mapobjects/rangarot/tree_leafydense_leaves.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
textures/heaven/barrera
{
	cull disable
	{
	map textures/heaven/barrera.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}


models/ruin/tree_leafy_leaves
{
	cull disable
	{
		map models/ruin/tree_leafy_leaves.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/headlong/p_2
{
	cull disable
	{
		map models/headlong/p_2.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/ruin/vines_hanging
{
	cull disable
	{
		map models/ruin/vines_hanging.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/forge/diffusetable
{
	cull disable
	{
		map models/forge/diffusetable.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/mapobjects/rangarot/halo_skyworld
{
	qer_editorimage models/mapobjects/rangarot/halo_skyworld.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_sun 1 1 1 80 -41 58
	q3map_surfacelight 350
	skyparms env/mon_sky - -
}
models/grass2
{
     surfaceparm alphashadow
	cull disable
	{
		map models/grass2.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_textures/decals_weathered
{
     surfaceparm alphashadow
	cull disable
	{
		map models/foundry_textures/decals_weathered.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_textures/unsc
{
     surfaceparm alphashadow
	cull disable
	{
		map models/foundry_textures/unsc.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}
models/foundry_textures/fence
{
     surfaceparm alphashadow
	cull disable
	{
		map models/foundry_textures/fence.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
}






