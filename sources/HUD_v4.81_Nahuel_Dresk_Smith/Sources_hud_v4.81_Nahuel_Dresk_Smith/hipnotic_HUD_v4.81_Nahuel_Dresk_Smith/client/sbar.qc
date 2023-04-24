/*

client/sbar.qc

This is a slight redesign of the quake item bar.

*/

var float ibar_alpha = 1;

float SB_BOTTOM = 0;
float SB_MIDDLE = 1;
float SB_TOP    = 2;
float SB_BOTTOM_RIGHT = 3;
float sb_align;

float cl_items;

// for weapon icon blink
float sg, ssg, ng, sng, gl, rl, lg, mj, lc, pg;

float items, items2, currentweap;

//-----------------------------------------------------------------------------
// Custom hud config init / shutdown
//-----------------------------------------------------------------------------

void() Sbar_Init =
{
	if((cvar("viewsize") >= 113) && (cvar("viewsize") <= 115))
	{
		compass = 1;
		ibar_flag = cvar("viewsize") - 113;
		if (ibar_flag == 0 ) ibar = 0;
		else ibar = 1;
		cvar_set("viewsize", "110");
	}
	else if((cvar("viewsize") >= 110) && (cvar("viewsize") <= 112))
	{
		compass = 0;
		ibar_flag = cvar("viewsize") - 110;
		if (ibar_flag == 0 ) ibar = 0;
		else ibar = 1;
		cvar_set("viewsize", "110");
	}
	if(cvar("viewsize") == 101) compass = 1;

	weapons_offset = autocvar_hud_weapons_offset;
	var float autocvar_waterfog = 0;
	waterfog = autocvar_waterfog;

	if (((getkeybind(67)=="")&&(getkeybind(99) =="")))	localcmd("bind c compass\n");
	if (((getkeybind(88)=="")&&(getkeybind(120)=="")))	localcmd("bind x itembar\n");
	if (((getkeybind(70)=="")&&(getkeybind(102)=="")))	localcmd("bind f itembar\n");
	if (((getkeybind(82)=="")&&(getkeybind(114)=="")))	localcmd("bind r compass\n");
	if (((getkeybind(91)=="")&&(getkeybind(123)=="")))	localcmd("bind [ consizedown\n");
	if (((getkeybind(93)=="")&&(getkeybind(125)=="")))	localcmd("bind ] consizeup\n");

	cvar_set("vid_conheight", ftos(cvar("vid_conwidth")*cvar("vid_height")/cvar("vid_width")));
	
	sg = 0; ssg = 0; ng = 0; sng = 0; gl = 0; rl = 0; lg = 0; mj = 0; lc = 0; pg = 0;
};

void() Sbar_Shutdown =
{
	if((cvar("viewsize") >= 110) && (cvar("viewsize") < 120))
	{
		if(compass == 1) cvar_set("viewsize", ftos(110 + ibar_flag + 3));
		else cvar_set("viewsize", ftos(110 + ibar_flag));
	}
	if((cvar("viewsize") >= 100) && (cvar("viewsize") < 110) && compass )
		cvar_set("viewsize", "101");
};


//-----------------------------------------------------------------------------
// Sbar_Draw functions
//-----------------------------------------------------------------------------

vector(vector v) sbar_align =
{
	if (sb_align == SB_MIDDLE)
	{
		v_x = v_x + (vid_conwidth / 2);
		v_y = v_y + (vid_conheight / 2);
		return v;
	}

	if (sb_align == SB_TOP)
	{
		v_x = v_x + (vid_conwidth / 2);
		// no change to v_y
		return v;
	}
	if (sb_align == SB_BOTTOM_RIGHT)
	{
		v_x = vid_conwidth - ( 320 - v_x );
		v_y = vid_conheight - v_y;
		return v;
	}

	// SB_BOTTOM - the default
	v_x = v_x + (vid_conwidth / 2);
	v_y = vid_conheight - v_y;
	return v;
};
 
/*
void(vector pos, string pic, float alph, float escala, float tre) Sbar_DrawPic2 =
{
	local vector siz;
	siz = drawgetimagesize(pic);
	siz_x = siz_x * escala;
	siz_y = siz_y * tre;
	
	//siz_x = drawgetimagesize(pic) * escala;
	//siz_y = drawgetimagesize(pic) * tre;

	pos = sbar_align(pos);
	drawpic(pos, pic, siz, VEC_1, alph, DRAWFLAG_NORMAL);
};
*/

