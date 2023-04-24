



void() PLAYER_Precache
{
	precache_model2("models/players/runner.md3");
	precache_model2("models/weapons/shell.iqm");
	precache_model2("models/gib.md3");
	precache_model2("models/gib1.md3");
	precache_model2("models/gib2.md3");
	precache_model2("models/gib3.md3");
	precache_model2("models/muzzle1.md3");
	precache_model2("models/muzzle2.md3");

	precache_sound2("player/jump1.wav");
	precache_sound2("player/land1.wav");
	precache_sound2("player/land2.wav");
	precache_sound2("player/death1.wav");
	precache_sound2("player/death2.wav");
	precache_sound2("player/death3.wav");
	precache_sound2("player/ladder1.wav");
	precache_sound2("player/ladder2.wav");
	precache_sound2("player/ladder3.wav");
	precache_sound2("player/ladder4.wav");
	precache_sound2("player/footstep1.wav");
	precache_sound2("player/footstep2.wav");
	precache_sound2("player/footstep3.wav");
	precache_sound2("player/footstep4.wav");
	precache_sound2("player/heal.wav");
	precache_sound2("player/pickup.wav");
	precache_sound2("player/switch.wav");
	precache_sound2("player/pain1.wav");
	precache_sound2("player/pain2.wav");
	precache_sound2("player/pain3.wav");
	precache_sound2("player/pain4.wav");
	precache_sound2("player/pain5.wav");
	precache_sound2("player/pain6.wav");
	precache_sound2("player/pain7.wav");
};

void MISC_Precache()
{
	precache_sound2("impacts/hit1.wav");
	precache_sound2("impacts/hit2.wav");
	precache_sound2("impacts/hit3.wav");
	precache_sound2("impacts/hit4.wav");
	
	precache_sound2("impacts/metal1.wav");
	precache_sound2("impacts/metal2.wav");
	precache_sound2("impacts/metal3.wav");
	precache_sound2("impacts/metal4.wav");
	precache_sound2("impacts/metal5.wav");
	
	precache_sound2("impacts/wood1.wav");
	precache_sound2("impacts/wood2.wav");
	precache_sound2("impacts/wood3.wav");
	precache_sound2("impacts/wood4.wav");
	
	precache_sound2("impacts/body1.wav");
	precache_sound2("impacts/body2.wav");
	precache_sound2("impacts/body3.wav");
	precache_sound2("impacts/body4.wav");
	precache_sound2("impacts/body5.wav");
	
	precache_sound2("impacts/ric1.wav");
	precache_sound2("impacts/ric2.wav");
	
	precache_sound2("weapons/shell1.wav");
	precache_sound2("weapons/shell2.wav");
	precache_sound2("misc/talk.wav");

	precache_sound2("misc/h2ohit1.wav");
	precache_sound2("misc/item_respawn.wav");
};

void() Precache
{
	PLAYER_Precache();
	MISC_Precache();

	KNIFE_Precache();
	PM_Precache();
	AK74_Precache();
	GRENADE_Precache();
	SHOTGUN_Precache();
};