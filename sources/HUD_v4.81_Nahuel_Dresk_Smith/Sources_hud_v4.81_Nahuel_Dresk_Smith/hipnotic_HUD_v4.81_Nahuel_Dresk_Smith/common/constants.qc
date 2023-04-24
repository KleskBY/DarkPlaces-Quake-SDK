/*

common/constants.qc

Constants which are present on both client and server.

*/

// helpful things

float TRUE  = 1;
float FALSE = 0;

float EXTRA_LOW = -99999999;
float EXTRA_HIGH = 99999999;

vector VEC_1  = '1 1 1';
vector VEC_0  = '0 0 0';
vector VEC_M1 = '-1 -1 -1';

float M_PI = 3.14159265358979323846;

// network update types
float NT_PLAYER = 2;

// entity effects
float EF_BRIGHTFIELD = 1;
float EF_MUZZLEFLASH = 2;
float EF_BRIGHTLIGHT = 4;
float EF_DIMLIGHT    = 8;

// items
float IT_AXE              = 4096;
float IT_SHOTGUN          = 1;
float IT_SUPER_SHOTGUN    = 2;
float IT_NAILGUN          = 4;
float IT_SUPER_NAILGUN    = 8;
float IT_GRENADE_LAUNCHER = 16;
float IT_ROCKET_LAUNCHER  = 32;
float IT_LIGHTNING        = 64;
//float IT_EXTRA_WEAPON     = 128;
float IT_MJOLNIR 	  = 128;
float IT_LASER_CANNON = 8388608;

float IT_SHELLS           = 256;
float IT_NAILS            = 512;
float IT_ROCKETS          = 1024;
float IT_CELLS            = 2048;
float IT_ARMOR1           = 8192;
float IT_ARMOR2           = 16384;
float IT_ARMOR3           = 32768;
float IT_PROXIMITY_GUN    = 65536;
//float IT_SUPERHEALTH      = 65536;
float IT_KEY1             = 131072;
float IT_KEY2             = 262144;
float IT_INVISIBILITY     = 524288;
float IT_INVULNERABILITY  = 1048576;
float IT_SUIT             = 2097152;
float IT_QUAD             = 4194304;

float HIP_IT_WETSUIT = 2;
float HIP_IT_EMPATY_SHIELD = 4;
float HIP_IT_HORN_OF_CONJURING = 8;

// mod stats
//float STAT_COMPASS_NORTH = 34;
