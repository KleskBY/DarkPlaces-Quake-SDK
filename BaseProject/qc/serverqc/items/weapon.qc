



void() weapon_touch =
{
	if(other.classname == "useprefab") other = other.owner;
	if (!(other.flags & FL_CLIENT)) return;
	other.picked_items = other.picked_items + 1;
	
	if (coop && other.items & self.weapon) return;
	if(!(other.weapons & self.weapon))
	{
		other.items = other.items | self.weapon;
		other.weapons = other.weapons | self.weapon;
	}
	if (self.classname == "weapon_rifle") other.ammoRifle = other.ammoRifle + 30;
	if (self.classname == "weapon_grenade") other.ammoGrenades = other.ammoGrenades + 1;
	if (self.classname == "weapon_shotgun") other.ammoShells = other.ammoShells + 5;
	if (self.classname == "weapon_sniper") other.ammoSniper = other.ammoSniper + 10;
	
	sprint(other, "You got the ");
	sprint(other, self.netname);
	sprint(other, "\n");
	sound(other, CHAN_ITEM, "player/pickup.wav", 1, SoundRadius(400));
	stuffcmd(other, "bf\n");
	bound_other_ammo();
	
	if(!other.hgrenade && !other.reload)
	{
		if(self.weapon == WP_RIFLE) other.impulse = 4;
		else if(self.weapon == WP_SHOTGUN) other.impulse = 3;
		else if(self.weapon == WP_SNIPER) other.impulse = 5;
	}
	
	if (coop) return;

	self.model = string_null;
	self.solid = SOLID_NOT;
	if (deathmatch == 1) self.nextthink = time + 30;
	else if (deathmatch == 2) self.nextthink = time + 180;
	self.think = SUB_regen;
	

	
	activator = other;
	SUB_UseTargets();
};



void() weapon_shotgun =
{
	precache_model ("models/weapons/w_shot.iqm");
	setmodel (self, "models/weapons/w_shot.iqm");
	self.weapon = WP_SHOTGUN;
	self.netname = "shotgun";
	self.touch = weapon_touch;
	setsize(self, '-16 -16 0', '16 16 56');
	StartItem();
};

void() weapon_rifle =
{
	precache_model ("models/weapons/w_rifle.iqm");
	setmodel (self, "models/weapons/w_rifle.iqm");
	self.weapon = WP_RIFLE;
	self.netname = "AK-74";
	self.touch = weapon_touch;
	setsize(self, '-8 -8 0', '8 8 56');
	StartItem();
};

void() weapon_grenade =
{
	precache_model ("models/weapons/w_grenade.md3");
	setmodel (self, "models/weapons/w_grenade.md3");
	self.weapon = WP_GRENADE;
	self.netname = "Grenade";
	self.touch = weapon_touch;
	setsize(self, '-16 -16 0', '16 16 56');
	StartItem();
};

