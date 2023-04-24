float PM_DAMAGE = 25;
float PM_MAX_CLIP = 8;
float PM_RATE = 0.05;
float PM_SEMI = 1;
float PM_DISTANCE = 1024;
.float PM_AMMO = ammoPistol;
.float PM_CLIP;
.float PM_PICKUP;
float PM_ITEM = IT_9x18;

float PM_RELOAD_START_FRAME = 36;
float PM_RELOAD_END_FRAME = 156;
float PM_DRAW_START_FRAME = 1;
float PM_DRAW_END_FRAME = 25;
float PM_ATTACK_START_FRAME = 26;
float PM_ATTACK_END_FRAME = 35;
float PM_FRAMERATE = 0.015;

string PM_VIEW_MODEL = "models/weapons/v_pistol.iqm";
string PM_PLAYER_MODEL = "models/players/ussr_pistol.md3";
string PM_WORLD_MODEL = "models/w_pm.md3";

string PM_FIRE_SOUND = "weapons/pistol_shot.wav";
string PM_CLIPIN_SOUND = "weapons/pm/clipin.wav";
string PM_CLIPOUT_SOUND = "weapons/pm/clipout.wav";
string PM_SLIDE1 = "weapons/pm/slideback.wav";
string PM_NOAMMO_SOUND = "weapons/noammo.wav";

//////////////////////////// FIRE ///////////////////////////////

void() PM_Fire = 
{
	self.PM_CLIP = self.PM_CLIP - 1;
	self.currentClip = self.PM_CLIP;
	
	fireBullet(Spread('9 9 0'), PM_DISTANCE, PM_DAMAGE);
	
	self.punchangle_x = random(-2, 2);
	self.punchangle_y = random(0, 2.5);
	
	sound (self, CHAN_WEAPON, PM_FIRE_SOUND, 1, SoundRadius(1700));
	pointparticles(particleeffectnum("supernailgun_muzzleflash"), self.origin + self.view_ofs + v_up * -5 + v_forward * 25 + v_right * 5, self.velocity * 50, 1);
	eject_shell (self.origin + self.view_ofs + v_up * -5 + v_forward * 20 - v_right * -7, "models/weapons/shell.iqm");
};


//////////////////////// RELOADING ПЕРЕЗАРЯДКА ///////////////////////////

void() PM_Reload3//Short
{
	self.weaponframe = self.weaponframe - 1;
	self.nextthink = time + PM_FRAMERATE;
	
	if(self.weaponframe == 59) sound(self, CHAN_ITEM, PM_CLIPIN_SOUND, 0.5, ATTN_NORM);
	if(self.weaponframe <= PM_RELOAD_START_FRAME + 1)
	{
		self.weaponframe = 0;
		if(self.PM_AMMO >= PM_MAX_CLIP)
		{
			self.PM_AMMO = self.PM_AMMO - (PM_MAX_CLIP - self.PM_CLIP);
			self.PM_CLIP = PM_MAX_CLIP + 1;
			self.currentClip = self.PM_CLIP;
		}
		else
		{
			self.PM_CLIP = self.PM_AMMO;
			self.currentClip = self.PM_CLIP;
			self.PM_AMMO = 0;
		}
		W_SetCurrentAmmo();
		self.think = player_run;
	}
}
void() PM_Reload2
{
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + PM_FRAMERATE;
	
	if(self.weaponframe > 85 && (self.PM_CLIP > 0 || deathmatch))
	{
		self.think = PM_Reload3;
		return;
	}
	
	if (self.weaponframe == 56) sound(self, CHAN_ITEM, PM_CLIPOUT_SOUND, 0.5, ATTN_NORM);
	if (self.weaponframe == 104) sound(self, CHAN_ITEM, PM_CLIPIN_SOUND, 0.5, ATTN_NORM);
	if (self.weaponframe == 132) sound(self, CHAN_ITEM, PM_SLIDE1, 0.5, ATTN_NORM);
	if (self.weaponframe >= PM_RELOAD_END_FRAME)
	{
		self.weaponframe = 0;
		if(self.PM_AMMO >= PM_MAX_CLIP)
		{
			self.PM_AMMO = self.PM_AMMO - (PM_MAX_CLIP - self.PM_CLIP);
			self.PM_CLIP = PM_MAX_CLIP;
			self.currentClip = self.PM_CLIP;
		}
		else
		{
			self.PM_CLIP = self.PM_AMMO;
			self.currentClip = self.PM_CLIP;
			self.PM_AMMO = 0;
		}
		W_SetCurrentAmmo();
		self.think = player_run;
	}
};

