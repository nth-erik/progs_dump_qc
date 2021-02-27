/*
==============================================================================

Customizable Constants

These constants are NOT used by the engine, so they can be freely modified to
tailor the code for the required gameplay experience.

Use the following regular expressions to find stray constants:

To match e.g. "string AB1_23C   =":
(//)?[\s]*(float|string|vector)+\s+[A-Z0-9_]+\s*=

To match e.g. "float  Ab1_23c   = 4096":
(//)?[\s]*(float|string|vector)+\s+\w+\s*=\s*\d+;

Note:
  - You can open Search using <Ctrl + F> in most editors
  - Some editors use e.g. <Ctrl + Shift + F> for searching in open project
  - Search fields usually toggle regular expression input with a ".*" button
  - Check if the matched values never changes or are never intended to change

==============================================================================
*/



/*
=======================
Meta values for the mod
=======================
*/

/*
-----------------------------
Customization name

The name of the customization
-----------------------------
*/
string MOD_NAME = "\nprogs_dump devkit \bGIBLETS\b";

/*
--------------------------
Version number

The current version number
Inspired by Copper Quake

Credits to Lunaran
--------------------------
*/
string VERSION = "\nversion 2.0.1-gibs";

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
===============
General purpose
===============
*/

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
--------------------------------------------------------------
Null string

Should be left empty

Obsolete:
  - string_null
--------------------------------------------------------------
*/
string STRING_NULL;



/*
=====
World
=====
*/

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
========
Entities
========
*/

/*
--------------------------------------------------------------------------
Entity state flags

Numbers representing default item ambiance
Set in map and used for default key styles
Use these to set/check entity.flags

  1:    Fly
  2:    Swim
  4:    (unused)
  8:    Client (set for every client)
  16:   In water (entity touches liquid)
  32:   Monster (set for every monster)
  64:   God mode (god mode cheat active)
  128:  No target (no monster wake cheat active)
  256:  Item (extra width for pickup)
  512:  On ground (all 4 bottom corners on horizontal surface)
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

  0:  None (ignores gravity, ignores collision)
  1:  Angle-noclip (unused, unverified)
  2:  Angle-clip (unused, unverified)
  3:  Walk (moves realtime, applies gravity, applies collision, used by
      player)
  4:  Step (moves frame-by-frame, applies gravity, applies collision)
  5:  Fly (ignores gravity, applies collision)
  6:  Toss (applies gravity, applies collision)
  7:  Push (ignores gravity, applies entity collision, used by func)
  8:  No-clip (moves, ignores gravity, ignores collision)
  9:  Fly-missile (ignores gravity, applies collision, add volume for monsters)
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
//float RANGE_OUT = 4;

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
--------------------------------------------
Spawn inhibition spawnflags

  256:   Not on Easy skill
  512:   Not on Normal skill
  1024:  Not on Hard or Nightmare skill
  2048:  Not in Deathmatch mode
  4096:  Not in Cooperative mode
  8192:  Not in Single Player mode
  32768: Not on Hard skill specifically
  65536: Not on Nightmare skill specifically
--------------------------------------------
*/
float SPAWNFLAG_NOT_ON_SKILL0 = 256;
float SPAWNFLAG_NOT_ON_SKILL1 = 512;
float SPAWNFLAG_NOT_ON_SKILL2_3 = 1024;
float SPAWNFLAG_NOT_IN_DM = 2048;
float SPAWNFLAG_NOT_IN_COOP = 4096;
float SPAWNFLAG_NOT_IN_SP = 8192;
float SPAWNFLAG_NOT_ON_SKILL2 = 32768;
float SPAWNFLAG_NOT_ON_SKILL3 = 65536;

/*
------------------------------
Teleport train spawnflags

  2: Don't rotate
  4: Start on even with target
  8: Invisible

Credits to TheSolipsist
------------------------------
*/
float TTRAIN_NOSPIN = 2;
float TTRAIN_STARTON = 4;
float TTRAIN_INVISIBLE = 8;


