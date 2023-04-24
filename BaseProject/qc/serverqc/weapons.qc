void (entity targ, entity inflictor, entity attacker, float damage) T_Damage;
void() player_run;
void(entity bomb, entity attacker, float rad, entity ignore) T_RadiusDamage;
void(vector org, vector vel, float damage) SpawnBlood;


//============================================================================


vector() wall_velocity =
{
	local vector	vel;
	vel = normalize (self.velocity);
	vel = normalize(vel + v_up*(random()- 0.5) + v_right*(random()- 0.5));
	vel = vel + 2*trace_plane_normal;
	vel = vel * 200;
	return vel;
};



/*
	================
	spawn_touchblood
	================
*/
void(float damage) spawn_touchblood =
{
	local vector	vel;
	vel = wall_velocity() * 0.2;
	SpawnBlood(self.origin + vel * 0.01, vel, damage);
};


/*
	================
	SpawnChunk
	================
*/
void(vector org, vector vel) SpawnChunk =
{
	particle (org, vel * 0.02, 0, 10);
};

/*
	==============================================================================
	
	MULTI-DAMAGE
	
	Collects multiple small damages into a single damage
	
	==============================================================================
*/

entity	multi_ent;
float	multi_damage;

void() ClearMultiDamage =
{
	multi_ent = world;
	multi_damage = 0;
};

void() ApplyMultiDamage =
{
	if (!multi_ent) return;
	T_Damage (multi_ent, self, self, multi_damage);
};

void(entity hit, float damage) AddMultiDamage =
{
	if (!hit) return;
	if (hit != multi_ent)
	{
		ApplyMultiDamage();
		multi_damage = damage;
		multi_ent = hit;
	}
	else multi_damage = multi_damage + damage;
};

/*
	==============================================================================
	
	BULLETS
	
	==============================================================================
*/

/*
	================
	TraceAttack
	================
*/

void (vector position, vector direction, float type) shootGib = 
{
	if(!type) return;
	local entity blood;
	local float r;
	
	blood = spawn ();
	blood.owner = self;
	blood.movetype = MOVETYPE_BOUNCE;
	blood.solid = SOLID_NOT;
	makevectors (self.angles);
	blood.velocity = direction;
	blood.avelocity = '300 300 300';
	blood.angles = vectoangles(blood.velocity);
	blood.nextthink = time + random(2,4);
	blood.think = SUB_Remove;
	blood.touch = SUB_Remove;
	
	if(type == 1) 
	{
		blood.scale = random(0.6,1.6);
		r = rint(random() * 5);
		if(r == 1) setmodel (blood, "models/wood1.md3");
		else if(r == 2) setmodel (blood, "models/wood2.md3");
		else if(r == 3) setmodel (blood, "models/wood3.md3");
		else if(r == 4) setmodel (blood, "models/wood4.md3");
		else if(r == 5) setmodel (blood, "models/wood5.md3");
	}
	else if(type == 2) 
	{
		blood.alpha = 0.5;
		blood.scale = random(1,3);
		setmodel (blood,"models/gib.md3");
	}
	else 
	{
		blood.scale = random(0.6,1.6);
		r = rint(random() * 4);
		if(r == 1) setmodel (blood, "models/metal1.md3");
		else if(r == 2) setmodel (blood, "models/metal2.md3");
		else if(r == 3) setmodel (blood, "models/metal3.md3");
		else if(r == 4) setmodel (blood, "models/metal4.md3");
	}
	setsize (blood,VEC_ORIGIN,VEC_ORIGIN);
	setorigin (blood,position);
	//pointparticles(particleeffectnum("smoke"), position, direction, 1);
};
	

float (float damage) DetectHitbox =
{
	if (trace_ent.absmax_z - trace_endpos_z <= 13 && !trace_ent.duck) //headshot
	{
		damage = rint(damage * 1.7);
		trace_ent.hitbox = HITBOX_HEAD;
	}
	else if(trace_ent.duck && trace_ent.absmax_z - trace_endpos_z <= 6)
	{
		damage = rint(damage * 1.7);
		trace_ent.hitbox = HITBOX_HEAD;
	}
	else if (trace_ent.absmax_z - trace_endpos_z > 30)	//legshot
	{
		trace_ent.hitbox = HITBOX_LEGS;
		damage = rint(damage * 0.7);
	}
	else trace_ent.hitbox = HITBOX_BODY;
	return damage;
}

