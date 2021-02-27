/*
==============================================================================

Customizable Variables

These variables are NOT used by the engine, so they can be freely modified to
tailor the code for the required gameplay experience.

==============================================================================
*/



/*
====================================================
Global variables that are defined before given value
====================================================
*/

/*
--------------------------------------------------------------
Distance to cover

Utility variable for caching frame-by-frame entity translation
Used by walkmove()
--------------------------------------------------------------
*/
float movedist;

/*
-----------------------------------------------------------------------------
Game is over

Utility variable to tell that the game has ended by its arbitrary ruleset
Used for syncing a game over state across clients and skip death anim on quit

TRUE if the game (match) has ended
-----------------------------------------------------------------------------
*/
float gameover;

/*
----------------------------------------------------------
New projectile

Utility variable for setting up newly spawned projectiles
Used in launch_spike(), LaunchLaser() and EnfLaunchSpike()
----------------------------------------------------------
*/
entity newmis;

/*
-----------------------------------------------------------------------
Activator

Utility variable for identifying the source of activation for an entity
Monsters also set activator as self.enemy when woken up by proxy
-----------------------------------------------------------------------
*/
entity activator;

/*
-------------------------------------------------------------------
Damage intender

Used by shootable buttons and triggers to set activator for targets
Set by T_Damage()
-------------------------------------------------------------------
*/
entity damage_attacker;

/*
---------------------------------------
Frame count

Frames since start of game (match, map)
Incremented each frame by StartFrame()
---------------------------------------
*/
float framecount;

/*
---------------------------------------
Game skill level enum

  0: Easy
  1: Normal
  2: Hard
  3: Nightmare
---------------------------------------
*/
float skill;

/*
-----------------------------------------------------
Known release enum

(credits to iw)
Unique ID for a release

  0: Not
  1: ID1
  2: func_mapjamx
-----------------------------------------------------
*/
float known_release;

/*
---------------------------------
Last triggered targetname

Stored but not used at the moment
---------------------------------
*/
string lastnameused;

/*
-----------------------------------------------------------
Music track

Global reference to world.sounds
Used for switching the music track for the level
'nosave' prevents it from getting reloaded from saved games

Credits to Spike
-----------------------------------------------------------
*/
nosave float *world_sounds;

/*
----------------------
Cutscene playing

TRUE during a cutscene
----------------------
*/
float cutscene;

/*
-------------------------------------------
Model is invisible

TRUE when model index is set to null_sprite
-------------------------------------------
*/
float mindex_inviso;

/*
------------------------------------------------------
Total not in cooperative

Total count of entites removed due to cooperative mode

Credits to iw
------------------------------------------------------
*/
float total_not_in_coop;

/*
--------------------------------------------------------
Total not in single player

Total count of entites removed due to single player mode

Credits to iw
--------------------------------------------------------
*/
float total_not_in_sp;

/*
------------------------------------------------
Total not on hard skill specifically

Total count of entites removed due to skill == 2

Credits to iw
------------------------------------------------
*/
float total_not_on_skill2;

/*
------------------------------------------------
Total not on nightmare skill specifically

Total count of entites removed due to skill == 3

Credits to iw
------------------------------------------------
*/
float total_not_on_skill3;

/*
-
Done with inhibition summary

TRUE if the inhibition summary has been printed

Credits to iw
-
*/
float done_inhibition_summary;



/*
=================================================
Entity fields that are defined before given value
=================================================
*/

/*
-----------------------
WAD file path

Map texture resource
Set by map in world.wad
-----------------------
*/
__used .string wad;

/*
-----------------------
Map file path

Map data resource
Set by map in world.wad
-----------------------
*/
.string map;

/*
---------------------------------------------------------
World ambience

Set in map and used for default key styles

  0: Medieval a.k.a. "Wizard" - uses physical keys
  1: Metal a.k.a. "Runic" - uses gravity-defying runekeys
  2: Base a.k.a. "Modern" - uses 80's sci-fi keycards
---------------------------------------------------------
*/
.float worldtype;

