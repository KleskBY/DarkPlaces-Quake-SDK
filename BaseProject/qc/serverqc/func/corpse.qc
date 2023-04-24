void() func_corpse_die =
{
	local entity t;
	self.origin = (self.absmin + self.absmax) * 0.5;
	sound (self, CHAN_VOICE, "player/death3.wav", 1, ATTN_NORM);
	ThrowGib ("models/gib1.md3", self.health);
	ThrowGib ("models/gib2.md3", self.health);
	ThrowGib ("models/gib3.md3", self.health);
	ThrowGib ("models/gib3.md3", self.health);
	if (self.killtarget) // kill the killtagets
	{
		t = world;
		do
		{
			t = find (t, targetname, self.killtarget);
			if (!t) return;
			remove (t);
		} 
		while ( 1 );
	}
	remove(self);
};

void() func_corpse =
{
	self.angles = '0 0 0';
	self.solid = SOLID_BSP;
	self.classname = "shootblood";
	self.takedamage = DAMAGE_YES ;
	//self.health = 99999;
	self.max_health = self.health;
	self.th_die = func_corpse_die;
	setmodel (self, self.model);
	self.movetype = MOVETYPE_NONE;
	self.modelindex = 0;
	self.model = "";
};
