void() SetChangeParms =
{
	if (self.health <= 0)
	{
		SetNewParms();
		return;
	}
	self.items = self.items - (self.items & (IT_KEY1 | IT_KEY2 /*| IT_INVISIBILITY | IT_INVULNERABILITY | IT_SUIT | IT_QUAD*/));
	if (self.health > 100) self.health = 100;
	if (self.health < 50) self.health = 50;
	
	parm1 = self.items;
	parm2 = self.health;
	parm3 = self.weapon;
	parm4 = self.ammoPistol;
	parm5 = self.ammoRifle;
	parm6 = self.ammoGrenades;
	parm7 = self.ammoShells;
	parm3 = self.ammoSniper;
	parm16 = self.ammoBarricades;
	parm8 = self.weapon;
	parm9 = self.armortype * 100;
	parm10 = self.weapons;
	parm11 = 0;
	parm12 = 0;
	parm13 = 0;
	parm15 = 0;
	
	
};

void() SetNewParms =
{
	parm1 = IT_PM | IT_KNIFE | IT_GRENADE;
	parm2 = 100;
	parm3 = 0;
	parm4 = 40;
	parm5 = 0;
        parm6 = 3;
	parm7 = 0;
        parm8 = WP_PISTOL;
	parm9 = 0;
        parm10 = WP_KNIFE | WP_PISTOL | WP_GRENADE;
        parm11 = 0;
        parm12 = 7;
        parm13 = 30;
        parm14 = 0;
        parm15 = 0;
        parm16 = 0;
};

void() SetNewParmsObserver =
{
	//bprint("debug SetNewParmsObserver()\n");
	parm1 = 0;
	parm2 = 666;
	parm3 = 0;
	parm4 = 0;
	parm5 = 0;
        parm6 = 0;
	parm7 = 0;
        parm8 = 0;
	parm9 = 0;
        parm10 = 0;
        parm11 = 0;
        parm12 = 0;
        parm13 = 0;
        parm14 = 0;
        parm15 = 0;
        parm16 = 0;
};

void() PrintLevelParms =
{
	bprint("Items: ");
	bprint(ftos(parm1));
	bprint("\n");
	bprint("Health: ");
	bprint(ftos(parm2));
	bprint("\n");
	bprint("armor: ");
	bprint(ftos(parm3));
	bprint("\n");
	bprint("Pistol: ");
	bprint(ftos(parm4));
	bprint("\n");
	bprint("Rifle: ");
	bprint(ftos(parm5));
	bprint("\n");
	bprint("Grenades: ");
	bprint(ftos(parm6));
	bprint("\n");
	bprint("Shells: ");
	bprint(ftos(parm7));
	bprint("\n");
	bprint("Weapon: ");
	bprint(ftos(parm8));
	bprint("\n");
	bprint("ArmorType: ");
	bprint(ftos(parm9));
	bprint("\n");
	bprint("Weapops: ");
	bprint(ftos(parm10));
	bprint("\n");
};

void() DecodeLevelParms =
{
	if (serverflags)
	{
		if (world.model == "maps/start.bsp" || world.model == "maps/e1m1.bsp") SetNewParms();		// take away all stuff on starting new episode
	}
	if(!parm2 || parm2 > 600) SetNewParms();	//coop fix
	self.items = parm1;
	self.health = parm2;
	self.ammoSniper = parm3;
	self.ammoPistol = parm4;
	self.ammoRifle = parm5;
	self.ammoGrenades = parm6;
	self.ammoShells = parm7;
	self.ammoBarricades = parm16;
	self.weapon = parm8;
	self.armortype = parm9 * 0.01;
	self.weapons = parm10;
};
