
v_shot
{	

	{
	map models/weapons2/pistol/pistol.jpg
	rgbGen identity
	depthFunc equal
	}
dpreflectcube textures/cubemaps/pistol_cubemap
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