/*
========
Messages
========
*/

/*
--------------------------------------------------------------
Server message protocol prefix byte enums

Use with WriteByte()

  3:  Hipnotic monster stat update
  5:  (unused) Report Hipnotic Drake devkit camera viewport set
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
//float SVC_SETVIEWPORT = 5;
//float SVC_SETVIEWANGLES = 10;
float SVC_TEMPENTITY = 23;
float SVC_KILLEDMONSTER = 27;
float SVC_FOUNDSECRET = 28;
float SVC_INTERMISSION = 30;
float SVC_FINALE = 31;
float SVC_CDTRACK = 32;
float SVC_SELLSCREEN = 33;
//float SVC_CUTSCENE = 34;

/*
---------------------------------------------
Server message temporary entity type enums

Special effects generated on impact/explosion
Use with WriteByte() after SVC_TEMPENTITY

  0:  nail impact
  1:  super nail impact
  2:  shell or axe impact
  3:  explosion
  4:  spawn monster explosion
  5:  shambler lightning
  6:  thunderbolt lightning
  7:  scrag splat
  8:  death knight spark
  9:  terminal lightning (Chthon map)
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
--------------------
Update type enums

(unused, unverified)
--------------------
*/
//float UPDATE_GENERAL = 0;
//float UPDATE_STATIC = 1;
//float UPDATE_BINARY = 2;
//float UPDATE_TEMP = 3;

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
=======
Effects
=======
*/

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
-------------------------
Rubicon2 laser spawnflags

  2: Blocks movement
-------------------------
*/
float LASER_SOLID = 2;

/*
------------------
dtquake spawnflags
------------------
*/
float VIEWONLY = 1;

/*
-----------------------------------
Hipnotic particle effect spawnflags

  1: Uses other.cnt

Credits to Jim Dosé
-----------------------------------
*/
float USE_COUNT = 1;

/*
----------------------------------
Hipnotic sound spawnflags

  1: Toggles on/off when activated

Credits to TheSolipsist
----------------------------------
*/
float SOUND_TOGGLE = 1;

/*
-----------------------
dtmisc gib spawnflags

  1: Solid bounding box
  2: Alternate frame

Credits to TheSolipsist
-----------------------
*/
float GIB_SOLID = 1;
float GIB_ALT = 2;



/*
============
Func brushes
============
*/

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
-----------------
dtmisc spawnflags

Credits to RennyC
-----------------
*/
float DONT_FADE = 1;

/*
------------------------------------------------------------
DoE platform spawnflags

  1:  Call down, wait .health seconds, return up
  2:  Toggle up/down on each trigger
  4:  Moves equal distances up and down
  8:  Indicates that elevator is initially at the top floor
  16: Fixed version of func_plat at top position
  32: (unused) Fixed version of func_plat at bottom position

Credits to pmack
------------------------------------------------------------
*/
float DN_N_WAIT = 1;
float PLT_TOGGLE = 2;
float ELEVATOR = 4;
float START_AT_TOP = 8;
float PLAT2 = 16;
//float PLAT2_BOTTOM = 32;

/*
--------------------------------------------
Door spawnflags

  1:  Open state is default
  4:  Don't join trigger with touching doors
  8:  Requires gold key
  16: Requires silver key
  32: Toggles when triggered
  64: Doesn't take away the key
--------------------------------------------
*/
float DOOR_START_OPEN = 1;
float DOOR_DONT_LINK = 4;
float DOOR_GOLD_KEY = 8;
float DOOR_SILVER_KEY = 16;
float DOOR_TOGGLE = 32;
float DOOR_DOOM_STYLE_UNLOCK = 64;

