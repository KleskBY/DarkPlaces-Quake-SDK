
void() PutObserverInServer;
void() W_WeaponFrame;
void() W_SetCurrentAmmo;
void(entity attacker, float damage) player_pain;
void() player_stand;
void(vector org) spawn_tfog;
void(vector org, entity death_owner) spawn_tdeath;



/*
=============================================================================

				PLAYER GAME EDGE FUNCTIONS

=============================================================================
*/

void() set_suicide_frame;
void() respawn = // called by ClientKill and DeadThink
{
	local entity e;
	local float players;
	
	CopyToBodyQue(self);	// make a copy of the dead body for appearances sake
	if (coop)
	{
		for (e = findchain(classname, "player"); e; e = e.chain) if(allive(e)) players = players + 1;
		if(players) PutObserverInServer();
		else localcmd ("restart\n");
	}
	else if(deathmatch)
	{
		SetNewParms();
		PutClientInServer();
	}
	else localcmd ("restart\n"); // restart the entire server
};


/*
============
ClientKill

Player entered the suicide command
============
*/

void() ClientKill =
{
	T_Damage(self, world, world, 200);
};

/*
============
SelectSpawnPoint

Returns the entity to spawn at
============
*/
entity() SelectSpawnPoint =
{
	local entity spot;
	local entity thing;
	local float  pcount;
			
	if (coop)
	{
		lastspawn = find(lastspawn, classname, "info_player_coop");
		if (lastspawn == world) lastspawn = find (lastspawn, classname, "info_player_start");
		if (lastspawn != world) return lastspawn;
	}
	else if (deathmatch)
	{
		spot = lastspawn;	
		while (1)
		{
			spot = find(spot, classname, "info_player_deathmatch");
			if (spot != world)
			{
				if (spot == lastspawn) return lastspawn;
				pcount = 0;
				thing = findradius(spot.origin, 32);
				while(thing)
				{
					if (thing.classname == "player") pcount = pcount + 1;
					thing = thing.chain;
				}
				if (pcount == 0)
				{
					lastspawn = spot;
					return spot;
				}
			}
		}
	}

	if (serverflags) // return with a rune to start
	{	
		spot = find (world, classname, "info_player_start2");
		if (spot) return spot;
	}
	
	spot = find (world, classname, "info_player_start");
	if(!spot)
	{
		bprint("SelectSpawnPoint: no info_player_start on level\n");
		local entity newspawn = spawn();
		setorigin(newspawn, '0 0 64');
		return newspawn;
	}

	return spot;
};

/*
===========
PutClientInServer

called each time a player is spawned
============
*/


void() DecodeLevelParms;
void() PlayerDie;
void() PutClientInServer =
{
	stuffcmd (self, strcat("r_ambient ", ftos(world.light_lev), "\n"));
	stuffcmd (self, strcat("teamplay ", ftos(teamplay), "\n"));
	stuffcmd (self, strcat("deathmatch ", ftos(deathmatch), "\n"));
	stuffcmd (self, strcat("coop ", ftos(coop), "\n"));
	stuffcmd(self, "cl_forwardspeed 250; cl_backspeed 200; cl_sidespeed 225;\n");

	//Item stats
	local entity e;
	self.item = 0;
	self.picked_items = 0;
	self.total_hits = 0;
	self.total_shots = 0;
	for (e = findchainfloat(item, TRUE); e; e = e.chain)
	{
		self.item = self.item + 1;
	}
		
	local entity spot;
	spot = SelectSpawnPoint();

	self.classname = "player";
	self.health = 100;
	self.takedamage = DAMAGE_AIM;
	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_WALK;
	self.show_hostile = 0;
	self.max_health = 100;
	self.flags = FL_CLIENT;
	self.air_finished = time + 12;
	self.dmg = 2;   		// initial water damage
	self.super_damage_finished = 0;
	self.radsuit_finished = 0;
	self.invisible_finished = 0;
	self.invincible_finished = 0;
	self.effects = 0;
	self.invincible_time = 0;

	if(coop && parm8 == 0) SetNewParms();
	DecodeLevelParms();
	
	W_SetCurrentAmmo();

	self.attack_finished = time;
	self.th_pain = player_pain;
	self.th_die = PlayerDie;
	self.deadflag = DEAD_NO;
	self.pausetime = 0; // paustime is set by teleporters to keep the player from moving a while
	
	self.origin = self.oldorigin = spot.origin + '0 0 1';	// 1998-07-21 Respawning where player died fix by Robert Field
	self.angles = spot.angles;
	self.fixangle = TRUE;		// turn this way immediately

	W_SetCurrentAmmo();
	if(self.weaponSwitch) self.weaponSwitch();
	
	setsize(self, VEC_HULL_MIN, VEC_HULL_MAX);
	self.view_ofs = '0 0 24';
	self.velocity = '0 0 0';
	self.duck = 0;
	
	player_stand();
	
	if (deathmatch || coop)
	{
		makevectors(self.angles);
		spawn_tfog(self.origin + v_forward * 20);
	}
	if(deathmatch) spawn_tdeath (self.origin, self);
};