/*
--------------------------------------
Kill target

Target entity to despawn on activation
--------------------------------------
*/
.string killtarget;

/*
--------------------------------------
Light level

Parsed by QuakeEd's light util
--------------------------------------
*/
__used .float light_lev;

/*
-----------------------------
Generic entity style enum

Also specifically light style
-----------------------------
*/
.float style;

/*
------------------------------
Guard behavior

Monster stationary guarding AI
------------------------------
*/
.void() th_stand;

/*
---------------------
Patrol behavior

Monster patrolling AI
---------------------
*/
.void() th_walk;

/*
-----------------
Combat behavior

Monster combat AI
-----------------
*/
.void() th_run;

/*
---------------------------------
Ranged attack behavior

Monster projectile or leap attack
---------------------------------
*/
.void() th_missile;

/*
---------------------
Melee attack behavior

Monster melee attack
---------------------
*/
.void() th_melee;

/*
------------------------------------------------------
Stagger behavior

Monster getting losing balance from a shot

attacker: the entity who attacked (not the projectile)
damage: the amount of damage taken
------------------------------------------------------
*/
.void(entity attacker, float damage) th_pain;

/*
--------------------
Melee death behavior

Monster death
--------------------
*/
.void() th_die;

/*
----------------------------------------------------------
Last player target

Monster will return to attack this player after infighting
----------------------------------------------------------
*/
.entity oldenemy;

/*
---------------------------------------
General entity speed

Not to be confused with velocity vector
---------------------------------------
*/
.float speed;

/*
--------------------------------------------
Monster left-siding

Monster should strafe left

Used by strafing AI for scrags
(Horrible waste of memory for boolean value)
--------------------------------------------
*/
.float lefty;

/*
-----------------------------------------------------
Monster search time

Monster will look for the player until this timestamp
-----------------------------------------------------
*/
.float search_time;

/*
-----------------------------------------------------
Monster attack state enum

The type of attack pattern the monster should execute
Used in ai_run() for attack check
Set by monster AI

  1: Forward charge
  2: Strafe around
  3: Melee attack
  4: Ranged attack (leap or projectile)
-----------------------------------------------------
*/
.float attack_state;

/*
----------------------------------------------------
Player animation frame

Current animation frame for the current sequence
Relative to which animation sequence is being played
----------------------------------------------------
*/
.float walkframe;

/*
----------------------------------------
Attack finished timestamp

Indicates when the next attack may start
----------------------------------------
*/
.float attack_finished;

/*
----------------------------------------
Stagger finished timestamp

Indicates when the next attack may start
----------------------------------------
*/
.float pain_finished;

/*
------------------------------------------------
Invincibility finished timestamp

Indicates when Pentagram of Protection wears off
------------------------------------------------
*/
.float invincible_finished;

/*
----------------------------------------
Invisibility finished timestamp

Indicates when Ring of Shadows wears off
----------------------------------------
*/
.float invisible_finished;

/*
------------------------------------
Quad Damage finished timestamp

Indicates when Quad Damage wears off
------------------------------------
*/
.float super_damage_finished;

/*
--------------------------------
Biosuit finished timestamp

Indicates when Biosuit wears off
--------------------------------
*/
.float radsuit_finished;

/*
--------------------------------------------------------
Invincibility flash interval timestamp

Indicates when each Pentagram wearoff flash should occur
--------------------------------------------------------
*/
.float invincible_time;

/*
---------------------------------------------
Invincibility sound repeat timestamp

Indicates when protection sound can retrigger
---------------------------------------------
*/
.float invincible_sound;

/*
---------------------------------------------------
Invisibility flash interval timestamp

Indicates when each Ring wearoff flash should occur
---------------------------------------------------
*/
.float invisible_time;

/*
---------------------------------------------
Invincibility sound repeat timestamp

Indicates when whisper sound should loop back
---------------------------------------------
*/
.float invisible_sound;

/*
---------------------------------------------------
Quad Damage flash interval timestamp

Indicates when each Quad wearoff flash should occur
---------------------------------------------------
*/
.float super_time;

