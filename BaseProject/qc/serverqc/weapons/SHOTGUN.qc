float SHOTGUN_DAMAGE = 8;
float SHOTGUN_MAX_CLIP = 5;
float SHOTGUN_RATE = 0.66;
float SHOTGUN_SEMI = 1;
float SHOTGUN_DISTANCE = 1024;
.float SHOTGUN_AMMO = ammoShells;
.float SHOTGUN_CLIP;
.float SHOTGUN_PICKUP;
float SHOTGUN_ITEM = IT_SHELLS;

float SHOTGUN_RELOAD_START_FRAME = 73;
float SHOTGUN_RELOAD_END_FRAME = 156;
float SHOTGUN_DRAW_START_FRAME = 1;
float SHOTGUN_DRAW_END_FRAME = 45;
float SHOTGUN_ATTACK_START_FRAME = 46;
float SHOTGUN_ATTACK_END_FRAME = 73;
float SHOTGUN_FRAMERATE = 0.022;

string SHOTGUN_VIEW_MODEL = "models/weapons/v_shot.iqm";
string SHOTGUN_PLAYER_MODEL = "models/players/player_rifle.md3";
string SHOTGUN_WORLD_MODEL = "models/w_shot.md3";

string SHOTGUN_FIRE_SOUND = "weapons/shotgun_shot.wav";
string SHOTGUN_CLIPIN_SOUND = "weapons/shotgun/insertshell.wav";
string SHOTGUN_SLIDE1 = "weapons/shotgun/pump.wav";
string SHOTGUN_NOAMMO_SOUND = "weapons/noammo.wav";

//////////////////////////// FIRE ///////////////////////////////

void() SHOTGUN_Fire = 
{
	self.SHOTGUN_CLIP = self.SHOTGUN_CLIP - 1;
	self.currentClip = self.SHOTGUN_CLIP;
	
	self.punchangle_x = random (-2,-6);
	self.punchangle_z = random (2,4);
	local float i;
	i = 16;
	while (i > 0)
	{
		fireBullet('90 90 0', SHOTGUN_DISTANCE, SHOTGUN_DAMAGE);
		i = i -1;
	}
	sound(self, CHAN_WEAPON, SHOTGUN_FIRE_SOUND, 1, SoundRadius(2500));
	pointparticles(particleeffectnum("double_shotgun_muzzleflash"), self.origin + self.view_ofs + v_up * -2.6 + v_forward * 26 + v_right*3.7, self.velocity*50, 1);
	MuzzleFlash('40 -6.6 -8.2', 5);
	eject_shell (self.origin + self.view_ofs + v_up * -8 + v_forward*22 - v_right * -8, "models/weapons/shell.iqm");
};


//////////////////////// RELOADING ПЕРЕЗАРЯДКА ///////////////////////////

void() SHOTGUN_Reload2
{
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + SHOTGUN_FRAMERATE;
	
	if(self.weaponframe == 91 && (self.ammoShells == 1 || self.SHOTGUN_CLIP == 6)) self.weaponframe = 133;
	if(self.weaponframe == 112 || self.weaponframe == 152)
	{
		self.ammoShells = self.ammoShells - 1;
		self.SHOTGUN_CLIP = self.SHOTGUN_CLIP + 1;
		sound(self, CHAN_ITEM, SHOTGUN_CLIPIN_SOUND, 0.6, ATTN_NORM);
		self.currentammo = self.ammoShells;
	}
	if(self.weaponframe == 132 && self.SHOTGUN_CLIP < SHOTGUN_MAX_CLIP && self.ammoShells > 1) self.weaponframe = 90;
	if(self.weaponframe == 188) sound(self, CHAN_ITEM, SHOTGUN_SLIDE1, 0.6, ATTN_NORM);
	if (self.weaponframe == 207) 
	{
		self.think = player_run;
		W_SetCurrentAmmo();
	}
	if(self.button0 && (self.weaponframe < 133 && self.weaponframe> 91)) self.weaponframe = self.weaponframe + 43;
};

