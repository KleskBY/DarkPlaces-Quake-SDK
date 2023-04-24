

.float flash_flag;
void() flash_update =
{
	if (self.owner.view_ofs == '0 0 0' || self.owner.health <= 0) self.think = SUB_Remove;
	makevectors(self.owner.v_angle);
	traceline(self.owner.origin, self.owner.origin + v_forward * 6, FALSE, self);
	setorigin (self, trace_endpos + '0 0 10' /* + (v_forward * - 6) */); //4
	self.angles_x = -(self.owner.v_angle_x - 180); //-(((self.owner.angles_x) * -3) - 180);
	self.angles_y = self.owner.v_angle_y; //self.owner.angles_y - 3 ;
	self.angles_z = self.owner.v_angle_z; //self.owner.angles_z;
	self.light_lev = 300 - random(-5,5);
	
	if(self.owner.classname == "observer") self.think = SUB_Remove;
	self.nextthink = time + 0.02;
};

void() flash_on =
{
	local entity myflash;
	
	if(self.classname != "observer")
	{
		myflash = spawn ();
		myflash.movetype = MOVETYPE_NONE;
		myflash.solid = SOLID_NOT;
		setmodel(myflash, ""); 
		setsize(myflash, '0 0 0', '0 0 0');
		myflash.pflags = PFLAGS_FULLDYNAMIC|PFLAGS_NOSHADOW;
		myflash.light_lev = 350;
		myflash.color = '0.95 0.8 0.7'; //'1 1 1.5';
		myflash.skin = 237; 
		myflash.owner = self;
		myflash.classname = "flash";
		
		makevectors(self.v_angle);
		traceline(self.origin, self.origin + v_forward * 6 + v_up * 20, FALSE, self);
		setorigin(myflash, trace_endpos);
		self.angles = self.owner.angles;

		myflash.think = flash_update;
		myflash.nextthink = time + 0.02;
	}
};


void() flash_toggle =
{
	local entity flash;

	if (self.flash_flag == FALSE)
	{       
		self.flash_flag = TRUE;
		flash_on();
	}
	else
	{
		for (flash = findchain(classname, "flash"); flash; flash = flash.chain) 
		{
			if (flash.owner == self)
			{
			   self.flash_flag = FALSE;
			   remove(flash);
			   return;
			}
		}
	}
};