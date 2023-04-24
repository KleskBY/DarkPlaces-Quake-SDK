
models/forge/diffusetable
{
	qer_editorimage models/forge/diffusetable.tga
	qer_trans 0.4
	q3map_lightimage models/forge/diffusetable.tga
	q3map_surfacelight 280
	cull disable
	{
		map models/forge/diffusetable.tga
		blendfunc add		
	}
	{
      		map $lightmap
     		blendFunc GL_DST_COLOR GL_ZERO
      		rgbGen identity
   	}
}