float (float damage, vector org, vector dir) DetectObject =
{
	if(trace_ent.classname == "button")
	{
		AddMultiDamage(trace_ent,damage);
		return TRUE;
	}
	else if(trace_ent.classname == "breakable")
	{
		local vector meatdir;
		pointparticles(particleeffectnum("nailgun_muzzleflash"), org, '500 500 500', 1);
		WriteByte (MSG_BROADCAST,SVC_TEMPENTITY);
		WriteByte (MSG_BROADCAST,TE_GUNSHOT);
		WriteCoord (MSG_BROADCAST,org_x);
		WriteCoord (MSG_BROADCAST,org_y);
		WriteCoord (MSG_BROADCAST,org_z);
		
		if(self.weapon == WP_SHOTGUN) 
		{
			AddMultiDamage (trace_ent, damage);
			return TRUE;
		}

		meatdir_x = ((random () * 100) + dir_x);
		meatdir_y = ((random () * 100) + dir_y);
		meatdir_z = ((random () * 100) + dir_z);
		shootGib (org,meatdir,trace_ent.sounds);
		meatdir_x = ((random () * 100) + dir_x);
		meatdir_y = ((random () * 100) + dir_y);
		meatdir_z = ((random () * 100) + dir_z);
		shootGib (org,meatdir,trace_ent.sounds);
		meatdir_x = ((random () * 100) + dir_x);
		meatdir_y = ((random () * 100) + dir_y);
		meatdir_z = ((random () * 100) + dir_z);
		shootGib (org,meatdir,trace_ent.sounds);
		
		AddMultiDamage (trace_ent, damage);
		return TRUE;
	}
	return FALSE;
}

void(vector org) HitSound =
{
	local float rsnd;
	local vector dir = normalize(self.origin - org);
	traceline(self.origin, org + dir, TRUE, world);
	local float surfnum = getsurfacenearpoint(self.groundentity, org + dir);
	if (surfnum >= 0)
	{
		local string s = getsurfacetexture(self.groundentity, surfnum);
		
		if(strstrofs(s, "meta", 0) >= 0)
		{
			rsnd = rint(random() * 5);		
			if (rsnd == 1) pointsound(org, "impacts/metal1.wav", 1, SoundRadius(1250));
			else if (rsnd == 2) pointsound(org, "impacts/metal2.wav", 1, SoundRadius(1250));
			else if (rsnd == 3) pointsound(org, "impacts/metal3.wav", 1, SoundRadius(1250));
			else if (rsnd == 4) pointsound(org, "impacts/metal4.wav", 1, SoundRadius(1250));
			else if (rsnd == 5) pointsound(org, "impacts/metal5.wav", 1, SoundRadius(1250));
			return;
		}
		else if(strstrofs(s, "wood", 0) >= 0 || strstrofs(s, "crate", 0) >= 0)
		{
			rsnd = rint(random() * 4);		
			if (rsnd == 1) pointsound(org, "impacts/wood1.wav", 1, SoundRadius(1250));
			else if (rsnd == 2) pointsound(org, "impacts/wood2.wav", 1, SoundRadius(1250));
			else if (rsnd == 3) pointsound(org, "impacts/wood3.wav", 1, SoundRadius(1250));
			else if (rsnd == 4) pointsound(org, "impacts/wood4.wav", 1, SoundRadius(1250));
			return;
		}
	}
	if(random() > 0.2)
	{
		rsnd = rint(random() * 4);		
		if (rsnd == 1) pointsound(org, "impacts/hit1.wav", 1, SoundRadius(900));
		else if (rsnd == 2) pointsound(org, "impacts/hit2.wav", 1, SoundRadius(900));
		else if (rsnd == 3) pointsound(org, "impacts/hit3.wav", 1, SoundRadius(900));
		else if (rsnd == 4) pointsound(org, "impacts/hit4.wav", 1, SoundRadius(900));
	}
	else
	{
		if(random() >= 0.5) pointsound(org, "impacts/ric1.wav", 1, SoundRadius(1000));
		else pointsound(org, "impacts/ric2.wav", 1, SoundRadius(1000));
	}
}

void(vector org) ImpactSound =
{
	local float rsnd = rint(random() * 5);		
	if (rsnd == 1) pointsound(org, "impacts/body1.wav", 1, SoundRadius(1250));
	else if (rsnd == 2) pointsound(org, "impacts/body2.wav", 1, SoundRadius(1250));
	else if (rsnd == 3) pointsound(org, "impacts/body3.wav", 1, SoundRadius(1250));
	else if (rsnd == 4) pointsound(org, "impacts/body4.wav", 1, SoundRadius(1250));
	else if (rsnd == 5) pointsound(org, "impacts/body5.wav", 1, SoundRadius(1250));
}

