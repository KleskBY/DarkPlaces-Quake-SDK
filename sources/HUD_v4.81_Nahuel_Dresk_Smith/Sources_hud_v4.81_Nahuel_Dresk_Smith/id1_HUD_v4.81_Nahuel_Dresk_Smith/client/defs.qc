//NOTE: THIS IS AN INTERFACE FILE. DO NOT EDIT.
//MODIFYING THIS FILE CAN RESULT IN CRC ERRORS.
//YOU HAVE BEEN WARNED.

//feel free to look though. :)

#define CSQC 1

/*
==============================================================================

			SOURCE FOR GLOBALVARS_T C STRUCTURE

==============================================================================
*/

//
// system globals
//
entity		self;
entity		other;
entity		world;
float		time;
float		frametime;

float 		player_localentnum;	//the entnum
float 		player_localnum;	//the playernum
float		maxclients;	//a constant filled in by the engine. gah, portability eh?

float		clientcommandframe;	//player movement
float		servercommandframe;	//clientframe echoed off the server

float		intermission;

string		mapname;

//
// global variables set by built in functions
//
vector		v_forward, v_up, v_right;	// set by makevectors()

// set by traceline / tracebox
float		trace_allsolid;
float		trace_startsolid;
float		trace_fraction;
vector		trace_endpos;
vector		trace_plane_normal;
float		trace_plane_dist;
entity		trace_ent;
float		trace_inopen;
float		trace_inwater;

//
// required prog functions
//
void()		CSQC_Init;
void()		CSQC_Shutdown;
float(float f, float t)	CSQC_InputEvent;
void()		CSQC_UpdateView;
float(string s)	CSQC_ConsoleCommand;


//these fields are read and set by the default player physics
vector		pmove_org;
vector		pmove_vel;
vector		pmove_mins;
vector		pmove_maxs;
//retrieved from the current movement commands (read by player physics)
float		input_timelength;
vector		input_angles;
vector		input_movevalues;	//forwards, right, up.
float		input_buttons;		//attack, use, jump (default physics only uses jump)

float		movevar_gravity;
float		movevar_stopspeed;
float		movevar_maxspeed;
float		movevar_spectatormaxspeed;	//used by NOCLIP movetypes.
float		movevar_accelerate;
float		movevar_airaccelerate;
float		movevar_wateraccelerate;
float		movevar_friction;
float		movevar_waterfriction;
float		movevar_entgravity;	//the local player's gravity field. Is a multiple (1 is the normal value)

//================================================
void		end_sys_globals;		// flag for structure dumping
//================================================

/*
==============================================================================

			SOURCE FOR ENTVARS_T C STRUCTURE

==============================================================================
*/

//
// system fields (*** = do not set in prog code, maintained by C code)
//
.float		modelindex;		// *** model index in the precached list
.vector		absmin, absmax;	// *** origin + mins / maxs

.float		entnum;	// *** the ent number as on the server
.float		drawmask;
.void()		predraw;

.float		movetype;
.float		solid;

.vector		origin;			// ***
.vector		oldorigin;		// ***
.vector		velocity;
.vector		angles;
.vector		avelocity;

.string		classname;		// spawn function
.string		model;
.float		frame;
.float		skin;
.float		effects;

.vector		mins, maxs;		// bounding box extents reletive to origin
.vector		size;			// maxs - mins

.void()		touch;
.void()		use;
.void()		think;
.void()		blocked;		// for doors or plats, called when can't push other

.float		nextthink;

.entity		chain;

.string		netname;

.entity 	enemy;

.float		flags;

.float		colormap;

.entity		owner;		// who launched a missile

//================================================
void		end_sys_fields;			// flag for structure dumping
//================================================

//-----------------------------------------------------------------------------
// BUILTINS
//-----------------------------------------------------------------------------

// 'core' - standard qc minus the funcs that are server specific
// We do not have the server specific ones - they are commented out.

void(vector ang)	makevectors		= #1;		// sets v_forward, etc globals
void(entity e, vector o) setorigin	= #2;
void(entity e, string m) setmodel	= #3;		// set movetype and solid first
void(entity e, vector min, vector max) setsize = #4;
// #5 was removed
void() break						= #6;
float() random						= #7;		// returns 0 - 1