void(vector pos, string pic, float alph, float escala) Sbar_DrawPic =
{
	local vector siz;
	siz = drawgetimagesize(pic) * escala;
	pos = sbar_align(pos);
	drawpic(pos, pic, siz, VEC_1, alph, DRAWFLAG_NORMAL);
};

void(vector pos, float char, float alph) Sbar_DrawCharacter =
{
	pos = sbar_align(pos);
	drawcharacter(pos, char, '8 8 0', VEC_1, alph, DRAWFLAG_NORMAL);
};

void(vector pos, string str, float alph,vector medida,vector coloracion) Sbar_DrawString =
{
	pos = sbar_align(pos);
	drawstring(pos, str, medida, coloracion, alph, DRAWFLAG_NORMAL);
};


void(vector pos, float num, float digits, float color, float alpha) Sbar_DrawNum =
{
	string pic, s, digit;
	float i, len, cnt;
	vector v;

	s = ftos(num);
	len = strlen(s);
	
	// draw the last 'digits' chars of s
	cnt = digits;
	if (len < digits) cnt = len;

	for (i=1; i<=cnt; i=i+1)
	{
		digit = substring(s, len - i, 1);
		if (digit == "-")
			digit = "minus";
		if (color)
			pic = strcat("gfx/anum_", digit);
		else
			pic = strcat("gfx/num_", digit);

		v = pos + ('24 0 0' * (digits - i));
		Sbar_DrawPic(v, pic, alpha,1);
	}
};


//-----------------------------------------------------------------------------
// Sbar_DrawCompass
//-----------------------------------------------------------------------------

vector(float x, float y) vec2 =
{
	vector v;
	v_x = x;
	v_y = y;
	return v;
};

void() Sbar_DrawCompass =
{

	sb_align = SB_TOP;

	local string compass_string, s, point;
	local float ang, yaw, ofs, i, strofs;
	
	compass_string = "N...ne...E...se...S...sw...W...nw...";
	compass_string = strconv(CONV_SAME, CONV_RED, CONV_RED, compass_string);
	point = strconv(CONV_SAME, CONV_RED, CONV_RED, ".");
	
	// Note: STAT_COMPASS_NORTH is a stat I was using in a server side
	// mod so that the level could change the north position of the compass (and basically
	// pretend that the entire level is aligned at any compass angle. I've left the code
	// here so that it's easy to add back.
	ang = 365 - (input_angles_y /* - GetStat_FLOAT_TRUNCATED(STAT_COMPASS_NORTH) */ );
	while (ang < 0)	{ ang = ang + 360; }
	while (ang >= 360) { ang = ang - 360; }
	
	ang = ang * 0.1;//(365 - angle) * 0.1;
	yaw = ceil(ang);
	ofs = (ceil(ang) - ang) * 8;
	yaw = yaw - 5;
	
	for (i=0; i<9; i=i+1)
	{
		strofs = yaw + i;
		if (strofs > 35)
			strofs = strofs - 36;
		if (strofs < 0)
			strofs = strofs + 36;
		// a hack to centre '.' characters a bit more
		// theres no centred red dot in conchars
		s = substring(compass_string, strofs, 1);
		if (s == point)
			Sbar_DrawString(vec2(-40 + ofs + i*8 + 2, 8 - 1), s, 1,'8 8 0','1 1 1' );
		else
			Sbar_DrawString(vec2(-40 + ofs + i*8, 8), s, 1,'8 8 0', '1 1 1');
	}
	
	s = strcat(chr2str(16), "        ", chr2str(17));
	Sbar_DrawString('-40 8 0', s, 1,'8 8 0','1 1 1');
};

//-----------------------------------------------------------------------------
// Sbar_DrawInventory
//-----------------------------------------------------------------------------

