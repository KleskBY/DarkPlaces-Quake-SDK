/*

client/main.qc

Code entry points for CSQC

*/


//-----------------------------------------------------------------------------
// Init
//-----------------------------------------------------------------------------
void() CSQC_Init =
{
	Sbar_Init();
	
	g_nVideoWidth = cvar("vid_conwidth");
	g_nVideoHeight = cvar("vid_conheight");
	var float autocvar_hud_mapname = 1;
	if (autocvar_hud_mapname)
	{
		HUD_PrepareMapDisplayName();
		HUD_BeginMapNameDisplay();
	}
	
	if (cvar("r_editlights") && cvar("sv_cheats"))
	{
		localcmd("god");
		localcmd("notarget");
	}
	increment = 1;
	
	mouse = cvar("sensitivity");
	if (!mouse)	cvar_set("sensitivity", "3");	
};

//-----------------------------------------------------------------------------
// Shutdown
//-----------------------------------------------------------------------------
void() CSQC_Shutdown =
{
	Sbar_Shutdown();
	cvar_set("sensitivity", ftos(mouse));
};

//-----------------------------------------------------------------------------
// ConsoleCommand
//-----------------------------------------------------------------------------
float(string s) CSQC_ConsoleCommand =
{
	return FALSE;
};

//-----------------------------------------------------------------------------
// UpdateView
//-----------------------------------------------------------------------------
void() CSQC_UpdateView =
{
	vid_conwidth = cvar("vid_conwidth");
	vid_conheight = cvar("vid_conheight");
	
	R_ClearScene();

	//finale sequence player entity position change check
	discrepancy = getpropertyvec(VF_ORIGIN) - getentityvec(player_localentnum, E_ORIGIN);
	if ((fabs(discrepancy_x)>100)||(fabs(discrepancy_y)>100)||(fabs(discrepancy_z)>100)) finale = 1;	

	if ((intermission && !finale) || finale == 1)
	{
		if (finale == 1) finale = 2;
		cvar_set("sensitivity", "0");			// disable mouselook
		viewpos = getentityvec(player_localentnum, E_ORIGINANDVECTORS);
		viewang = vectoangles2(v_forward, v_up);
		viewang_x = - viewang_x;

		viewang_x = viewang_x + sin(time * 0.5) * 0.75;	// camera sway
		viewang_y = viewang_y + sin(time * 1) * 0.75;
		viewang_z = viewang_z + sin(time * 0.25) * 0.25;

		R_SetView(VF_ORIGIN, viewpos);
		R_SetView(VF_ANGLES, viewang);
	}
	else if	(cvar("sensitivity"))	mouse = cvar("sensitivity");

	R_AddEntities(MASK_NORMAL | MASK_ENGINE | MASK_ENGINEVIEWMODELS);
	R_SetView(VF_DRAWWORLD, 1);
	R_SetView(VF_DRAWCROSSHAIR, 1);
	R_SetView(VF_DRAWENGINESBAR, 1);
	R_RenderScene();

	if (cvar("r_editlights"))					rt_lights_editor_help();
	else if ((ibar)&&(!intermission)&&(!showscores))   		Sbar_DrawInventory();

	if ((g_fMapNameDisplayState)&&(!intermission)&&(!showscores))	HUD_UpdateMapNameDisplay();
	if ((compass)&&(!intermission)&&(!showscores))			Sbar_DrawCompass();
	if (waterfog)					   		UpdateFluidContents(false);
};

