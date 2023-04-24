
player_sshot
{	

	{
	map models/masther.jpg
	rgbGen identity
	depthFunc equal
	}
dpreflectcube textures/cubemaps/pistol cubemap
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