/*
---------------------------------------------
Quad sound repeat timestamp

Indicates when damage amp sound can retrigger
---------------------------------------------
*/
.float super_sound;

/*
------------------------------------------------------
Biosuit flash interval timestamp

Indicates when each Biosuit wearoff flash should occur
------------------------------------------------------
*/
.float rad_time;

/*
----------------------------------------------------------
Air tunnel sound repeat timestamp

Indicates when trigger_push air tunnel sound can retrigger
----------------------------------------------------------
*/
.float fly_sound;

/*
--------------------------------------------------------------------
Axe hit is being taken

Entity is suffering an axe-like slicing attack
Zombies are supposed to get gibbed from chainsaw but it's impossible
--------------------------------------------------------------------
*/
.float axhitme;

/*
------------------------------------------------------------------
Alert monsters timestamp

Timestamp until monsters will notice the player
Entity is causing a commotion so monsters can hear it
Set to time + 0.2 whenever a client fires a weapon or takes damage
------------------------------------------------------------------
*/
.float show_hostile;

/*
------------------------------------------------------------
Player drop speed

Player vertical speed for considering sounds and fall damage
Comes from velocity_z
Used in PlayerPostThink()
------------------------------------------------------------
*/
.float jump_flag;

/*
-------------------------------------------------
Player swim sound timestamp

The next time the player swim sound can retrigger
-------------------------------------------------
*/
.float swim_flag;

/*
-----------------------------------
Player drown timestamp

When passed, player starts drowning
-----------------------------------
*/
.float air_finished;

/*
---------------------------
Bubble counter

Used in DeathBubblesSpawn()
---------------------------
*/
.float bubble_count;

/*
-----------------------------------
Cause of death

E.g. drowning, slime, lava, falling
-----------------------------------
*/
.string deathtype;

/*
-----------------
Entity model path
-----------------
*/
.string mdl;

/*
------------------
Entity model angle

Pitch, yaw, roll
------------------
*/
.vector mangle;

/*
-------------------
Previous position

Used by secret door
-------------------
*/
.vector oldorigin;

/*
--------------------------------
Secret door second move distance
--------------------------------
*/
.float t_length;

/*
-------------------------------
Secret door first move distance
-------------------------------
*/
.float t_width;

/*
------------------------------------------
Custom destination

Used in particle fields and rotating doors
------------------------------------------
*/
.vector dest;

/*
---------------------------------
Destination 1

Used in particle fields and doors
---------------------------------
*/
.vector dest1;

/*
---------------------------------
Destination 2

Used in particle fields and doors
---------------------------------
*/
.vector dest2;

/*
--------------------------------
Wait before reset

Time from firing to reactivation
--------------------------------
*/
.float wait;

/*
------------------------------
Delay before firing

Time from activation to firing
------------------------------
*/
.float delay;

/*
-----------------------------------
Trigger volume

Trigger entity generated for func_*
-----------------------------------
*/
.entity trigger_field;

/*
------------------------
Entity sound file path 4

Used for emitted sounds
------------------------
*/
.string noise4;

/*
--------------------------------------------
Pause timestamp

Time at which the entity leaves a path point
--------------------------------------------
*/
.float pausetime;

/*
---------------------------------------------
Movement target

Target entity which the entity is approaching
---------------------------------------------
*/
.entity movetarget;

/*
-----------------------------
Ammo flag

Ammo count to add on pickup
Also used by Hipnotic counter
-----------------------------
*/
.float aflag;

/*
--------------------------------
Damage dealt

Damage dealt by an entity/func_*
Primary particle color
--------------------------------
*/
.float dmg;

/*
--------------------------------------------------------
Misc. count

Nightmare skill monster refire count
Player camera viewsize cache for restore after cutscenes
Falling brush disappear boolean
Secondary particle color
Elevator floor
Door unlock marker
Key retainment marker
Used in func_fall2
Used in particle fields
Used as premature trigger cache for func_trains
Rotating entity acceleration/start time
Item respawn timer index
Bubble count
Debris fragments to generate
Sparks to generate
Shub Niggurath thrash count
Spawn flight duration
Hipnotic counter index
--------------------------------------------------------
*/
.float cnt;

