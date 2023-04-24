

void() Nametags =
{
	if(!deathmatch && !coop) return;
	if(self.lastNametag + 0.25 > time) return;
	self.lastNametag = time;
	
	local vector dir = aim(self, 1000);
	makevectors(self.v_angle);
	
	local vector src = self.origin + v_forward * 10;
	if(self.duck) src_z = self.origin_z + self.view_ofs_z + 0.1;
	else src_z = self.absmin_z + self.size_z * 0.8;
	
	traceline(src, src + v_forward * 1024, FALSE, self);
	if (trace_fraction != 1.0)
	{
		if (trace_ent.classname != "player") return;
		centerprint(self, trace_ent.netname);
	}
}