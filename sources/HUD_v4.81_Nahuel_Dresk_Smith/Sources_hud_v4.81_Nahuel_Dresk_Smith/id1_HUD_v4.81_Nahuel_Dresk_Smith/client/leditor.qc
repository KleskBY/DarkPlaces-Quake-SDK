// lighteditor variables
float increment, scale_cache, help,
radius, coronasize, diffuse, specular, ambient, style,
grey, red, green, blue, movex, movey, movez, angx, angy, angz;
vector color_cache;


void() rt_lights_editor_help =
{
	local vector v;
	
	if (!help)
	{
		v_x = vid_conwidth - ( 320 - 75 );
		v_y = vid_conheight - 245;
		drawpic(v, "gfx/blacktile", '245 168', VEC_1, 0.7, DRAWFLAG_NORMAL); v_x = v_x + 5;
		
		drawstring(v,"==================================", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"      or        Tick: x1 x10 x100 ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v,"Wheel    Mouse3", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"==================================", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v," Hold (Key) + (Mouse Wheel)       ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"----------------------------------", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"Base Tick:                        ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v,"           1", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL);  v_y = v_y + 7;
		drawstring(v,"(     ) (    ) (  ) Move:  X Y Z  ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v," Right   Down   Up", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"( ) ( ) ( )         Angle: X Y Z  ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v," <   >   ?", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"( )     ( ) Radius, Style         ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v," Y       K", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL); v_y = v_y + 14;
		drawstring(v,"Base Tick:                        ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v,"           0.01", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"( ) ( ) ( ) Red, Green, Blue      ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v," R", '7 7', '1 0 0', 1, DRAWFLAG_NORMAL); drawstring(v,"     G", '7 7', '0 1 0', 1, DRAWFLAG_NORMAL); drawstring(v,"         B", '7 7', '0.5 0.5 1', 1, DRAWFLAG_NORMAL);v_y = v_y + 7;
		drawstring(v,"( )CorS (T) Color Scale:          ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v," X", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"( ) ( ) ( ) Ambient, Diff, Spec   ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v," U   I   O", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"==================================", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v," Press (Key)                      ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"----------------------------------", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"(      )    Spawn Light           ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v," Mouse1", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"(      )    Remove Light          ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v," Mouse2", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"( )  ( )    Light: Copy, Paste    ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v," C    V", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"( )  ( )    Shadows, Corona       ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v," J    Z", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"( )  ( )    Normal, Realtime      ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v," N    M", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL); v_y = v_y + 7;
		drawstring(v,"( )  ( )    Save To File, Help    ", '7 7', '1 1 1', 1, DRAWFLAG_NORMAL); drawstring(v," Q    H", '7 7', '1 1 0', 1, DRAWFLAG_NORMAL);
	}
	
	if (grey)
	{
		v_x = vid_conwidth - ( 320 - 80) + 25 * 7;
		v_y = vid_conheight - 245 + 12 * 7; 
		drawstring(v,ftos(scale_cache), '7 7', '1 0.2 0.2', 1, DRAWFLAG_NORMAL);
	}

	v_y = vid_conheight - 245 + 7; 
	if 	(increment == 1)
	{
		v_x = vid_conwidth - ( 320 - 80 ) + 22 * 7;
		drawstring(v,"x1", '7 7', '1 0 0', 1, DRAWFLAG_NORMAL);
	}
	else if (increment == 10)
	{
		v_x = vid_conwidth - ( 320 - 80 ) + 25 * 7; 
		drawstring(v,"x10", '7 7', '1 0 0', 1, DRAWFLAG_NORMAL);
	}
	else if (increment == 100)
	{
		v_x = vid_conwidth - ( 320 - 80 ) + 29 * 7;
		drawstring(v,"x100", '7 7', '1 0 0', 1, DRAWFLAG_NORMAL);
	}
};


string(float keynum) KeyMap =
{
	local string chrlist, key;
	
	if	(keynum == 32)
		key = " ";
	else if	(keynum >= 39 && keynum <= 61)
	{
		chrlist = "'  *+,-./0123456789 ; =";   
		key = substring(chrlist, keynum - 39, 1);
	}
	else if (keynum <= -39 && keynum >= -61)
	{
		chrlist = "\"    <_>?)!@#$%^&*( : +";
		key = substring(chrlist, (-keynum) - 39, 1);
	}
	else if (keynum >= 91 && keynum <= 93)
	{
		chrlist = "[\\]";
		key = substring(chrlist, keynum - 91, 1);
	}
	else if (keynum <= -91 && keynum >= -93)
	{
		chrlist = "{|}";
		key = substring(chrlist, (-keynum) - 91, 1);
	}   
	else if (keynum >= 97 && keynum <= 122)
	{
		chrlist = "abcdefghijklmnopqrstuvwxyz";
		key = substring(chrlist, keynum - 97, 1);
	}
	
	return key;
};


float(float event, float parama) rt_lights_editor =
{
	local string key;
	local float inc;
	local vector v;
	
	// print(strcat(ftos(parama),"\n"));
	
	key = KeyMap(parama);

	if (key == "h")				// toggle help panel
	{
		if (event == INPUT_KEYDOWN)
		{
			if (help) help = 0;
			else help = 1;
		}	
		return 1;
	}
	
	if (key == "j")				// toggle shadows
	{
		if (event == INPUT_KEYDOWN)
		{
			localcmd("r_editlights_toggleshadow\n");
			return 1;
		}
	}

	if (key == "z")				// toggle corona
	{
		if (event == INPUT_KEYDOWN)
		{
			localcmd("r_editlights_togglecorona\n");
			return 1;
		}
	}

	if (key == "c")				// copy parameters from light
	{
		if (event == INPUT_KEYDOWN)
		{
			localcmd("r_editlights_copyinfo\n");
			return 1;
		}
	}	
	
	if (key == "v")				// paste parameters into light
	{
		if (event == INPUT_KEYDOWN)
		{
			localcmd("r_editlights_pasteinfo\n");
			return 1;
		}
	}
	
	if (key == "q")				// save rtlights to file
	{
		if (event == INPUT_KEYDOWN)
		{
			localcmd("r_editlights_save\n");
			return 1;
		}
	}
	
	if (key == "n")				// normalmode toggle
	{
		if (event == INPUT_KEYDOWN)
			if (cvar("r_editlights_current_normalmode"))
				localcmd("r_editlights_edit normalmode 0\n");
			else	localcmd("r_editlights_edit normalmode 1\n");
		return 1;
	}
	
	if (key == "m")				// realtimemode toggle
	{
		if (event == INPUT_KEYDOWN)
			if (cvar("r_editlights_current_realtimemode"))
				localcmd("r_editlights_edit realtimemode 0\n");
			else	localcmd("r_editlights_edit realtimemode 1\n");
		return 1;
	}
	
	if (parama == 512)			// spawn light - mouse button 1
	{
		if (event == INPUT_KEYDOWN)
		{
			localcmd("r_editlights_spawn\n");
			return 1;
		}
	}

	if (parama == 513)			// delete light - mouse button 2
	{
		if (event == INPUT_KEYDOWN)
		{
			localcmd("r_editlights_remove\n");
			return 1;
		}
	}
	
	if (parama == 514)			// alternate increment control - mouse button 3 ( useful for colorscale adjustement )
	{
		if (event == INPUT_KEYDOWN)
		{
			if	(increment == 1  ) increment = 100;
			else if	(increment == 10 ) increment = 1;
			else if	(increment == 100) increment = 10;
		}
		return 1;
	}

	if (key == "u")				// ambient
	{
		if (event == INPUT_KEYDOWN)
			ambient = 1;
		else	ambient = 0;
		return 1;
	}

	if (key == "i")				// diffuse
	{
		if (event == INPUT_KEYDOWN)
			diffuse = 1;
		else	diffuse = 0;
		return 1;
	}
	
	if (key == "o")				// specular
	{
		if (event == INPUT_KEYDOWN)
			specular = 1;
		else	specular = 0;
		return 1;
	}
	
	if (key == "k")				// style
	{
		if (event == INPUT_KEYDOWN)
			style = 1;
		else	style = 0;
		return 1;
	}	
	
	if (key == "y")				// radius
	{
		if (event == INPUT_KEYDOWN)
			radius = 1;
		else	radius = 0;
		return 1;
	}
	
	if (key == "x")				// coronasize
	{
		if (event == INPUT_KEYDOWN)
			coronasize = 1;
		else	coronasize = 0;
		return 1;
	}
	
	if (parama == 131)			// movex - arrow right
	{
		if (event == INPUT_KEYDOWN)
			movex = 1;
		else	movex = 0;
		return 1;
	}
	
	if (parama == 129)			// movey - arrow down
	{
		if (event == INPUT_KEYDOWN)
			movey = 1;
		else	movey = 0;
		return 1;
	}

	if (parama == 128)			// movez - arrow up
	{
		if (event == INPUT_KEYDOWN)
			movez = 1;
		else	movez = 0;
		return 1;
	}
	
	if (key == ",")				// angx
	{
		if (event == INPUT_KEYDOWN)
			angx = 1;
		else	angx = 0;
		return 1;
	}
	
	if (key == ".")				// angy
	{
		if (event == INPUT_KEYDOWN)
			angy = 1;
		else	angy = 0;
		return 1;
	}

	if (key == "/")				// angz
	{
		if (event == INPUT_KEYDOWN)
			angz = 1;
		else	angz = 0;
		return 1;
	}
	
	if (key == "t")				// color scale
	{
		if (event == INPUT_KEYDOWN)
		{
			if (!grey)
			{
				grey = 1;
				scale_cache = 1;
				color_cache = stov(cvar_string("r_editlights_current_color"));
			}
		}
		else
		{
			grey = 0;
			scale_cache = 0;
		}
		return 1;
	}

	if (key == "r")				// red
	{
		if (event == INPUT_KEYDOWN)
			red = 1;
		else	red = 0;
		return 1;
	}

	if (key == "g")				// green
	{
		if (event == INPUT_KEYDOWN)
			green = 1;
		else	green = 0;
		return 1;
	}
	
	if (key == "b")				// blue
	{
		if (event == INPUT_KEYDOWN)
			blue = 1;
		else	blue = 0;
		return 1;
	}
	
	if ((parama == 515 || parama == 516) && (event == INPUT_KEYDOWN))	// apply incrementation - mouse wheel up and down 
	{
		if (parama == 515)
			inc = increment;
		else	inc = increment * (-1);
		
		if	(radius)	localcmd(strcat("r_editlights_edit radius ", ftos(cvar("r_editlights_current_radius") + inc), "\n"));
		else if (coronasize)	localcmd(strcat("r_editlights_edit coronasize ", ftos(cvar("r_editlights_current_coronasize") + inc * 0.01), "\n"));

		else if (angx || angy || angz)
		{
			v = '0 0 0';
			if (angx)	v_x = inc;
			if (angy)	v_y = inc;
			if (angz)	v_z = inc;
			if (v != '0 0 0')
			{
				v = v + stov(cvar_string("r_editlights_current_angles"));
				localcmd(strcat("r_editlights_edit anglesx ", ftos(v_x), "\n"));
				localcmd(strcat("r_editlights_edit anglesy ", ftos(v_y), "\n"));
				localcmd(strcat("r_editlights_edit anglesz ", ftos(v_z), "\n"));
			}
		}

		else if (movex)		localcmd(strcat("r_editlights_edit movex ", ftos(inc), "\n"));
		else if (movey)		localcmd(strcat("r_editlights_edit movey ", ftos(inc), "\n"));
		else if (movez)		localcmd(strcat("r_editlights_edit movez ", ftos(inc), "\n"));

		else if (diffuse)	localcmd(strcat("r_editlights_edit diffuse ", ftos(cvar("r_editlights_current_diffuse") + inc * 0.01), "\n"));
		else if (ambient)	localcmd(strcat("r_editlights_edit ambient ", ftos(cvar("r_editlights_current_ambient") + inc * 0.01), "\n"));
		else if (specular)	localcmd(strcat("r_editlights_edit specular ", ftos(cvar("r_editlights_current_specular") + inc * 0.01), "\n"));

		else if (grey)
		{
			inc = inc * 0.01;
			if (scale_cache + inc >= 0.01)
			{
				scale_cache = scale_cache + inc;
				localcmd(strcat("r_editlights_edit color ",ftos(color_cache_x * scale_cache)," ",ftos(color_cache_y * scale_cache)," ",ftos(color_cache_z * scale_cache),"\n"));
			}
		}
		else if (red || green || blue)
		{
			v = '0 0 0';
			if (red)	v_x = inc * 0.01;
			if (green)	v_y = inc * 0.01;
			if (blue)	v_z = inc * 0.01;
			if (v != '0 0 0')
			{
				v = v + stov(cvar_string("r_editlights_current_color"));
				localcmd(strcat("r_editlights_edit color ",ftos(v_x)," ",ftos(v_y)," ",ftos(v_z),"\n"));
			}
		}
		
		else if (style)
		{
			if (inc > 0) inc = 1;
			else inc = -1;
			inc = cvar("r_editlights_current_style") + inc;
			if (inc < 12 && inc >= 0) localcmd(strcat("r_editlights_edit style ", ftos(inc), "\n"));
		}
		
		else
		{
			if (parama == 515)
			{
				if (increment == 1) increment = 10;
				else increment = 100;
			}
			else if (parama == 516)
			{
				if (increment == 100) increment = 10;
				else increment = 1;
			}
		}
		return 1;
	}
	return FALSE;
}; 