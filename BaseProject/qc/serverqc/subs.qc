/*  Copyright (C) 1996-1997  Id Software, Inc.

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

    See file, 'COPYING', for details.
*/


void() SUB_Null = {};

void(entity attacker, float damage) SUB_null_pain = {};

void() SUB_Remove = { remove(self); };


/*
QuakeEd only writes a single float for angles(bad idea), so up and down are
just constant angles.
*/
void() SetMovedir =
{
	if (self.angles == '0 -1 0') self.movedir = '0 0 1';
	else if (self.angles == '0 -2 0') self.movedir = '0 0 -1';
	else
	{
		makevectors(self.angles);
		self.movedir = v_forward;
	}
	self.angles = '0 0 0';
};

/*
================
InitTrigger
================
*/
void() InitTrigger =
{
// trigger angles are used for one-way touches.  An angle of 0 is assumed
// to mean no restrictions, so use a yaw of 360 instead.
	if (self.angles != '0 0 0') SetMovedir();
	self.solid = SOLID_TRIGGER;
	setmodel(self, self.model); // set size and link into world
	self.movetype = MOVETYPE_NONE;
	self.modelindex = 0;
	self.model = "";
};

/*
=============
SUB_CalcMove

calculate self.velocity and self.nextthink to reach dest from
self.origin traveling at speed
===============
*/
void(entity ent, vector tdest, float tspeed, void() func) SUB_CalcMoveEnt =
{
	entity stemp;
	stemp = self;
	self = ent;

	SUB_CalcMove(tdest, tspeed, func);
	self = stemp;
};

void(vector tdest, float tspeed, void() func) SUB_CalcMove =
{
	vector vdestdelta;
	float len, traveltime;

	if (!tspeed) objerror("No speed is defined!");

	self.think1 = func;
	self.finaldest = tdest;
	self.think = SUB_CalcMoveDone;

	if (tdest == self.origin)
	{
		self.velocity = '0 0 0';
		self.nextthink = self.ltime + 0.1;
		return;
	}

// set destdelta to the vector needed to move
	vdestdelta = tdest - self.origin;

// calculate length of vector
	len = vlen(vdestdelta);

// divide by speed to get time to reach dest
	traveltime = len / tspeed;

	if (traveltime < 0.1)
	{
		self.velocity = '0 0 0';
		self.nextthink = self.ltime + 0.1;
		return;
	}

// set nextthink to trigger a think when dest is reached
	self.nextthink = self.ltime + traveltime;

// scale the destdelta vector by the time spent traveling to get velocity
	self.velocity = vdestdelta * (1/traveltime); // qcc won't take vec/float
};

/*
============
After moving, set origin to exact final destination
============
*/
void()  SUB_CalcMoveDone =
{
	setorigin(self, self.finaldest);
	self.velocity = '0 0 0';
	self.nextthink = -1;
	if (self.think1)
		self.think1();
};


/*
=============
SUB_CalcAngleMove

calculate self.avelocity and self.nextthink to reach destangle from
self.angles rotating

The calling function should make sure self.think is valid
===============
*/
void(entity ent, vector destangle, float tspeed, void() func) SUB_CalcAngleMoveEnt =
{
	entity stemp;
	stemp = self;
	self = ent;
	SUB_CalcAngleMove(destangle, tspeed, func);
	self = stemp;
};

void(vector destangle, float tspeed, void() func) SUB_CalcAngleMove =
{
	vector destdelta;
	float len, traveltime;

	if (!tspeed)
		objerror("No speed is defined!");

// set destdelta to the vector needed to move
	destdelta = destangle - self.angles;

// calculate length ofvector
	len = vlen(destdelta);

// divide by speed to get time to reach dest
	traveltime = len / tspeed;

// set nextthink to trigger a think when dest is reached
	self.nextthink = self.ltime + traveltime;

// scale the destdelta vector by the time spent traveling to get velocity
	self.avelocity = destdelta * (1 / traveltime);

	self.think1 = func;
	self.finalangle = destangle;
	self.think = SUB_CalcAngleMoveDone;
};

/*
============
After rotating, set angle to exact final angle
============
*/
void() SUB_CalcAngleMoveDone =
{
	self.angles = self.finalangle;
	self.avelocity = '0 0 0';
	self.nextthink = -1;
	if (self.think1)
		self.think1();
};


//=============================================================================

void() DelayThink =
{
	activator = self.enemy;
	SUB_UseTargets();
	remove(self);
};

/*
==============================
SUB_UseTargets

the global "activator" should be set to the entity that initiated the firing.

If self.delay is set, a DelayedUse entity will be created that will actually
do the SUB_UseTargets after that many seconds have passed.

Centerprints any self.message to the activator.

Removes all entities with a targetname that match self.killtarget,
and removes them, so some events can remove other triggers.

Search for(string)targetname in all entities that
match(string)self.target and call their .use function

==============================
*/
void() SUB_UseTargets =
{
	local entity t, stemp, otemp, act;

	if (self.delay) // create a temp object to fire at a later time
	{
		t = spawn();
		t.classname = "DelayedUse";
		t.nextthink = time + self.delay;
		t.think = DelayThink;
		t.enemy = activator;
		t.message = self.message;
		t.killtarget = self.killtarget;
		t.target = self.target;
		return;
	}
	
	if (activator.classname == "player" && self.message != "")
	{
		centerprint (activator, self.message);
		if (!self.noise) sound (activator, CHAN_VOICE, "misc/talk.wav", 1, ATTN_NORM);
	}

	if (self.target) // fire targets
	{
		act = activator;
		t = world;
		do
		{
			t = find (t, targetname, self.target);
			if (!t)
			{
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
				return;
			}
			stemp = self;
			otemp = other;
			self = t;
			other = stemp;
			if (self.use) self.use();
			self = stemp;
			other = otemp;
			activator = act;
		} 
		while ( 1 );
	}
	else if (self.killtarget) // kill the killtagets
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
};


