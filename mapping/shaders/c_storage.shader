
bidon
{	

	{
	map models/c_storage.jpg
	rgbGen identity
	depthFunc equal
	}
dpreflectcube textures/cubemaps/shot2
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
