
////////////////////////////////
/////////// GLOBALS ////////////
////////////////////////////////


float current_health, current_ammo, current_weapon;
vector screensize;

float showScores;
float completedTime;
float grenade_time;


/////////////////////////////////////////
////////////// UI ELEMENTS //////////////
/////////////////////////////////////////

vector mouse_pos;
vector last_mouse_pos;
vector vid_res;
float vy_rel;
float vx_rel;
float font_size;
float clicked;

void(string txt, vector pos) txt =
{
	drawstring(pos, txt, [font_size, font_size], '1 1 1', 1, 0);
};

void() UpdateMouse = 
{
 	vector raw_mouse;
 	raw_mouse = getmousepos();
 	mouse_pos += raw_mouse;
 	if (mouse_pos_x < 0) mouse_pos_x = 0;
 	if (mouse_pos_x > screensize_x) mouse_pos_x = screensize_x;
 	if (mouse_pos_y < 0) mouse_pos_y = 0;
 	if (mouse_pos_y > screensize_y) mouse_pos_y = screensize_y;
};

void() GetRelative =
{
	font_size = screensize_x * 0.02;
	if (((vid_res_x == 2560) && (vid_res_y == 1440)) || ((vid_res_x == 2560) && (vid_res_y == 1080)) || ((vid_res_x == 3440) && (vid_res_y == 1440)) || ((vid_res_x == 5120) && (vid_res_y == 2160)))
	{	
		vx_rel = ((screensize_x / 1134));
		vy_rel = ((screensize_y / 540));
	}
	else if ((vid_res_x == 4096) && (vid_res_y == 2160))
	{	
		vx_rel = ((screensize_x / 1134));
		vy_rel = ((screensize_y / 540));
	}
	else if ((vid_res_x == 3840) && (vid_res_y == 1600))
	{	
		vx_rel = ((screensize_x / 1134));
		vy_rel = ((screensize_y / 540));
	}
	else
	{
		vx_rel = ((screensize_x / 960));
		vy_rel = ((screensize_y / 540));
	}
};

vector(vector vctr) fixed_vector = 
{
	return [rint(vctr_x * vx_rel), rint(vctr_y * vy_rel)];
};

float check_mouse(vector pos, vector pos2)
{
	pos -= fixed_vector('5 0 0');
 	pos2 += fixed_vector('5 0 0');
	if (mouse_pos_x >= pos_x && mouse_pos_x <= pos2_x)
	{
		if (mouse_pos_y >= pos_y && mouse_pos_y <= pos2_y)
			return 1;
	}
	return 0;
};

float(vector pos, vector buttonSize, string name) button =
{
	if(check_mouse(pos, pos + buttonSize))
	{
		drawfill(pos, buttonSize, '0.6 0.53 0.4', 0.5, 0);
		if(clicked) 
		{
			clicked = FALSE;
			return TRUE;
		}
	}
	else drawfill(pos, buttonSize, '0.1 0.1 0.1', 0.5, 0);
	drawstring([screensize_x / 2 - (strlen(name) / 2) * font_size, pos_y + font_size * 0.4], name, [font_size, font_size], '1 1 1', 0.9, 0);
	return FALSE;
};

void(vector pos, string title, string text) scoresboard_text =
{
	local string dots = "                         ";
	dots = strcat(substring(dots, 0, strlen(dots) - strlen(text)), text);
	dots = strcat(title, substring(dots, strlen(title), strlen(dots)));
	drawstring(pos, dots, [font_size, font_size], '1 1 1', 1, 0);
};

/////////////////////////////////////
////////////// INPUT ////////////////
/////////////////////////////////////

string KeyMap(float keynum) 
{
   local string chrlist, key;

   if(keynum == 32) key = " ";
   else if(keynum >= 39 && keynum <= 61)
   {
      chrlist = "'  *+,-./0123456789 ; =";   
      key = substring(chrlist, keynum - 39, 1);
   }
   else if(keynum <= -39 && keynum >= -61)
   {
      chrlist = "\"    <_>?)!@#$%^&*( : +";
      key = substring(chrlist, (-keynum) - 39, 1);
   }
   else if(keynum >= 91 && keynum <= 93)
   {
      chrlist = "[\\]";
      key = substring(chrlist, keynum - 91, 1);
   }
   else if(keynum <= -91 && keynum >= -93)
   {
      chrlist = "{|}";
      key = substring(chrlist, (-keynum) - 91, 1);
   }   
   else if(keynum >= 97 && keynum <= 122)
   {
      chrlist = "abcdefghijklmnopqrstuvwxyz";
      key = substring(chrlist, keynum - 97, 1);
   }

   return key;
}

