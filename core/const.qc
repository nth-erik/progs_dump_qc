/*
==============================================================================

Customizable Variables

These variables are NOT used by the engine, so they can be freely modified to
tailor the code for the required gameplay experience.

==============================================================================
*/



/*
=================================================
Constants that identify specific immutable values
=================================================
*/

/*
-----------------------------
Customization name

The name of the customization
-----------------------------
*/
string MOD_NAME = "\nprogs_dump devkit \bGIBLETS\b";

/*
-----------------------------------
Version number

The current version number
Inspired by Copper Quake (@Lunaran)
-----------------------------------
*/
string VERSION = "\nversion 2.0.0-gibs";

/*
-------------------------------------------------------
Logical values

Binary logic is represented with numbers
Any non-zero value is interpreted as "true"
Use TRUE only when you expect that exact value
Use comparison operators when you're testing for chance
-------------------------------------------------------
*/
float FALSE = 0;
float TRUE = 1;

/*
---------------------------------------------------------
World type enums

Numbers representing default item ambiance
Set in map and used for default key styles
Check against world.worldtype

  0: Medieval a.k.a. "Wizard" - uses physical keys
  1: Metal a.k.a. "Runic" - uses gravity-defying runekeys
  2: Base a.k.a. "Modern" - uses 80's sci-fi keycards
---------------------------------------------------------
*/
float WORLDTYPE_MEDIEVAL = 0;
float WORLDTYPE_METAL = 1;
float WORLDTYPE_BASE = 2;

/*
--------------------------------------------------------------------------
Entity state flags

Numbers representing default item ambiance
Set in map and used for default key styles
Use these to set/check entity.flags

  1: Fly
  2: Swim
  4: (unused)
  8: Client (set for every client)
  16: In water (entity touches liquid)
  32: Monster (set for every monster)
  64: God mode (god mode cheat active)
  128: No target (no monster wake cheat active)
  256: Item (extra width for pickup)
  512: On ground (all 4 bottom corners on horizontal surface)
  1024: Partial ground (some bottom corners are not on horizontal surface)
  2048: Water jump (currently "jumping" out of water)
  4096: Jump released (player must not bunnyhop" automatically)
--------------------------------------------------------------------------
*/
float FL_FLY = 1;
float FL_SWIM = 2;
float FL_CLIENT = 8;
float FL_INWATER = 16;
float FL_MONSTER = 32;
float FL_GODMODE = 64;
float FL_NOTARGET = 128;
float FL_ITEM = 256;
float FL_ONGROUND = 512;
float FL_PARTIALGROUND = 1024;
float FL_WATERJUMP = 2048;
float FL_JUMPRELEASED = 4096;

/*
------------------------------------------------------------------------------
Move type enums

Numbers representing various movement and interaction types
Use these with entity.movetype to define their behavior

  0: None (ignores gravity, ignores collision)
  1: Angle-noclip (unused, unverified)
  2: Angle-clip (unused, unverified)
  3: Walk (moves realtime, applies gravity, applies collision, used by player)
  4: Step (moves frame-by-frame, applies gravity, applies collision)
  5: Fly (ignores gravity, applies collision)
  6: Toss (applies gravity, applies collision)
  7: Push (ignores gravity, applies entity collision, used by func)
  8: No-clip (moves, ignores gravity, ignores collision)
  9: Fly-missile (ignores gravity, applies collision, add volume for monsters)
  10: Bounce (applies gravity, applies bouncy collision)
  11: Bounce-missile (applies gravity, applies bouncy collision, add volume
      for monsters)
------------------------------------------------------------------------------
*/
float MOVETYPE_NONE = 0;
//float MOVETYPE_ANGLENOCLIP = 1;
//float MOVETYPE_ANGLECLIP = 2;
float MOVETYPE_WALK = 3;
float MOVETYPE_STEP = 4;
float MOVETYPE_FLY = 5;
float MOVETYPE_TOSS = 6;
float MOVETYPE_PUSH = 7;
float MOVETYPE_NOCLIP = 8;
float MOVETYPE_FLYMISSILE = 9;
float MOVETYPE_BOUNCE = 10;
float MOVETYPE_BOUNCEMISSILE = 11;

