//dp_water ReflectAmount FresnelAmount DiffuseRefractAmount BumpAmount  FresnelColorRGB  R G B  Alpha


///////////////////////
//ACTUAL STUFF
///////////////////////

textures/fatal/concrete01
{
	qer_editorimage textures/fatal/concrete01.tga

	dpglossintensitymod 4
	dpglossexponentmod 4
	dpreflectcube env/cubemaps/01
	{
	map $lightmap
	rgbGen identity
	tcGen lightmap
	}
	{
	map textures/fatal/concrete01.tga
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	}
//	dp_water 0.1 1.2  1.4 0.7  1 1 1  1 1 1  0.1
}