float CSQC_InputEvent(float flEventType, float flKey, float flCharacter) 
{
    local string key, keybind;

	key = KeyMap(flKey);
	keybind = getkeybind(flKey);

	clicked = false;
    if (!flEventType) // key pressed down
	{	
		if (flKey == K_MOUSE1) clicked = true;
	}

	if (keybind == "+showscores")
	{
		if(!flEventType) showScores = TRUE;
		if(flEventType == 1) showScores = FALSE;
	}
	
	return FALSE;
}




/////////////////////////////////////
/////////////// HUD /////////////////
/////////////////////////////////////

void DrawHUD()
{
	if(intermission || !cvar("cl_hud") || cvar("viewsize") > 100 || current_health < 0 || current_health > 666) return;
	
	drawfont = FONT_SBAR;
	local vector hud_size = [font_size * 2, font_size * 2];
	local vector healthColor = [1, (current_health / 100), (current_health / 100)];
	local string healthStr = strcat("+", ftos(current_health));
	drawstring([hud_size_x, screensize_y - hud_size_x * 1.5], healthStr, hud_size, healthColor, 0.9, 0);
	
	if(current_weapon && current_weapon != WP_KNIFE) 
	{
		local float offset = stringwidth(ftos(current_ammo), true, hud_size);
		drawstring([screensize_x - hud_size_x - offset, screensize_y - hud_size_y * 1.5], ftos(current_ammo), hud_size, '1 1 1', 0.9, 0);
	}
	drawfont = FONT_DEFAULT;
};

//////////////////////////////////
/////////// CROSSHAIR ////////////
//////////////////////////////////

void DrawCrosshair()
{
	if(cvar("crosshair") <= 0 || current_health <= 0 || current_weapon <= 0 || current_health > 666 || intermission) return;
	
	local float recoil = fabs(view_punchangle_x);
	local float gap_size = rint(vx_rel * 8) + rint(recoil * 2);
	local vector crosshair_size = fixed_vector('10 2 0');
	local vector crosshair_color = [cvar("crosshair_color_red"), cvar("crosshair_color_blue"), cvar("crosshair_color_green")];

	//outline
	drawfill([screensize_x / 2 - crosshair_size_x - gap_size - 1, screensize_y / 2 - crosshair_size_y / 2 - 1], [crosshair_size_x + 2, crosshair_size_y + 2], '.1 .1 .1', 0.3, 0); //left
	drawfill([screensize_x / 2 + gap_size - 1, screensize_y / 2 - crosshair_size_y / 2 - 1], [crosshair_size_x + 2, crosshair_size_y + 2], '.1 .1 .1', 0.3, 0);  //right
	drawfill([screensize_x / 2 - crosshair_size_y / 2 - 1, screensize_y / 2 - crosshair_size_x - gap_size  - 1], [crosshair_size_y + 2, crosshair_size_x + 2], '.1 .1 .1', 0.3, 0); //top
	drawfill([screensize_x / 2 - crosshair_size_y / 2 - 1, screensize_y / 2 + gap_size - 1], [crosshair_size_y + 2, crosshair_size_x + 2], '.1 .1 .1', 0.3, 0); //bottom

	//crosshair
	drawfill([screensize_x / 2 - crosshair_size_x - gap_size, screensize_y / 2 - crosshair_size_y / 2], [crosshair_size_x, crosshair_size_y], crosshair_color, 0.75, 0); //left
	drawfill([screensize_x / 2 + gap_size, screensize_y / 2 - crosshair_size_y / 2], [crosshair_size_x, crosshair_size_y], crosshair_color, 0.75, 0);  //right
	drawfill([screensize_x / 2 - crosshair_size_y / 2, screensize_y / 2 - crosshair_size_x - gap_size], [crosshair_size_y, crosshair_size_x], crosshair_color, 0.75, 0); //top
	drawfill([screensize_x / 2 - crosshair_size_y / 2, screensize_y / 2 + gap_size], [crosshair_size_y, crosshair_size_x], crosshair_color, 0.75, 0); //bottom
}