/*
------------------------------------------------------
Secret door spawnflags

  1:  Stays open
  2:  Shifts 90° left of the opening angle before open
  4:  Shifts downward before open
  8:  Cannot be shot open (only triggered)
  16: Shootable despite being targeted by trigger
------------------------------------------------------
*/
float SECRET_OPEN_ONCE = 1;
float SECRET_1ST_LEFT = 2;
float SECRET_1ST_DOWN = 4;
float SECRET_NO_SHOOT = 8;
float SECRET_YES_SHOOT = 16;

/*
--------------------------
Elevator button spawnflags

  1: Move target downward
--------------------------
*/
float ELVTR_DOWN = 1;

/*
------------------------------------------------------
Bobbing brush spawnflags

  2: Collide model
  4: Illusion only (SOLID_NOT)

Note: BOB_COLLISION doesn't really make sense
------------------------------------------------------
*/
float BOB_COLLISION = 2;
float BOB_NONSOLID = 4;

/*
----------------------------------------
Falling brush 2 spawnflags

  1: Breaks only when touched by player
  2: Breaks only when touched by monster
----------------------------------------
*/
float	PLAYER_TRIGGERED = 1;
float	MONSTER_TRIGGERED = 2;

/*
---------------------------
Platform spawnflags

  1: Low-height trigger box
---------------------------
*/
float PLAT_LOW_TRIGGER = 1;

/*
----------------------------
Train spawnflags

  1: Resumes movement on use

Credits to johnfitz
----------------------------
*/
float TRAIN_RETRIGGER = 1;

/*
----------------------------------
Hipnotic rotating brush spawnflags

  1: Activation toggles rotating
  2: Start activated

Credits to Jim Dosé
----------------------------------
*/
float ROTATE_ENTITY_TOGGLE = 1;
float ROTATE_ENTITY_START_ON = 2;

/*
------------------------------------------------
Hipnotic rotating train and path spawnflags

  1:  Rotate at rate specified by "rotate"
  2:  Rotate to the angles specified by "angles"
  4:  Stop moving until retrigger
  8:  Stop rotating until retrigger
  16: Cause "dmg" damage on crush
  32: Interpret speed as duration between points
  64: Sets damage of target(s) to "dmg"

Credits to Jim Dosé
------------------------------------------------
*/
float PATH_ROTATE_ROTATION = 1;
float PATH_ROTATE_ANGLES = 2;
float PATH_ROTATE_STOP = 4;
float PATH_ROTATE_NO_ROTATE = 8;
float PATH_ROTATE_DAMAGE = 16;
float PATH_ROTATE_MOVETIME = 32;
float PATH_ROTATE_SET_DAMAGE = 64;

/*
---------------------------------
Hipnotic rotating door spawnflags

  1:  Door doesn't close

Credits to Jim Dosé
---------------------------------
*/
float ROTATE_DOOR_STAYOPEN = 1;

/*
--------------------
Rotation states

  0: At top speed
  1: At bottom speed
  2: Accelerating
  3: Decelerating

Credits to Jim Dosé
--------------------
*/
float STATE_ACTIVE = 0;
float STATE_INACTIVE = 1;
float STATE_SPEEDINGUP = 2;
float STATE_SLOWINGDOWN = 3;

/*
-------------------------
Rotating door states

  0: Closed
  1: Opened
  2: Moving toward opened
  3: Moving toward closed

Credits to Jim Dosé
-------------------------
*/
float STATE_CLOSED = 4;
float STATE_OPEN = 5;
float STATE_OPENING = 6;
float STATE_CLOSING = 7;

/*
--------------------------------
Rotation states

  0: Waiting (may still damage)
  1: Moving
  2: Stopped (no longer damages)
  3: Looking for path_rotate
  4: Switching path_rotate

Credits to Jim Dosé
--------------------------------
*/
float STATE_WAIT = 0;
float STATE_MOVE = 1;
float STATE_STOP = 2;
float STATE_FIND = 3;
float STATE_NEXT = 4;

/*
-------------------------------
Hipnotic rotating object values

Used for rotating stuff

Credits to Jim Dosé
-------------------------------
*/
float OBJECT_ROTATE = 0;
float OBJECT_MOVEWALL = 1;
float OBJECT_SETORIGIN = 2;