/*
---------------------------------------------------
Collision type enums

Numbers representing entity collision types
Use with entity.solid

0: Not (pass-thru, untouchable)
  1: Trigger (pass-thru, touchable)
  2: Bounding-box (blocking, touchable, on-ground)
  3: Slide-box (blocking, touchable, NOT on-ground)
  4: BSP (blocking, touchable, on-ground, sloped)
---------------------------------------------------
*/
float SOLID_NOT = 0;
float SOLID_TRIGGER = 1;
float SOLID_BBOX = 2;
float SOLID_SLIDEBOX = 3;
float SOLID_BSP = 4;

/*
------------------------------------------
Range tier enums

Used for monster AI decisions

  0: Melee (maximum melee attack range)
  1: Near (maximum leap attack range)
  2: Mid (maximum projectile attack range)
  3: Far (maximum wake range)
  4: Out (unused, out of range)
------------------------------------------
*/
float RANGE_MELEE = 0;
float RANGE_NEAR = 1;
float RANGE_MID = 2;
float RANGE_FAR = 3;
float RANGE_OUT = 3;

/*
-----------------------------------
Death state enums

Represents entity's stage of dying
Use with entity.deadflag

  0: No (alive)
  1: Dying (collapsing)
  2: Dead (no longer moving)
  3: Respawnable (awaiting respawn)
-----------------------------------
*/
float DEAD_NO = 0;
float DEAD_DYING = 1;
float DEAD_DEAD = 2;
float DEAD_RESPAWNABLE = 3;

/*
-------------------------------------------------
Damage taking enums

Represents entity's projectile interaction type
Use with entity.takedamage

  0: No (cannot be damaged)
  1: Yes (takes damage, doesn't set off grenades)
  2: Aim (takes damage, sets off grenades)
-------------------------------------------------
*/
float DAMAGE_NO = 0;
float DAMAGE_YES = 1;
float DAMAGE_AIM = 2;

/*
---------------------------------------
Item flags

Entity's current inventory items
Use with entity.items and entity.weapon

  1: shotgun
  2: double-barreled shotgun
  4: nailgun
  8: perforator
  16: grenade launcher
  32: rocket launcher
  64: thunderbolt
  128: unused weapon 9
  4096: axe

  256: shells
  512: nails
  1024: rockets
  2048: cells

  8192: green armor
  16384: yellow armor
  32768: red armor
  65536: megahealth

  131072: silver key
  262144: gold key

  524288: ring of shadows
  1048576: pentagram of protection
  2097152: biosuit
  4194304: quad damage
---------------------------------------
*/
float IT_SHOTGUN = 1;
float IT_SUPER_SHOTGUN = 2;
float IT_NAILGUN = 4;
float IT_SUPER_NAILGUN = 8;
float IT_GRENADE_LAUNCHER = 16;
float IT_ROCKET_LAUNCHER = 32;
float IT_LIGHTNING = 64;
float IT_EXTRA_WEAPON = 128;
float IT_AXE = 4096;

float IT_SHELLS = 256;
float IT_NAILS = 512;
float IT_ROCKETS = 1024;
float IT_CELLS = 2048;

float IT_ARMOR1 = 8192;
float IT_ARMOR2 = 16384;
float IT_ARMOR3 = 32768;
float IT_SUPERHEALTH = 65536;

float IT_KEY1 = 131072;
float IT_KEY2 = 262144;

float IT_INVISIBILITY = 524288;
float IT_INVULNERABILITY = 1048576;
float IT_SUIT = 2097152;
float IT_QUAD = 4194304;

/*
---------------------------------------------
Point content enums

The environment relating to a point or entity
Use with pointcontents() and entity.watertype

  -1: Empty (air)
  -2: Solid (wall)
  -3: Water
  -4: Slime (low damage)
  -5: Lava (high frequent damage)
  -6: Sky (despawns projectiles)
---------------------------------------------
*/
float CONTENT_EMPTY = -1;
float CONTENT_SOLID = -2;
float CONTENT_WATER = -3;
float CONTENT_SLIME = -4;
float CONTENT_LAVA = -5;
float CONTENT_SKY = -6;

