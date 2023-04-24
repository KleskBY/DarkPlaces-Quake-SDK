
/*
===============================================================================

AMMO

===============================================================================
*/

void() ammo_touch =
{
	local entity stemp;

	if (other.classname == "useprefab") other = other.owner;
	if (other.classname != "player" ) return;
	if (other.health <= 0) return;
	other.picked_items = other.picked_items + 1;

	if (self.weapon == 1)
	{
		if (other.ammoPistol >= 100) return;
		other.ammoPistol = other.ammoPistol + self.aflag;
	}
	if (self.weapon == 2)
	{
		if (other.ammoShells >= 100) return;
		other.ammoShells = other.ammoShells + self.aflag;
	}
	if (self.weapon == 3)
	{
		if (other.ammoRifle >= 200) return;
		other.ammoRifle = other.ammoRifle + self.aflag;
	}
	if (self.weapon == 4)
	{
		if (other.ammoSniper >= 100) return;
		other.ammoSniper = other.ammoSniper + self.aflag;
	}

	bound_other_ammo ();
	
	sprint (other, "You got the ");
	sprint (other, self.netname);
	sprint (other, " ammo\n");
	
	sound (other, CHAN_ITEM, "player/pickup.wav", 1, SoundRadius(400));
	stuffcmd (other, "bf\n");

	if(!other.reload && !other.hgrenade)
	{
	// if changed current ammo, update it
		stemp = self;
		self = other;
		W_SetCurrentAmmo();
		self = stemp;
	}

	// remove it in single player, or setup for respawning in deathmatch
	self.model = string_null;
	self.solid = SOLID_NOT;
	if (deathmatch == 1) self.nextthink = time + 30;
	self.think = SUB_regen;

	activator = other;
	SUB_UseTargets();				// fire all targets / killtargets
};



void() item_9x18 =
{
	self.touch = ammo_touch;

	precache_model2("models/w_pmammo.md3");
	setmodel(self,"models/w_pmammo.md3");
	self.aflag = 20;
	
	self.weapon = 1;
	self.netname = "9x18";
	setsize(self, '0 0 0', '16 16 16');
	StartItem();
};


void() item_shells =
{
	self.touch = ammo_touch;

	precache_model2("models/items/shotgunammo.md3");
	setmodel (self, "models/items/shotgunammo.md3");
	self.aflag = 20;
	
	self.weapon = 2;
	self.netname = "shells";
	setsize (self, '-18 -18 0', '18 18 56');
	StartItem ();
};

void() item_545x39 =
{
	self.touch = ammo_touch;

	precache_model("models/w_akammo.md3");
	setmodel(self, "models/w_akammo.md3");
	self.aflag = 30;
	
	self.weapon = 3;
	self.netname = "5.45x39";
	setsize (self, '-18 -18 0', '18 18 56');
	StartItem ();
};

void() item_762x54 =
{
	self.touch = ammo_touch;
	precache_model ("models/w_svdammo.md3");
	setmodel (self, "models/w_svdammo.md3");
	self.aflag = 10;
	self.weapon = 4;
	self.netname = "7.62x54";
	setsize (self, '-18 -18 0', '18 18 56');
	StartItem ();
};
