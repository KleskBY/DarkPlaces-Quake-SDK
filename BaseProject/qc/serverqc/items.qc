void() W_SetCurrentAmmo;
/* ALL LIGHTS SHOULD BE 0 1 0 IN COLOR ALL OTHER ITEMS SHOULD
BE .8 .3 .4 IN COLOR */


void() SUB_regen =
{
	self.model = self.mdl;		// restore original model
	self.solid = SOLID_TRIGGER;	// allow it to be touched again
	sound (self, CHAN_VOICE, "misc/item_respawn.wav", 1, ATTN_NORM);	// play respawn sound
	setorigin (self, self.origin);
};



/*QUAKED noclass (0 0 0) (-8 -8 -8) (8 8 8)
prints a warning message when spawned
*/
void() noclass =
{
	dprint ("noclass spawned at");
	dprint (vtos(self.origin));
	dprint ("\n");
	remove (self);
};



/*
============
PlaceItem

plants the object on the floor
============
*/
void() PlaceItem =
{
	self.mdl = self.model;		// so it can be restored on respawn
	self.flags = FL_ITEM;		// make extra wide
	self.solid = SOLID_TRIGGER;
	self.movetype = MOVETYPE_TOSS;	
	self.velocity = '0 0 0';
};

/*
============
StartItem

Sets the clipping size and plants the object on the floor
============
*/
void() StartItem =
{
	self.item = TRUE;
	self.nextthink = time + 0.2;	// items start after other solids
	self.think = PlaceItem;
};


/*
===============================================================================

WEAPONS

===============================================================================
*/

void() bound_other_ammo =
{
	if (other.ammoPistol > 100) other.ammoPistol = 100;
	if (other.ammoShells > 100) other.ammoShells = 100;
	if (other.ammoRifle > 200) other.ammoRifle = 200;
	if (other.ammoGrenades > 100) other.ammoGrenades = 100;		
	if (other.ammoSniper > 100) other.ammoSniper = 100;		
};

/*
===============================================================================

PLAYER BACKPACKS

===============================================================================
*/

void() BackpackTouch =
{
	local string s;
	local float old, new;
	local entity stemp;
	local float acount;
	
	if (other.classname == "useprefab") other = other.owner;
	if (other.classname != "player") return;
	if (other.health <= 0) return;

	acount = 0;
	sprint (other, "You get ");

	if (self.items)
	{
		if (other.items & self.items == 0)
		{
			acount = 1;
			sprint (other, "the ");
			sprint (other, self.netname);
		}
	}
	
	if(!(other.weapons & self.weapon))
	{
		other.items = other.items | self.weapon;
		other.weapons = other.weapons | self.weapon;
		if(!other.hgrenade && !other.reload)
		{
			if(self.weapon == WP_RIFLE) other.impulse = 4;
			else if(self.weapon == WP_SHOTGUN) other.impulse = 3;
			else if(self.weapon == WP_SNIPER) other.impulse = 5;
		}
	
	}


// change weapons
	other.ammoPistol = other.ammoPistol + self.ammoPistol;
	other.ammoShells = other.ammoShells + self.ammoShells;
	other.ammoRifle = other.ammoRifle + self.ammoRifle;
	other.ammoGrenades = other.ammoGrenades + self.ammoGrenades;
	other.ammoSniper = other.ammoSniper + self.ammoSniper;

	new = self.items;
	if (!new) new = other.weapon;
	old = other.items;
	other.items = other.items | new;
	
	bound_other_ammo ();

	if (self.ammoPistol)
	{
		if (acount) sprint(other, ", ");
		acount = 1;
		s = ftos(self.ammoPistol);
		sprint (other, s);
		sprint (other, " 9x18 ammo");
	}
	if (self.ammoShells)
	{
		if (acount)
			sprint(other, ", ");
		acount = 1;
		s = ftos(self.ammoShells);
		sprint (other, s);
		sprint (other, " shells");
	}
	if (self.ammoRifle)
	{
		if (acount) sprint(other, ", ");
		acount = 1;
		s = ftos(self.ammoRifle);
		sprint (other, s);
		sprint (other, " AK-74 ammo");
	}
	if (self.ammoGrenades)
	{
		if (acount)
			sprint(other, ", ");
		acount = 1;
		s = ftos(self.ammoGrenades);
		sprint (other, s);
		sprint (other, " rockets");
	}
	if (self.ammoSniper)
	{
		if (acount) sprint(other, ", ");
		acount = 1;
		s = ftos(self.ammoSniper);
		sprint (other, s);
		sprint (other, " sniper ammo");
	}
	
	sprint (other, "\n");
	sound (other, CHAN_ITEM, "player/pickup.wav", 1, ATTN_NORM);
	stuffcmd (other, "bf\n");
	remove(self);
	
	self = other;

	if(!other.reload && !other.hgrenade)
	{
		W_SetCurrentAmmo();
	}
};

