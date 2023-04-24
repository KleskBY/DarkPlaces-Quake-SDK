

void() pushable_touch =
{
	// print(other.classname, "\n");
	if(other.classname == "player" || other.classname == "useprefab")
	{
		local vector center = (self.absmin + self.absmax) * 0.5;
		if(center_z + (self.absmax_z - self.absmin_z) * 0.2 < other.origin_z) return;
		local vector dir = center - other.origin;
		if(other.classname == "useprefab") 
		{
			dir = other.origin - center;
			other.owner.velocity = other.owner.velocity *0.7;
		}
		dir_z = 0; 
		dir = normalize(dir);
		dir_x = rint(dir_x);
		dir_y = rint(dir_y);
		local float yaw = vectoyaw(dir);
		self.flags = self.flags - (self.flags & FL_ONGROUND);
		self.velocity = dir * 125;
		if(other.classname == "useprefab") self.velocity = self.velocity * 0.7;
		// walkmove(yaw, 1);
	}

}


void() func_pushable =
{
	self.solid = SOLID_BSP;
	self.movetype = MOVETYPE_STEP; //MOVETYPE_TOSS
	setorigin (self, self.origin);
	setmodel (self, self.model);
	self.classname = "func_pushable";
	self.touch = pushable_touch;
}


void() movable_think =
{
	if(self.owner.buttonuse)
	{
		self.flags = self.flags - (self.flags & FL_ONGROUND);
		makevectors(self.owner.v_angle);
		local vector center = (self.absmin + self.absmax) * 0.5;
		center = center - self.lastAngles;
		local vector newPos = self.owner.origin + v_forward * 60 + v_up * 10;
		local vector dir =  newPos - center;
		// dir = normalize(dir);
		self.velocity = dir * 8;
		// setorigin(self, self.origin + dir);
		self.nextthink = time + 0.1;
	}
	else
	{
		self.movetype = MOVETYPE_STEP;
		self.owner = world;
	}
}



void() movable_touch =
{
	
	if(other.classname != "useprefab") return;
	if(self.owner) return;
	// print("movable_touch", "\n");
	local vector center = (self.absmin + self.absmax) * 0.5;
	self.lastAngles = center - other.origin;
	self.movetype = MOVETYPE_FLY;
	self.owner = other.owner;
	self.think = movable_think;
	self.nextthink = time + 0.1;
}

void() func_movable =
{
	self.solid = SOLID_BSP;
	self.movetype = MOVETYPE_STEP; //MOVETYPE_TOSS
	setorigin (self, self.origin);
	setmodel (self, self.model);
	self.classname = "func_movable";
	self.touch = movable_touch;
}
