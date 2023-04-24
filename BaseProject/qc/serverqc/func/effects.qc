

void() fire_think =
{
	self.effects = EF_FLAME; 
	te_flamejet(self.origin, '0 0 0', self.speed);
	self.nextthink = time + 0.1;
};

void() func_fire
{
	precache_sound2("func/fire.wav");
	if (!self.speed) self.speed = 10;
	self.think = fire_think;
	self.nextthink = time + 0.1;
}


void() lightning_think =
{
	// DrawLine(self.pos1, self.pos2);
	if(random() >= 0.5) te_lightning1(self, self.origin, self.pos1);
	else te_lightning1(self, self.origin, self.pos2);
	// te_lightning1(self, self.origin, self.owner.origin);
	sound (self, CHAN_VOICE, "misc/electrichit1.wav", 1, SoundRadius(450));
	self.nextthink = time + 0.1 + random() * 0.75;
};

void() func_lightning
{
	precache_sound2("misc/electrichit1.wav");
	
	if (!self.pos1 || !self.pos2) objerror ("func_lightning: no pos");
	self.think = lightning_think;
	self.nextthink = time + 0.1;
}