void (entity e, float chan, string samp, float vol, float atten)	sound = #8;

vector(vector v) normalize			= #9;
void(string e) error				= #10;
void(string e) objerror				= #11;
float(vector v) vlen				= #12;
float(vector v) vectoyaw			= #13;
entity() spawn						= #14;
void(entity e) remove				= #15;

void(vector v1, vector v2, float nomonsters, entity forent) traceline = #16;

//entity() checkclient				= #17;	// returns a client to look for
entity(entity start, .string fld, string match) find = #18;
string(string s) precache_sound		= #19;
string(string s) precache_model		= #20;
//void(entity client, string s)stuffcmd = #21;
entity(vector org, float rad) findradius = #22;
//void(string s) bprint				= #23;
//void(entity client, string s) sprint = #24;
//void(string s) dprint				= #25;
string(float f) ftos				= #26;
string(vector v) vtos				= #27;
void() coredump						= #28;		// prints all edicts
void() traceon						= #29;		// turns statment trace on
void() traceoff						= #30;
void(entity e) eprint				= #31;		// prints an entire edict
float(float yaw, float dist) walkmove	= #32;	// returns TRUE or FALSE
// #33 was removed
float() droptofloor= #34;	// TRUE if landed on floor
void(float style, string value) lightstyle = #35;
float(float v) rint					= #36;		// round to nearest int
float(float v) floor				= #37;		// largest integer <= v
float(float v) ceil					= #38;		// smallest integer >= v
// #39 was removed
float(entity e) checkbottom			= #40;		// true if self is on ground
float(vector v) pointcontents		= #41;		// returns a CONTENT_*
// #42 was removed
float(float f) fabs = #43;
//vector(entity e, float speed) aim = #44;		// returns the shooting vector
float(string s) cvar = #45;						// return cvar.value
void(string s) localcmd = #46;					// put string into local que
entity(entity e) nextent = #47;					// for looping through all ents
void(vector o, vector d, float color, float count) particle = #48;// start a particle effect
void() ChangeYaw = #49;						// turn towards self.ideal_yaw
											// at self.yaw_speed
// #50 was removed
vector(vector v) vectoangles			= #51;

void(float step) movetogoal				= #67;

string(string s) precache_file		= #68;	// no effect except for -copy
//void(entity e) makestatic		= #69;
//void(string s) changelevel = #70;

//#71 was removed

void(string var, string val) cvar_set = #72;	// sets cvar.value

//void(entity client, string s) centerprint = #73;	// sprint, but in middle

void(vector pos, string samp, float vol, float atten) ambientsound = #74;

string(string s) precache_model2	= #75;		// registered version only
string(string s) precache_sound2	= #76;		// registered version only
string(string s) precache_file2		= #77;		// registered version only

//void(entity e) setspawnparms		= #78;		// set parm1... to the
												// values at level start
												// for coop respawn

// 'csqc'
float(string name, string value) registercvar = #93;

// CSQC Builtins
float()									ReadByte = #360;
float()									ReadChar = #361;
float()									ReadShort = #362;
float()									ReadLong = #363;
float()									ReadCoord = #364;
float()									ReadAngle = #365;
string()								ReadString = #366;	//warning: this returns a temporary!

// CSQC builtins
void ()									R_ClearScene = #300;
void (float mask)						R_AddEntities = #301;
void (entity e)							R_AddEntity = #302;
float (float property, ...)				R_SetView = #303;
void ()									R_RenderScene = #304;
void (vector org, float radius, vector rgb)	R_AddDynamicLight = #305;
void ()									R_CalcRefDef = #306;

vector (vector v)						cs_unproject = #310;
vector (vector v)						cs_project = #311;

// CSQC draw builtins
void	drawline(float width, vector pos1, vector pos2, vector rgb, float alpha, float flags) = #315;

