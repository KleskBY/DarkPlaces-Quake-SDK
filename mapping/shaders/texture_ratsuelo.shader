
ratsuelo
{	

	{
	map textures/ratsuelo.tga
	rgbGen identity
	depthFunc equal
	}
dpreflectcube textures/halo#004.jpg
{
map $lightmap
blendfunc add
tcGen lightmap
}
	{
      	map $lightmap
      	rgbGen identity
     	depthFunc equal
	}

}
