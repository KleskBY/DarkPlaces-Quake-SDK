/*
===========
WaterMove

============
*/
.float dmgtime;

void() WaterMove =
{
	if (self.movetype == MOVETYPE_NOCLIP) return;
	if (self.health < 0) return;

	if (self.waterlevel != 3)
	{
		//if (self.air_finished < time) sound (self, CHAN_VOICE, "player/gasp2.wav", 1, ATTN_NORM);
		//else if (self.air_finished < time + 9) sound (self, CHAN_VOICE, "player/gasp1.wav", 1, ATTN_NORM);
		self.air_finished = time + 12;
		self.dmg = 2;
	}
	else if (self.air_finished < time) // drown!
	{	
		if (self.pain_finished < time)
		{
			self.dmg = self.dmg + 2;
			if (self.dmg > 15)
				self.dmg = 10;
			T_Damage (self, world, world, self.dmg);
			self.pain_finished = time + 1;
		}
	}
	
	if (!self.waterlevel)
	{
		if (self.flags & FL_INWATER)
		{	
			// play leave water sound
			//sound (self, CHAN_BODY, "misc/outwater.wav", 1, ATTN_NORM);
			self.flags = self.flags - FL_INWATER;
		}
		return;
	}

	if (self.watertype == CONTENT_LAVA)
	{	// do damage
		if (self.dmgtime < time)
		{
			if (self.radsuit_finished > time) self.dmgtime = time + 1;
			else self.dmgtime = time + 0.2;

			T_Damage (self, world, world, 10*self.waterlevel);
		}
	}
	else if (self.watertype == CONTENT_SLIME)
	{	// do damage
		if (self.dmgtime < time && self.radsuit_finished < time)
		{
			self.dmgtime = time + 1;
			T_Damage (self, world, world, 4*self.waterlevel);
		}
	}
	
	if (!(self.flags & FL_INWATER) && self.movetype != MOVETYPE_BOUNCE) // player enter water
	{	
		sound (self, CHAN_BODY, "misc/h2ohit1.wav", 1, ATTN_NORM);
		self.flags = self.flags + FL_INWATER;
		self.dmgtime = 0;
	}
	
	if (!(self.flags & FL_WATERJUMP)) self.velocity = self.velocity - 0.8 * self.waterlevel * frametime * self.velocity;
};

void() CheckWaterJump =
{
	if (self.waterlevel != 2) return;
	local vector start, end;

	// check for a jump-out-of-water
	makevectors (self.angles);
	start = self.origin;
	start_z = start_z + 8; 
	v_forward_z = 0;
	normalize(v_forward);
	end = start + v_forward*24;
	traceline (start, end, TRUE, self);
	if (trace_fraction < 1)
	{	// solid at waist
		start_z = start_z + self.maxs_z - 8;
		end = start + v_forward*24;
		self.movedir = trace_plane_normal * -50;
		traceline (start, end, TRUE, self);
		if (trace_fraction == 1)
		{	// open at eye level
			self.flags = self.flags | FL_WATERJUMP;
			self.velocity_z = 225;
			self.flags = self.flags - (self.flags & FL_JUMPRELEASED);
			self.teleport_time = time + 2;	// safety net
			return;
		}
	}
};

void() Swim =
{
	WaterMove();
	CheckWaterJump();
}