/*
------------------------------
Func. Think

Used by moving brush entities
Used after monster teleporting
------------------------------
*/
.void() think1;

/*
-----------------------------
Final destination

Used by moving brush entities
Used by cutscenes
-----------------------------
*/
.vector finaldest;

/*
-----------------------------
Final angle

Used by moving brush entities
-----------------------------
*/
.vector finalangle;

/*
----------------------------------------
Count

Earthquake radius
Light style for fading and on/off
Bob direction cycle timer
Particle density/count
Rotating brush rotation rate
Grenade bounce sound retrigger timestamp
Monster spawner spawn count
Zombie sleeping until triggered
Trigger count index
Random teleport destination index
CD track to play
----------------------------------------
*/
.float count;

/*
-----------------------------------------------------------
Lip

2-position brush retraction at active destination point
Maximum brush fall speed
-----------------------------------------------------------
*/
.float lip;

/*
-----------------------------------------------
State

Active state for triggerable effects
2-position mover motion state
Rotating brush on/off/acceleration/deceleration
Rotating train motion state
Active state for shooters
Electrode for Chthon getting zapped
Active state for trigger volumes
Hipnotic counter index
-----------------------------------------------
*/
.float state;

/*
-------------------------------
Start position

2-position mover starting point
Falling brush fall rotation
Spawned item .mins
-------------------------------
*/
.vector pos1;

/*
----------------------------------
Destination position

2-position mover destination point
Falling brush fall velocity
Spawned item .maxs
Changedest teleport position
----------------------------------
*/
.vector pos2;

/*
-----------------------
Height

Brush travel height
Monster jump z-velocity
-----------------------
*/
.float height;

/*
-----------------------------------
Minimum wait time

Bobbing acceleration velocity
Wizard idle sound minimum wait time
-----------------------------------
*/
.float waitmin;

/*
-------------------------
Volume

Custom sound volume level
Particle density
-------------------------
*/
.float volume;


/*
------------------
Custom key name

Custom key netname
------------------
*/
.string keyname;

/*
--------------------
Custom key inventory

Custom key flags

Credits to iw
--------------------
*/
.float customkeys;

/*
------------------------------
Additional target

Additional targets to activate
------------------------------
*/
.string target2;
.string target3;
.string target4;

/*
----------------------------------
Additional targetname

Additional targetnames to activate
----------------------------------
*/
.string targetname2;
.string targetname3;
.string targetname4;

/*
-------------------------
Additional killtarget

Additional target to kill
-------------------------
*/
.string killtarget2;

/*
----------------------------------
Trigger is waiting

TRUE if trigger is inactive/locked

Credits to Supa
----------------------------------
*/
.float is_waiting; // Supa, triggers, wait until activated before we can trigger?

/*
----------------------------------------------------------
Gravity

Gravitational force affecting the entity
Used for sparks, ladder climbing, Hipnotic gravity trigger
----------------------------------------------------------
*/
.float gravity;

/*
----------------------------------
Latest elevator use

Timestamp for last use of elevator

Credits to dumptruck_ds, Rogue DoE
----------------------------------
*/
.float elevatorLastUse;

/*
----------------------------------
Current elevator floor

Current floor number for elevator

Credits to dumptruck_ds, Rogue DoE
----------------------------------
*/
.float elevatorOnFloor;

/*
----------------------------------
Target elevator floor

Target floor number for elevator

Credits to dumptruck_ds, Rogue DoE
----------------------------------
*/
.float elevatorToFloor;

/*
----------------------------------
Elevator target coordinates

Target floor point for movement

Credits to dumptruck_ds, Rogue DoE
----------------------------------
*/
.vector elevatorDestination;

/*
----------------------------------
Plat2 called

Plat2 is being called manually

Credits to dumptruck_ds, Rogue DoE
----------------------------------
*/
.float plat2Called;