/*
-------------------------------------
Activation state enums

Brush entity activation/motion states
Use with entity.state

  0: Top
  1: Bottom
  2: Up (moving to top)
  3: Down (moving to bottom)
-------------------------------------
*/
float STATE_TOP = 0;
float STATE_BOTTOM = 1;
float STATE_UP = 2;
float STATE_DOWN = 3;

/*
----------------------------------------------------
Entity bounding box vectors

Dimensions of various entities
Use with setsize() and entity.size

  '0 0 0': Relative origin
  '-16 -16 -24': Human sized left rear bottom corner
  '16 16 32': Human sized right front top corner
  '32 32 56': Human spatial diagonal size
  '-32 -32 -24': Beast sized left rear bottom corner
  '32 32 64': Beast sized right front top corner
  '64 64 88': Beast spatial diagonal size
----------------------------------------------------
*/
vector VEC_ORIGIN = '0 0 0';
vector VEC_HULL_MIN = '-16 -16 -24';
vector VEC_HULL_MAX = '16 16 32';
vector VEC_HULL_SIZE = '32 32 56';
vector VEC_HULL2_MIN = '-32 -32 -24';
vector VEC_HULL2_MAX = '32 32 64';
vector VEC_HULL2_SIZE = '64 64 88';

/*
--------------------------------------------------------------
Server message protocol prefix byte enums

Use with WriteByte()

  3: Hipnotic monster stat update
  5: (unused) Report Hipnotic Drake devkit camera viewport set
  10: (unused) Report Hipnotic Drake devkit camera angles set
  23: Report start of temporary entity
  27: Report +1 monster killed
  28: Report +1 secret found
  30: Report start of intermission
  31: Report start of episode finale paragraph
  32: Report start of changing the CD track
  33: Report shareware completed, enter shill mode
  34: (unused) Report Hipnotic Drake devkit cutscene start
--------------------------------------------------------------
*/
float SVC_UPDATESTAT = 3;
float SVC_SETVIEWPORT = 5;
float SVC_SETVIEWANGLES = 10;
float SVC_TEMPENTITY = 23;
float SVC_KILLEDMONSTER = 27;
float SVC_FOUNDSECRET = 28;
float SVC_INTERMISSION = 30;
float SVC_FINALE = 31;
float SVC_CDTRACK = 32;
float SVC_SELLSCREEN = 33;
float SVC_CUTSCENE = 34;

/*
---------------------------------------------
Server message temporary entity type enums

Special effects generated on impact/explosion
Use with WriteByte() after SVC_TEMPENTITY

  0: nail impact
  1: super nail impact
  2: shell or axe impact
  3: explosion
  4: spawn monster explosion
  5: shambler lightning
  6: thunderbolt lightning
  7: scrag splat
  8: death knight spark
  9: terminal lightning (Chthon map)
  10: lava splash
  11: teleport splash
  12: mini-grenade explosion (from DoE)
---------------------------------------------
*/
float TE_SPIKE = 0;
float TE_SUPERSPIKE = 1;
float TE_GUNSHOT = 2;
float TE_EXPLOSION = 3;
float TE_EXPLOSION2 = 12;
float TE_TAREXPLOSION = 4;
float TE_LIGHTNING1 = 5;
float TE_LIGHTNING2 = 6;
float TE_WIZSPIKE = 7;
float TE_KNIGHTSPIKE = 8;
float TE_LIGHTNING3 = 9;
float TE_LAVASPLASH = 10;
float TE_TELEPORT = 11;

/*
----------------------------------------
Sound channel enum

Use with sound()
Channel 0 never willingly overrides
Channels 1-7 always override their sound

  0: Automatic
  1: Weapon sound
  2: Character voice
  3: Powerup signal
  4: Foliage noise
  5: (misc.)
  6: (misc.)
  7: (misc.)
----------------------------------------
*/
float CHAN_AUTO = 0;
float CHAN_WEAPON = 1;
float CHAN_VOICE = 2;
float CHAN_ITEM = 3;
float CHAN_BODY = 4;

