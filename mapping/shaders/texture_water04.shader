
textures/water04
{
	surfaceparm nonsolid
	surfaceparm nolightmap
	cull disable
	deformVertexes wave 100 sin 0 1 0 1.5 
	{
		map textures/water04.tga
		blendfunc blend
		rgbGen Vertex
		tcMod scroll 0 -1.5
		alphaGen Vertex
	}
}


