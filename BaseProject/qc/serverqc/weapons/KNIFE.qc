float KNIFE_DAMAGE = 25;
float KNIFE_MAX_CLIP = 8;
float KNIFE_RATE = 0.55;
float KNIFE_SEMI = 1;
float KNIFE_DISTANCE = 1024;
.float KNIFE_AMMO = ammoPistol;
.float KNIFE_CLIP;
.float KNIFE_PICKUP;

float KNIFE_RELOAD_START_FRAME = 36;
float KNIFE_RELOAD_END_FRAME = 156;
float KNIFE_DRAW_START_FRAME = 1;
float KNIFE_DRAW_END_FRAME = 25;
float KNIFE_ATTACK_START_FRAME = 26;
float KNIFE_ATTACK_END_FRAME = 35;
float KNIFE_FRAMERATE = 0.01;

string KNIFE_VIEW_MODEL = "models/weapons/v_knife.iqm";
string KNIFE_PLAYER_MODEL = "models/players/player_knife.md3";
string KNIFE_WORLD_MODEL = "models/w_knife.md3";

string KNIFE_FIRE_SOUND = "weapons/knife/hit.wav";
string KNIFE_WHOOSH1_SOUND = "weapons/knife/whoosh1.wav";
string KNIFE_WHOOSH2_SOUND = "weapons/knife/whoosh2.wav";
string KNIFE_MISS_SOUND = "weapons/knife/miss.wav";

//////////////////////////// FIRE ///////////////////////////////

void() KNIFE_Fire = 
{
	local entity head;
	local vector org;
	local float damage = 16;
	
	local vector meatdir;
	makevectors (self.v_angle);
	meatdir_x = (random() * 300);
	meatdir_y = (random() * 300);
	meatdir_z = (random() * 300);

	if(deathmatch)
	{
		head = findradius(self.origin, 75);
		while (head)
		{
			if (head != self && head.takedamage)
			{
				if (CanDamage (head, self) && visible(head) && infront(head))
				{	
					if (head.flags & FL_MONSTER || head.classname == "player" || head.classname == "bot")
					{
						T_Damage (head, self, self, damage);
						Shoot_Blood (org,meatdir);
						Shoot_Blood (org,meatdir * 2);
						damage = 1;
						break;
					}
				}
			}
			head = head.chain;
		}
	}
	if(deathmatch != MODE_ZM)
	{
		fireBullet('0.1 0.1 0', 75, damage);
	}
};



////////////////////////// ATTACK //////////////////////////////

void() KNIFE_Attack2
{
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + KNIFE_FRAMERATE;
	if(self.weaponframe >= 50 && self.weaponframe < 55)
	{
	   if(self.weaponframe == 50) 
	   {
		   self.frame = 3;
		   if(random()) sound(self, CHAN_WEAPON, KNIFE_WHOOSH1_SOUND, 0.5, SoundRadius(400));
		   else sound(self, CHAN_WEAPON, KNIFE_WHOOSH2_SOUND, 0.5, SoundRadius(400));
	   }
	   KNIFE_Fire();
	}
	if(self.weaponframe >= 89) self.think = player_run;
}
void() KNIFE_AttackB2
{
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + KNIFE_FRAMERATE;
	if(self.weaponframe >= 101 && self.weaponframe < 107)
	{
	   if(self.weaponframe == 101) 
	   {
		   self.frame = 3;
		   if(random()) sound(self, CHAN_WEAPON, KNIFE_WHOOSH1_SOUND, 0.8, SoundRadius(400));
		   else sound(self, CHAN_WEAPON, KNIFE_WHOOSH2_SOUND, 0.8, SoundRadius(400));
	   }
	   KNIFE_Fire();
	}
	if(self.weaponframe >= 124) self.think = player_run;
};

void() KNIFE_Attack
{
	self.attack_finished = time + KNIFE_RATE;
	self.nextthink = time + KNIFE_FRAMERATE;
	
	if(random() > 0.5)
	{
		self.weaponframe = 90;
		self.think = KNIFE_AttackB2;
	}
	else
	{
		self.weaponframe = 35;
		self.think = KNIFE_Attack2;
	}
}

///////////////// WEAPON CHANGE ///////////////////

void() KNIFE_Switch2
{	
	self.weaponframe = self.weaponframe + 1;
	self.nextthink = time + KNIFE_FRAMERATE;
	self.currentammo =  self.KNIFE_AMMO;
	if(self.weaponframe >= KNIFE_DRAW_END_FRAME)
	{
		self.think = player_run;
		self.reload = 0;
	}
};

void() KNIFE_Switch
{
	if(!self.KNIFE_PICKUP)
	{
		self.KNIFE_PICKUP = TRUE;
		self.KNIFE_CLIP = KNIFE_MAX_CLIP;
	}
	self.weaponframe = KNIFE_DRAW_START_FRAME;
	self.nextthink = time + KNIFE_FRAMERATE;
	self.think = KNIFE_Switch2;
	self.reload = 1;
	self.currentammo = self.KNIFE_AMMO;
};

/////////////////////// SELECT //////////////////////

void() KNIFE_Select =
{
	self.currentClip = self.KNIFE_CLIP;
	self.currentammo = self.KNIFE_AMMO;
	self.weaponframe = 0;
	self.weaponmodel = KNIFE_VIEW_MODEL;
	self.items = (self.items | IT_9x18);
	setmodel(self, KNIFE_PLAYER_MODEL);
	if(self.duck) setsize(self, DUCK_SIZE_MIN, DUCK_SIZE_MAX);
	else setsize (self, VEC_HULL_MIN, VEC_HULL_MAX);
	self.weaponSwitch = KNIFE_Switch;
	self.weaponAttack = KNIFE_Attack;
	self.weaponReload = SUB_Null;
	self.weaponSelect = KNIFE_Select;
	SetGun(KNIFE_WORLD_MODEL);
}

//////////////// PRECACHE //////////////////////////

void() KNIFE_Precache =
{
	if(deathmatch) precache_model2("models/weapons/v_knife_usa.md3");
	if(deathmatch) precache_model2("models/players/usa_knife.md3");
	precache_model2(KNIFE_VIEW_MODEL);
	precache_model2(KNIFE_PLAYER_MODEL);
	precache_model2(KNIFE_WORLD_MODEL);
	precache_sound2(KNIFE_FIRE_SOUND);
	precache_sound2(KNIFE_WHOOSH1_SOUND);
	precache_sound2(KNIFE_WHOOSH2_SOUND);
	precache_sound2(KNIFE_MISS_SOUND);
};


