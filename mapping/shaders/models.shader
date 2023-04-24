models/decal
{
	qer_editorimage models/decal.tga
	
	surfaceparm trans
//	cull twosided
	dpnoshadow	
	{
		map models/decal.tga
		blendfunc blend
	}
}


progs/missile.mdl
{
	corona 100
	flags 1
	use_MISSILE
}

progs/grenade.mdl
{
	flags 2
	use_GRENADE
}

progs/spike.mdl
{
	use_SPIKE
}
