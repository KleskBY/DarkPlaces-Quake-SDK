textures/zlan/ground_0
{
	q3map_shadeangle 179
	q3map_forcemeta
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_lightmapsamplesize 8
	q3map_lightmapaxis z
	q3map_texturesize 512 512
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	{
		map textures/zlan03/ter_grasspatchy3.jpg
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/zlan/ground_1
{
	q3map_shadeangle 179
	q3map_forcemeta
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_lightmapsamplesize 8
	q3map_lightmapaxis z
	q3map_texturesize 512 512
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	{
		map textures/zlan03/ter_grass.jpg
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/zlan/ground_2
{
	q3map_shadeangle 179
	q3map_forcemeta
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_lightmapsamplesize 8
	q3map_lightmapaxis z
	q3map_texturesize 512 512
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	{
		map textures/zlan03/ter_dirt1.jpg
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/zlan/ground_3
{
	q3map_shadeangle 179
	q3map_forcemeta
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_lightmapsamplesize 8
	q3map_lightmapaxis z
	q3map_texturesize 512 512
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	{
		map textures/zlan03/conc_1.jpg
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/zlan/ground_0to1
{
	q3map_shadeangle 179
	q3map_forcemeta
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_lightmapsamplesize 8
	q3map_lightmapaxis z
	q3map_texturesize 512 512
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	
	{
		map textures/zlan03/ter_grasspatchy3.jpg
	}
	{
		map textures/zlan03/ter_grass.jpg
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/zlan/ground_0to2
{
	q3map_shadeangle 179
	q3map_forcemeta
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_lightmapsamplesize 8
	q3map_lightmapaxis z
	q3map_texturesize 512 512
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	
	{
		map textures/zlan03/ter_grasspatchy3.jpg
	}
	{
		map textures/zlan03/ter_dirt1.jpg
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/zlan/ground_0to3
{
	q3map_shadeangle 179
	q3map_forcemeta
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_lightmapsamplesize 8
	q3map_lightmapaxis z
	q3map_texturesize 512 512
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	
	{
		map textures/zlan03/ter_grasspatchy3.jpg
	}
	{
		map textures/zlan03/conc_1.jpg
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/zlan/ground_1to2
{
	q3map_shadeangle 179
	q3map_forcemeta
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_lightmapsamplesize 8
	q3map_lightmapaxis z
	q3map_texturesize 512 512
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	
	{
		map textures/zlan03/ter_grass.jpg
	}
	{
		map textures/zlan03/ter_dirt1.jpg
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/zlan/ground_1to3
{
	q3map_shadeangle 179
	q3map_forcemeta
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_lightmapsamplesize 8
	q3map_lightmapaxis z
	q3map_texturesize 512 512
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	
	{
		map textures/zlan03/ter_grass.jpg
	}
	{
		map textures/zlan03/conc_1.jpg
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/zlan/ground_2to3
{
	q3map_shadeangle 179
	q3map_forcemeta
	q3map_nonplanar
	q3map_lightmapmergable
	q3map_lightmapsamplesize 8
	q3map_lightmapaxis z
	q3map_texturesize 512 512
	q3map_tcGen ivector ( 128 0 0 ) ( 0 128 0 )
	
	{
		map textures/zlan03/ter_dirt1.jpg
	}
	{
		map textures/zlan03/conc_1.jpg
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		tcGen lightmap
	}
}

textures/zlan/ground.vertex
{
	{
		map textures/zlan03/ter_grasspatchy3.jpg
		rgbGen vertex
	}
}