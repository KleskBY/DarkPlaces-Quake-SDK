



void() BetterNoclip =
{
	if(self.movetype == MOVETYPE_NOCLIP && !self.button2 && !self.button3) //noclip and ladder move
	{
		local float sv_accelerate = cvar("sv_accelerate");
		local float sv_friction = cvar("sv_friction");
		local float sv_maxspeed = cvar("sv_maxspeed");
		local vector wishvel, wishdir;
		local float wishspeed, f;
		
		self.velocity = self.velocity * (1 - frametime * sv_friction);
		makevectors(self.v_angle);
		wishvel = v_forward * self.movement_x + v_right * (self.movement_z * 30);
		
		// acceleration
		wishdir = normalize(wishvel);
		wishspeed = vlen(wishvel);
		
		if (time >= self.teleport_time)
		{
			f = wishspeed - (self.velocity * wishdir);
			if (f > 0) self.velocity = self.velocity + wishdir * min(f, sv_accelerate * frametime * wishspeed);
			self.velocity_z =  self.velocity_z * 6;
			if(self.button4) self.velocity = self.velocity * 4;
		}
	}
}

void() NoSlide = 
{
	if(self.movetype != MOVETYPE_NOCLIP && clienttype(self) != CLIENTTYPE_BOT) //SLIDING (SURFING) FIX
	{
		if(self.flags & FL_ONGROUND && vlen(self.velocity) < 30)
		{
			traceline (self.origin, self.origin - '0 0 42', TRUE, self); //detecting slope angle
			if(trace_fraction > 0.65) self.movetype = MOVETYPE_BOUNCE;
			else self.movetype = MOVETYPE_WALK;
		}
		else self.movetype = MOVETYPE_WALK;
	}
}

void() FixMovement =
{
	BetterNoclip();
	NoSlide();

	if(self.movetype == MOVETYPE_FLY && other.lastTouch < time) //reset movetype after lader
	{
		self.movetype = MOVETYPE_WALK;
	}
	
	self.angles_x = 0; // Fix ugly vertical model lean
};