/*
--------------------------------
DoE lightning spawnflags

  1: Stays on/off when activated
  2: Currently active

Credits to pmack
--------------------------------
*/
float LT_TOGGLE =	1;
float LT_ACTIVE = 2;

/*
------------------------------------
Hipnotic counter brush spawnflags

  1:  Toggle on/off on activation
  2:  Loop counting when finished
  4:  Increment once when activated
  8:  Reset to zero when finished
  16: Randomize between 1 and .count
  32: Keep counting until finished
  64: Start active

Credits to Jim Dosé
------------------------------------
*/
float COUNTER_TOGGLE = 1;
float COUNTER_LOOP = 2;
float COUNTER_STEP = 4;
float COUNTER_RESET = 8;
float COUNTER_RANDOM = 16;
float COUNTER_FINISHCOUNT = 32;
float COUNTER_START_ON = 64;



/*
=======
Pickups
=======
*/

/*
---------------------------------------
Item flags

Entity's current inventory items
Use with entity.items and entity.weapon

  1:       shotgun
  2:       double-barreled shotgun
  4:       nailgun
  8:       perforator
  16:      grenade launcher
  32:      rocket launcher
  64:      thunderbolt
  128:     unused weapon 9
  4096:    axe

  256:     shells
  512:     nails
  1024:    rockets
  2048:    cells

  8192:    green armor
  16384:   yellow armor
  32768:   red armor
  65536:   megahealth

  131072:  silver key
  262144:  gold key

  524288:  ring of shadows
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
//float IT_EXTRA_WEAPON = 128;
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
-----------------
Health spawnflags

  1: Expired box
  2: Megahealth
  4: Vial
-----------------
*/
float	H_ROTTEN = 1;
float	H_MEGA = 2;
float H_VIAL = 4;

/*
---------------
Ammo spawnflags

  1: Large box
---------------
*/
float WEAPON_BIG2 = 1;

/*
---------------------
Backpack spawnflags

  1:  Contain all
  2:  Contain shells
  4:  Contain Nails
  8:  Contain rockets
  16: Contain cells
---------------------
*/
float DEFAULT = 1;
float SHELLS = 2;
float NAILS = 4;
float ROCKETS = 8;
float CELLS = 16;

/*
--------------------------
Custom key highest flag ID

Credits to dumptruck_ds
--------------------------
*/
float FINAL_CUSTOM_KEY = 4194304;

/*
---------------------------
Shotgun item spawnflags

  2: Rubicon2 style shotgun
  4: SlapMap style shotgun

Credits to TheSolipsist
---------------------------
*/
float SG_RUBICON2 = 2;
float SG_SLAPMAP = 4;

/*
-----------------------
Sigil item spawnflags

  1: Episode 1 rune
  2: Episode 2 rune
  4: Episode 3 rune
  8: Episode 4 rune

Credits to TheSolipsist
-----------------------
*/
float SIGIL_E1 = 1;
float SIGIL_E2 = 2;
float SIGIL_E3 = 4;
float SIGIL_E4 = 8;



/*
=======
Hazards
=======
*/

/*
---------------------------------
Shooter spawnflags

  1:   Shoots super nail
  2:   Shoots enforcer laser
  4:   Shoots Chthon lava ball
  8:   Shoots rocket
  16:  Shoots Vore magic
  32:  Shoots grenade
  64:  Shoots zombie gib
  128: Does not emit sound

Credits to Hipnotic, dumptruck_ds
MED 11/09/96
---------------------------------
*/
float SPAWNFLAG_SUPERSPIKE	= 1;
float SPAWNFLAG_LASER = 2;
float SPAWNFLAG_LAVABALL = 4;
float SPAWNFLAG_ROCKET = 8;
float SPAWNFLAG_VOREBALL = 16;
float SPAWNFLAG_GRENADE = 32;
float SPAWNFLAG_GIBS = 64;
float SPAWNFLAG_SILENT = 128;