void (float damage, vector dir) TraceAttack = 
{
	local vector vel, org, meatdir;
	local float particle_color;

	vel = normalize (dir + v_up * crandom() + v_right * crandom());
	vel = vel + trace_plane_normal * 2;
	vel = vel * 200;
	org = trace_endpos - dir * 4;
	
	if(self.weapon == WP_KNIFE)
	{
		if (!trace_ent.takedamage || trace_ent.classname == "worldspawn")
		{
			sound(self, CHAN_WEAPON,"weapons/knife/miss.wav", 1, ATTN_IDLE);
			WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
			WriteByte (MSG_BROADCAST, TE_GUNSHOT);
			WriteCoord (MSG_BROADCAST, org_x);
			WriteCoord (MSG_BROADCAST, org_y);
			WriteCoord (MSG_BROADCAST, org_z);
			return;
		}
	}
	
	if(trace_ent.takedamage) 
	{
		if(DetectObject(damage, org, dir)) return;
		damage = DetectHitbox(damage);
		
		if(self.weapon == WP_KNIFE)
		{
			trace_ent.axhitme = 1;
			sound(self, CHAN_WEAPON, "weapons/knife/hit.wav", 1, ATTN_NORM);
		}
		
		particle_color = random();
		meatdir_x = random() * 300;
		meatdir_y = random() * 300;
		meatdir_z = random() * 300;
		makevectors(self.v_angle);
		
		if(particle_color < 0.7 && damage >= 6) 
		{
			SpawnBlood(org, vel * 0.2, damage * 100); 
		}
		
		if(damage >= 20)
		{
			SpawnBlood(org + '10 10 0', v_forward * 200, 10); 
			SpawnBlood(org, v_forward * 200, 10); 
		}
		if(damage <= 20 && damage > 0)
		{
			if (trace_ent.health <= damage && trace_ent.movetype != MOVETYPE_PUSH && trace_ent.duck != 1 && trace_ent.classname != "misc_explobox") 
			{
				trace_ent.flags = trace_ent.flags - FL_ONGROUND;
				trace_ent.velocity = v_forward * 100;
				trace_ent.velocity_z = 100 + random() * 100;
			}
		}
		if(damage > 20)
		{
			if(trace_ent.health <= damage && trace_ent.movetype != MOVETYPE_PUSH && trace_ent.duck != 1) 
			{
				trace_ent.flags = trace_ent.flags - FL_ONGROUND;
				trace_ent.velocity = v_forward * 150;
				trace_ent.velocity_z = 100 + random() * 100;
			}
		}
		
		AddMultiDamage(trace_ent, damage);
		ImpactSound(trace_endpos);
	}
	else if(trace_ent.solid == SOLID_CORPSE)
	{
		SpawnBlood(org, vel * 0.2, damage * 100);
		trace_ent.health = trace_ent.health - damage;
		if(trace_ent.health < -260)
		{
			local entity oldself = self;
			self = trace_ent;
			Gib();
			self = oldself;
		}
		ImpactSound(trace_endpos);
	}
	else 
	{
		HitSound(org);
		WriteByte (MSG_BROADCAST,SVC_TEMPENTITY);
		WriteByte (MSG_BROADCAST,TE_GUNSHOT);
		WriteCoord (MSG_BROADCAST,org_x);
		WriteCoord (MSG_BROADCAST,org_y);
		WriteCoord (MSG_BROADCAST,org_z);
	}
	
};

/*
	================
	FireBullet
	================
*/

void(vector spread, float dist, float dmg) fireBullet =
{
	local vector src, dir;
	local float len;
	
	self.total_shots = self.total_shots + 1;
	makevectors(self.angles);
	dir = aim(self, 1000);
	
	makevectors(self.v_angle + self.punchangle);
	if(self.button5) makevectors(self.v_angle);
	
	src = self.origin + v_forward * 10;
	if(self.duck) src_z = self.origin_z + self.view_ofs_z + 0.1;
	else src_z = self.absmin_z + self.size_z * 0.8;
	
	ClearMultiDamage();
	
	local float oldSolid = self.solid; //Corpse hit fix
	self.solid = SOLID_BBOX;
	traceline(src, (src + v_forward * dist) - (v_right * crandom() * spread_x) - (v_up * crandom() * spread_y), FALSE, self);
	self.solid = oldSolid;
	// traceline (src, (src + v_forward * dist) - (v_right * crandom() * spread_x) - (v_up * crandom() * spread_y), FALSE, self);
	
	if (trace_fraction != 1.0)
	{
		if(trace_ent.takedamage) self.total_hits = self.total_hits + 1;
		len = vlen(trace_endpos - self.origin);
		if (len < 250) TraceAttack(dmg, dir);
		else if (len < 350 && len >= 250) TraceAttack(dmg * 0.9, dir);
		else TraceAttack(dmg * 0.8, dir);
	}
	ApplyMultiDamage();
};


