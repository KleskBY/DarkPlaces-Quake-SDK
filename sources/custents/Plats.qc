// ###
// all changes for the custents smooth trains are set
// off with a "// ###" at the begining and end.
// ###

void() plat_center_touch;
void() plat_outside_touch;
void() plat_trigger_use;
void() plat_go_up;
void() plat_go_down;
void() plat_crush;
float PLAT_LOW_TRIGGER = 1;

void() plat_spawn_inside_trigger =
{
	local entity	trigger;
	local vector	tmin, tmax;

//
// middle trigger
//	
	trigger = spawn();
	trigger.touch = plat_center_touch;
	trigger.movetype = MOVETYPE_NONE;
	trigger.solid = SOLID_TRIGGER;
	trigger.enemy = self;
	
	tmin = self.mins + '25 25 0';
	tmax = self.maxs - '25 25 -8';
	tmin_z = tmax_z - (self.pos1_z - self.pos2_z + 8);
	if (self.spawnflags & PLAT_LOW_TRIGGER)
		tmax_z = tmin_z + 8;
	
	if (self.size_x <= 50)
	{
		tmin_x = (self.mins_x + self.maxs_x) / 2;
		tmax_x = tmin_x + 1;
	}
	if (self.size_y <= 50)
	{
		tmin_y = (self.mins_y + self.maxs_y) / 2;
		tmax_y = tmin_y + 1;
	}
	
	setsize (trigger, tmin, tmax);
};

void() plat_hit_top =
{
	sound (self, CHAN_VOICE, self.noise1, 1, ATTN_NORM);
	self.state = STATE_TOP;
	self.think = plat_go_down;
	self.nextthink = self.ltime + 3;
};

void() plat_hit_bottom =
{
	sound (self, CHAN_VOICE, self.noise1, 1, ATTN_NORM);
	self.state = STATE_BOTTOM;
};

void() plat_go_down =
{
	sound (self, CHAN_VOICE, self.noise, 1, ATTN_NORM);
	self.state = STATE_DOWN;
	SUB_CalcMove (self.pos2, self.speed, plat_hit_bottom);
};

void() plat_go_up =
{
	sound (self, CHAN_VOICE, self.noise, 1, ATTN_NORM);
	self.state = STATE_UP;
	SUB_CalcMove (self.pos1, self.speed, plat_hit_top);
};

void() plat_center_touch =
{
	if (other.classname != "player")
		return;
		
	if (other.health <= 0)
		return;

	self = self.enemy;
	if (self.state == STATE_BOTTOM)
		plat_go_up ();
	else if (self.state == STATE_TOP)
		self.nextthink = self.ltime + 1;	// delay going down
};

void() plat_outside_touch =
{
	if (other.classname != "player")
		return;

	if (other.health <= 0)
		return;
		
//dprint ("plat_outside_touch\n");
	self = self.enemy;
	if (self.state == STATE_TOP)
		plat_go_down ();
};

void() plat_trigger_use =
{
	if (self.think)
		return;		// allready activated
	plat_go_down();
};


void() plat_crush =
{
//dprint ("plat_crush\n");

	T_Damage (other, self, self, 1);
	
	if (self.state == STATE_UP)
		plat_go_down ();
	else if (self.state == STATE_DOWN)
		plat_go_up ();
	else
		objerror ("plat_crush: bad self.state\n");
};

void() plat_use =
{
	self.use = SUB_Null;
	if (self.state != STATE_UP)
		objerror ("plat_use: not in up state");
	plat_go_down();
};


/*QUAKED func_plat (0 .5 .8) ? PLAT_LOW_TRIGGER
speed	default 150

Plats are always drawn in the extended position, so they will light correctly.

If the plat is the target of another trigger or button, it will start out disabled in the extended position until it is trigger, when it will lower and become a normal plat.

If the "height" key is set, that will determine the amount the plat moves, instead of being implicitly determined by the model's height.
Set "sounds" to one of the following:
1) base fast
2) chain slow
*/