/*

in nightmare mode, all attack_finished times become 0
some monsters refire twice automatically

*/

void(float normal) SUB_AttackFinished =
{
	self.cnt = 0; // refire count for nightmare
	if (skill != 3) self.attack_finished = time + normal;
};

float(entity targ) visible;

void(void() thinkst) SUB_CheckRefire =
{
	if (skill != 3) return;
	if (self.cnt == 1) return;
	if (!visible(self.enemy)) return;
	self.cnt = 1;
	self.think = thinkst;
};

///////////////////////////////////// GENERAL //////////////////////////////////////

void() footsteps =
{
	if(self.button4) return;
	if(self.flags & FL_ONGROUND && !self.duck && self.movetype != MOVETYPE_NOCLIP)
	{
		if(time + random(0, 0.1) > self.footstep_finished || self.footstep_finished == 0) 
		{
			local float r = random();
			if(clienttype(self) != CLIENTTYPE_REAL)
			{
				if (r <=0.25) sound(self, CHAN_BODY, "player/footstep1.wav", 0.75, ATTN_IDLE );
				else if (r <=0.5 && r>0.25) sound(self, CHAN_BODY, "player/footstep2.wav", 0.75, ATTN_IDLE );
				else if (r <=0.75 && r>0.5) sound(self, CHAN_BODY, "player/footstep3.wav", 0.75, ATTN_IDLE );
				else sound(self, CHAN_BODY, "player/footstep4.wav", 0.75, ATTN_IDLE );
				self.footstep_finished = time + 0.5;
				return;
			}
		
			local float surfnum;
			local string s;
			local vector org2;
			traceline(self.origin, self.origin - '0 0 64', TRUE, self);
			if (trace_fraction != 1) org2 = trace_endpos + ' 0 0 0.5';
			surfnum = getsurfacenearpoint(self.groundentity, org2);
			if (surfnum >= 0) s = getsurfacetexture(self.groundentity, surfnum);
		
			if(strstrofs(s, "metal", 0) >= 0)
			{
				if (r <=0.25) sound(self, CHAN_BODY, "player/ladder1.wav", 0.75, SoundRadius(450));
				else if (r <=0.5 && r>0.25) sound(self, CHAN_BODY, "player/ladder2.wav", 0.75, SoundRadius(450));
				else if (r <=0.75 && r>0.5) sound(self, CHAN_BODY, "player/ladder3.wav", 0.75, SoundRadius(450));
				else sound(self, CHAN_BODY, "player/ladder4.wav", 0.75, SoundRadius(450));
			}
			else if (self.flags & FL_INWATER && self.waterlevel > 0)
			{
				sound(self, CHAN_BODY, "misc/h2ohit1.wav", 1, SoundRadius(550));
			}
			else
			{
				if (r <= 0.25) sound(self, CHAN_BODY, "player/footstep1.wav", 0.75, SoundRadius(450) );
				else if (r <= 0.5 && r > 0.25) sound(self, CHAN_BODY, "player/footstep2.wav", 0.75, SoundRadius(450) );
				else if (r <= 0.75 && r > 0.5) sound(self, CHAN_BODY, "player/footstep3.wav", 0.75, SoundRadius(450) );
				else sound(self, CHAN_BODY, "player/footstep4.wav", 0.75, SoundRadius(450) );
			}
			self.footstep_finished = time + 0.4;
		}
	}
}




void(vector start, vector dst) DrawLine = //cl_beams_quakepositionhack
{
	WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
	WriteByte (MSG_BROADCAST, TE_LIGHTNING1);
	WriteEntity (MSG_BROADCAST, self);
	WriteCoord (MSG_BROADCAST, start_x);
	WriteCoord (MSG_BROADCAST, start_y);
	WriteCoord (MSG_BROADCAST, start_z);
	WriteCoord (MSG_BROADCAST, dst_x);
	WriteCoord (MSG_BROADCAST, dst_y);
	WriteCoord (MSG_BROADCAST, dst_z);
};

void(vector vec) printVector =
{
	bprint(ftos(vec_x));
	bprint(" ");
	bprint(ftos(vec_y));
	bprint(" ");
	bprint(ftos(vec_z));
	bprint("\n");
}

float(entity e) allive =
{
	if(e.deadflag != DEAD_DEAD && e.deadflag != DEAD_DYING && e.deadflag != DEAD_RESPAWNABLE) return TRUE;
	return FALSE;
}

void() PrintAllConchars =
{
	local float i;
	for(i = 0; i < 256; i++)
	{
		bprint(strcat(ftos(i), ": ", chr2str(i), "\n"));
	}
}

float() crandom =
{
	return 2 * (random() - 0.5);
};

vector(vector angle) NormalizeAngle =
{
	while (angle_x < -180) angle_x += 360;
	while (angle_x > 180) angle_x -= 360;

	while (angle_y < -180) angle_y += 360;
	while (angle_y > 180) angle_y -= 360;

	while (angle_z < -180) angle_z += 360;
	while (angle_z > 180) angle_z -= 360;

	return angle;
}
vector(vector angle) ClampAngle =
{
	while (angle_y > 180) angle_y -= 360;
	while (angle_y < -180) angle_y += 360;

	if (angle_x > 89.0) angle_x = 89.0;
	if (angle_x < -89.0) angle_x = -89.0;

	angle_z = 0;

	return angle;
}

float lerp(float a, float b, float factor)
{
    return a * (1.0 - factor) + (b * factor);
}
vector lerpv(vector a, vector b, float factor)
{
    return a * (1.0 - factor) + (b * factor);
}