/*
----------------------------------
Latest plat2 move

Timestamp for last use of plat2

Credits to dumptruck_ds, Rogue DoE
----------------------------------
*/
.float plat2LastMove;

/*
----------------------------------
Plat2 wait

Timestamp for next use of plat2

Credits to dumptruck_ds, Rogue DoE
----------------------------------
*/
.float plat2GoTime;

/*
----------------------------------
Plat2 target state

Determines plat2 behavior

Credits to dumptruck_ds, Rogue DoE
----------------------------------
*/
.float plat2GoTo;

/*
------------------------------------------
Reset items

If set, resets player loadout on map start

  0: map default loadout
  1: shotgun start
  2: axe start

Credits to dumptruck_ds
------------------------------------------
*/
.float reset_items;

/*
-----------------------------------------------------------------------------
Spawn angry

If TRUE and the monster is trigger-spawned, it spawns attacking at the player

Credits to dumptruck_ds
-----------------------------------------------------------------------------
*/
.float spawn_angry;

/*
---------------------------------------
Debris model

Custom debris model path for breakables

Credits to dumptruck_ds
---------------------------------------
*/
.string mdl_debris;

/*
------------------------------------
Keep backpack

If TRUE, enemy doesn't drop backpack

Credits to dumptruck_ds
------------------------------------
*/
.float keep_ammo;

/*
----------------------------------------
Obituary name

Custom monster name used in kill message
E.g.: "Shrek" or "Leeroy Jenkins"

Credits to dumptruck_ds
----------------------------------------
*/
.string obit_name;

/*
---------------------------------------
Obituary method

Custom kill method used in kill message
E.g.: "eviscerated" or "shot"

Credits to dumptruck_ds
---------------------------------------
*/
.string obit_method;

/*
------------------------
Damage modifier

Combat damage multiplier

Credits to dumptruck_ds
------------------------
*/
.float damage_mod;

/*
------------------------------------
Wanted gravity

Rubicon2 cached custom gravity value
Used for ladders
Set by gravity trigger

Credits to johnfitz, Spike
------------------------------------
*/
.float wantedgravity;

/*
------------------------------------------
On ladder

Currently grappling onto a Rubicon2 ladder
Credits to johnfitz
------------------------------------------
*/
.float onladder;

/*
--------------------------
Ladder step retrigger

Unused
For ladder footstep sounds

Credits to johnfitz
--------------------------
*/
//.float ladder_step_finished;

/*
----------------------------------------------------
Breakable template 1

Break template path for Rubicon2
Unused

Credits to jognfitz, Qmaster, Arcane Dimensions team
----------------------------------------------------
*/
//.string break_template1_e;

/*
----------------------------------------------------
Breakable template 2

Break template path for Rubicon2
Unused

Credits to jognfitz, Qmaster, Arcane Dimensions team
----------------------------------------------------
*/
//.string break_template2_e;

/*
----------------------------------------------------
Breakable template 3

Break template path for Rubicon2
Unused

Credits to jognfitz, Qmaster, Arcane Dimensions team
----------------------------------------------------
*/
//.string break_template3_e;

/*
----------------------------------------------------
Breakable template 4

Break template path for Rubicon2
Unused

Credits to jognfitz, Qmaster, Arcane Dimensions team
----------------------------------------------------
*/
//.string break_template4_e;

/*
----------------------------------------------------
Breakable template 5

Break template path for Rubicon2
Unused

Credits to jognfitz, Qmaster, Arcane Dimensions team
----------------------------------------------------
*/
//.string break_template5_e;

/*
----------------------------------------------------
Find breakable template model

Find break template for Rubicon2
Unused

Credits to jognfitz, Qmaster, Arcane Dimensions team
----------------------------------------------------
*/
//.string find_brk_template_model;

/*
------------------------------------
Pain threshold

Health at which pain_target is fired

Credits to remakequake, dumptruck_ds
------------------------------------
*/
.float pain_threshold;

/*
-----------------------------------------
Pain target

Target to fire when pain_threshold is met

Credits to remakequake, dumptruck_ds
-----------------------------------------
*/
.string pain_target;