//============================================================================

void() PlayerDeathThink =
{
	local entity oldself;
	local float forward;
	local entity nearest;
	local entity e;
	
	if (self.flags & FL_ONGROUND)
	{
		forward = vlen(self.velocity);
		forward = forward - 20;
		if (forward <= 0) self.velocity = '0 0 0';
		else self.velocity = forward * normalize(self.velocity);
	}

	if (self.deadflag == DEAD_DEAD)
	{
		if (self.button2 || self.button1 || self.button0) return; // wait for all buttons released
		self.deadflag = DEAD_RESPAWNABLE;
		return;
	}
	
	if (clienttype(self) == CLIENTTYPE_BOT) respawn();
	
	if (!self.button2 && !self.button1 && !self.button0) return;// wait for any button down

	self.button0 = 0;
	self.button1 = 0;
	self.button2 = 0;
	respawn();
};


/*
================
PlayerPreThink

Called every frame before physics are run
================
*/


void() PlayerPreThink =
{
	if (intermission_running)
	{
		IntermissionThink();	// otherwise a button could be missed between
		return;					// the think tics
	}
	if (self.view_ofs == '0 0 0') // intermission or finale
	{
		return;		
	}
	if (self.deadflag >= DEAD_DEAD)
	{
		PlayerDeathThink();
		return;
	}
	if (self.deadflag == DEAD_DYING) return;	// dying, so do nothing
	if(self.flags & FL_ONGROUND) self.flags = self.flags - (self.flags & FL_LADDERJUMP);
	
	Swim();
	PlayerJump();
	UseSmth();
	Nametags();
	Duck();
	FixMovement();
	Rain();
	// OcclusionCulling();

	if (time < self.pausetime) self.velocity = '0 0 0'; // teleporters can force a non-moving pause time
};

/*
================
PlayerPostThink

Called every frame after physics are run
================
*/

float PLAYER_STAND_FRAME = 0;
float PLAYER_CROUCH_FRAME = 27;
float PLAYER_RUN_START_FRAME = 2;
float PLAYER_RUN_END_FRAME = 26;
float PLAYER_CROUCH_START_FRAME = 28;
float PLAYER_CROUCH_END_FRAME = 62;

void() playerAnim =
{
	if (fabs(self.velocity_x) > 15 || fabs(self.velocity_y) > 15)
	{
		if(self.anim_finished + 0.06 < time)
		{
			if(self.duck) //crouch
			{
				if (self.walkframe >= PLAYER_CROUCH_END_FRAME || self.walkframe < PLAYER_CROUCH_START_FRAME) self.walkframe = PLAYER_CROUCH_START_FRAME;
				self.walkframe = self.walkframe + 2;
			}
			else 
			{
				if (self.walkframe >= PLAYER_RUN_END_FRAME || self.walkframe < PLAYER_RUN_START_FRAME) self.walkframe = PLAYER_RUN_START_FRAME;
				if(self.walk) self.walkframe = self.walkframe + 1;	//walk
				else self.walkframe = self.walkframe + 2; //run
			}
			self.anim_finished = time;
		}
		self.frame = self.walkframe;
	}
	else
	{
		self.walkframe = PLAYER_RUN_START_FRAME;
		if(self.duck == 1) self.frame = PLAYER_CROUCH_FRAME;
		else self.frame = PLAYER_STAND_FRAME;
	}
}