float	iscachedpic(string name)	= #316;
string	precache_pic(string name, ...)	= #317;
vector	drawgetimagesize(string pic) = #318;
void	freepic(string name)		= #319;
float	drawcharacter(vector position, float character, vector scale, vector rgb, float alpha, float flag) = #320;
float	drawstring(vector position, string text, vector scale, vector rgb, float alpha, float flag) = #321;
float	drawpic(vector position, string pic, vector size, vector rgb, float alpha, float flag) = #322;
float	drawfill(vector position, vector size, vector rgb, float alpha, float flag) = #323;
void	drawsetcliparea(float x, float y, float width, float height) = #324;
void	drawresetcliparea(void) = #325;

// CSQC stat builtins
// coerent names with the server functions by krimzon
float (float statnum)	GetStat_FLOAT           = #330;
float (float statnum)	GetStat_FLOAT_TRUNCATED = #331;
float(float statnum, float first, float count) GetStat_BITS = #331; // only needed for STAT_ITEMS
string (float statnum)	GetStat_STRING          = #332;

// client side centerprint and print
void (string s, ...)	cprint = #338;
void (string s, ...)	print = #339;

// csqc
void (entity e, float i)					setmodelindex = #333;
string (float i)							modelnameforindex = #334;

float(string efname)						particleseffectforname = #335;
void(entity ent, float effectnum, vector start, vector end, ...)	trailparticles = #336;
void (float efnum, vector org, vector vel, float countmultiplier)	pointparticles = #337;

// csqc input thingy
float(float framenum)	CL_getinputstate = #345;

void (float scale)		setsensitivityscale = #347;

void (float framenum)	RetrieveMovementFrame = #345;
void ()					DefaultPlayerPhysics = #347;

string (float playernum, string key)	getplayerkey = #348;
void (string cmdname)	registercmd = #352;
vector ()				getmousepos = #344;

float ()				playernum = #354;

void (vector org, vector forward, vector right, vector up) setlistener = #351;

float (vector start, vector end, float ignore, float csqcents) selecttraceline = #355;
float ()				isdemo = #349;
float ()				isserver = #350;

void (float f)			setwantsmousemove = #343;
string (float key)		getkeybind = #342;

float () onground = #355;

// CSQC manual drawing
void(string texturename, ...) R_BeginPolygon = #306;
void(vector org, vector texcoords, vector rgb, float alpha) R_PolygonVertex = #307;
void() R_EndPolygon = #308;

float(string s) tokenize = #441;
string(float n) argv = #442;

float(string s, float num) charindex = #356;
float(float a, float b) min = #94;
float(float a, float b, float c) min3 = #94;
float(float a, float b, float c, float d) min4 = #94;
float(float a, float b, float c, float d, float e) min5 = #94;
float(float a, float b, float c, float d, float e, float f) min6 = #94;
float(float a, float b, float c, float d, float e, float f, float g) min7 = #94;
float(float a, float b, float c, float d, float e, float f, float g, float h) min8 = #94;
float(float a, float b) max = #95;
float(float a, float b, float c) max3 = #95;
float(float a, float b, float c, float d) max4 = #95;
float(float a, float b, float c, float d, float e) max5 = #95;
float(float a, float b, float c, float d, float e, float f) max6 = #95;
float(float a, float b, float c, float d, float e, float f, float g) max7 = #95;
float(float a, float b, float c, float d, float e, float f, float g, float h) max8 = #95;
//float		deathmatch;

vector(vector forward, vector up) vectoangles2 = #51;

float E_ACTIVE 	    = 0; // float 0/1
float E_ORIGIN      = 1; // vector
float E_FORWARD     = 2; // vector
float E_RIGHT       = 3; // vector
float E_UP          = 4; // vector
float E_SCALE       = 5; // float
float E_ORIGINANDVECTORS = 6; // returns origin, + sets v_* vectors to orientation
float E_ALPHA       = 7; // float
float E_COLORMOD    = 8; // vector
float E_PANTSCOLOR  = 9; // vector
float E_SHIRTCOLOR  = 10; // vector
float E_SKIN        = 11; // float
float E_MINS        = 12; // vector
float E_MAXS        = 13; // vector
float E_ABSMIN      = 14; // vector
float E_ABSMAX      = 15; // vector
float E_LIGHT       = 16; // vector - modellight
// builtin definitions:
float(float entitynum, float fldnum) getentity = #504;
vector(float entitynum, float fldnum) getentityvec = #504;
vector(float property) getpropertyvec = #303;