/*
----------------------------------------------
Color

Color for particles
Rubicon misc_particles uses row numbers (0-15)

Credits to remakequake, dumptruck_ds, Hipnotic
----------------------------------------------
*/
.float color;

/*
------------------------------------
Active megahealth rot time

Timestamp for next life tickdown

Credits to remakequake, dumptruck_ds
------------------------------------
*/
.float megahealth_rottime;

/*
--------------------------------------------
Alpha value

Visibility value
Fadeout of falling brushes
Rubicon2 flicker of laser brushes
Rubicon2 fadeout of sparks

Credits to remakequake, dumptruck_ds, RennyC
--------------------------------------------
*/
.float alpha;

/*
-----------------------------------------
Last used lightning trail

DoE lightning trail last used
Time is set but not used

Credits to remakequake, dumptruck_ds, DoE
-----------------------------------------
*/
.float ltrailLastUsed;

/*
--------------------------------------------
Style 2

Switchable light "on" style

Credits to remakequake, dumptruck_ds, c0burn
--------------------------------------------
*/
.float style2;

/*
--------------------------------------------
Sight trigger

If TRUE, monster fires targets when awakened

Credits to remakequake, dumptruck_ds, RennyC
--------------------------------------------
*/
.float sight_trigger;

/*
------------------------------------------
Berserk

If TRUE, monster doesn't stagger from pain

Credits to remakequake, dumptruck_ds
------------------------------------------
*/
.float berserk;

// Drake Cutscenes -- Borrowed from Zerstorer.

/*
--------------------------------
Script

Script to read in cutscene

Credits to Drake, Zerstorer, dhm
--------------------------------
*/
.string script;

/*
-----------------------------------
Next script

Next script in cutscene info_script

Credits to Drake, Zerstorer, dhm
-----------------------------------
*/
.string next_script;

/*
--------------------------------
Script number

Cutscene info_script ID number

Credits to Drake, Zerstorer, dhm
--------------------------------
*/
.string script_num;

/*
-----------------------------------
Camera point

Cutscene camera motion target point
Unused

Credits to Drake, Zerstorer, dhm
-----------------------------------
*/
//.string camera_point;

/*
----------------------------------------
Focal point

Cutscene camera observation target point

Credits to Drake, Zerstorer, dhm
----------------------------------------
*/
.string focal_point;

/*
----------------------------------------
Script delay

Cutscene delay before next script

Credits to Drake, Zerstorer, dhm
----------------------------------------
*/
.float script_delay;

/*
----------------------------------------
Script time

Cutscene last trigger time + 1 second
Used for script timing

Credits to Drake, Zerstorer, dhm
----------------------------------------
*/
.float script_time;

/*
-----------------------------------------------------------------
Script count

When cutscene count reaches script_delay, advances to next script

Credits to Drake, Zerstorer, dhm
-----------------------------------------------------------------
*/
.float script_count;

/*
----------------------------------------
Null string

world.null_string to replace STRING_NULL
Nothing should be stored in it

Credits to Drake, Zerstorer, dhm
----------------------------------------
*/
.string null_string;

/*
------------------------------------------
Heal timer

Timestamp for next heal of healing trigger

Credits to Custents
------------------------------------------
*/
.float heal_timer;

/*
------------------------------------
Heal amount

Health received from healing trigger

Credits to Custents
------------------------------------
*/
.float heal_amount;

/*
--------------------------------------------
Maximum health

Limit of health to recover to at the trigger

Credits to Custents
--------------------------------------------
*/
.float health_max;

/*
-----------------------
Death sound path

Sound to emit on death

Credits to dumptruck_ds
-----------------------
*/
.string snd_death;

/*
-----------------------
Pain sound path

Sound to emit on pain

Credits to dumptruck_ds
-----------------------
*/
.string snd_pain;

/*
-----------------------
Sight sound path

Sound to emit on sight

Credits to dumptruck_ds
-----------------------
*/
.string snd_sight;

/*
-----------------------
Attack sound path

Sound to emit on attack

Credits to dumptruck_ds
-----------------------
*/
.string snd_attack;