void(vector org, float scl) MuzzleFlash =
{
	newmis = spawn();
	newmis.movetype = MOVETYPE_NONE;
	newmis.solid = SOLID_NOT;
	newmis.viewmodelforclient = self;
	newmis.owner = self;
	newmis.alpha = 0.7;
	newmis.effects = EF_FULLBRIGHT;
	if(random() >= 0.5) setmodel(newmis, "models/muzzle2.md3");
	else setmodel(newmis, "models/muzzle1.md3");
	newmis.scale = scl;
	setsize(newmis, '0 0 0', '0 0 0');
	setorigin(newmis, org);
	newmis.angles_z = random(0, 359);
	newmis.nextthink = time + 0.05;
	newmis.think = SUB_Remove;
}

void() shell_touch = 
{
	if (other.classname == "door") 
	{
		SUB_Remove();
		return;
	}
	if (self.owner.weapon == WP_SHOTGUN) sound (self, CHAN_WEAPON, "weapons/shell2.wav", 0.5, ATTN_NORM);
	else sound (self, CHAN_WEAPON, "weapons/shell1.wav", 0.5, ATTN_NORM);
};

void (vector org, string mod) eject_shell = 
{
	local float r;
	
	makevectors (self.v_angle);
	newmis = spawn ();
	newmis.owner = self;
	newmis.movetype = MOVETYPE_BOUNCE;
	r = random ();
	if (r < 0.5) newmis.solid = SOLID_BBOX;
	else newmis.solid = SOLID_NOT;
	newmis.angles = v_forward * (r + 1);
	newmis.classname = "shellcasing";
	newmis.touch = shell_touch;
	newmis.think = SUB_Remove;
	newmis.owner = self;
	newmis.nextthink = time + 1.5;
	setmodel (newmis, mod);
	setsize (newmis,VEC_ORIGIN,VEC_ORIGIN);
	setorigin (newmis,org);
	newmis.avelocity_x = (r * 6000);
	newmis.avelocity_y = (r * 6000);
	
	if (r < 0.1 && r >= MSG_BROADCAST) newmis.velocity = (((v_forward * 20) + (v_right * 60)) + (v_up * 80));
	if (r < 0.2 && r >= 0.1) newmis.velocity = (((v_forward * SVC_INTERMISSION) + (v_right * 65)) + (v_up * 90));
	if (r < 0.3 && r >= 0.2) newmis.velocity = (((v_forward * 25) + (v_right * 70)) + (v_up * 100));
	if (r < 0.4 && r >= 0.3) newmis.velocity = (((v_forward * 15) + (v_right * 75)) + (v_up * 110));
	if (r < 0.5 && r >= 0.4) newmis.velocity = (((v_forward * 25) + (v_right * 80)) + (v_up * 130));
	if (r < 0.6 && r >= 0.5) newmis.velocity = (((v_forward * 20) + (v_right * 85)) + (v_up * 150));
	if (r < 0.7 && r >= 0.6) newmis.velocity = (((v_forward * TE_LAVASPLASH) + (v_right * 90)) + (v_up * 120));
	if (r < 0.8 && r >= 0.7) newmis.velocity = (((v_forward * 20) + (v_right * 100)) + (v_up * 200));
	if (r < 0.900 && r >= 0.8) newmis.velocity = (((v_forward * SVC_INTERMISSION) + (v_right * 110)) + (v_up * 130));
	if (r <= 1 && r >= 0.9) newmis.velocity = (((v_forward * 25) + (v_right * 105)) + (v_up * 175));
};


/*
	===============================================================================
	PLAYER WEAPON USE 
	FX Weapon ammo
	===============================================================================
*/

void() PM_Select;
void() AK74_Select;
void() KNIFE_Select;
void() SHOTGUN_Select;
void() GRENADE_Select;
void() SelectCurrentWeapon
{
	if(self.weapon == WP_RIFLE) AK74_Select();
	else if(self.weapon == WP_PISTOL) PM_Select();
	else if(self.weapon == WP_KNIFE) KNIFE_Select();
	else if(self.weapon == WP_SHOTGUN) SHOTGUN_Select();
	else if(self.weapon == WP_GRENADE) GRENADE_Select();
};