/*
----------------------------------------
Sound attenuation level enum

Volume falloff levels
Use with sound()

  0: no falloff, heard everywhere
  1: normal, loud falloff
  2: idle, near falloff
  3: ambient sound falloff
----------------------------------------
*/
float ATTN_NONE = 0;
float ATTN_NORM = 1;
float ATTN_IDLE = 2;
float ATTN_STATIC = 3;

/*
--------------------
Update type enums

(unused, unverified)
--------------------
*/
float UPDATE_GENERAL = 0;
float UPDATE_STATIC = 1;
float UPDATE_BINARY = 2;
float UPDATE_TEMP = 3;

/*
--------------------------------------
Entity effect flags

Entity's special effects

  1: Bright field (with particles)
  2: Muzzle flash (once)
  4: Bright light
  8: Dim light (e.g. laser projectile)
--------------------------------------
*/
float EF_BRIGHTFIELD = 1;
float EF_MUZZLEFLASH = 2;
float EF_BRIGHTLIGHT = 4;
float EF_DIMLIGHT = 8;

/*
--------------------------------------
Message type enums

Use with Write*()

  0: Broadcast (unreliable for all)
  1: One (reliable for entity)
  2: All (reliable for all)
  3: Init (written to init string)
--------------------------------------
*/
float MSG_BROADCAST = 0;
float MSG_ONE = 1;
float MSG_ALL = 2;
float MSG_INIT = 3;

/*
-------------------------
func_movewall spawn flags

  1: Visible
  2: Touchable
  4: Non-blocking
-------------------------
*/
float MOVEWALL_VISIBLE = 1;
float MOVEWALL_TOUCH = 2;
float MOVEWALL_NONBLOCKING = 4;

/*
-------------------------------------------------
Release version enums

(credits to iw)
Used for circumventing quirks of certain releases

  0: Not
  1: ID1
  2: func_mapjamx
-------------------------------------------------
*/
float KNOWN_RELEASE_NOT = 0;
float KNOWN_RELEASE_ID1 = 1;
float KNOWN_RELEASE_FUNC_MAPJAMX = 2;

/*
--------------------------------------------------------------
Null string

Should be left empty

Obsolete:
  - string_null
--------------------------------------------------------------
*/
string STRING_NULL;

/*
-----------------------------------------------------
Monster attack state enum

The type of attack pattern the monster should execute

  1: Forward charge
  2: Strafe around
  3: Melee attack
  4: Ranged attack (leap or projectile)
-----------------------------------------------------
*/
float AS_STRAIGHT = 1;
float AS_SLIDING = 2;
float AS_MELEE = 3;
float AS_MISSILE = 4;

/*
------------------------------------
Total monsters message

Hipnotic total monsters stat message
------------------------------------
*/
float STAT_TOTALMONSTERS = 12;

/*
----------------------------------------------
Rubicon2 breakable spawnflags

  1: Not breakable by monsters
  2: Explodes on break
  3: Custom break models

Credits to johnfitz, Qmaster, iw, dumptruck_ds
----------------------------------------------
*/
float BREAKABLE_NO_MONSTERS = 1;
float BREAK_EXPLODE = 2;
float BREAK_CUSTOM = 4;

/*
----------------------------------------
Light spawnflags

Spawnflags for lights from Slipgate mod:

  1: Starts off
  2: Fade in and out on trigger
  4: Silent (torch only)

Credits to c0burn
----------------------------------------
*/
float START_OFF = 1;
float FADE_IN_OUT = 2;
float SILENT_TORCH = 4;

/*
---------------------------
Rubicon2 spark spawnflags

  2: Use blue sparks
  4: Use pale yellow sparks

Credits to c0burn
---------------------------
*/
float SPARKS_BLUE = 2;
float SPARKS_PALE = 4;

/*
--------------------------
Healing trigger spawnflags

  1: Start active
  2: Heals player only
  4: Heals monster only
--------------------------
*/
float HEAL_START_ON = 1;
float HEAL_PLAYER_ONLY = 2;
float HEAL_MONSTER_ONLY = 4;

/*
-------------------------
Rubicon2 laser spawnflags

  2: Blocks movement
-------------------------
*/
float LASER_SOLID = 2;