For darkplaces engine only. Drop into id1\ hipnotic\ or rogue\ folders to use ( Quake, MP1:Scurge of Armagon, MP2:Dissolution of Eternity ) 

This mod, among other things, will correct console aspect ratio, to match rendering resoltion aspect ratio.
No more stretched HUD on 16:9 monitors, or multi screen setups.

Ingame settings will be saved between levels and gaming sessions:
keys '+' '-' ( default DP sizeup, sizedown binds )	// full classic hud - layout 1 ( Smith )  - layout 2 ( Nahuel ) - status bar only - hide hud


This mod will automatically write into console default binds for its functions.
It won't bind a key if you've already binded it to something else. 
You can use console command to bind these functions manually in such case. Default binds below:

bind [ consizedown		// decrease console resolution - it'll increase HUD/MENU/CONSOLE size
bind ] consizeup		// increase console resolution - it'll decrease HUD/MENU/CONSOLE size	
bind x itembar			// toggle item bar
bind f itembar
bind c compass			// toggle compass
bind r compass


autoexec.cfg settings:
set hud_mapname 1		// on/off map name display after loading a level, 1 == default
set waterfog 0			// on/off waterfog, 0 == default ( not compatible with world fog via .ent files and fits only with not transparent water surface )
set hud_weapons_offset 0	// 0 - move up/down custom inventory weapons and ammocounts ( value +/- 40 is about 10% screen height up/down ), 0 == default
				// with default '0' and Smiths layout - custom ibar automatically adjust its position to be just above ( fps / date/ time )
"sbar_alpha_bg""0.4"		// DP cvars for hud graphics transparency, bg - background, fg - icons  
"sbar_alpha_fg""1"


********************
Credits / Changelog:

Nahuel, Dresk	( Old Nahuel's sources preserved in zip file, there is some unused code that may be of use for someone - like status bar, for example )

v1,v2	Thanks: Chip, for the great quakewiki.net, Seven, for arranging my code.
	Unknow programmer, for his great and simple use of csqc: http://www.quakewiki.net/quake-1/mods/custom-hud/

v3	Kleshik and Nexuiz stuff in "kleshikstuff.qc, kleshik stuff by Dresk ( map name display, waterfog )


Smith

v4.5	Classic intermission screen restored, customization options, new optional layout 
	Mission packs HUD versions: v3 & v4 updates features added into MPs versions
	Restored functionality of dark places hud, DP scorebar, transparency cvars, etc.

v4.6	Position of custom ibar is correct no matter what vid_conwidth value is used
	Proper vid_conheight value will be automatically set to match screen resolution aspect ratio and HUD/MENU size is adjustable with [ ] keys.

v4.7	Thanks to Spike's unlimited knowledge all issues with intermission and finale views are fixed. Thanks a lot Spike !!!
	Key binds, layouts and compass fully adjustable ingame now, improved layout 1.

v4.8	Mouselook is now disabled during intermission and finale views on new DP builds too.
	Camera sway during intermission and finale views like in original Quake.
	Weapon icons will now blink on weapon pickup also when custom layout is used.
	Convenient interface for DP RealTime Lights Edit Mode.


********************************************
Interface for DP Real Time Lights Edit Mode:

Thanks to Nahuel for the original idea, I remade in csqc with many improvements:

It's done in CSQC so it's compatible with any Mod, or Mission Pack.
Edited light does not reset, adjustement starts from it's current values.
Toggleable help panel shows controls, so you don't have to memorise them.
For non binary parameters, you can change adjustement tick multiplier, current multiplier is displayed on the help panel.
You can change multiplier with mouse scroll beforehand, or decrease it during adjustement by pressing mouse wheel (mouse3).
Color scale adjustement use starting color value as a base for linear incrementation, currently applied scale is displayed on the help panel.

Help panel explains all the controls so there is no point in repeating it here.
Mod is enabled \ disabled together with "r_editlights" cvar.

"r_editlights_help" shows all DP light editing commands. The most notable commands not covered by this mod are:
Setting cubemap texture, setting style value above 11 ( for triggered lights ), for loading lights from files and for changing all lights at once.

Mod will activate god and notarget cheats on level load, if "sv_cheats" and "r_editlights" are set to 1 before loading a level.
To start ready to work, with movement controls, that won't interfere with light editing controls, add this to autoexec.cfg:

"sv_cheats""1"
"r_editlights""1"
bind l "noclip"



bind w "+forward"
bind s "+back"

bind a "+moveleft"


bind d "+moveright"


bind e "+moveup"
bind f "+movedown"