void() W_SetCurrentAmmo =
{
	SelectCurrentWeapon();
	player_run();		// get out of any weapon firing states
	self.items = self.items - (self.items & (IT_SHELLS | IT_545x39 | IT_ROCKETS | IT_762x54 | IT_9x18));
	if(self.weaponSelect) self.weaponSelect();
};



/*
	============
	W_Attack
	
	An attack impulse can be triggered now
	============
*/

void() W_Attack =
{
	if (self.reload) return;
    self.weaponfired = self.weapon;
	makevectors	(self.v_angle);		// calculate forward angle for velocity
	self.show_hostile = time + 1;	// wake monsters up
	if(self.weaponAttack) self.weaponAttack();
};



/*
	============
	W_ChangeWeapon
	============
*/

void() W_ChangeWeapon =
{
	local float weaponID = 1;
	local float i = 1;
	while(i < self.impulse)
	{
		i = i + 1;
		weaponID = weaponID * 2;
	}
		
	self.impulse = 0;
	self.hgrenade = 0;
	
	if(weaponID == self.weapon) return;
	if (!(self.weapons & weaponID)) { sprint (self, "No weapon\n"); return; }
	
	self.weapon = weaponID;
	W_SetCurrentAmmo();
	sound(self, CHAN_AUTO, "player/switch.wav", random(0.3, 0.8), SoundRadius(400));
	if(self.weaponSwitch) self.weaponSwitch();
}



/*
	============
	CycleWeaponCommand
	Go to the next weapon with ammo
	============
*/

void() CycleWeaponCommand =
{
	self.impulse = 0;
	if(self.weapon <= 0) return;
	local float oldweapon = self.weapon;
	local float i;
	for(i = self.weapon * 2; i < 4194304; i = i * 2)
	{
		if(self.weapons & i)
		{		
			self.weapon = i;
			sound(self, CHAN_AUTO, "player/switch.wav", random(0.3, 0.8), SoundRadius(400));
			W_SetCurrentAmmo();
			if(self.weaponSwitch) self.weaponSwitch();
			break;
		}
	}
	if(i == 4194304 && oldweapon != 0.5)
	{
		self.weapon = 0.5;
		CycleWeaponCommand();
	}
};



/*
	============
	CycleWeaponReverseCommand
	Go to the prev weapon with ammo
	============
*/

void() CycleWeaponReverseCommand =
{
	self.impulse = 0;
	if(self.weapon <= 0) return;
	local float oldweapon = self.weapon;
	local float i;
	for(i = self.weapon / 2; i > 0.5; i = i / 2)
	{
		if(self.weapons & i)
		{		
			self.weapon = i;
			sound(self,CHAN_AUTO,"player/switch.wav", random(0.3, 0.8), SoundRadius(400));
			W_SetCurrentAmmo();
			if(self.weaponSwitch) self.weaponSwitch();
			break;
		}
	}
	if(i < 1 && oldweapon != 4194304)
	{
		self.weapon = 4194304;
		CycleWeaponReverseCommand();
	}
};



/*
	============
	W_WeaponFrame
	Called every frame so impulse events can be handled as well as possible
	============
*/

void() W_WeaponFrame =
{
	if (time < self.attack_finished) return;
	ImpulseCommands();
	if (!self.button0) self.ShootsFired = 0;
	if (self.button0) W_Attack();	// check for attack
};



/*
	============
	Weapon funcs
	============
*/

vector Spread(vector spread) =
{
	if (self.ShootsFired == 1) spread = spread * 1.5;
	else if (self.ShootsFired == 2) spread = spread * 2;
	else if (self.ShootsFired == 3) spread = spread * 3;
	else if (self.ShootsFired == 4) spread = spread * 3.5;
	else spread = spread * 5;
	if(self.duck) spread = spread * 0.75;
	return spread;
};


void(string mdl) SetGun =
{
	if(!self.model) return;
	if(!self.gun) self.gun = spawn();
	setmodel(self.gun, mdl);
	self.gun.model = mdl;
	setattachment(self.gun, self, "tag_weapon");
};

void() SelectNone =
{
	self.currentClip = 0;
	self.currentammo = 0;
	self.weaponframe = 0;
	self.weaponmodel = "";
	self.weaponSwitch = SUB_Null;
	self.weaponAttack = SUB_Null;
	self.weaponReload = SUB_Null;
	self.weaponSelect = SUB_Null;
	SetGun("");
}