void() func_plat =

{
local entity t;

	if (!self.t_length)
		self.t_length = 80;
	if (!self.t_width)
		self.t_width = 10;

	if (self.sounds == 0)
		self.sounds = 2;
// FIX THIS TO LOAD A GENERIC PLAT SOUND

	if (self.sounds == 1)
	{
		precache_sound ("plats/plat1.wav");
		precache_sound ("plats/plat2.wav");
		self.noise = "plats/plat1.wav";
		self.noise1 = "plats/plat2.wav";
	}

	if (self.sounds == 2)
	{
		precache_sound ("plats/medplat1.wav");
		precache_sound ("plats/medplat2.wav");
		self.noise = "plats/medplat1.wav";
		self.noise1 = "plats/medplat2.wav";
	}


	self.mangle = self.angles;
	self.angles = '0 0 0';

	self.classname = "plat";
	self.solid = SOLID_BSP;
	self.movetype = MOVETYPE_PUSH;
	setorigin (self, self.origin);	
	setmodel (self, self.model);
	setsize (self, self.mins , self.maxs);

	self.blocked = plat_crush;
	if (!self.speed)
		self.speed = 150;

// pos1 is the top position, pos2 is the bottom
	self.pos1 = self.origin;
	self.pos2 = self.origin;
	if (self.height)
		self.pos2_z = self.origin_z - self.height;
	else
		self.pos2_z = self.origin_z - self.size_z + 8;

	self.use = plat_trigger_use;

	plat_spawn_inside_trigger ();	// the "start moving" trigger	

	if (self.targetname)
	{
		self.state = STATE_UP;
		self.use = plat_use;
	}
	else
	{
		setorigin (self, self.pos2);
		self.state = STATE_BOTTOM;
	}
};

//============================================================================
// ### The trains have been changed so much, just replace the whole thing

void() train_next;
void() func_train_find;
void() sync_blocked;

void() train_blocked =
{
	if(self.owner)
	{
		sync_blocked();
		return;
	}
	if(self.classname != "train" && !(self.spawnflags & TRAIN_BLOCKABLE))
	{
		other.velocity = other.velocity + (self.velocity * 2.5);
		return;
	}

	if (time < self.attack_finished)
		return;
	self.attack_finished = time + 0.5;
	T_Damage (other, self, self, self.dmg);
};

void() train_use =
{
	if(self.classname == "smtrain")
	{
		if (self.think != func_smtrain_setup)
			return;		// already activated
		smtrain_next();
	}
	else
	{
		if (self.think != func_train_find)
			return;		// already activated
		train_next();
	}
};

void() train_wait =
{
	if (self.wait)
	{
		if(self.noise)
			sound (self, CHAN_VOICE, self.noise, 1, ATTN_NORM);
		else
			sound (self, CHAN_VOICE, "misc/null.wav", 1, ATTN_NORM);

		// allows trains to be retriggered after stopping
		if(self.wait == -1)
		{
			self.think = func_train_find;
			return;
		}

		self.nextthink = self.ltime + self.wait;
	}
	else
		self.nextthink = self.ltime + 0.1;
	
	self.think = train_next;
};

void() train_next =
{
	local entity targ;
	local string temp;

	targ = find (world, targetname, self.target);
	self.target = targ.target;
	if (!self.target)
		objerror ("train_next: no next target");
	if(self.noise1)
		sound (self, CHAN_VOICE, self.noise1, 1, ATTN_NORM);
	else
		sound (self, CHAN_VOICE, "misc/null.wav", 1, ATTN_NORM);

	self.wait = targ.wait;

	if (self.goalentity.event)
      {
	      // Trigger any events that should happen at the corner.
	      temp = self.target;
	      self.target = self.goalentity.event;
	      self.message = self.goalentity.message;
	      SUB_UseTargets();
	      self.target = temp;
	      self.message = string_null;
	}

	if(self.goalentity.duration < 0 || self.goalentity.speed < 0)
	{
		setorigin (self, targ.origin - self.mins );
		self.nextthink = self.ltime + 0.05;
	}
	else
	{
		if(self.goalentity.duration > 0)
			self.duration = self.goalentity.duration;
		else if (self.goalentity.speed > 0)
		{
			self.duration = 0;
			self.speed = self.goalentity.speed;
		}

		// if .duration is set, then use use a new sub to set the train's
		// speed to get there in .duration seconds by seting direction and speed.
		if(self.duration)
			SUB_CalcTimedMove(targ.origin - self.mins, self.duration, train_wait);
		else
			SUB_CalcMove (targ.origin - self.mins, self.speed, train_wait);
	}

	self.goalentity = targ;
};

