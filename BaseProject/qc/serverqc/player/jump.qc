




void() PlayerJump =
{	
	if(!self.button2) 
	{
		self.flags = self.flags | FL_JUMPRELEASED;
		return;
	}
	if (self.flags & FL_WATERJUMP) return;
	if(self.lastTouch + JUMPCOOLDOWN > time) return;
	if(clienttype(self) == CLIENTTYPE_BOT && self.lastTouch + 1 > time) return;
	
	if (self.waterlevel >= 2)
	{
		if (self.watertype == CONTENT_WATER) self.velocity_z = 100;
		else if (self.watertype == CONTENT_SLIME) self.velocity_z = 80;
		else self.velocity_z = 50;

		if (self.swim_flag < time) // play swiming sound
		{
			self.swim_flag = time + 1;
			//if (random() < 0.5) sound (self, CHAN_BODY, "misc/water1.wav", 1, ATTN_NORM);
			//else sound (self, CHAN_BODY, "misc/water2.wav", 1, ATTN_NORM);
		}
		return;
	}

	if (!(self.flags & FL_ONGROUND)) return;
	if (!AUTOJUMP && !(self.flags & FL_JUMPRELEASED)) return;

	self.flags = self.flags - (self.flags & FL_JUMPRELEASED);
	self.flags = self.flags - FL_ONGROUND;	// don't stairwalk
	
	self.button2 = 0;
	self.lastTouch = time;
	local float rand;
	rand = random();
	sound (self, CHAN_BODY, "player/jump1.wav", 1, SoundRadius(500));
	self.velocity_z = self.velocity_z + 270;
	
	tracebox(self.origin, VEC_HULL_MIN, VEC_HULL_MAX, self.origin - '0 0 30', FALSE, self); //TRAIN MOVE FIX
	if(trace_fraction != 1)
	{
		if(trace_ent.classname == "train")
		{
			self.velocity = self.velocity + trace_ent.velocity * 0.92;
		}
	}
};
