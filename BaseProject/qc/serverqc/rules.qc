
/*
=============================================================================

				LEVEL CHANGING / INTERMISSION

=============================================================================
*/



float intermission_running;
float intermission_exittime;
void() info_intermission =
{
};

string nextmap;
void() GotoNextMap =
{
	if (cvar("samelevel")) changelevel(mapname);// if samelevel is set, stay on same level
	else changelevel(nextmap);
};


void() ExitIntermission =
{
	if (deathmatch) // skip any text in deathmatch
	{
		GotoNextMap();
		return;
	}
	intermission_exittime = time + 1;
	intermission_running = intermission_running + 1;
	
	if (intermission_running == 2)
	{
		if (world.model == "maps/e1m8.bsp")
		{
			WriteByte (MSG_ALL, SVC_CDTRACK);
			WriteByte (MSG_ALL, 2);
			WriteByte (MSG_ALL, 3);
			WriteByte (MSG_ALL, SVC_FINALE);
			WriteString (MSG_ALL, "");
			return;
		}
		GotoNextMap();
	}

	GotoNextMap();
};


/*
============
IntermissionThink

When the player presses attack or jump, change to the next level
============
*/
void() IntermissionThink =
{
	if (time < intermission_exittime) return;
	if (!self.button0 && !self.button1 && !self.button2) return;
	ExitIntermission();
};






////////////////////////////////
///////// CHANGELEVEL //////////
////////////////////////////////



entity() FindIntermission =
{
	local	entity spot;
	local	float cyc;
	spot = find (world, classname, "info_intermission"); // look for info_intermission first
	if (spot) // pick a random one
	{	
		cyc = random() * 4;
		while (cyc > 1)
		{
			spot = find (spot, classname, "info_intermission");
			if (!spot) spot = find (spot, classname, "info_intermission");
			cyc = cyc - 1;
		}
		return spot;
	}
	spot = find (world, classname, "info_player_start"); // then look for the start position
	if (spot) return spot;
	else
	{
		bprint("No info_player_start\n");
		local entity newspawn = spawn();
		setorigin(newspawn, '0 0 1');
		return newspawn;
	}
	return world;
};

void() execute_changelevel =
{
	entity pos;
	intermission_running = 1;
	intermission_exittime = time + 2.5; // enforce a wait time before allowing changelevel

	WriteByte(MSG_ALL, SVC_CDTRACK);
	WriteByte(MSG_ALL, 3);
	WriteByte(MSG_ALL, 3);

	pos = FindIntermission();

	other = find(world, classname, "player");
	while (other != world)
	{
		other.view_ofs = '0 0 0';
		other.angles = other.v_angle = pos.mangle;
		other.fixangle = TRUE; // turn this way immediately
		other.nextthink = time + 0.5;
		other.takedamage = DAMAGE_NO;
		other.solid = SOLID_NOT;
		other.movetype = MOVETYPE_NONE;
		other.modelindex = 0;
		setorigin(other, pos.origin);
		other = find(other, classname, "player");
	}

	WriteByte(MSG_ALL, SVC_INTERMISSION);
};


void() changelevel_touch =
{
	if (other.classname != "player") return;
	if (cvar("noexit") == 1 || cvar("noexit") == 2 && mapname != "start")
	{
		T_Damage (other, self, self, 50000);
		return;
	}
	
	if (coop || deathmatch)
	{
		bprint(other.netname);
		bprint(" exited the level\n");
	}

	nextmap = self.map;
	SUB_UseTargets();
	if (self.spawnflags & 1 && deathmatch == 0) // NO_INTERMISSION
	{	
		GotoNextMap();
		return;
	}
	
	self.touch = SUB_Null;
	self.think = execute_changelevel;
	self.nextthink = time + 0.1;
};


void() trigger_changelevel =
{
	if (!self.map) objerror("chagnelevel trigger doesn't have map");
	InitTrigger();
	self.touch = changelevel_touch;
};





/*
===============================================================================

RULES

===============================================================================
*/

/*
go to the next level for deathmatch
*/
void() NextLevel =
{
	local entity o;
	local float r;
	if(deathmatch == 1)
	{
		r = rint(random() * 4);
		if(r == 1) nextmap = "dusty";
		else if(r == 2) nextmap = "snowy";
		else if(r == 3) nextmap = "factory";
		else nextmap = "terrain";
		
		mapname = nextmap;
		o = spawn();
		o.map = mapname;
		
		nextmap = o.map;
		gameover = TRUE;
		
		if (o.nextthink < time)
		{
			o.think = execute_changelevel;
			o.nextthink = time + 0.1;
		}
	}
	else
	{
		o = find(world, classname, "trigger_changelevel");
		if (!o)
		{
			mapname = "start";
			o = spawn();
			o.map = mapname;
		}

		nextmap = o.map;
		gameover = TRUE;
		
		if (o.nextthink < time)
		{
			o.think = execute_changelevel;
			o.nextthink = time + 0.1;
		}
	}
};















float ANTIAFK = 6;
.float lastAfkCheck;
.float afkWarnings;
void() AntiAFK = 
{
	if(coop && self.lastAfkCheck + 5 < time)
	{
		self.lastAfkCheck = time;
		
		local entity e;
		local float players;

		for (e = findchain(classname, "player"); e; e = e.chain) 
		{
			if(e.lastAngles == e.v_angle) e.afkWarnings = e.afkWarnings + 1;
			else e.afkWarnings = 0;
			
			if(e.afkWarnings > rint(ANTIAFK * 0.5))
			{
				centerprint(e, "MOVE OR YOU WILL BE KICKED FOR BEING AFK");
				sound (e, CHAN_BODY, "misc/talk.wav", 1, ATTN_IDLE);
			}
			if(e.afkWarnings > ANTIAFK) 
			{
				bprint(e.netname);
				bprint(" was kicked for being afk\n");
				dropclient(e);
			}
			e.lastAngles = e.v_angle;
		}
	}
}


void() AutoRestartCoop =
{
	local entity e;
	local float players;
	local float allive;
	
	if(coop && time > 5)
	{
		for (e = findchain(classname, "player"); e; e = e.chain)
		{
			players = players + 1;
			if(e.deadflag != DEAD_DEAD && e.deadflag != DEAD_DYING && e.deadflag != DEAD_RESPAWNABLE) allive = allive + 1;
		}
		for (e = findchain(classname, "observer"); e; e = e.chain) players = players + 1;
		if(!players) 
		{
			if(time > 600)
			{
				bprint("Restarting\n");
				localcmd("coop 1; deathmatch 0; map e1m1\n");
			}
		}
		if(!allive) localcmd ("restart\n");
	}
}

void() Timelimit =
{
	float timelimit = cvar("timelimit") * 60;
	if (timelimit && time >= timelimit)
	{
		NextLevel();
	}
}

void() Fraglimit = 
{
	float fraglimit = cvar("fraglimit");
	if (fraglimit && self.frags >= fraglimit)
	{
		NextLevel();
	}
}





void() global_think =
{
	self.nextthink = time + 0.1;
	if (gameover) return; // someone else quit the game already
	Timelimit();
	Fraglimit();
	AntiAFK();
	AutoRestartCoop();
}


void() RulesInit = 
{
	local entity e;
	e = spawn();
	e.classname = "global";
	e.think = global_think;
	e.nextthink = time + 0.1;
};