/*
--------------------------
Ogre flak spawnflags

  4: Damage came from ogre
--------------------------
*/
float MONSTER_FLAK_OGRE = 4;

/*
----------------------------------
Ogre flak state flags

  8192: Ignored by entity selector
----------------------------------
*/
float	FL_NOSELECT = 8192;



/*
========
Monsters
========
*/

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
-------------------------------------
Generic monster spawnflags

  1:  Ambush
  2:  Ambush
  8:  Teleport spawn
  32: Wakes without roar

Credits to dumptruck_ds, TheSolipsist
-------------------------------------
*/

float MONSTER_AMBUSH1 = 1;
float MONSTER_AMBUSH2 = 2;
float MONSTER_AMBUSH3 = 3;
float MONSTER_SPAWNED = 8;
float NO_SIGHT_SOUND = 32;

/*
---------------------
Ogre grenade velocity

Credits to Preach
---------------------
*/
float OGRE_G_VEL = 600;

/*
------------------------------
Ogre out-of-range firing angle

Credits to Preach
------------------------------
*/
float OGRE_DEFAULT_ELEVATION = 30;

/*
----------------------------
Zombie spawnflags

  1:  Crucified
  4:  Crucified, not moving
  16: Start downed

Credits to Zer, dumptruck_ds
----------------------------
*/
float SPAWN_CRUCIFIED = 1;
float SPAWN_DEAD_CRUCIFIED = 4;
float SPAWN_SLEEPING = 16;



/*
========
Triggers
========
*/

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
--------------------------------------
Exit trigger spawnflags

Moves the trigger volume out of bounds

Credits to dumptruck_ds, TheSolipsist
--------------------------------------
*/
float NO_INTERMISSION = 1;
float DT_EXITOFF = 8;

/*
-------------------------------
Hipnotic trigger key spawnflags

Same as for doors

  8:  Requires silver key
  16: Requires gold key

Credits to Jim Dosé
-------------------------------
*/
float USE_SILV_KEY = 8;
float USE_GOLD_KEY = 16;

/*
-----------------------------------
Hipnotic gravity trigger spawnflags

  8: Starts off
-----------------------------------
*/
float DT_GRAVTOFF = 8;

/*
----------------------------------
Counter spawnflags

  1: Do not display count messages
----------------------------------
*/
float	SPAWNFLAG_NOMESSAGE = 1;

/*
----------------------------
General trigger spawnflags

  1: Only activate as target
----------------------------
*/
float	SPAWNFLAG_NOTOUCH = 1;

/*
-------------------------------------------------
Teleport trigger spawnflags

  1:  Only teleport players
  2:  Do not emit ambient noise
  4:  Teleports to any info_teleport_random
  8:  Doesn't create particle and sound effect
  16: Monster only
  32: Uses .noise field as target (player only)

Credits to Zerstrorer, Qmaster, dumptruck_ds, dhm
-------------------------------------------------
*/
float	PLAYER_ONLY	= 1;
float	SILENT = 2;
float RANDOM = 4;
float TELE_STEALTH = 8;
float MONSTER_ONLY = 16;
float TELE_DD = 32;

/*
--------------------------------
Custom push trigger spawnflags

  1:  Triggers only once
  8:  Starts inactive
  16: Doesn't make sound on push
  32: Use .noise field for sound

Credits to dumptruck_ds
--------------------------------
*/
float PUSH_ONCE = 1;
float DT_STARTOFF = 8;  // trigger will start off
float DT_SILENT = 16; // push silently
float DT_NOISE = 32; // use custom sound using noise key/value

/*
-------------------------------
Void plunge trigger

  1: Doesn't work on monsters
  2: Doesn't work on players

Credits to necros, dumptruck_ds
-------------------------------
*/
float MONSTER_SAFE = 1;
float PLAYER_SAFE = 2;