//dp_water ReflectAmount FresnelAmount DiffuseRefractAmount BumpAmount  1 1 1  R G B  Alpha

textures/liquids/dpwater
{
	qer_editorimage textures/map01/scuzzy_1.tga
	qer_trans 0.5
	
	dpglossintensitymod 4
	dpglossexponentmod 4
//	dpmeshcollisions
	
	surfaceparm nomarks
	surfaceparm trans 
//	surfaceparm water
//	surfaceparm nolightmap
	cull none
	q3map_globaltexture
	tessSize 256

	{
		map textures/map01/scuzzy_1.tga
		tcmod scale 0.3 0.4
		tcMod scroll 0.02 0.02
		blendfunc add
		alphaGen vertex
	}
		dpreflectcube cubemaps/default/sky
	{
		map $lightmap
		blendfunc add
		tcGen lightmap
	}
	//dp_water 0.1 1   1 0.6   1 1 1   0.8 0.85 0.9   0.1
	dp_water 0.85 1   1 1   1 1 1   0.75 0.0 0.0   0.01
	
	//dp_water 0.1 1.2  1.4 0.7  1 1 1  1 1 1  0.1
}
