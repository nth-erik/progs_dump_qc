/*
=======================================
System functions provided by the engine

These may be renamed freely
=======================================
*/

/*
-------------------------------------------
Generate relative axial unit vectors

Returns:
  - v_forward: forward facing unit vector
  - v_up:      upward facing unit vector
  - v_right:   rightward facing unit vector

ang: facing direction to derive axes from
-------------------------------------------
*/
void(vector ang) makevectors = #1;

/*
------------------------------------
Set origin for entity to coordinates

e: entity to reposition
o: position to set
------------------------------------
*/
void(entity e, vector o) setorigin = #2;

/*
-------------------------------------------
Set model to render for entity

Sets size and links entity into world
Advisable to set .movetype and .solid first
The model should be precached before use

e: entity to set model for
m: model path (.mdl, .spd, .bsp)
-------------------------------------------
*/
void(entity e, string m) setmodel = #3;

/*
----------------------------
Set entity bounding box

e:   entity to set bounds for
min: rear bottom left corner
max: front top right corner
----------------------------
*/
void(entity e, vector min, vector max) setsize = #4;

/*
----------
#5 Removed
----------
*/

/*
-----------------------------------------------
Break control flow

Drops out of process loops or decision branches
Use with "switch" statements to isolate cases

Works without parentheses
-----------------------------------------------
*/
void() break = #6;

/*
----------------------------------------------------------------------
Get pseudo-random fraction

Returns a random float between 0.0 (inclusive) and 1.0 (non-inclusive)
Relatively costly to produce, use sparingly
----------------------------------------------------------------------
*/
float() random = #7;

/*
-----------------------------------------------------------------
Emit sound

e:     Entity to originate from
chan:  channel to use
  0: Automatic
  1: Weapon sound
  2: Character voice
  3: Powerup signal
  4: Foliage noise
  5: (misc.)
  6: (misc.)
  7: (misc.)
samp:  path to sound file
vol:   Volume on a 0.0-1.0 scale
atten: Attenuation (falloff)
  0.0: infinite radius
  1.0: ~1000 unit radius
  3.9: ~250 unit radius

Note: Sounds beyond hearing range stop playing to preserve memory
-----------------------------------------------------------------
*/
void(entity e, float chan, string samp, float vol, float atten) sound = #8;

/*
-------------------------------------------
Normalize vector

Returns a unit vector
Used for directional motion and dot product

v: vector to normalize
-------------------------------------------
*/
vector(vector v) normalize = #9;

/*
------------------------------------------
Error

Halts execution and displays error message
Use for fatal errors

e: message to display
------------------------------------------
*/
void(string e) error = #10;

/*
-----------------------------------------
Object error

Removes entity and displays error message
Use for fatal errors

e: message to display
-----------------------------------------
*/
void(string e) objerror = #11;

/*
----------------------------------
Vector length

Returns the absolute vector length
Use for measuring distance

v: vector to measure
----------------------------------
*/
float(vector v) vlen = #12;

/*
----------------------------------------
Vector to yaw

Returns the horizontal angle of a vector

v: vector to extract yaw from
----------------------------------------
*/
float(vector v) vectoyaw = #13;

/*
--------------------------
Spawn

Returns a new blank entity
--------------------------
*/
entity() spawn = #14;

/*
--------------------------
Remove

Despawns the passed entity

e: entity to despawn
--------------------------
*/
void(entity e) remove = #15;

/*
----------------------------------------------------------
Trace line

Returns:
  - trace_allsolid
  - trace_startsolid
  - trace_fraction
  - trace_endpos
  - trace_plane_normal
  - trace_plane_dist
  - trace_ent
  - trace_inopen
  - trace_inwater

Casts a collision ray between two points
Extracts information

v1:         source point
v2:         destination point
nomonsters:
  0: check monsters
  1: skip monsters
  2: check monsters with width
forent:     entity, its owner and owned entities to ignore
----------------------------------------------------------
*/
void(vector v1, vector v2, float nomonsters, entity forent) traceline = #16;

/*
------------------------------------------------------------------------
Find a visible player

Returns a player from the current entity's PVS (potentially visible set)
Probably uses map VIS data
You can temporarily replace "self" to use this on any entity

(self): the entity which checks for a player in the PVS
------------------------------------------------------------------------
*/
entity() checkclient = #17; // returns a client to look for

