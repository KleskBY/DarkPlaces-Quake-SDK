

models/mapobjects/kk/base
{
	surfaceparm alphashadow
	cull twosided
	nomipmaps
	{
         	map models/mapobjects/kk/base.tga
		alphaFunc GE128
		depthWrite
//		rgbgen lightingDiffuse
		rgbgen vertex
	}
}
models/mapobjects/kk/base4
{   
    
        {
                map textures/effects/base.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}   
        {
		
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
models/mapobjects/kk/bat
{
	surfaceparm alphashadow
	cull twosided
	nomipmaps
	{
         	map models/mapobjects/kk/blood gulch.tga
		alphaFunc GE128
		depthWrite
//		rgbgen lightingDiffuse
		rgbgen vertex
	}
}
models/mapobjects/kk/kkb
{
	surfaceparm alphashadow
	cull twosided
	nomipmaps
	{
         	map models/mapobjects/kk/base.tga
		alphaFunc GE128
		depthWrite
//		rgbgen lightingDiffuse
		rgbgen vertex
	}
}
models/mapobjects/kk/ramp
{
	surfaceparm alphashadow
	cull twosided
	nomipmaps
	{
         	map models/mapobjects/kk/detail cliff rock.tga
		alphaFunc GE128
		depthWrite
//		rgbgen lightingDiffuse
		rgbgen vertex
	}
}