//  for the 4 small sized ammo counts on the right side
void(vector valor, float ammo, float transparencia) DrawAmmo =
{
	vector v;
	string s;
	v = valor;
	v_y = v_y + weapons_offset;

	if (ammo >= 100)
	{
		s = strconv(CONV_SAME, CONV_RED, CONV_WHITESPECIAL, ftos(ammo));
		Sbar_DrawString(v, s, transparencia, '7 7 0','0.5 0.7 1');
	}
	if ((ammo >= 10) && (ammo <= 99)) 
	{
		v_x = v_x + 7;    
		s = strconv(CONV_SAME, CONV_RED, CONV_WHITESPECIAL, ftos(ammo));
		Sbar_DrawString(v, s, transparencia, '7 7 0','1 1 1');
	}
	if ((ammo >= 0) && (ammo <= 9)) 
	{
		v_x = v_x + 14;   
		s = strconv(CONV_SAME, CONV_RED, CONV_WHITESPECIAL, ftos(ammo));
		Sbar_DrawString(v, s, transparencia, '7 7 0','1 0.5 0.5');
	}
};

void(vector valor, string pic, float itemnum, float item2num, float transparencia, float scale) DrawInventory =
{
	vector v;
	v = valor;
	if (items & itemnum || items2 & item2num)
	{
		Sbar_DrawPic(v, pic, transparencia, scale);
	}
};

void(vector valor, string pic1, string pic2, float itemnum, float blink) DrawInventoryWeapon =
{
	vector v;
	string pic;
	float wb;

	v = valor;
	v_y = v_y + weapons_offset;

	if (blink > 0)
	{
		wb = time - blink;
		if (wb >= 0.5 && wb < 1) wb = wb - 0.5;			// blink two times

		if	(wb < 0.1) pic = strzone(strcat("gfx/inva1_", substring(pic1, 8, strlen(pic1) - 8)));
		else if (wb < 0.2) pic = strzone(strcat("gfx/inva2_", substring(pic1, 8, strlen(pic1) - 8)));
		else if (wb < 0.3) pic = strzone(strcat("gfx/inva3_", substring(pic1, 8, strlen(pic1) - 8)));
		else if (wb < 0.4) pic = strzone(strcat("gfx/inva4_", substring(pic1, 8, strlen(pic1) - 8)));
		else if (wb < 0.5) pic = strzone(strcat("gfx/inva5_", substring(pic1, 8, strlen(pic1) - 8)));
		else return;
		
		Sbar_DrawPic(v, pic, ibar_alpha, 1);
		strunzone(pic);
	}
	else if ((items & itemnum) || (cl_items & itemnum))
	{
		if (currentweap == itemnum)
			pic = pic2;
		else	pic = pic1;
		Sbar_DrawPic(v, pic, ibar_alpha, 1);
	}
};

void(vector valor, string pic, float transparencia, float scale) DrawInventoryAmmo =
{
	vector v;
	v = valor;
	v_y = v_y + weapons_offset;
	Sbar_DrawPic(v, pic, transparencia, scale);
}; 

//-----------------------------------------------------------------------------

