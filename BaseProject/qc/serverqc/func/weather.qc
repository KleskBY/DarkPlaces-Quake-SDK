
void() sun_think =
{
	local float radius = 500;
	self.lastTouch = self.lastTouch + 10 ;
	self.origin_x = self.origin_x + radius * cos(self.lastTouch * 0.005);
	self.origin_z = self.origin_z + radius * sin(self.lastTouch * 0.005);
	self.nextthink = time + 0.5;
	local float fogFactor = self.origin_z / -5000;
	if(random() < 0.05)
	{	
		if(!cvar("scratch1")) localcmd("scratch1 1\n");
		else localcmd("scratch1 0\n");
	}
	localcmd(strcat("fog ", ftos(fogFactor), " 0 0 0 ", ftos(fogFactor), "\n"));
};

void() func_sun =
{
	self.pflags = PFLAGS_FULLDYNAMIC|PFLAGS_NOSHADOW;
	self.light_lev = 35000;
	self.color = '0.99 0.72 0.79';//'1 1 1.5';
	self.glow_color = 6;
	self.glow_size = 5000;
	self.glow_trail = 1;
	self.movetype = MOVETYPE_NOCLIP;
	
	//setmodel(self, "XX");
	setsize(self, '-100 -100 -100', '100 100 100');
	self.think = sun_think;
	self.nextthink = time + 0.5;
};

void() func_light =
{
	self.pflags = PFLAGS_FULLDYNAMIC;
	self.light_lev = 35000;
	self.color = '0.99 0.72 0.79';
	self.glow_color = 6;
	self.glow_size = 5000;
	self.glow_trail = 1;
}








// ============================================================================
/*  Rain effect from dpmod
*/
//te_particlerain(self.origin - '1000 1000 1000', self.origin + '1000 1000 1000', '0 0 -700', 10, 2);
void() rain_think =
{
	self.nextthink = time + 0.1;
	te_particlerain(self.absmin, self.absmax, self.dest, self.count, self.cnt);
//	te_particlesnow(self.absmin, self.absmax, self.dest * 0.25, self.count, self.cnt);
	// WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
	// WriteByte (MSG_BROADCAST, TE_PARTICLERAIN);
	// WriteVec (MSG_BROADCAST, self.absmin);
	// WriteVec (MSG_BROADCAST, self.absmax);
	// WriteVec (MSG_BROADCAST, self.dest);
	// WriteShort (MSG_BROADCAST, self.count);
	// WriteByte (MSG_BROADCAST, self.cnt);
};

/*QUAKED func_rain (0 .5 .8) ?
This is an invisible area like a trigger, which rain falls inside of.

Keys:
"velocity"
 falling direction (should be something like '0 0 -700', use the X and Y velocity for wind)
"cnt"
 sets color of rain (default 12 - white)
"count"
 adjusts rain density, this many particles fall every second, experiment to see the effects (default is based on area size)
*/
void() func_rain =
{
	self.dest = self.velocity;
	self.velocity = '0 0 0';
	if (!self.dest)
		self.dest = '0 0 -700';
	self.angles = '0 0 0';
	self.movetype = MOVETYPE_NONE;
	self.solid = SOLID_NOT;
	setmodel(self, self.model);
	setorigin(self, self.origin);
	setsize(self, self.mins, self.maxs);
	self.model = "";
	if (!self.cnt)
		self.cnt = 12;
	if (!self.count)
		self.count = (self.absmax_x - self.absmin_x)*(self.absmax_y - self.absmin_y)/8192;
	if (self.count < 1)
	{
		remove(self);
		return;
	}
	// convert from per second to per 0.1 sec,
	self.count = ceil(self.count * 0.1);
	self.think = rain_think;
	self.nextthink = time + 0.5;
};

// ============================================================================
/*  Snow effect from dpmod
*/

void() snow_think =
{
	self.nextthink = time + 0.1;
	te_particlesnow(self.absmin, self.absmax, self.dest, self.count, self.cnt);
//	WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
//	WriteByte (MSG_BROADCAST, TE_PARTICLESNOW);
//	WriteVec (MSG_BROADCAST, self.absmin);
//	WriteVec (MSG_BROADCAST, self.absmax);
//	WriteVec (MSG_BROADCAST, self.dest);
//	WriteShort (MSG_BROADCAST, self.count);
//	WriteByte (MSG_BROADCAST, self.cnt);
};

/*QUAKED func_snow (0 .5 .8) ?
This is an invisible area like a trigger, which snow falls inside of.

Keys:
"velocity"
 falling direction (should be something like '0 0 -300', use the X and Y velocity for wind)
"cnt"
 sets color of rain (default 12 - white)
"count"
 adjusts snow density, this many particles fall every second, experiment to see the effects (default is based on area size)
*/
void() func_snow =
{
	self.dest = self.velocity;
	self.velocity = '0 0 0';
	if (!self.dest)
		self.dest = '0 0 -300';
	self.angles = '0 0 0';
	self.movetype = MOVETYPE_NONE;
	self.solid = SOLID_NOT;
	setmodel(self, self.model);
	setorigin(self, self.origin);
	setsize(self, self.mins, self.maxs);
	self.model = "";
	if (!self.cnt)
		self.cnt = 12;
	if (!self.count)
		self.count = (self.absmax_x - self.absmin_x)*(self.absmax_y - self.absmin_y)/8192;
	if (self.count < 1)
	{
		remove(self);
		return;
	}
	// convert from per second to per 0.1 sec,
	self.count = ceil(self.count * 0.1);
	self.think = snow_think;
	self.nextthink = time + 0.5;
};