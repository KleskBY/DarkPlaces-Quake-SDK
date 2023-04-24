
string ZOMBIE_MODEL = "models/monsters/zombie.md3";
float ZOMBIE_HEALTH = 350;
vector ZOMBIE_BIG_SIZE1 = '-12 -12 0';
vector ZOMBIE_BIG_SIZE2 = '12 12 52';
float ZOMBIE_BIG_ANIM_SPEED = 0.035;


float ZOMBIE_IDLE_START_FRAME = 0;
float ZOMBIE_IDLE_END_FRAME = 147;
float ZOMBIE_WALK_START_FRAME = 150;
float ZOMBIE_WALK_END_FRAME = 169;
float ZOMBIE_RUN_START_FRAME = 150;
float ZOMBIE_RUN_END_FRAME = 169;
float ZOMBIE_ATTACK_START_FRAME = 170;
float ZOMBIE_ATTACK_END_FRAME = 230;
float ZOMBIE_PAIN_START_FRAME = 240;
float ZOMBIE_PAIN_END_FRAME = 250;
float ZOMBIE_DEATH_START_FRAME = 240;
float ZOMBIE_DEATH_END_FRAME = 299;


////////////////////////// IDLE ////////////////////////////

void() zombie_big_stand =
{
	self.frame = self.frame + 1;
	if (self.frame < ZOMBIE_IDLE_START_FRAME || self.frame >= ZOMBIE_IDLE_END_FRAME) self.frame = ZOMBIE_IDLE_START_FRAME;
	
	self.think = zombie_big_stand;
	self.nextthink = time + ZOMBIE_BIG_ANIM_SPEED;
	ai_stand();
};

////////////////////////// WALK ////////////////////////////

void() zombie_big_walk =
{
	self.frame = self.frame + 1;
	if (self.frame < ZOMBIE_WALK_START_FRAME || self.frame >= ZOMBIE_WALK_END_FRAME) self.frame = ZOMBIE_WALK_START_FRAME;
	self.think = zombie_big_walk;
	self.nextthink = time + ZOMBIE_BIG_ANIM_SPEED;
	ai_walk(5);
};

////////////////////////// RUN ////////////////////////////

void() zombie_big_run =
{
	footsteps();
	self.frame = self.frame + 1;
	if (self.frame < ZOMBIE_RUN_START_FRAME || self.frame >= ZOMBIE_RUN_END_FRAME) self.frame = ZOMBIE_RUN_START_FRAME;
	self.think = zombie_big_run;
	self.nextthink = time + ZOMBIE_BIG_ANIM_SPEED;
	
	if(visible(self.goalentity))
	{
		ai_run(1);
		local vector dir = normalize(self.goalentity.origin - self.origin);
		local float needyaw = vectoyaw(dir);
		if(walkmove(needyaw, 3))
		{
			self.ideal_yaw = needyaw;
			ChangeYaw();
		}
		else ai_run(3);
	}
	else ai_run(3);
};

////////////////////////// PAIN ////////////////////////////

void() zombie_big_pain1 =
{
	self.frame = self.frame + 1;
	if(self.frame > ZOMBIE_PAIN_END_FRAME) self.think = zombie_big_run;
	else self.think = zombie_big_pain1;
	self.nextthink = time + ZOMBIE_BIG_ANIM_SPEED;
	ai_painforward(1);
};

void(entity attacker, float damage)	zombie_big_pain =
{
	if(random() > 0.6) return;
	local float r;
	if (self.pain_finished > time) return;
	r = random();

	if (self.frame < ZOMBIE_PAIN_START_FRAME || self.frame >= ZOMBIE_PAIN_END_FRAME) self.frame = ZOMBIE_PAIN_START_FRAME;
	zombie_big_pain1();
	self.pain_finished = time + 4;
};

////////////////////////// DIE ////////////////////////////

void() zombie_big_die1 =
{
	if(self.solid != SOLID_CORPSE) self.frame = ZOMBIE_DEATH_START_FRAME;
	else if(self.frame < ZOMBIE_DEATH_END_FRAME) self.frame = self.frame + 1;
	else self.nextthink = 0;
	setsize(self, ZOMBIE_BIG_SIZE1 + '-2 -2 0', '15 15 12');
	self.solid = SOLID_CORPSE;
	self.think = zombie_big_die1;
	self.nextthink = time + ZOMBIE_BIG_ANIM_SPEED;
};

void() zombie_big_die =
{
	if (self.health < -40)
	{
		Gib();
		return;
	}
	local float rsnd = rint(random() * 3);
	switch (rsnd)
	{
		case 1:
			sound (self, CHAN_VOICE, "player/death1.wav", 1, ATTN_NORM);
			break;
		case 2:
			sound (self, CHAN_VOICE, "player/death2.wav", 1, ATTN_NORM);
			break;
		default:
			sound (self, CHAN_VOICE, "player/death3.wav", 1, ATTN_NORM);
			break;
	}
	zombie_big_die1();
};

////////////////////////// ATTACK //////////////////////////

void() zombie_big_attack_loop =
{	
	self.frame = self.frame + 1;
	
	if(self.frame > ZOMBIE_ATTACK_END_FRAME)
	{
		self.think = zombie_big_run;
		self.nextthink = time + ZOMBIE_BIG_ANIM_SPEED;
	}
	else
	{
		if(self.frame & 10)
		{
			ai_face();
			local vector dir = normalize(self.goalentity.origin - self.origin);
			local float needyaw = vectoyaw(dir);
			walkmove(needyaw, 1);
			if(self.frame > 175) ai_melee();
		}
		self.think = zombie_big_attack_loop;
		self.nextthink = time + ZOMBIE_BIG_ANIM_SPEED;
	}
};

void() zombie_big_attack =
{
	self.frame = ZOMBIE_ATTACK_START_FRAME;
	ai_charge(2);
	self.think = zombie_big_attack_loop;
	self.nextthink = time + ZOMBIE_BIG_ANIM_SPEED;
};

//INIT


void() monster_zombie =
{
	precache_model2(ZOMBIE_MODEL);
	
	self.solid = SOLID_SLIDEBOX;
	self.movetype = MOVETYPE_STEP;
	self.yaw_speed = 10;

	setmodel (self, ZOMBIE_MODEL);
	setsize (self, ZOMBIE_BIG_SIZE1, ZOMBIE_BIG_SIZE2);
	self.health = ZOMBIE_HEALTH;
	self.th_stand = zombie_big_stand;
	self.th_walk = zombie_big_walk;
	self.th_run = zombie_big_run;
	self.th_melee = zombie_big_attack;
	self.th_pain = zombie_big_pain;
	self.th_die = zombie_big_die;
	self.goalentity = world;
	self.enemy = world;
	
	walkmonster_start();
};