void() SHOTGUN_Reload
{
	self.currentClip = self.SHOTGUN_CLIP;
	if(self.SHOTGUN_CLIP >= SHOTGUN_MAX_CLIP) return;
	if(self.SHOTGUN_AMMO <= 0)
	{
		CycleWeaponReverseCommand();
		return;
	}
	self.weaponframe = SHOTGUN_RELOAD_START_FRAME;
	self.nextthink = time + SHOTGUN_FRAMERATE;
	self.think = SHOTGUN_Reload2;
	self.reload = 1;
	sound(self, CHAN_ITEM, SHOTGUN_NOAMMO_SOUND, 1, ATTN_NORM);
}

////////////////////////// ATTACK //////////////////////////////

void() SHOTGUN_Attack2
{
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + SHOTGUN_FRAMERATE;
	if(self.weaponframe == 60) sound(self, CHAN_ITEM, SHOTGUN_SLIDE1, 0.5, ATTN_NORM);
	if(self.weaponframe >= SHOTGUN_ATTACK_END_FRAME) self.think = player_run;
	else self.think = SHOTGUN_Attack2;
}

void() SHOTGUN_Attack
{
	if(SHOTGUN_SEMI && self.ShootsFired != 0) return;
	if(self.SHOTGUN_AMMO <= 0 && self.SHOTGUN_CLIP <= 0)
	{
		CycleWeaponReverseCommand();
		return;
	}
	if (self.SHOTGUN_CLIP > 0) 
	{
		self.attack_finished = time + SHOTGUN_RATE;
		self.effects = self.effects | EF_MUZZLEFLASH;
		self.weaponframe = SHOTGUN_ATTACK_START_FRAME;
		self.nextthink = time + SHOTGUN_FRAMERATE;
		SHOTGUN_Fire();
		self.ShootsFired = self.ShootsFired + 1;
		self.think = SHOTGUN_Attack2;
	}                           
	else 
	{
		sound(self, CHAN_ITEM, SHOTGUN_NOAMMO_SOUND, 1, ATTN_NORM);
		self.attack_finished = time + 0.4;
		if (AUTORELOAD) self.impulse = 100;
		self.think = player_run;
	}
}

///////////////// WEAPON CHANGE ///////////////////

void() SHOTGUN_Switch2
{	
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + SHOTGUN_FRAMERATE;
	self.currentammo =  self.SHOTGUN_AMMO;
	if(self.weaponframe >= SHOTGUN_DRAW_END_FRAME)
	{
		self.think = player_run;
		self.reload = 0;
	}
};

void() SHOTGUN_Switch
{
	if(!self.SHOTGUN_PICKUP)
	{
		self.SHOTGUN_PICKUP = TRUE;
		self.SHOTGUN_CLIP = SHOTGUN_MAX_CLIP;
	}
	self.weaponframe = SHOTGUN_DRAW_START_FRAME;
	self.nextthink = time + SHOTGUN_FRAMERATE;
	self.think = SHOTGUN_Switch2;
	self.reload = 1;
	self.currentammo = self.SHOTGUN_AMMO;
};

/////////////////////// SELECT //////////////////////

void() SHOTGUN_Select =
{
	self.currentClip = self.SHOTGUN_CLIP;
	self.currentammo = self.SHOTGUN_AMMO;
	self.weaponframe = 0;
	self.items = (self.items | SHOTGUN_ITEM);
	self.weaponmodel = SHOTGUN_VIEW_MODEL;
	setmodel(self, SHOTGUN_PLAYER_MODEL);
	if(self.duck) setsize(self, DUCK_SIZE_MIN, DUCK_SIZE_MAX);
	else setsize (self, VEC_HULL_MIN, VEC_HULL_MAX);
	self.weaponSwitch = SHOTGUN_Switch;
	self.weaponAttack = SHOTGUN_Attack;
	self.weaponReload = SHOTGUN_Reload;
	self.weaponSelect = SHOTGUN_Select;
	SetGun(SHOTGUN_WORLD_MODEL);
}

//////////////// PRECACHE //////////////////////////

void() SHOTGUN_Precache =
{
	precache_model2(SHOTGUN_VIEW_MODEL);
	precache_model2(SHOTGUN_PLAYER_MODEL);
	precache_model2(SHOTGUN_WORLD_MODEL);
	if(deathmatch) precache_model2("models/weapons/v_shot_usa.md3");
	precache_sound2(SHOTGUN_FIRE_SOUND);
	precache_sound2(SHOTGUN_CLIPIN_SOUND);
	precache_sound2(SHOTGUN_NOAMMO_SOUND);
	precache_sound2(SHOTGUN_SLIDE1);
};


