
/*
===============================================================================

KEYS

===============================================================================
*/

void() key_touch =
{
	if(other.classname == "useprefab") other = other.owner;
	if (other.classname != "player") return;
	if (other.health <= 0) return;
	if (other.items & self.items) return;
	other.picked_items = other.picked_items + 1;

	sprint (other, "You got the ");
	sprint (other, self.netname);
	sprint (other,"\n");

	sound (other, CHAN_ITEM, self.noise, 1, ATTN_NORM);
	stuffcmd (other, "bf\n");
	other.items = other.items | self.items;

	if (!coop)
	{	
		self.solid = SOLID_NOT;
		self.model = string_null;
		self.light_lev = 0;
	}

	activator = other;
	SUB_UseTargets();				// fire all targets / killtargets
};



void() item_key1 =
{
	precache_model ("models/items/key.iqm");
	setmodel (self, "models/items/key.iqm");
	self.netname = "blue key";

	precache_sound ("misc/key.wav");
	self.noise = "misc/key.wav";
	
	self.pflags = PFLAGS_FULLDYNAMIC|PFLAGS_NOSHADOW;
	self.light_lev = 100;
	self.color = '0 0 1';
	self.colormod = self.color;
	
	self.touch = key_touch;
	self.items = IT_KEY1;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem();
};


void() item_key2 =
{
	precache_model ("models/items/key.iqm");
	setmodel (self, "models/items/key.iqm");
	self.netname = "yellow key";
	
	precache_sound ("misc/key.wav");
	self.noise = "misc/key.wav";
	
	self.pflags = PFLAGS_FULLDYNAMIC|PFLAGS_NOSHADOW;
	self.light_lev = 100;
	self.color = '1 1 0';
	self.colormod = self.color;
	
	self.touch = key_touch;
	self.items = IT_KEY2;
	setsize (self, '-16 -16 -24', '16 16 32');
	StartItem();
};
