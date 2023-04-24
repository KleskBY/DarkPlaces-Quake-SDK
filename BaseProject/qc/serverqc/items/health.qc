/*
=========================================================================

HEALTH BOX

=========================================================================
*/
//
// T_Heal: add health to an entity, limiting health to max_health
// "ignore" will ignore max_health limit
//
float (entity e, float healamount, float ignore) T_Heal =
{
	if (e.health <= 0) return 0;
	if ((!ignore) && (e.health >= other.max_health)) return 0;
	healamount = ceil(healamount);
	e.health = e.health + healamount;
	if ((!ignore) && (e.health >= other.max_health)) e.health = other.max_health;
	if (e.health > 250) e.health = 250;
	return 1;
};

void() health_touch =
{
	if (other.classname != "player") return;
	if (!T_Heal(other, 25, 0)) return;
	other.picked_items = other.picked_items + 1;
	sprint(other, "You receive 25 health\n");
	sound(other, CHAN_ITEM, self.noise, 1, ATTN_NORM);
	stuffcmd (other, "bf\n");
	self.model = string_null;
	self.solid = SOLID_NOT;
	if (deathmatch != 2)
	{
		if (deathmatch) self.nextthink = time + 20;
		self.think = SUB_regen;
	}
	activator = other;
	SUB_UseTargets();				// fire all targets / killtargets
};	

void() item_health =
{	
	self.touch = health_touch;	
	precache_model2("models/items/medkit.iqm");
	setmodel(self, "models/items/medkit.iqm");
	precache_sound("player/heal.wav");
	self.noise = "player/heal.wav";
	
	setsize(self, '-18 -18 0', '18 18 56');
	StartItem();
};