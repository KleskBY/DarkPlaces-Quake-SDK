
/*QUAKED info_null (0 0.5 0) (-4 -4 -4) (4 4 4)
Used as a positional target for spotlights, etc.
*/
void() info_null =
{
	remove(self);
};

/*QUAKED info_notnull (0 0.5 0) (-4 -4 -4) (4 4 4)
Used as a positional target for lightning.
*/
void() info_notnull =
{
};

//============================================================================

float START_OFF = 1;

void() light_use =
{
	if (self.spawnflags & START_OFF)
	{
		lightstyle(self.style, "m");
		self.spawnflags = self.spawnflags - START_OFF;
	}
	else
	{
		lightstyle(self.style, "a");
		self.spawnflags = self.spawnflags + START_OFF;
	}
};

/*QUAKED light (0 1 0) (-8 -8 -8) (8 8 8) START_OFF
Non-displayed light.
Default light value is 300
Default style is 0
If targeted, it will toggle between on or off.
*/
void() light =
{
	if (!self.targetname) // inert light
	{	
		remove(self);
		return;
	}
	
	if (self.style >= 32)
	{
		self.use = light_use;
		if (self.spawnflags & START_OFF) lightstyle(self.style, "a");
		else lightstyle(self.style, "m");
	}
};

/*QUAKED light_fluoro (0 1 0) (-8 -8 -8) (8 8 8) START_OFF
Non-displayed light.
Default light value is 300
Default style is 0
If targeted, it will toggle between on or off.
Makes steady fluorescent humming sound
*/
void() light_fluoro =
{
	if (self.style >= 32)
	{
		self.use = light_use;
		if (self.spawnflags & START_OFF) lightstyle(self.style, "a");
		else lightstyle(self.style, "m");
	}
};

//============================================================================


void() barrel_explode =
{
	self.takedamage = DAMAGE_NO;
	self.classname = "breakable";
	// T_RadiusDamage (self, self, 160, world);
	particle (self.origin, '0 0 0', 75, 255);
	self.origin_z = self.origin_z + 32;
	MyGrenadeExplode();
};

void() barrel_burn 
{
	self.nextthink = time + 0.1;
	T_Damage (self, self.enemy, self.enemy, 1);
}

void(entity attacker, float damage) barrel_pain
{
	if(damage > 5)
	{
		self.enemy = attacker;
		self.effects = EF_FLAME; 
		self.think = barrel_burn;
		self.nextthink = time + 0.1;
	}
}

/*QUAKED misc_explobox (0 .5 .8) (0 0 0) (32 32 64)
TESTING THING
*/

void() misc_explobox =
{
	local float	oldz;
	
	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;
	precache_model ("models/props/barrel.md3");
	setmodel (self, "models/props/barrel.md3");
	self.health = 36;
	self.th_die = barrel_explode;
	self.takedamage = DAMAGE_AIM;
	self.classname = "breakable";
	self.th_pain = barrel_pain;
	setsize (self, '-13 -13 0', '13 13 40');

	self.origin_z = self.origin_z + 2;
	oldz = self.origin_z;
	droptofloor();
	if (oldz - self.origin_z > 250)
	{
		dprint ("item fell out of level at ");
		dprint (vtos(self.origin));
		dprint ("\n");
		remove(self);
	}
};



/*
==============================================================================

SIMPLE BMODELS

==============================================================================
*/

void() func_wall_use =
{	
	self.frame = 1 - self.frame; // change to alternate textures
};

/*QUAKED func_wall (0 .5 .8) ?
This is just a solid wall if not inhibitted
*/
void() func_wall =
{
	self.angles = '0 0 0';
	self.movetype = MOVETYPE_PUSH;	// so it doesn't get pushed by anything
	self.solid = SOLID_BSP;
	self.use = func_wall_use;
	setmodel (self, self.model);
};


/*QUAKED func_illusionary (0 .5 .8) ?
A simple entity that looks solid but lets you walk through it.
*/
void() func_illusionary =
{
	self.angles = '0 0 0';
	self.movetype = MOVETYPE_NONE;
	self.solid = SOLID_NOT;
	setmodel(self, self.model);
	makestatic(self);
};

void() ambient =
{
	precache_sound2(self.weaponmodel);
	ambientsound(self.origin, self.weaponmodel, self.volume, self.style);
};