void() func_train_find =
{
	local entity	targ;
	
	targ = find (world, targetname, self.target);
	self.goalentity = targ;
	self.target = targ.target;
	setorigin (self, targ.origin - self.mins);
	if (!self.targetname)
	{	// not triggered, so start immediately
		self.nextthink = self.ltime + 0.6;
		self.think = train_next;
	}
	if(self.count > 0) // for cloning
		generate_train_clones();
};

/*QUAKED func_train (0 .5 .8) ?
Trains are moving platforms that players can ride.
The targets origin specifies the min point of the train at each corner.
The train spawns at the first target it is pointing at.
If the train is the target of a button or trigger, it will not begin moving until activated.
speed	default 100
dmg		default	2
sounds
1) ratchet metal

*/
void() func_train =
{	
	if (!self.speed)
		self.speed = 100;
	if (!self.target)
		objerror ("func_train without a target");
	if (!self.dmg)
		self.dmg = 2;

	if (self.sounds == 0)
	{
		if(!self.noise)
			self.noise = ("misc/null.wav");
		if(!self.noise1)
			self.noise1 = ("misc/null.wav");
	}

	if (self.sounds == 1)
	{
		if(!self.noise)
			self.noise = ("plats/train2.wav");
		if(!self.noise1)
			self.noise1 = ("plats/train1.wav");
	}
	precache_sound (self.noise);
	precache_sound (self.noise1);

	// you set the first spawnflag for a smooth train.
	if(self.spawnflags & TRAIN_SMOOTH)
		self.classname = "smtrain";
	else
		self.classname = "train";

	self.cnt = 1;
	self.solid = SOLID_BSP;
	self.movetype = MOVETYPE_PUSH;
	self.blocked = train_blocked;
	self.use = train_use;

	setmodel (self, self.model);
	setsize (self, self.mins , self.maxs);
	setorigin (self, self.origin);

// start trains later, to make sure their targets have had
// a chance to spawn
// sets up the train's thinking stuff for either normal or smooth
	if(self.classname == "smtrain")
		self.think = func_smtrain_setup;
	else
		self.think = func_train_find;
	self.nextthink = self.ltime + 0.6;
};
// ### end of Custents train code

/*QUAKED misc_teleporttrain (0 .5 .8) (-8 -8 -8) (8 8 8)
This is used for the final bos
*/
void() misc_teleporttrain =
{	
	if (!self.speed)
		self.speed = 100;
	if (!self.target)
		objerror ("func_train without a target");

	self.cnt = 1;
	self.solid = SOLID_NOT;
	self.movetype = MOVETYPE_PUSH;
	self.blocked = train_blocked;
	self.use = train_use;
	self.avelocity = '100 200 300';

	self.noise = ("misc/null.wav");
	precache_sound ("misc/null.wav");
	self.noise1 = ("misc/null.wav");
	precache_sound ("misc/null.wav");

	precache_model2 ("progs/teleport.mdl");
	setmodel (self, "progs/teleport.mdl");
	setsize (self, self.mins , self.maxs);
	setorigin (self, self.origin);

// start trains on the second frame, to make sure their targets have had
// a chance to spawn
	self.nextthink = self.ltime + 0.1;
	self.think = func_train_find;
};
