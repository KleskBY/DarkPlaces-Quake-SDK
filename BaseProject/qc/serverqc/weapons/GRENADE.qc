float GRENADE_DAMAGE = 25;
float GRENADE_MAX_CLIP = 8;
float GRENADE_RATE = 0.65;
float GRENADE_SEMI = 1;
float GRENADE_DISTANCE = 1024;
.float GRENADE_AMMO = ammoGrenades;
.float GRENADE_CLIP;
.float GRENADE_PICKUP;
float GRENADE_ITEM = IT_ROCKETS;

float GRENADE_RELOAD_START_FRAME = 0;
float GRENADE_RELOAD_END_FRAME = 0;
float GRENADE_DRAW_START_FRAME = 1;
float GRENADE_DRAW_END_FRAME = 35;
float GRENADE_ATTACK_START_FRAME = 36;
float GRENADE_ATTACK_END_FRAME = 35;
float GRENADE_FRAMERATE = 0.015;

string GRENADE_VIEW_MODEL = "models/weapons/v_grenade.iqm";
string GRENADE_WORLD_MODEL = "models/weapons/w_grenade.iqm";
string GRENADE_SHRAPNEL_MODEL = "models/weapons/shrapnel.iqm";
string GRENADE_PLAYER_MODEL = "models/players/player_knife.md3";
string GRENADE_FIRE_SOUND = "weapons/explosion.wav";
string GRENADE_PIN_SOUND = "weapons/pinpull.wav";
string GRENADE_HIT_SOUND = "weapons/bounce.wav";

//////////////////////////// EXPLODE ////////////////////////////

void(entity inflictor, entity attacker, float damage, entity ignore) T_GrenadeRadiusDamage =
{
	local	float 	points;
	local	entity	head;
	local	vector	org;
	local   float temp;
	local   float grange;

	head = findradius(inflictor.origin, damage + 150);
	while (head)
	{
		if (head.takedamage)
		{
			org = head.origin + (head.mins + head.maxs)*0.5;
			points = 0.25*vlen (inflictor.origin - org);
			if (points < 0) points = 0;
			points = damage - points;
			if (head == attacker) points = points * 0.5;
			if (points > 0)
			{
				if (CanDamage (head, inflictor))
				{	
					T_Damage (head, inflictor, attacker, points);
					if(head.takedamage)
					{
						head.flags = head.flags - FL_ONGROUND;
						temp = vlen(org - inflictor.origin);
						if (temp < 60 && temp >= 0) grange = 8;
						if (temp < 120 && temp >= 60) grange = 4;
						if (temp < 180 && temp >= 120) grange = 2;
						if (temp < 240 && temp >= 180) grange = 1;
						if (temp >= 240) grange = 0.5;
						head.velocity = (org - inflictor.origin) * grange;
						Shoot_Blood(org,head.velocity * 100);
						head.velocity_z = 100 + (grange * 20);
					}
				}
			}
		}
		head = head.chain;
	}
};

void() shrapnel_touch =
{
	if (other == self.owner) return;
	if (other.solid == SOLID_TRIGGER) return;	// trigger field, do nothing
	if (pointcontents(self.origin) == CONTENT_SKY)
	{
		remove(self);
		return;
	}	

	if (other.takedamage) // hit something that bleeds
	{
        makevectors(self.v_angle);
		Shoot_Blood (other.origin,v_forward * 2000);
        T_Damage (other, self, self, 20);
	}
	else
	{
		WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
		WriteByte (MSG_BROADCAST, TE_SPIKE);
		WriteCoord (MSG_BROADCAST, self.origin_x);
		WriteCoord (MSG_BROADCAST, self.origin_y);
		WriteCoord (MSG_BROADCAST, self.origin_z);
	}
	remove(self);
};
void(vector org, vector dir) shoot_shrapnel =
{
	newmis = spawn ();
	newmis.owner = self;
	newmis.movetype = MOVETYPE_BOUNCE;
	newmis.solid = SOLID_BBOX;
	newmis.angles = vectoangles(dir);
	newmis.touch = shrapnel_touch;
    newmis.classname = "shrapnel";
	newmis.think = SUB_Remove;
	newmis.nextthink = time + 1.5;
	setmodel (newmis, GRENADE_SHRAPNEL_MODEL);
	setsize (newmis, VEC_ORIGIN, VEC_ORIGIN);
	setorigin (newmis, org);
	newmis.modelflags = MF_GRENADE;
	newmis.velocity = dir * 3;
};

