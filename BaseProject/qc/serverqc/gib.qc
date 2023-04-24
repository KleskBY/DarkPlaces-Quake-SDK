

/*
	================
	SpawnBlood
	================
*/

vector(float dm) VelocityForDamage =
{
	local vector v;
	v_x = 100 * crandom();
	v_y = 100 * crandom();
	v_z = 200 + 100 * random();
	v = v * 0.8;
	if (dm < -50) v = v * 2;
	return v;
};

void(vector org, vector vel, float damage) SpawnBlood =
{
	particle(org, vel * 0.1, 73, damage * 2);
};

void (vector position, vector direction) Shoot_Blood = 
{
	SpawnBlood(position, direction, 10);
};

void(string gibname, float dm) ThrowGib =
{
	local	entity new;
	new = spawn();
	new.origin = self.origin;
	setmodel (new, gibname);
	setsize (new, '0 0 0', '0 0 0');
	new.modelflags = MF_ZOMGIB;
	new.scale = 0.8;
	new.velocity = VelocityForDamage(dm);
	new.movetype = MOVETYPE_BOUNCE;
	new.solid = SOLID_NOT;
	new.avelocity_x = random() * 600;
	new.avelocity_y = random() * 600;
	new.avelocity_z = random() * 600;
	new.think = SUB_Remove;
	new.ltime = time;
	new.nextthink = time + 10 + random()*10;
	new.frame = 0;
	new.flags = 0;
};

void(string gibname, float dm) ThrowHead =
{
	setmodel (self, gibname);
	self.frame = 0;
	self.nextthink = -1;
	self.movetype = MOVETYPE_BOUNCE;
	self.takedamage = DAMAGE_NO;
	self.solid = SOLID_CORPSE;
	self.view_ofs = '0 0 8';
	setsize (self, '0 0 0', '0 0 0');
	self.velocity = VelocityForDamage(dm);
	self.flags = self.flags - (self.flags & FL_ONGROUND);
	self.avelocity = crandom() * '0 600 0';
};


void() Gib =
{
	ThrowGib("models/gib1.md3", self.health);
	ThrowGib("models/gib2.md3", self.health);
	ThrowGib("models/gib3.md3", self.health);
	ThrowHead("models/gib1.md3", self.health);

	self.deadflag = DEAD_DEAD;

	if (damage_attacker.classname == "teledeath")
	{
		sound (self, CHAN_VOICE, "player/death3.wav", 1, ATTN_NORM);
		return;
	}

	if (damage_attacker.classname == "teledeath2")
	{
		sound (self, CHAN_VOICE, "player/death3.wav", 1, ATTN_NORM);
		return;
	}

	sound (self, CHAN_VOICE, "player/death3.wav", 1, ATTN_NORM);
};



void(string gibname, float dm) ThrowChunk =
{
	local	entity new;

	new = spawn();
	new.origin = self.origin;
	setmodel (new, gibname);
	new.view_ofs = '0 0 8';
	setsize (new, '0 0 0', '1 1 1');
	new.velocity = VelocityForDamage (dm) * 0.5;
	new.movetype = MOVETYPE_BOUNCE;
	new.solid = SOLID_BBOX;
	new.avelocity = crandom() * '0 600 0';
	new.think = SUB_Remove;
	new.ltime = time;
	new.nextthink = time + 10 + random()*10;
	new.frame = 0;
	new.flags = new.flags - (new.flags & FL_ONGROUND);
};
	