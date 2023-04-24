/*
	==============================================================================
	
	PLAYER
	
	==============================================================================
*/

void() player_run;
void() player_stand =
{
	self.weaponframe = 0;
	if (vlen(self.velocity) >= 20)
	{
		player_run();
		return;
	}
	
	self.think = player_stand;
	self.nextthink = time + 0.1;
}

void() player_run =
{
	self.weaponframe = 0;
	self.reload = 0;
	if (vlen(self.velocity) < 20)
	{
		player_stand();
		return;
	}

	self.think = player_run;
	self.nextthink = time + 0.1;
}
		
void() PainSound =
{
	local float rs;
	if (self.health < 0) return;
	
	if (damage_attacker.classname == "teledeath")
	{
		sound (self, CHAN_VOICE, "player/death3.wav", 1, ATTN_NORM);
		return;
	}
	if (self.pain_finished > time)
	{
		self.axhitme = 0;
		return;
	}
	self.pain_finished = time + 0.1; // don't make multiple pain sounds right after each other
	
	rs = rint((random() * 7) + 1);
	switch(rs)
	{
		case 1:
			self.noise = "player/pain1.wav";
			break;
		case 2:
			self.noise = "player/pain2.wav";
			break;
		case 3:
			self.noise = "player/pain3.wav";
			break;
		case 4:
			self.noise = "player/pain4.wav";
			break;
		case 5:
			self.noise = "player/pain5.wav";
			break;
		case 6:
			self.noise = "player/pain6.wav";
			break;
		default:
			self.noise = "player/pain7.wav";
			break;
	}
			
	sound (self, CHAN_VOICE, self.noise, 1, ATTN_NORM);
};


void(entity attacker, float damage) player_pain =
{
	PainSound();
};
	
void() PlayerDead =
{
	self.nextthink = -1;
	self.deadflag = DEAD_DEAD; // allow respawn after a certain time
};
	
void() player_die1 =
{
	if(self.frame < 66) self.frame = 66;
	else 
	{
		self.frame = self.frame + 1;
		if(self.frame >= 77)
		{
			PlayerDead();
			return;
		}
	}
	self.think = player_die1;
	self.nextthink = time + 0.05;
};

void() player_die2 =
{
	if(self.frame < 78) self.frame = 78;
	else 
	{
		self.frame = self.frame + 1;
		if(self.frame >= 126)
		{
			PlayerDead();
			return;
		}
	}
	self.think = player_die2;
	self.nextthink = time + 0.025;
};

void() DeathSound =
{
	local float		rs;
	rs = rint ((random() * 2) + 1);
	if (rs == 1) self.noise = "player/death1.wav";
	else if (rs == 2) self.noise = "player/death2.wav";
	else self.noise = "player/death3.wav";
	sound (self, CHAN_VOICE, self.noise, 1, ATTN_NORM);
};

void() PlayerDie =
{
	self.items = self.items - (self.items & IT_INVISIBILITY);
	self.invisible_finished = 0;	// don't die as eyes
	self.invincible_finished = 0;
	self.super_damage_finished = 0;
	self.radsuit_finished = 0;
		
	self.weaponmodel = "";
	self.view_ofs = '0 0 -8';
	self.deadflag = DEAD_DYING;
	setsize(self, '-12 -12 -24', '12 12 -20');
	self.solid = SOLID_CORPSE;
	self.flags = self.flags - (self.flags & FL_ONGROUND);
	self.movetype = MOVETYPE_TOSS;
	if (self.velocity_z < 10) self.velocity_z = self.velocity_z + random() * 300;
	
	if (self.health < -40)
	{
		Gib();
		return;
	}
	
	DeathSound();
	
	self.angles_x = 0;
	self.angles_z = 0;
	
	if (random() <= 0.5) player_die1();
	else player_die2();
};
	
void() set_suicide_frame =
{	
	player_die1(); // self.frame = $deatha11;
	self.solid = SOLID_NOT;
	self.movetype = MOVETYPE_TOSS;
	self.deadflag = DEAD_DEAD;
	self.nextthink = -1;
};