void() MyGrenadeExplode =
{
	T_GrenadeRadiusDamage (self, self.owner, 100, world);
	WriteByte (MSG_BROADCAST, SVC_TEMPENTITY);
	WriteByte (MSG_BROADCAST, TE_EXPLOSION);
	WriteCoord (MSG_BROADCAST, self.origin_x);
	WriteCoord (MSG_BROADCAST, self.origin_y);
	WriteCoord (MSG_BROADCAST, self.origin_z);
	local vector shrapdir;
	local float i;
	for (i = 0; i < 17; i = i+1)	
	{
      shrapdir_x = 0 - (random(-1,1) * 200);
      shrapdir_y = 0 - (random(-1,1) * 200);
      shrapdir_z = (random(-1,1) * 200);
      shoot_shrapnel(self.origin , shrapdir);
	}
	sound (self, CHAN_WEAPON, GRENADE_FIRE_SOUND, 1, SoundRadius(3500));
	remove(self);
};



//////////////////////////// FIRE ///////////////////////////////

void() GRENADE_Touch =
{
	local vector meatdir;
	if (other == self.owner) return;		// don't explode on owner
	if(other.classname ==  "breakable")
	{
		T_Damage (other, self, self, 2);
		pointparticles(particleeffectnum("nailgun_muzzleflash"), self.origin, self.velocity*50, 1);
		meatdir_x = ((random () * 300) +  self.origin_x);
		meatdir_y = ((random () * 300) +  self.origin_y);
		meatdir_z = ((random () * 300) +  self.origin_z);
		shootGib (self.origin,meatdir,other.sounds);
		meatdir_x = ((random () * 300) +  self.origin_x);
		meatdir_y = ((random () * 300) +  self.origin_y);
		meatdir_z = ((random () * 300) +  self.origin_z);
		shootGib (self.origin,meatdir,other.sounds);
		meatdir_x = ((random () * 300) +  self.origin_x);
		meatdir_y = ((random () * 300) +  self.origin_y);
		meatdir_z = ((random () * 300) +  self.origin_z);
		shootGib (self.origin,meatdir,other.sounds);
	}
	sound (self, CHAN_WEAPON, GRENADE_HIT_SOUND, 1, ATTN_NORM);
	if (self.velocity == '0 0 0') self.avelocity = '0 0 0';
};

void() GRENADE_Fire = 
{
	self.GRENADE_AMMO = self.GRENADE_AMMO - 1;
	self.currentammo = self.GRENADE_AMMO;
	self.punchangle_x = -2;
	newmis = spawn();
	newmis.owner = self;
	newmis.movetype = MOVETYPE_BOUNCE;
	newmis.bouncefactor = 0.4;
	newmis.solid = SOLID_BBOX;
	newmis.classname = "grenade";
	makevectors (self.v_angle);
	if (self.v_angle_x) newmis.velocity = v_forward * (25 * self.grenadetime) + v_up * 100 + (2*(random() - 0.5)) * v_right*10 + (2*(random() - 0.5)) *v_up*30;
	else
	{
		newmis.velocity = aim(self, 10000);
        newmis.velocity = newmis.velocity * 20 * self.grenadetime;
		newmis.velocity_z = 30;
	}
	newmis.avelocity = '300 300 300';
	newmis.angles = vectoangles(newmis.velocity);
	newmis.touch = GRENADE_Touch;
	newmis.nextthink = time + 3;
	newmis.think = MyGrenadeExplode;
	newmis.search_time = time + 3.0;
	newmis.nextthink   = time + 1.5; //Delay
    setmodel (newmis, GRENADE_WORLD_MODEL);
	setsize (newmis, '0 0 0', '1 1 1');
	setorigin (newmis, self.origin - (v_right * -6) + (v_up * 11));
	if(self.currentammo == 0) CycleWeaponReverseCommand();
	self.grenadetime = 0;
};


