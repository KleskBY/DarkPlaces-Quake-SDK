
v_nail
{	

	{
	map models/weapons2/assault/assault rifle_fp.jpg
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
