

////////////////////////////////////////
///////////////// DEFS /////////////////
////////////////////////////////////////


float	FL_LADDERJUMP			= 8192;	// for ladders

vector DUCK_SIZE_MIN = '-16 -16 -24';//VEC_HULL_MIN;
vector DUCK_SIZE_MAX = /*VEC_HULL_MAX*/'16 16 32' - '0 0 15';

float AUTOJUMP = 1;
float JUMPCOOLDOWN = 0.85;
float AUTOBOTS = 0;
float AUTORELOAD = 1;
float PUSHING_FACTOR = 5;

float HITBOX_HEAD = 1;
float HITBOX_LEGS = 0;
float HITBOX_BODY = -1;

float WP_KNIFE = 1;
float WP_PISTOL = 2;
float WP_SHOTGUN = 4;
float WP_SHOT = 4;
float WP_RIFLE = 8;
float WP_AK74 = 8;
float WP_SNIPER = 16;
float WP_GRENADE = 32;
float WP_HAMMER = 64;
float WP_COLT = 2;
float WP_M4 = 256;
float WP_BARRET = 512;

float	IT_KNIFE			= 1;
float	IT_PM				= 2;
float	IT_TOZ				= 4;
float	IT_AKM				= 8;
float	IT_MOSIN			= 16;
float	IT_GRENADE			= 32;
float	IT_HAMMER			= 64;
float	IT_BOMB				= 128;

// float	IT_ROCKETS				= 256;
// float	IT_SHELLS				= 512;

float IT_SHELLS = 256;
float IT_ROCKETS = 1024;
float	IT_9x18					= 1024;
float	IT_545x39				= 2048;
float	IT_762x54				= 4096;
float	IT_BARRICADES			= 8192;


float	IT_ARMOR2				= 16384;
float	IT_ARMOR3				= 32768;
float	IT_SUPERHEALTH			= 65536;

float SoundRadius(float radius)
{
	return (800 / radius);
//	return ((cvar("snd_soundradius") / 1.5) / radius);
}


float MODE_COOP = 0;
float MODE_DM = 1;
float MODE_TDM = 2;
float MODE_DE = 3;
float MODE_HNS = 4;
float MODE_KZ = 5;
float MODE_ZM = 6;

float STAT_ZOOM = 32;
float STAT_TOTALITEMS = 33;
float STAT_PICKED_ITEMS = 34;
float STAT_SHOTS = 35;
float STAT_HITS = 36;

////////////////////////////////////////
//////////////// FIELDS ////////////////
////////////////////////////////////////

.float reload;
.float hgrenade;
.float hitbox;
.float ammoPistol, ammoShells, ammoRifle, ammoGrenades, ammoSniper, ammoBarricades;
.float duck;
.float walk;
.float ShootsFired;

.void() weaponAttack;
.void() weaponSwitch;
.void() weaponReload;
.void() weaponSelect;

.float currentClip;
.float weaponfired;
.float grenadetime;
.float weapons;
.float item;

.float picked_items;
.float total_shots;
.float total_hits;

.float barricade_flag;
.entity hook;
.float hooking;
.float timer;
.vector lastAngles;

.float lastTouch;
.float anim_finished;
.float footstep_finished;
.float lastNametag;

.entity gun;






