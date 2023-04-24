

void() Rain =
{
	if(cvar("scratch1"))
	{
		local vector rain_min = self.origin - '200 100 200';
		local vector rain_max = self.origin + '200 100 200';
		local float count = (rain_max_x - rain_min_x) * (rain_max_y - rain_min_y) / 16384;
		te_particlerain(rain_min, rain_max, '0 200 -700', count, 6);
	}
};