float AK74_DAMAGE = 35;
float AK74_MAX_CLIP = 30;
float AK74_RATE = 0.11;
float AK74_SEMI = 0;
float AK74_DISTANCE = 2048;
.float AK74_AMMO = ammoRifle;
.float AK74_CLIP;
.float AK74_PICKUP;

float AK74_RELOAD_START_FRAME = 37;
float AK74_RELOAD_END_FRAME = 117;
float AK74_DRAW_START_FRAME = 1;
float AK74_DRAW_END_FRAME = 30;
float AK74_ATTACK_START_FRAME = 31;
float AK74_ATTACK_END_FRAME = 36;
float AK74_FRAMERATE = 0.02;

string AK74_VIEW_MODEL = "models/weapons/v_rifle.iqm";
string AK74_PLAYER_MODEL = "models/players/player_rifle.md3";
string AK74_WORLD_MODEL = "models/w_ak.md3";

string AK74_FIRE_SOUND = "weapons/rifle_shot.wav";
string AK74_CLIPIN_SOUND = "weapons/ak74/clipin.wav";
string AK74_CLIPOUT_SOUND = "weapons/ak74/clipout.wav";
string AK74_NOAMMO_SOUND = "weapons/noammo.wav";

//////////////////////////// FIRE ///////////////////////////////

void() AK74_Fire = 
{
	self.AK74_CLIP = self.AK74_CLIP - 1;
	self.currentClip = self.AK74_CLIP;
	
	local vector spread = Spread('10 10 0');
	fireBullet(spread, AK74_DISTANCE, AK74_DAMAGE);
	
	self.punchangle_x = random(-3, -5);
	self.punchangle_y = random(2, -2);
	
	
	sound (self, CHAN_WEAPON, AK74_FIRE_SOUND, 1, SoundRadius(2500));
	
	MuzzleFlash('32 -5 -8', 2);
	pointparticles(particleeffectnum("supernailgun_muzzleflash"), self.origin + self.view_ofs + v_up * -5 + v_forward * 20 + v_right * 2, self.velocity * 50, 1);
	eject_shell (self.origin + self.view_ofs + v_up * -12 + v_forward*24 - v_right * -5, "models/weapons/shell.iqm");
};


//////////////////////// RELOADING ПЕРЕЗАРЯДКА ///////////////////////////


void() AK74_Reload2
{
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + AK74_FRAMERATE;
	
	if (self.weaponframe == 56) sound(self, CHAN_ITEM, AK74_CLIPOUT_SOUND, 0.5, ATTN_NORM);
	if (self.weaponframe == 104) sound(self, CHAN_ITEM, AK74_CLIPIN_SOUND, 0.5, ATTN_NORM);
	if (self.weaponframe >= AK74_RELOAD_END_FRAME)
	{
		self.weaponframe = 0;
		if(self.AK74_AMMO >= AK74_MAX_CLIP)
		{
			self.AK74_AMMO = self.AK74_AMMO - (AK74_MAX_CLIP - self.AK74_CLIP);
			self.AK74_CLIP = AK74_MAX_CLIP;
			self.currentClip = self.AK74_CLIP;
		}
		else
		{
			self.AK74_CLIP = self.AK74_AMMO;
			self.currentClip = self.AK74_CLIP;
			self.AK74_AMMO = 0;
		}
		W_SetCurrentAmmo();
		self.think = player_run;
	}
};

void() AK74_Reload
{
	self.currentClip = self.AK74_CLIP;
	if(self.AK74_CLIP >= AK74_MAX_CLIP) return;
	if(self.AK74_AMMO <= 0)
	{
		CycleWeaponReverseCommand();
		return;
	}
	self.weaponframe = AK74_RELOAD_START_FRAME;
	self.nextthink = time + AK74_FRAMERATE;
	self.think = AK74_Reload2;
	self.reload = 1;
	sound(self, CHAN_ITEM, AK74_NOAMMO_SOUND, 1, ATTN_NORM);
}


////////////////////////// ATTACK //////////////////////////////

void() AK74_Attack2
{
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + AK74_FRAMERATE;
	if(self.weaponframe >= AK74_ATTACK_END_FRAME) self.think = player_run;
	else self.think = AK74_Attack2;
}

void() AK74_Attack
{
	if(AK74_SEMI && self.ShootsFired != 0) return;
	if(self.AK74_AMMO <= 0 && self.AK74_CLIP <= 0)
	{
		CycleWeaponReverseCommand();
		return;
	}
	if (self.AK74_CLIP > 0) 
	{
		self.attack_finished = time + AK74_RATE;
		self.effects = self.effects | EF_MUZZLEFLASH;
		self.weaponframe = AK74_ATTACK_START_FRAME;
		self.nextthink = time + AK74_FRAMERATE;
		AK74_Fire();
		self.ShootsFired = self.ShootsFired + 1;
		self.think = AK74_Attack2;
	}                           
	else 
	{
		sound(self, CHAN_ITEM, AK74_NOAMMO_SOUND, 1, ATTN_NORM);
		self.attack_finished = time + 0.4;
		if (AUTORELOAD) self.impulse = 100;
		self.think = player_run;
	}
}

///////////////// WEAPON CHANGE ///////////////////

void() AK74_Switch2
{	
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + AK74_FRAMERATE;
	self.currentammo =  self.AK74_AMMO;
	if(self.weaponframe >= AK74_DRAW_END_FRAME)
	{
		self.think = player_run;
		self.reload = 0;
	}
};

void() AK74_Switch
{
	if(!self.AK74_PICKUP)
	{
		self.AK74_PICKUP = TRUE;
		self.AK74_CLIP = AK74_MAX_CLIP;
	}
	self.weaponframe = AK74_DRAW_START_FRAME;
	self.nextthink = time + AK74_FRAMERATE;
	self.think = AK74_Switch2;
	self.reload = 1;
	self.currentammo = self.AK74_AMMO;
};

/////////////////////// SELECT //////////////////////

void() AK74_Select =
{
	self.currentClip = self.AK74_CLIP;
	self.currentammo = self.AK74_AMMO;
	self.weaponframe = 0;
	self.weaponmodel = AK74_VIEW_MODEL;
	self.items = (self.items | IT_545x39);
	setmodel (self, AK74_PLAYER_MODEL);
	if(self.duck) setsize(self, DUCK_SIZE_MIN, DUCK_SIZE_MAX);
	else setsize (self, VEC_HULL_MIN, VEC_HULL_MAX);
	self.weaponSwitch = AK74_Switch;
	self.weaponAttack = AK74_Attack;
	self.weaponReload = AK74_Reload;
	self.weaponSelect = AK74_Select;
	SetGun(AK74_WORLD_MODEL);
}

//////////////// PRECACHE //////////////////////////

void() AK74_Precache =
{
	precache_model2(AK74_VIEW_MODEL);
	precache_model2(AK74_PLAYER_MODEL);
	precache_model2(AK74_WORLD_MODEL);
	precache_sound2(AK74_FIRE_SOUND);
	precache_sound2(AK74_CLIPIN_SOUND);
	precache_sound2(AK74_CLIPOUT_SOUND);
	precache_sound2(AK74_NOAMMO_SOUND);
};