//////////////////////////////////
//////////// RANKINGS ////////////
//////////////////////////////////
float lastPing;
void DrawRankings()
{
	if(cvar("deathmatch") == 0 && cvar("coop") == 0) return;
	if(!showScores && (!intermission && cvar("deathmatch"))) return;

	if(lastPing + 5 < time)
	{
		lastPing = time;
		localcmd("ping\n");
	}
	
	drawstring([screensize_x / 2 - stringwidth("RANKING", true, [font_size * 2, font_size * 2]) / 2, screensize_y * 0.16], "RANKING", [font_size * 2, font_size * 2], '1 1 1', 1, 0);

	drawfill([screensize_x / 2 - screensize_y / 2, screensize_y / 2 - screensize_y / 4], [screensize_y, screensize_y / 2], '0.1 0.1 0.1', 0.5, 0);
	drawfill([screensize_x / 2 - screensize_y / 2, screensize_y / 4 - font_size], [screensize_y, font_size], '0.9 0.9 0.9', 0.45, 0);
	scoresboard_text([screensize_x / 4, screensize_y / 4 - font_size], "NAME", "PING FRAGS");

	local float offset = 0;
	local float i;
	for(i = 0; i < 32; i++)
	{
		local string player_name = getplayerkeyvalue(i, "name");
		if(player_name != "" || player_name)
		{
			local string player_kills = getplayerkeyvalue(i, "frags");
			if(strlen(player_kills) == 1) player_kills = strcat("  ", player_kills);
			if(strlen(player_kills) == 2) player_kills = strcat(" ", player_kills);
			local string player_colors = getplayerkeyvalue(i, "colors");
			local string player_ping = getplayerkeyvalue(i, "ping");
			if(strlen(player_ping) == 1) player_ping = strcat(player_ping, "  ");
			if(strlen(player_ping) == 2) player_ping = strcat(player_ping, " ");

			scoresboard_text([screensize_x / 4, screensize_y / 4 + offset], player_name, strcat(player_ping, " ", player_kills));
			if(player_localnum == i) txt(">", [screensize_x / 2 - screensize_y / 2, screensize_y / 4 + offset]);
			offset = offset + font_size;
		}
	}
	
	txt(mapname, [screensize_x / 2 - screensize_y / 2,screensize_y -  screensize_y / 5]);
	txt(ftos(floor(time)), [screensize_x / 2 + screensize_y / 2 - font_size * strlen(ftos(floor(time))), screensize_y - screensize_y / 5]);
}

////////////////////////////
////////// SCORE ///////////
////////////////////////////