void() PlayerPostThink =
{
	if (self.view_ofs == '0 0 0') return;		// intermission or finale
	if (self.deadflag) return;
	if(fabs(self.velocity_x + self.velocity_y + self.velocity_z) > 60) footsteps();
	W_WeaponFrame();
	
	if(self.jump_flag < -300 && self.flags & FL_ONGROUND && self.health > 0) //Landing
	{
		if(self.jump_flag < -500)
		{
			T_Damage (self, world, world, -self.jump_flag *0.05); 
			sound (self, CHAN_VOICE, "player/land2.wav", 0.6, SoundRadius(750));
			self.deathtype = "falling";
		}
		else sound (self, CHAN_VOICE, "player/land1.wav", 0.6, SoundRadius(650));

		self.jump_flag = 0;
		self.punchangle_x = 3;
	}
	
	if(!(self.flags & FL_ONGROUND)) self.jump_flag = self.velocity_z;
	if(self.origin_z < -5000) ClientKill(); //fucker trying to escape
	playerAnim();
	// Viewmodel();
};





/*
===========
ClientConnect

called when a player connects to a server
============
*/

void() ClientConnect =
{
	bprint(self.netname);
	bprint(" entered the game\n");
	if (intermission_running) ExitIntermission(); // a client connecting during an intermission can cause problems
};


/*
===========
ClientDisconnect

called when a player disconnects from a server
============
*/
void() ClientDisconnect =
{
	if (gameover) return;
	bprint(self.netname);
	bprint(" left the game with ");
	bprint(ftos(self.frags));
	bprint(" frags\n");
	set_suicide_frame();
};


/*
===========
ClientObituary

called when a player dies// deathmsg killmsg kill message
============
*/


void(entity targ, entity attacker) ClientObituary =
{
	local	float rnum;
	local	string deathstring;
	rnum = random();

	if (targ.classname == "player")
	{
		if (attacker.classname == "teledeath")
		{
			bprint (targ.netname);
			bprint (" was telefragged by ");
			bprint (attacker.owner.netname);
			bprint ("\n");

			attacker.owner.frags = attacker.owner.frags + 1;
			return;
		}

		if (attacker.classname == "teledeath2")
		{
			bprint ("Satan's power deflects ");
			bprint (targ.netname);
			bprint ("'s telefrag\n");

			targ.frags = targ.frags - 1;
			return;
		}

		if (attacker.classname == "player")
		{
			if (targ == attacker)
			{
				// killed self
				attacker.frags = attacker.frags - 1;
				bprint (targ.netname);
				
				if (targ.weapon == 64 && targ.waterlevel > 1)
				{
					bprint (" discharges into the water.\n");
					return;
				}
				if (targ.weapon == IT_GRENADE) bprint (" tries to put the pin back in\n");
				else bprint (" becomes bored with life\n");
				return;
			}
			else if ((teamplay == 2) /*&& (targ.team > 0)*/ &&(targ.team == attacker.team) )
			{
				if (rnum < 0.25) deathstring = " mows down a teammate\n";
				else if (rnum < 0.50) deathstring = " checks his glasses\n";
				else if (rnum < 0.75) deathstring = " gets a frag for the other team\n";
				else deathstring = " loses another friend\n";
				
				bprint (attacker.netname);
				bprint (deathstring);
				attacker.frags = attacker.frags - 1;
				return;
			}
			else
			{
				attacker.frags = attacker.frags + 1;
				bprint(attacker.netname);
				bprint(" ");
				bprint(chr2str(3));
				if(targ.hitbox == 1) bprint(chr2str(2));//bprint("");
				bprint(" ");
				bprint(targ.netname);
				bprint("\n");
			}
			return;
		}
		else
		{
			targ.frags = targ.frags - 1;
			bprint (targ.netname);

			// killed by a montser?
			if (attacker.flags & FL_MONSTER)
			{
				bprint (" was killed\n");
				return;
			}

			if (attacker.solid == SOLID_BSP && attacker != world)
			{	
				bprint (" was squished\n");
				return;
			}
			if (attacker.classname == "trigger_changelevel")
			{
				bprint (" tried to leave\n");
				return;
			}

			// in-water deaths
			rnum = targ.watertype;
			if (rnum == -3)
			{
				bprint (" drowned\n");
				return;
			}
			else if (rnum == -4)
			{
				bprint (" dissolved in acid\n");
				return;
			}
			else if (rnum == -5)
			{
				bprint (" burned down\n");
				return;
			}
			if (targ.deathtype == "falling")
			{
				targ.deathtype = "";
				bprint (" fell to his death\n");
				return;
			}
			bprint (" died\n");
		}
	}
};