void() PM_Reload
{
	self.currentClip = self.PM_CLIP;
	if(self.PM_CLIP >= PM_MAX_CLIP) return;
	if(self.PM_AMMO <= 0)
	{
		CycleWeaponReverseCommand();
		return;
	}
	self.weaponframe = PM_RELOAD_START_FRAME;
	self.nextthink = time + PM_FRAMERATE;
	self.think = PM_Reload2;
	self.reload = 1;
	sound(self, CHAN_ITEM, PM_NOAMMO_SOUND, 1, ATTN_NORM);
}


////////////////////////// ATTACK //////////////////////////////

void() PM_Attack2
{
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + PM_FRAMERATE;
	if(self.weaponframe >= PM_ATTACK_END_FRAME) self.think = player_run;
	else self.think = PM_Attack2;
}

void() PM_Attack
{
	if(PM_SEMI && self.ShootsFired != 0) return;
	if(self.PM_AMMO <= 0 && self.PM_CLIP <= 0)
	{
		CycleWeaponReverseCommand();
		return;
	}
	if (self.PM_CLIP > 0) 
	{
		self.attack_finished = time + PM_RATE;
		self.effects = self.effects | EF_MUZZLEFLASH;
		self.weaponframe = PM_ATTACK_START_FRAME;
		self.nextthink = time + PM_FRAMERATE;
		PM_Fire();
		self.ShootsFired = self.ShootsFired + 1;
		self.think = PM_Attack2;
	}                           
	else 
	{
		sound(self, CHAN_ITEM, PM_NOAMMO_SOUND, 1, ATTN_NORM);
		self.attack_finished = time + 0.4;
		if (AUTORELOAD) self.impulse = 100;
		self.think = player_run;
	}
}

///////////////// WEAPON CHANGE ///////////////////

void() PM_Switch2
{	
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + PM_FRAMERATE;
	self.currentammo =  self.PM_AMMO;
	if(self.weaponframe >= PM_DRAW_END_FRAME)
	{
		self.think = player_run;
		self.reload = 0;
	}
};

void() PM_Switch
{
	if(!self.PM_PICKUP)
	{
		self.PM_PICKUP = TRUE;
		self.PM_CLIP = PM_MAX_CLIP;
	}
	self.weaponframe = PM_DRAW_START_FRAME;
	self.nextthink = time + PM_FRAMERATE;
	self.think = PM_Switch2;
	self.reload = 1;
	self.currentammo = self.PM_AMMO;
};

/////////////////////// SELECT //////////////////////

void() PM_Select =
{
	self.currentClip = self.PM_CLIP;
	self.currentammo = self.PM_AMMO;
	self.weaponframe = 0;
	self.weaponmodel = PM_VIEW_MODEL;
	self.items = (self.items | PM_ITEM);
	setmodel (self, PM_PLAYER_MODEL);
	if(self.duck) setsize(self, DUCK_SIZE_MIN, DUCK_SIZE_MAX);
	else setsize (self, VEC_HULL_MIN, VEC_HULL_MAX);
	self.weaponSwitch = PM_Switch;
	self.weaponAttack = PM_Attack;
	self.weaponReload = PM_Reload;
	self.weaponSelect = PM_Select;
	SetGun(PM_WORLD_MODEL);
}

//////////////// PRECACHE //////////////////////////

void() PM_Precache =
{
	precache_model2(PM_VIEW_MODEL);
	precache_model2(PM_PLAYER_MODEL);
	precache_model2(PM_WORLD_MODEL);
	precache_sound2(PM_FIRE_SOUND);
	precache_sound2(PM_CLIPIN_SOUND);
	precache_sound2(PM_CLIPOUT_SOUND);
	precache_sound2(PM_NOAMMO_SOUND);
	precache_sound2(PM_SLIDE1);
};