void DrawScore()
{
	if( (intermission && cvar("deathmatch") == 0) || (showScores && cvar("deathmatch") == 0 && cvar("coop") == 0) )
	{
		if(intermission)
		{
			if(!completedTime) completedTime = time;
			drawstring([screensize_x / 2 - stringwidth("COMPLETED", true, [font_size * 2, font_size * 2]) / 2 + font_size, screensize_y / 2 - font_size * 8], "COMPLETED", [font_size * 2, font_size * 2], '1 1 1', 1, 0);
			txt("TIME:", [screensize_x / 2 - font_size * 6, screensize_y / 2 - font_size * 6]); 
			txt(substring(ftos(completedTime), 0, strstrofs(ftos(completedTime), ".", 0) + 2), [screensize_x / 2 + font_size * 6, screensize_y / 2 - font_size * 6]);
		}
		else 
		{
			txt("TIME:", [screensize_x / 2 - font_size * 6, screensize_y / 2 - font_size * 6]); 
			txt(substring(ftos(time), 0, strstrofs(ftos(time), ".", 0) + 2), [screensize_x / 2 + font_size * 6, screensize_y / 2 - font_size * 6]);
		}
		
		txt("KILLS:", [screensize_x / 2 - font_size * 6, screensize_y / 2 - font_size * 4]); 
		txt(strcat(ftos(getstati(STAT_MONSTERS)), "/", ftos(getstati(STAT_TOTALMONSTERS))), [screensize_x / 2 + font_size * 6, screensize_y / 2 - font_size * 4]);
		txt("ITEMS:", [screensize_x / 2 - font_size * 6, screensize_y / 2 - font_size * 2]); 
		txt(strcat(ftos(getstati(STAT_PICKED_ITEMS)), "/", ftos(getstati(STAT_TOTALITEMS))), [screensize_x / 2 + font_size * 6, screensize_y / 2 - font_size * 2]);
		txt("HEALTH:", [screensize_x / 2 - font_size * 6, screensize_y / 2]); 
		txt(ftos(getstati(STAT_HEALTH)), [screensize_x / 2 + font_size * 6, screensize_y / 2]);
		txt("SECRETS:", [screensize_x / 2 - font_size * 6, screensize_y / 2 + font_size * 2]); 
		txt(strcat(ftos(getstati(STAT_SECRETS)), "/", ftos(getstati(STAT_TOTALSECRETS))), [screensize_x / 2 + font_size * 6, screensize_y / 2 + font_size * 2]);
		txt("MAPNAME:", [screensize_x / 2 - font_size * 6, screensize_y / 2 + font_size * 4]); 
		txt(substring(mapname, 5, strlen(mapname) - 9), [screensize_x / 2 + font_size * 6, screensize_y / 2 + font_size * 4]);
		txt("PLAYERS:", [screensize_x / 2 - font_size * 6, screensize_y / 2 + font_size * 6]); 
		txt(ftos(maxclients), [screensize_x / 2 + font_size * 6, screensize_y / 2 + font_size * 6]);
		if(getstati(STAT_SHOTS))
		{
			txt("ACCURACY:", [screensize_x / 2 - font_size * 6, screensize_y / 2 + font_size * 8]); 
			txt(strcat(ftos(getstati(STAT_HITS)), "/", ftos(getstati(STAT_SHOTS)), "(", ftos(floor(getstati(STAT_HITS) / getstati(STAT_SHOTS) * 100)), "%)")  , [screensize_x / 2 + font_size * 6, screensize_y / 2 + font_size * 8]);
		}
	}
}


////////////////////////////
/////////// VIEW ///////////
////////////////////////////


float lastFrame;
float deltaTime;

void CSQC_UpdateView(float flWidth, float flHeight) 
{
    clearscene(); 						// CSQC builtin to clear the scene of all entities / reset our view properties
	setproperty(VF_DRAWWORLD, 1); 		// we want to draw world!
	setproperty(VF_DRAWCROSSHAIR, 0);	// we want to draw our crosshair!
	setproperty(VF_DRAWENGINESBAR, 0);
	addentities(MASK_NORMAL | MASK_ENGINE | MASK_ENGINEVIEWMODELS); 		// add entities with these rendermask field var's to our view
	renderscene();
	
	screensize_x = cvar("vid_conwidth");
	screensize_y = cvar("vid_conheight");
	
	current_health = getstati(STAT_HEALTH);
	current_ammo = getstati(STAT_AMMO);
	current_weapon = getstati(STAT_ACTIVEWEAPON);
	
	GetRelative();
	UpdateMouse();

	DrawHUD();
	DrawCrosshair();
	DrawScore();
	DrawRankings();
}




////////////////////////////
/////////// CSQC ///////////
////////////////////////////



float CSQC_ConsoleCommand(string strCommand) 
{
    return FALSE;
}
void CSQC_Parse_StuffCmd (string msg)
{
	if(isdemo()) return;
	localcmd(msg);
}

void CSQC_Ent_Remove ()
{
	remove(self);
}
void CSQC_Init(void) 
{
	precache_pic("gfx/scope.tga");
	precache_cubemap("cubemaps/237nx.tga");
	registercvar("cl_hud", "1");
	registercvar("bot_stop", "0");
	completedTime = 0;
}

void CSQC_Shutdown(void) 
{
}
void CSQC_Ent_Update (float isnew)
{	
}