//-----------------------------------------------------------------------------
// InputEvent
//-----------------------------------------------------------------------------
float(float event, float parama) CSQC_InputEvent =
{
	if (cvar("r_editlights"))
		if (rt_lights_editor(event, parama)) return TRUE;
	
	if ( getkeybind(parama) == "itembar" )		// show/hide inventory
	{
		if (event == INPUT_KEYDOWN)
		{	
			if((cvar("viewsize") >= 100) && (cvar("viewsize") < 110))
			{
				cvar_set("viewsize", "110");
				return TRUE;
			}
			if((cvar("viewsize") >= 110) && (cvar("viewsize") < 120))
			{
				if ( ibar == 1 )
				{
					ibar = 0;
					return TRUE;
				}
				else if(ibar_flag) { ibar=1;   return TRUE; }
				else { cvar_set("viewsize", "100"); return TRUE; }
			}
			else return TRUE;
		}
	}

	if ( getkeybind(parama) == "compass" )  // show/hide compass
	{
		if (event == INPUT_KEYDOWN)
		{		
			if ( compass == 0 )
			{
				compass = 1;
				return TRUE;
			}
			if ( compass == 1 )
			{
				compass = 0;
				return TRUE;
			}
		}
	}
	
	// +- keys will put custom ibar between viewsizes [100-109)...[110-119) and reset below 100 cvar "viewsize" value to 100
	if ( getkeybind(parama) == "sizeup" )
	{
		if (event == INPUT_KEYDOWN)
		{		
			if((cvar("viewsize") >= 100) && (cvar("viewsize") < 110))
			{	ibar = 1; ibar_flag = 1; return FALSE;	}
			
			if((cvar("viewsize") >= 110) && (cvar("viewsize") < 120))
			{
				if(ibar_flag == 1) {ibar = 1; ibar_flag = 2; return TRUE;}
				if(ibar_flag == 2) {ibar = 0; ibar_flag = 0; return TRUE;}
				else return FALSE;
			}
			if((cvar("viewsize") < 100)) {cvar_set("viewsize", "100"); return TRUE;}
		}
	}
	if ( getkeybind(parama) == "sizedown" )
	{
		if (event == INPUT_KEYDOWN)
		{		
			if((cvar("viewsize") >= 110) && (cvar("viewsize") < 120))
			{
				if(ibar == 0) {ibar = 1; ibar_flag = 2; return TRUE;}
				else 
				{
					if (ibar_flag == 2 ) { ibar_flag = 1; ibar = 1; return TRUE; }
					if (ibar_flag == 1 ) { ibar_flag = 0; ibar = 0; return FALSE; }
				}
			}
			if((cvar("viewsize") < 110)) {cvar_set("viewsize", "100"); return TRUE;}
		}
	}
	
	// HUD/MENU size
	if ( getkeybind(parama) == "consizedown" )
	{
		if (event == INPUT_KEYDOWN)
		{	
			if ((cvar("vid_conwidth") > 320 ) && (cvar("vid_conwidth") <= 1280 )) cvar_set("vid_conwidth", ftos(cvar("vid_conwidth") - 80));
			else if (((cvar("vid_width")/cvar("vid_height")) <= (16/9)) && (cvar("vid_conwidth") > 1280 )) cvar_set("vid_conwidth", ftos( 1280 ));
			else 	cvar_set("vid_conwidth", ftos( 320 ));
			cvar_set("vid_conheight", ftos(cvar("vid_conwidth") * cvar("vid_height")/cvar("vid_width")));
			return TRUE;
		}
	}
	if ( getkeybind(parama) == "consizeup" )
	{
		if (event == INPUT_KEYDOWN)
		{	
			if ((cvar("vid_conwidth") < 1280 ) || ((cvar("vid_width")/cvar("vid_height")) > (16/9)))
				cvar_set("vid_conwidth", ftos(cvar("vid_conwidth") + 80));
			else cvar_set("vid_conwidth", ftos( 1280 ));
			cvar_set("vid_conheight", ftos(cvar("vid_conwidth") * cvar("vid_height")/cvar("vid_width")));
			return TRUE;	
		}
	}

	if (getkeybind(parama) == "+showscores")
	{
		if (event == INPUT_KEYDOWN)
		{
			showscores = TRUE;
			return FALSE;
		}
		if (event == INPUT_KEYUP)
		{
			showscores = FALSE;
			return FALSE;
		}
	}
	else return FALSE; 
};
 