/*
-----------------------------------------------------------
Find entities by field value

Returns the first found entity
.chain of the entity contains the next found entity
When .chain is "world", there are no more entities

start: entity to begin with (use world to start from first)
fld:   entity field name to check for matching value
match: field value to match (as string)
-----------------------------------------------------------
*/
entity(entity start, .string fld, string match) find = #18;

/*
-------------------------------------
Precache sound

Preloads the sound for use in the map

s: sound path to use
-------------------------------------
*/
string(string s) precache_sound = #19;

/*
-------------------------------------
Precache model

Preloads the model for use in the map

s: model path to use
-------------------------------------
*/
string(string s) precache_model = #20;

/*
---------------------------------------------------------------------------
Execute console command by client

Sends a command to the console through the entity
If not terminated with an escaped new line, the text will remain typed into
the console

client: entity executing the command
s: the command to execute
---------------------------------------------------------------------------
*/
void(entity client, string s)stuffcmd = #21;

/*
-----------------------------------------------------
Find in radius

Returns the first found entity
.chain of the entity contains the next found entity
When .chain is "world", there are no more entities
Used in explosion splash damage
Checks against entity bounding box center, not origin

org: origin point of the check
rad: distance (radius) of the check
-----------------------------------------------------
*/
entity(vector org, float rad) findradius = #22;

/*
------------------------------------------
Broadcast player message

Sends message to all players
Can be overloaded with multiple parameters

s: message to broadcast
------------------------------------------
*/
void(string s) bprint = #23;

/*
------------------------------------------
Send player message

Sends message to a specific player
Practically a MSG_ONE SVC_PRINT
Can be overloaded with multiple parameters

e: entity to receive
s: message to send
------------------------------------------
*/
void(entity client, string s) sprint = #24;

/*
------------------------------------------------------
Broadcast debug message

Sends message to all players when "developer 1" is set
Can be overloaded with multiple parameters

s: message to send
------------------------------------------------------
*/
void(string s) dprint = #25;

/*
--------------------------------------------
Float to string

Returns a string representation of the float

f: float to convert to string
--------------------------------------------
*/
string(float f) ftos = #26;

/*
---------------------------------------------
Vector to string

Returns a string representation of the vector

v: vector to convert to string
---------------------------------------------
*/
string(vector v) vtos = #27;

/*
-----------------------------
Core dump

Print all entities to console
Used for debugging
-----------------------------
*/
void() coredump = #28;

/*
----------------------
Trace on

Begin function tracing
Used for debugging
----------------------
*/
void() traceon = #29;

/*
--------------------
Trace off

End function tracing
Used for debugging
--------------------
*/
void() traceoff = #30;

/*
----------------------------------------
Broadcast entity

Print print details of entity to console
Used for debugging

e: entity to print
----------------------------------------
*/
void(entity e) eprint = #31;

/*
-----------------------------------------
Walk move

Returns TRUE if movement was unobstructed
Linear movement without fancy pathfinding

yaw:  horizontal angle of movement
dist: distance to move
-----------------------------------------
*/
float(float yaw, float dist) walkmove = #32;

/*
-----------
#33 Removed
-----------
*/

/*
------------------------------------------------------------
Drop to floor

Returns TRUE if touched floor
Drops entity by up to 256 units in a single frame
You can temporarily replace "self" to use this on any entity

(self): entity to drop to floor
------------------------------------------------------------
*/
float() droptofloor= #34;

/*
---------------------------------------------------------------------
Set light style

Define a lightstyle in the engine
32-62 are set for switchable lights by light.exe

style: 0-63, the light index to define
value: [a-z] string of characters where "a" is black and "z" is white
---------------------------------------------------------------------
*/
void(float style, string value) lightstyle = #35;

/*
-------------------------------------------------
Round to integer

Returns number rounded to nearest integer (whole)

v: float to round
-------------------------------------------------
*/
float(float v) rint = #36;

/*
-------------------------------------------------------
Round to lower integer

Returns number rounded to nearest lower integer (whole)

v: float to round down
-------------------------------------------------------
*/
float(float v) floor = #37;

/*
--------------------------------------------------------
Round to higher integer

Returns number rounded to nearest higher integer (whole)

v: float to round up
--------------------------------------------------------
*/
float(float v) ceil = #38;