/*
--------------------------
Hit sound path

Sound to emit when hitting

Credits to dumptruck_ds
--------------------------
*/
.string snd_hit;

/*
-----------------------
Idle sound path

Sound to emit when idle

Credits to dumptruck_ds
-----------------------
*/
.string snd_idle;

/*
-----------------------
Death sound path

Sound to emit on death

Credits to dumptruck_ds
-----------------------
*/
.string snd_land;

/*
------------------------
Land sound path

Sound to emit on landing

Credits to dumptruck_ds
------------------------
*/
.string snd_move;

/*
-----------------------
Move sound path

Sound to emit on moving

Credits to dumptruck_ds
-----------------------
*/
.string snd_misc;

/*
--------------------------
Miscellaneous sound path 1

Sound to emit on misc 1

Credits to dumptruck_ds
--------------------------
*/
.string snd_misc1;

/*
--------------------------
Miscellaneous sound path 2

Sound to emit on misc 2

Credits to dumptruck_ds
--------------------------
*/
.string snd_misc2;

/*
--------------------------
Miscellaneous sound path 3

Sound to emit on misc 3

Credits to dumptruck_ds
--------------------------
*/
.string snd_misc3;

/*
-----------------------
Custom head model

Credits to dumptruck_ds
-----------------------
*/
.string mdl_head;

/*
-----------------------
Custom body model

Credits to dumptruck_ds
-----------------------
*/
.string mdl_body;

/*
-----------------------
Custom projectile model

Credits to dumptruck_ds
-----------------------
*/
.string mdl_proj;

/*
-----------------------
Custom head skin

Credits to dumptruck_ds
-----------------------
*/
.float skin_head;

/*
-----------------------
Custom projectile skin

Credits to dumptruck_ds
-----------------------
*/
.float skin_proj;

/*
-----------------------
Custom gib model 1

Credits to dumptruck_ds
-----------------------
*/
.string mdl_gib1;

/*
-----------------------
Custom gib model 2

Credits to dumptruck_ds
-----------------------
*/
.string mdl_gib2;

/*
-----------------------
Custom gib model 3

Credits to dumptruck_ds
-----------------------
*/
.string mdl_gib3;

/*
----------------
Ammo shard value

Unused
----------------
*/
//.float shardvalue;

/*
------------------------------------------------
Drop item

Monster item drop:
  0: (Default) Disabled
  1: Drop a Silver Key upon death
  2: Drop a Gold Key upon death
  3: Drop a Health Vial upon death
  4: Drop an Armor Shard upon death
  5: Drop a Health Vial & Armor Shard
  6: Random combination of 3 Vials and/or Shards
------------------------------------------------
*/
.float drop_item;



/*
=================================================
Functions that are defined before given a process
=================================================
*/

/*
------------------------------
Utility Subroutine definitions
------------------------------
*/
void(vector tdest, float tspeed, void() func) SUB_CalcMove;
void(entity ent, vector tdest, float tspeed, void() func) SUB_CalcMoveEnt;
void(vector destangle, float tspeed, void() func) SUB_CalcAngleMove;
void() SUB_CalcMoveDone;
void() SUB_CalcAngleMoveDone;
void() SUB_Null;
void() SUB_UseTargets;
void() SUB_Remove;

/*
--------------------------
Combat routine definitions
--------------------------
*/
void(entity targ, entity inflictor, entity attacker, float damage) T_Damage;
float (entity e, float healamount, float ignore) T_Heal;
float(entity targ, entity inflictor) CanDamage;

/*
---------------------------
Monster routine definitions

Credits to dumptruck_ds
---------------------------
*/
void() monster_pain_use;
void() SUB_UsePain;

/*
---------------------------
Trigger routine definitions

Credits to dumptruck_ds
---------------------------
*/
void() trigger_changemusic;
void() onlookat_touch;

/*
----------------------------
Cutscene routine definitions
----------------------------
*/
void() Cutscene_Think;

/*
-------------------------
Debug routine definitions
-------------------------
*/
void(string type, string text) print_self;