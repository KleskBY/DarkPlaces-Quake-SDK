
void() CheatCommand =
{
	if (deathmatch || coop) return;
	
	self.ammoPistol = 100;
	self.ammoGrenades = 100;
	self.ammoRifle = 200;
	self.ammoShells = 100;
	self.ammoSniper = 200;
	self.items = self.items | IT_KNIFE | IT_PM | IT_TOZ | IT_AKM | IT_GRENADE | IT_MOSIN | IT_HAMMER | IT_KEY1 | IT_KEY2;
	self.weapons = self.weapons | WP_PISTOL | WP_AK74 | WP_SHOTGUN | WP_SNIPER;
	
	self.impulse = 0;
	W_SetCurrentAmmo();
};


void() ServerflagsCommand =
{
	if (deathmatch) return;
	serverflags = serverflags * 2 + 1;
};


void() W_ChangeWeapon;
void() CycleWeaponCommand;
void() CycleWeaponReverseCommand;
void() ImpulseCommands =
{
	if (self.impulse >= 1 && self.impulse <= 8) W_ChangeWeapon();
	if (self.impulse == 9) CheatCommand();
	if (self.impulse == 10) CycleWeaponCommand();
	if (self.impulse == 12) CycleWeaponReverseCommand();
	if (self.impulse == 11) ServerflagsCommand();
	
	if (self.impulse == 14)  //flashlight
	{
		flash_toggle();
		self.impulse = 0;
	}
	
	if (self.impulse == 100) //Reloading
	{
		self.impulse = 0;
		if(!self.reload && self.weaponReload) self.weaponReload();
	}	
}