/*
-----------
#39 Removed
-----------
*/

/*
-----------------------------------
Check bottom

Returns TRUE if entity is on ground
Used by airborne monsters

e: entity to check
-----------------------------------
*/
float(entity e) checkbottom = #40;

/*
---------------------------------------
Point contents

Returns:
  -1: Empty (air)
  -2: Solid (wall)
  -3: Water
  -4: Slime (low damage)
  -5: Lava (high frequent damage)
  -6: Sky (despawns projectiles)

Contents of the point based on BSP tree

v: point to check contents of
---------------------------------------
*/
float(vector v) pointcontents = #41;

/*
#42 is the answer
*/

/*
---------------------------------------
Float absolute

Returns the absolute value of the float

f: float to return absolute value for
---------------------------------------
*/
float(float f) fabs = #43;

/*
------------------------------------------------------------------------------
Aim

Returns a projectile velocity vector pointing away from the entity (the owner)

e:     entity which takes aim
speed: speed at which the projectile travels
------------------------------------------------------------------------------
*/
vector(entity e, float speed) aim = #44;

/*
--------------------------------
Get cvar

Returns the requested cvar value

s: cvar to read out
--------------------------------
*/
float(string s) cvar = #45;

/*
-------------------------------------------
Execute console command

Sends a command to the console
Must be terminated with an escaped new line

s: the command to execute
-------------------------------------------
*/
void(string s) localcmd = #46;

/*
------------------------------------------------------
Next entity

Returns the entity after the passed entity in the list
Used for looping through all entities

e: entity before to the entity to return
------------------------------------------------------
*/
entity(entity e) nextent = #47;

/*
--------------------------------------------------------
Generate particle

Creates a unit particle mass with the specified features

o:     starting origin point
d:     velocity vector
color: color index
count: particle count in unit (density)
--------------------------------------------------------
*/
void(vector o, vector d, float color, float count) particle = #48;

/*
------------------------------------------------------------
Change Yaw

Turn self horizontally toward its ideal_yaw at its yaw_speed
You can temporarily replace "self" to use this on any entity

(self): The entity to nudge toward its target yaw angle
------------------------------------------------------------
*/
void() ChangeYaw = #49;

/*
-----------
#50 Removed
-----------
*/
vector(vector v) vectoangles = #51;

/*
--------------------------------------------------------------
Write network message byte

to:
  0: Broadcast (unreliable for all)
  1: One (reliable for entity)
  2: All (reliable for all)
  3: Init (written to init string)

f:
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
void(float to, float f) WriteByte = #52;

/*
-------------------------------
Write network message character

Unused
-------------------------------
*/
void(float to, float f) WriteChar = #53;

/*
-----------------------------------
Write network message short integer

Unused
-----------------------------------
*/
void(float to, float f) WriteShort = #54;

/*
------------------------------------------
Write network message long integer

Used for updating total number of monsters
------------------------------------------
*/
void(float to, float f) WriteLong = #55;

/*
--------------------------------------------------------------
Write network message coodrinate

Used for origin of temporary entities, once for each dimension
--------------------------------------------------------------
*/
void(float to, float f) WriteCoord = #56;

/*
----------------------------------------------------------------------
Write network message angle

This function writes a single byte that represents 256 * (angle / 380)

Unused

Credits to QuakeC Reference Manual
----------------------------------------------------------------------
*/
void(float to, float f) WriteAngle = #57;

/*
-------------------------------------------------------------
Write network message string

Used for writing episode finale paragraphs
Writes a string, terminated by "\0" (the null character in C)
-------------------------------------------------------------
*/
void(float to, string s) WriteString = #58;

/*
--------------------------------------------
Write network message entity

Used with lightnings
Writes an entity reference, taking two bytes

Credits to QuakeC Reference Manual
--------------------------------------------
*/
void(float to, entity s) WriteEntity = #59;

/*
#60 Removed
*/

/*
#61 Removed
*/

/*
#62 Removed
*/

/*
#63 Removed
*/

/*
#64 Removed
*/

/*
#65 Removed
*/

/*
#66 Removed
*/

/*
------------------------------------------------------------
Move to goal

Moves toward .goalentity using fancy pathfinding
You can temporarily replace "self" to use this on any entity

step:   distance to cover
(self): entity to move toward its goal entity
------------------------------------------------------------
*/
void(float step) movetogoal = #67;