void() Sbar_DrawInventory =
{
	ibar_alpha = cvar("sbar_alpha_fg");


	float ALPHA_FULL, ALPHA_MEDIUM, ALPHA_LOW;
	
	ALPHA_FULL = ibar_alpha;
	ALPHA_MEDIUM = ibar_alpha * 0.7;	
	ALPHA_LOW = ibar_alpha * 0.5;

	float shells, rockets, nails, cells;

	shells  = GetStat_FLOAT_TRUNCATED(STAT_SHELLS);
	nails   = GetStat_FLOAT_TRUNCATED(STAT_NAILS);
	rockets = GetStat_FLOAT_TRUNCATED(STAT_ROCKETS);
	cells   = GetStat_FLOAT_TRUNCATED(STAT_CELLS);

	cl_items = GetStat_FLOAT_TRUNCATED(STAT_ITEMS);

	items = GetStat_BITS(STAT_ITEMS, 0, 23);
	items2 = GetStat_BITS(STAT_ITEMS, 23, 9);
	currentweap = GetStat_FLOAT_TRUNCATED(STAT_ACTIVEWEAPON);

	// weapon icons blink
	if ((items & IT_SHOTGUN          ) && sg  == 0) sg = time;
	if ((items & IT_SUPER_SHOTGUN    ) && ssg == 0) ssg = time;
	if ((items & IT_NAILGUN          ) && ng  == 0) ng = time;
	if ((items & IT_SUPER_NAILGUN	 ) && sng == 0) sng = time;
	if ((items & IT_ROCKET_LAUNCHER  ) && rl == 0) rl = time;
	if ((items & IT_LIGHTNING        ) && lg == 0) lg = time;
	if ((cl_items & IT_LASER_CANNON  ) && lc == 0) lc = time;
	if ((cl_items & IT_MJOLNIR       ) && mj == 0) mj = time;
	if ((cl_items & IT_GRENADE_LAUNCHER ) && gl == 0) gl = time;
	if ((cl_items & IT_PROXIMITY_GUN ) && pg == 0) 
	{
		pg = time;
		if (gl > 0) gl = - 1;
	}
	if (sg > 0 && (time - sg ) >= 1) sg  = -1;
	if (ssg> 0 && (time - ssg) >= 1) ssg = -1;
	if (ng > 0 && (time - ng ) >= 1) ng  = -1;
	if (sng> 0 && (time - sng) >= 1) sng = -1;
	if (rl > 0 && (time - rl ) >= 1) rl  = -1;
	if (lg > 0 && (time - lg ) >= 1) lg  = -1;
	if (lc > 0 && (time - lc ) >= 1) lc  = -1;
	if (mj > 0 && (time - mj ) >= 1) mj  = -1;
	if (gl > 0 && (time - gl ) >= 1) gl  = -1;
	if (pg > 0 && (time - pg ) >= 1) pg  = -1;	
	
	if( ibar_flag == 1)		// Smith's inventory layout 
	{
		weapons_offset = autocvar_hud_weapons_offset - 12;
		if ( weapons_offset == -12 )
		{
			if (cvar("showfps"))	weapons_offset = weapons_offset + 12;
			if (cvar("showtime"))	weapons_offset = weapons_offset + 12;
			if (cvar("showdate"))	weapons_offset = weapons_offset + 12;
		}
	
		sb_align = SB_BOTTOM;		
		
		//DrawInventory('32 40', "gfx/sb_key1",   IT_KEY1, 0, ALPHA_FULL, 1);
		//DrawInventory('48 40', "gfx/sb_key2",   IT_KEY2, 0, ALPHA_FULL, 1);
		DrawInventory('64 40', "gfx/sb_invis",  IT_INVISIBILITY, 0, ALPHA_FULL, 1);
		DrawInventory('80 40', "gfx/sb_invuln", IT_INVULNERABILITY, 0, ALPHA_FULL, 1);
		DrawInventory('96 40', "gfx/sb_suit",   IT_SUIT, 0, ALPHA_FULL, 1);
		DrawInventory('112 40',"gfx/sb_quad",   IT_QUAD, 0, ALPHA_FULL, 1);
		DrawInventory('128 40', "gfx/sb_eshld", 0, HIP_IT_EMPATY_SHIELD, ALPHA_FULL, 1);
		DrawInventory('144 40',"gfx/sb_wsuit", 0, HIP_IT_WETSUIT, ALPHA_FULL, 1);
	
		sb_align = SB_BOTTOM_RIGHT;
		
		//position and size of ibar items
		DrawInventoryWeapon('272 40', "gfx/inv_shotgun",  "gfx/inv2_shotgun",  IT_SHOTGUN, sg);
		DrawInventoryWeapon('296 40', "gfx/inv_sshotgun", "gfx/inv2_sshotgun", IT_SUPER_SHOTGUN, ssg);
		DrawInventoryWeapon('272 68', "gfx/inv_nailgun",  "gfx/inv2_nailgun",  IT_NAILGUN, ng);
		DrawInventoryWeapon('296 68', "gfx/inv_snailgun", "gfx/inv2_snailgun", IT_SUPER_NAILGUN, sng);
		DrawInventoryWeapon('296 96', "gfx/inv_srlaunch", "gfx/inv2_srlaunch", IT_ROCKET_LAUNCHER, rl);
		DrawInventoryWeapon('288 112',"gfx/inv_lightng",  "gfx/inv2_lightng",  IT_LIGHTNING, lg);
		DrawInventoryWeapon('296 140', "gfx/inv_mjolnir",  "gfx/inv2_mjolnir",  IT_MJOLNIR, mj);
		DrawInventoryWeapon('272 140', "gfx/inv_laser", "gfx/inv2_laser", IT_LASER_CANNON, lc);
		
		if	((currentweap == IT_GRENADE_LAUNCHER) || !(cl_items & IT_PROXIMITY_GUN))
			DrawInventoryWeapon('272 96', "gfx/inv_rlaunch", "gfx/inv2_rlaunch", IT_GRENADE_LAUNCHER, gl);
		else	DrawInventoryWeapon('272 96', "gfx/inv_prox", "gfx/inv2_prox", IT_PROXIMITY_GUN, pg);
	
		// for 4 small ammo icon positions
		DrawInventoryAmmo('308 24', "gfx/sb_shells", ALPHA_FULL, 0.5);  
		DrawInventoryAmmo('308 52', "gfx/sb_nails", ALPHA_FULL, 0.5);
		DrawInventoryAmmo('308 80', "gfx/sb_rocket", ALPHA_FULL, 0.5);
		DrawInventoryAmmo('308 124',"gfx/sb_cells", ALPHA_FULL, 0.5);
	
		//highlight of current weapon ammo counter + position of ammo counters
		if (cl_items & IT_SHELLS)
		{
			DrawAmmo('284 20', shells, ALPHA_FULL);
			DrawAmmo('284 48', nails, ALPHA_MEDIUM);
			DrawAmmo('284 76', rockets, ALPHA_MEDIUM);
			DrawAmmo('284 120', cells, ALPHA_MEDIUM);
		}	
		else if (cl_items & IT_NAILS)
		{
			DrawAmmo('284 20', shells, ALPHA_MEDIUM);
			DrawAmmo('284 48', nails, ALPHA_FULL);
			DrawAmmo('284 76', rockets, ALPHA_MEDIUM);
			DrawAmmo('284 120', cells, ALPHA_MEDIUM);
		}
		else if (cl_items & IT_ROCKETS)
		{
			DrawAmmo('284 20', shells, ALPHA_MEDIUM);
			DrawAmmo('284 48', nails, ALPHA_MEDIUM);
			DrawAmmo('284 76', rockets, ALPHA_FULL);
			DrawAmmo('284 120', cells, ALPHA_MEDIUM);
		}
		else if (cl_items & IT_CELLS)
		{
			DrawAmmo('284 20', shells, ALPHA_MEDIUM);
			DrawAmmo('284 48', nails, ALPHA_MEDIUM);
			DrawAmmo('284 76', rockets, ALPHA_MEDIUM);
			DrawAmmo('284 120', cells, ALPHA_FULL);
		}		
		if (cl_items & IT_AXE)// a strange dummy, but work´s fine!
		{
			if (cl_items & IT_SHELLS)	return;
			if (cl_items & IT_NAILS) 	return;
			if (cl_items & IT_ROCKETS) 	return;
			if (cl_items & IT_CELLS) 	return;
			DrawAmmo('284 20', shells, ALPHA_MEDIUM);
			DrawAmmo('284 48', nails, ALPHA_MEDIUM);
			DrawAmmo('284 76', rockets, ALPHA_MEDIUM);
			DrawAmmo('284 120', cells, ALPHA_MEDIUM);
		}
	}
	else if ( ibar_flag == 2 ) // Nahuel's inventory layout
	{
		weapons_offset = autocvar_hud_weapons_offset;
	
		sb_align = SB_BOTTOM;
		
		DrawInventory('40 48', "gfx/sb_invis",  IT_INVISIBILITY, 0, ALPHA_LOW, 1.5);
		DrawInventory('60 48', "gfx/sb_invuln", IT_INVULNERABILITY, 0, ALPHA_MEDIUM, 1.5);
		DrawInventory('80 48', "gfx/sb_suit",   IT_SUIT, 0, ALPHA_MEDIUM, 1.5);
		DrawInventory('100 48',"gfx/sb_quad",   IT_QUAD, 0, ALPHA_FULL, 1.5);
		DrawInventory('120 48', "gfx/sb_eshld", 0, HIP_IT_EMPATY_SHIELD, ALPHA_FULL, 1.5);
		DrawInventory('140 48', "gfx/sb_wsuit", 0, HIP_IT_WETSUIT, ALPHA_FULL, 1.5);
	
		sb_align = SB_BOTTOM_RIGHT;
	
		//position and size of ibar items
		DrawInventoryWeapon('290 140', "gfx/inv_shotgun",  "gfx/inv2_shotgun",  IT_SHOTGUN, sg);
		DrawInventoryWeapon('290 160', "gfx/inv_sshotgun", "gfx/inv2_sshotgun", IT_SUPER_SHOTGUN, ssg);
		DrawInventoryWeapon('290 180', "gfx/inv_nailgun",  "gfx/inv2_nailgun",  IT_NAILGUN, ng);
		DrawInventoryWeapon('290 200', "gfx/inv_snailgun", "gfx/inv2_snailgun", IT_SUPER_NAILGUN, sng);
		DrawInventoryWeapon('290 280', "gfx/inv_laser", "gfx/inv2_laser", IT_LASER_CANNON, lc);
		DrawInventoryWeapon('290 240', "gfx/inv_srlaunch", "gfx/inv2_srlaunch", IT_ROCKET_LAUNCHER, rl);
		DrawInventoryWeapon('290 260', "gfx/inv_lightng",  "gfx/inv2_lightng",  IT_LIGHTNING, lg);
		DrawInventoryWeapon('290 300', "gfx/inv_mjolnir",  "gfx/inv2_mjolnir",  IT_MJOLNIR, mj);

		if	((currentweap == IT_GRENADE_LAUNCHER) || !(cl_items & IT_PROXIMITY_GUN))
			DrawInventoryWeapon('290 220', "gfx/inv_rlaunch", "gfx/inv2_rlaunch", IT_GRENADE_LAUNCHER, gl);
		else	DrawInventoryWeapon('290 220', "gfx/inv_prox", "gfx/inv2_prox", IT_PROXIMITY_GUN, pg);
		
		// for 4 small ammo icon positions
		DrawInventoryAmmo('302 50', "gfx/sb_shells", ALPHA_FULL, 0.5);  
		DrawInventoryAmmo('302 70', "gfx/sb_nails", ALPHA_FULL, 0.5);
		DrawInventoryAmmo('302 90', "gfx/sb_rocket", ALPHA_FULL, 0.5);
		DrawInventoryAmmo('302 110',"gfx/sb_cells", ALPHA_FULL, 0.5);
	
		//highlight of current weapon ammo counter + position of ammo counters
		if (cl_items & IT_SHELLS)
		{
			DrawAmmo('280 45', shells, ALPHA_FULL);
			DrawAmmo('280 65', nails, ALPHA_MEDIUM);
			DrawAmmo('280 85', rockets, ALPHA_MEDIUM);
			DrawAmmo('280 105', cells, ALPHA_MEDIUM);
		}	
		else if (cl_items & IT_NAILS)
		{
			DrawAmmo('280 45', shells, ALPHA_MEDIUM);
			DrawAmmo('280 65', nails, ALPHA_FULL);
			DrawAmmo('280 85', rockets, ALPHA_MEDIUM);
			DrawAmmo('280 105', cells, ALPHA_MEDIUM);
		}
		else if (cl_items & IT_ROCKETS)
		{
			DrawAmmo('280 45', shells, ALPHA_MEDIUM);
			DrawAmmo('280 65', nails, ALPHA_MEDIUM);
			DrawAmmo('280 85', rockets, ALPHA_FULL);
			DrawAmmo('280 105', cells, ALPHA_MEDIUM);
		}
		else if (cl_items & IT_CELLS)
		{
			DrawAmmo('280 45', shells, ALPHA_MEDIUM);
			DrawAmmo('280 65', nails, ALPHA_MEDIUM);
			DrawAmmo('280 85', rockets, ALPHA_MEDIUM);
			DrawAmmo('280 105', cells, ALPHA_FULL);
		}		
		if (cl_items & IT_AXE)// a strange dummy, but work´s fine!
		{
			if (cl_items & IT_SHELLS)	return;
			if (cl_items & IT_NAILS) 	return;
			if (cl_items & IT_ROCKETS) 	return;
			if (cl_items & IT_CELLS) 	return;
			DrawAmmo('280 45', shells, ALPHA_MEDIUM);
			DrawAmmo('280 65', nails, ALPHA_MEDIUM);
			DrawAmmo('280 85', rockets, ALPHA_MEDIUM);
			DrawAmmo('280 105', cells, ALPHA_MEDIUM);
		}
	}
};
 