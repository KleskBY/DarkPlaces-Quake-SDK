
v_rocket
{	

	{
	map models/weapons2/rocketl/rocket_launcher_grip.jpg
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