////////////////////////// ATTACK //////////////////////////////

void() GRENADE_Attack4
{
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + GRENADE_FRAMERATE;
	if (self.weaponframe == 70) GRENADE_Fire();
	if (self.weaponframe >= 82) self.think = player_run;
}

void() GRENADE_Attack3
{
	self.nextthink = time + 0.02;
	self.attack_finished = time + 0.03;
	if (self.button0)
	{
		if (self.grenadetime <= 40)
		{
			self.grenadetime = self.grenadetime + 0.3; 
		}
	}
	else self.think = GRENADE_Attack4;
}

void() GRENADE_Attack2
{
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + GRENADE_FRAMERATE;
	if (self.weaponframe == 49) sound(self, CHAN_WEAPON, GRENADE_PIN_SOUND, 1, ATTN_NORM);
	if (self.weaponframe >= 60) self.think = GRENADE_Attack3;
}

void() GRENADE_Attack
{
	if(GRENADE_SEMI && self.ShootsFired != 0) return;
	if(self.GRENADE_AMMO <= 0)
	{
		CycleWeaponReverseCommand();
		return;
	}
	self.grenadetime = 10;
	self.attack_finished = time + GRENADE_RATE;
	self.weaponframe = GRENADE_ATTACK_START_FRAME;
	self.nextthink = time + GRENADE_FRAMERATE;
	self.think = GRENADE_Attack2;
	self.ShootsFired = self.ShootsFired + 1;
}

///////////////// WEAPON CHANGE ///////////////////

void() GRENADE_Switch2
{	
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + GRENADE_FRAMERATE;
	self.currentammo =  self.GRENADE_AMMO;
	if(self.weaponframe >= GRENADE_DRAW_END_FRAME)
	{
		self.think = player_run;
		self.reload = 0;
	}
};

void() GRENADE_Switch
{
	if(!self.GRENADE_PICKUP)
	{
		self.GRENADE_PICKUP = TRUE;
		self.GRENADE_CLIP = GRENADE_MAX_CLIP;
	}
	self.weaponframe = GRENADE_DRAW_START_FRAME;
	self.nextthink = time + GRENADE_FRAMERATE;
	self.think = GRENADE_Switch2;
	self.reload = 1;
	self.currentammo = self.GRENADE_AMMO;
};

/////////////////////// SELECT //////////////////////

void() GRENADE_Select =
{
	self.currentClip = self.GRENADE_CLIP;
	self.currentammo = self.GRENADE_AMMO;
	self.weaponframe = 0;
	self.weaponmodel = GRENADE_VIEW_MODEL;
	if(self.currentammo == 0) self.weaponmodel = "";
	setmodel(self, GRENADE_PLAYER_MODEL);
	if(self.duck) setsize(self, DUCK_SIZE_MIN, DUCK_SIZE_MAX);
	else setsize (self, VEC_HULL_MIN, VEC_HULL_MAX);
	self.items = (self.items | GRENADE_ITEM);
	self.weaponSwitch = GRENADE_Switch;
	self.weaponAttack = GRENADE_Attack;
	self.weaponReload = SUB_Null;
	self.weaponSelect = GRENADE_Select;
	SetGun(GRENADE_WORLD_MODEL);
}

//////////////// PRECACHE //////////////////////////

void() GRENADE_Precache =
{
	if(deathmatch) precache_model2("models/weapons/v_grenade_usa.md3");
	if(deathmatch) precache_model2("models/players/usa_knife.md3");
	precache_model2(GRENADE_VIEW_MODEL);
	precache_model2(GRENADE_PLAYER_MODEL);
	precache_model2(GRENADE_WORLD_MODEL);
	precache_model2(GRENADE_SHRAPNEL_MODEL);
	precache_sound2(GRENADE_FIRE_SOUND);
	precache_sound2(GRENADE_PIN_SOUND);
	precache_sound2(GRENADE_HIT_SOUND);
};