/*
------------------------------------------------------------------
Precache file

Quake progs compiler uses it to copy shareware files into PAK0.PAK
No effect during gameplay

s: file path to copy to PAK
------------------------------------------------------------------
*/
string(string s) precache_file = #68;

/*
-----------------------------------------------------------------------------
Make entity static

Converts an entity to a passive static entity.
Used by light models and illusionary brushes.
A static entity doesn't interact with the rest of the game. These are flames
(progs/flame.mdl), lights, illusionary objects, and the like. It is never be
necessary to reference such an entity, so they don't get an entity reference
number.
Causes a spawnstatic message to be sent to every client. A static entity
cannot be removed once created. The maximum number of static entities is 127.

e: entity to convert to static

Credits to QuakeC Reference Manual
-----------------------------------------------------------------------------
*/
void(entity e) makestatic = #69;

/*
----------------------------------------------------------
Change level

Loads the map at the given path instead of the current one
Executes the console command "changelevel" + mapname

s: map path (relative to id1/maps/)

Credits to QuakeC Reference Manual
----------------------------------------------------------
*/
void(string s) changelevel = #70;
/*
#71 Removed
*/

/*
----------------------------------------------------------------------------
Set cvar

Updates the given cvar with a new value
Note: May set the cvar to zero when the string value contains leading spaces;
      this is confirmed behavior for DOSQuake 1.08 and WinQuake 1.0.

var: cvar to update
val: string(!) value to update cvar with

Credits to QuakeC Reference Manual
----------------------------------------------------------------------------
*/
void(string var, string val) cvar_set = #72;

/*
------------------------------------------------------------------------------
Send centered player message

Sends message to a specific player centered on screen
Practically a MSG_ONE SVC_PRINT
Can be overloaded with multiple parameters (all possible overloads added)
Note: In the original engine, all of the strings for a centerprint message are
      concatenated into a single  256-char buffer, therefore excessively long
      messages should be avoided

client: entity to receive
s:      message to send

Credits to iw
------------------------------------------------------------------------------
*/
void(entity client, string s) centerprint = #73;
void(entity client, string s1, string s2) centerprint2 = #73;
void(entity client, string s1, string s2, string s3) centerprint3 = #73;
void(
  entity client,
  string s1,
  string s2,
  string s3,
  string s4
) centerprint4 = #73;
void(
  entity client,
  string s1,
  string s2,
  string s3,
  string s4,
  string s5
) centerprint5 = #73;
void(
  entity client,
  string s1,
  string s2,
  string s3,
  string s4,
  string s5,
  string s6
) centerprint6 = #73;
void(
  entity client,
  string s1,
  string s2,
  string s3,
  string s4,
  string s5,
  string s6,
  string s7
) centerprint7 = #73;

/*
-------------------------------------------------------------------------
Emit looping ambient sound

An ambient sound will never stop playing, even if the player moves out of
audible range

pos:   origin point of sound emission
samp:  path to sound file
vol:   Volume on a 0.0-1.0 scale
atten: Attenuation (falloff)
  0.0: infinite radius
  1.0: ~1000 unit radius
  3.9: ~250 unit radius

Credits to QuakeWiki
-------------------------------------------------------------------------
*/
void(vector pos, string samp, float vol, float atten) ambientsound = #74;

/*
---------------------------------------------------------------------
Precache model if registered

Preloads the model for use in the map for the registered version only

s: model path to use
---------------------------------------------------------------------
*/
string(string s) precache_model2 = #75;

/*
---------------------------------------------------------------------
Precache sound if registered

Preloads the sound for use in the map for the registered version only

s: sound path to use
---------------------------------------------------------------------
*/
string(string s) precache_sound2 = #76;

/*
------------------------------------------------------------------------
Precache file if registered

Quake progs compiler uses it to copy registered-only files into PAK1.PAK
No effect during gameplay

s: file path to copy to PAK
------------------------------------------------------------------------
*/
string(string s) precache_file2 = #77;

/*
---------------------------------------
Set spawn parameters

Sets parm1-16 for entity
Used at map start and coop respawn

e: the entity to set the parm values on
---------------------------------------
*/
void(entity e) setspawnparms = #78;
