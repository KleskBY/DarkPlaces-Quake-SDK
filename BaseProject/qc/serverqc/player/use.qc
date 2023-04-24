
void() UseTouch =
{
	if (other.classname != "worldspawn" && (strstrofs(other.classname,"trigger", 0) == -1) && other.message && other.lastTouch + 1 < time)
	{
		centerprint(self.owner, other.message);
		other.lastTouch = time;
	}
}

void() UseSmth =
{
	if(!self.buttonuse) return;
	if(self.classname == "player")
	{
		newmis = spawn ();
		newmis.owner = self;
		newmis.movetype = MOVETYPE_BOUNCE;
		newmis.solid = SOLID_TRIGGER;
		newmis.classname = "useprefab";
		newmis.bouncefactor = 0;
		newmis.touch = UseTouch;

		makevectors (self.v_angle);
		if (self.v_angle_x) newmis.velocity = v_forward * 1000;
		else
		{
			newmis.velocity = aim(self, 10000);
			newmis.velocity = newmis.velocity * 200 + '0 0 -300';
			newmis.velocity_z = 30;
		}
		
		newmis.nextthink = time + 0.07;
		newmis.think = SUB_Remove;
		
		newmis.angles = vectoangles(newmis.velocity);
		setsize(newmis, '-1 -1 -1', '1 1 1');
		setorigin(newmis, self.origin + (v_up * 20));
	}
}