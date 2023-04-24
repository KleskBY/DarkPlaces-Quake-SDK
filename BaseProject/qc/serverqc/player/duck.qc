

void() Duck =
{
	if (clienttype(self) != CLIENTTYPE_BOT)
	{
		if(self.button3)
		{
			if(!self.duck)
			{
				self.duck = 1;
				setsize(self, DUCK_SIZE_MIN, DUCK_SIZE_MAX);
				self.view_ofs = '0 0 11';
				stuffcmd(self, "cl_forwardspeed 100; cl_backspeed 80; cl_sidespeed 80;\n");
			}
		}
		else
		{
			if(self.duck)
			{
				local vector tempvec = VEC_HULL_MAX;
				tempvec_z = -tempvec_z;
				traceline(self.origin, self.origin - tempvec, FALSE, self);
				if(trace_fraction == 1)
				{
					traceline(self.origin, self.origin + VEC_HULL_MAX, FALSE, self);
					if(trace_fraction == 1)
					{
						tracebox(self.origin, VEC_HULL_MIN, VEC_HULL_MAX, self.origin + '0 0 10', FALSE, self);
						if(trace_fraction == 1)
						{
							self.duck = 0;
							setsize(self, VEC_HULL_MIN, VEC_HULL_MAX);
							self.view_ofs = '0 0 23';
							if(!self.walk) stuffcmd(self, "cl_forwardspeed 225; cl_backspeed 200; cl_sidespeed 200;\n");
						}
					}
				}
			}
		}
		if(self.button4)
		{
			if(!self.duck && !self.walk)
			{
				self.walk = TRUE;
				stuffcmd(self, "cl_forwardspeed 100; cl_backspeed 80; cl_sidespeed 80;\n");
			}
		}
		else if(!self.duck && self.walk)
		{
			self.walk = FALSE;
			stuffcmd(self, "cl_forwardspeed 250; cl_backspeed 200; cl_sidespeed 225;\n");
		}
	}

}