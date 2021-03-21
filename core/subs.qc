/*
==============================================================================

Subroutine functions

Basic functions that operate on the current entity and return either noting or
a logical value to report on their success.

==============================================================================
*/

/*
--------------------------
No Operation

Disables current entity AI
--------------------------
*/
void() SUB_Null = {};

/*
-------------------------------
No Pain Operation

Disables current entity pain AI
-------------------------------
*/
void(entity attacker, float damage) SUB_NullPain = {};

/*
----------------------
Destroy function

Removes current entity
----------------------
*/
void() SUB_Remove =
{
  remove(self);
};

/*
------------------------------------------------------------------------------
Flagset NOT check

Returns the negative of flagset 'b' for each flag NOT contained in flagset 'a'
Used for checking unset flags and safely unsetting flags with (a & not(a , b))

Credits to dumptruck_ds, Lunaran
------------------------------------------------------------------------------
*/
float(float a, float b) not = {
  return a - (a & b);
}

/*
----------------------------------------------------------------------------
Initialize movement direction

Converts .angles to .movedir on current entity

NOTE: .angles is float in map editors, -1 is up and -2 is down, other values
are interpreted as horizontal yaw value
----------------------------------------------------------------------------
*/
void() SetMovedir =
{
  if (self.angles == '0 -1 0')
    self.movedir = '0 0 1';
  else if (self.angles == '0 -2 0')
    self.movedir = '0 0 -1';
  else
  {
    makevectors(self.angles);
    self.movedir = v_forward;
  }

  self.angles = '0 0 0';
};

/*
---------------------------------------------------------------------
Initialize trigger volume

Sets current entity features to use facing angle, exist in world, be
pass-through, not use a model and never move

NOTE: Use 360 for .angles in the editor to represent a '0 0 0' facing
---------------------------------------------------------------------
*/
void() InitTrigger =
{
  if (self.angles != '0 0 0')
    SetMovedir ();

  self.solid = SOLID_TRIGGER;
  setmodel(self, self.model);
  self.movetype = MOVETYPE_NONE;
  self.modelindex = 0;
  self.model = "";
};

/*
---------------------------------------------------------------------
Initialize trigger point

Eliminates model, then initializes trigger and restores size using
.origin and .mangle

NOTE: Use 360 for .angles in the editor to represent a '0 0 0' facing

Credits to Drake, dumptruck_ds
---------------------------------------------------------------------
*/
void() InitPointTrigger =
{
    local vector v1;
    local vector v2;

    v1 = self.origin;
    v2 = v1 + self.mangle;
    self.model = "";
    setorigin(self, '0 0 0');
    InitTrigger();
    // Restore entity size reset by InitTrigger
    setsize(self, v1, v2);
};

/*
-----------------------------------------------------------------------
Move provided entity

Wraps SUB_CalcMove so it temporarily replaces self with provided entity

ent:    entity to move
tdest:  destination point for .finaldest
tspeed: offset speed
func:   additional .think1 function
-----------------------------------------------------------------------
*/
void(entity ent, vector tdest, float tspeed, void() func) SUB_CalcMoveEnt =
{
  local entity stemp;
  stemp = self;
  self = ent;

  SUB_CalcMove(tdest, tspeed, func);
  self = stemp;
};

/*
---------------------------------------------------------------
Move current entity

Calculates velocity and .nextthink for current entity
Use with brush entity to scale motion to time of arrival
This is a blind physics drift, not suitable for AI or animation

tdest:  destination point for .finaldest
tspeed: offset speed
func:   additional .think1 function
---------------------------------------------------------------
*/
void(vector tdest, float tspeed, void() func) SUB_CalcMove =
{
  local vector vdestdelta;
  local float len;
  local float traveltime;

  if (!tspeed)
    objerror("No speed is defined!");

  self.think1 = func;
  self.finaldest = tdest;
  self.think = SUB_CalcMoveDone;

  // prevent overshooting
  if (tdest == self.origin)
  {
    self.velocity = '0 0 0';
    self.nextthink = self.ltime + 0.1;
    return;
  }

  // get movement vector with velocity
  vdestdelta = tdest - self.origin;
  len = vlen(vdestdelta);

  // get time to reach dest
  traveltime = len / tspeed;

  // prevent overshooting
  if (traveltime < 0.1)
  {
    self.velocity = '0 0 0';
    self.nextthink = self.ltime + 0.1;
    return;
  }

  // don't trigger .think until dest is reached
  self.nextthink = self.ltime + traveltime;

  // scale destdelta by the time spent traveling to get velocity
  self.velocity = vdestdelta * (1 / traveltime);
};

/*
--------------------------------------------
Finish moving current entity

Stops movement
Nudges current entity into destination point
Runs .think1
--------------------------------------------
*/
void()  SUB_CalcMoveDone =
{
  setorigin(self, self.finaldest);
  self.velocity = '0 0 0';
  self.nextthink = -1;

  if (self.think1)
    self.think1();
};

/*
----------------------------------------------------------------------------
Rotate provided entity

Wraps SUB_CalcAngleMove so it temporarily replaces self with provided entity

ent:       entity to orient
destangle: destination orientation for .finalangle
tspeed:    turn speed
func:      additional .think1 function
----------------------------------------------------------------------------
*/
void(entity ent, vector destangle, float tspeed, void() func) SUB_CalcAngleMoveEnt =
{
  local entity stemp;
  stemp = self;
  self = ent;
  SUB_CalcAngleMove(destangle, tspeed, func);
  self = stemp;
};

/*
--------------------------------------------------------------
Rotate current entity

Calculates angular velocity and .nextthink for current entity
Use with brush entity to scale motion to time of arrival
This is a blind physics spin, not suitable for AI or animation

destangle: destination point for .finaldest
tspeed:    offset speed
func:      additional .think1 function
--------------------------------------------------------------
*/
void(vector destangle, float tspeed, void() func) SUB_CalcAngleMove =
{
  local vector destdelta;
  local float len;
  local float traveltime;

  if (!tspeed)
    objerror("No speed is defined!");

  self.think1 = func;
  self.finalangle = destangle;
  self.think = SUB_CalcAngleMoveDone;

  // get rotation vector with angular velocity
  destdelta = destangle - self.angles;
  len = vlen(destdelta);

  // get time to reach dest
  traveltime = len / tspeed;

  // don't trigger .think until dest is reached
  self.nextthink = self.ltime + traveltime;

  // scale the destdelta vector by the time spent traveling to get avelocity
  self.avelocity = destdelta * (1 / traveltime);
};

/*
--------------------------------------------
Finish rotating current entity

Stops rotation
Nudges current entity into destination angle
Runs .think1
--------------------------------------------
*/
void() SUB_CalcAngleMoveDone =
{
  self.angles = self.finalangle;
  self.avelocity = '0 0 0';
  self.nextthink = -1;
  if (self.think1)
    self.think1();
};

/*
------------------------------------------
Deferred execution

Runs the behavior on a DelayedUse entity
Manually sets cached activator from .enemy
------------------------------------------
*/
void() DelayThink =
{
  activator = self.enemy;
  SUB_UseTargets();
  remove(self);
};

/*
---------------------------------------------------
Defer timer entity spawn function

Returns TRUE if DelayedUse was spawned

Creates an entity to fire targets at its .nextthink
Inherits targeting fields from spawner entity
Caches spawner entity activator in .enemy
---------------------------------------------------
*/
float() DelayedUse =
{
  if (self.delay) {
    local entity t;
    t = spawn();
    t.classname = "DelayedUse";
    t.nextthink = time + self.delay;
    t.think = DelayThink;
    // cache activator in .enemy
    t.enemy = activator;
    t.message = self.message;
    t.killtarget = self.killtarget;
    t.killtarget2 = self.killtarget2;
    t.target = self.target;
    t.target2 = self.target2;
    t.target3 = self.target3;
    t.target4 = self.target4;
    return TRUE;
  }

  return FALSE;
}

/*
-------------------------------------------------------
Display entity message with sound

Centerprints current entity .message to the activator
Plays .noise or default message sound for the activator
-------------------------------------------------------
*/
void() ShowMessage =
{
  centerprint(activator, self.message);
  if (!self.noise)
    sound(activator, CHAN_VOICE, "misc/talk.wav", 1, ATTN_NORM);
}

/*
------------------------------------------------------------------------------
Use specific target

Executes .use on each entity with matching values in their corresponding field
For the .use, self is shifted from the targeting entity to the entity with the
matching targetname for each match
Activator is restored after each match

matchstring: the value to match on a field
matchfield:  the field to check on each entity

NOTE: Targets are killed before used - this prevents both using and killing
      the same target
------------------------------------------------------------------------------
*/
void(string matchstring, .string matchfield) SUB_UseSpecificTarget =
{
  local entity t;
  local entity stemp;
  local entity otemp;
  local entity act;

  act = activator;
  t = find(world, matchfield, matchstring);

  while (t != world)
  {
    // substitute self for current target to execute from own perspective
    // substitute other for original self to maintain relation
    stemp = self;
    otemp = other;
    self = t;
    other = stemp;

    if (self.use && self.use != SUB_Null)
    {
      // run defined use function on target
      lastnameused = matchstring;
      self.use();
    }

    // restore original self, other and activator for next target
    self = stemp;
    other = otemp;
    activator = act;
    t = find(t, matchfield, matchstring);
  }
};

void(string matchstring, .string matchfield) KillSpecificTarget =
{
  local entity t;
  t = find(world, matchfield, matchstring);
  while(t != world)
  {
    remove(t);
    t = find(t, matchfield, matchstring);
  }
}

/*
------------------------------------------------------------------------------
Use all targets

Executes .use on each entity matching the .targetname field for .target,
.target2, .target3 and .target4 fields of the current entity
Able to defer the execution if .delay is set
Able to display a message to the activator if it's a player
Able to kill up to 2 target entity groups
Able to use up to 4 targets
------------------------------------------------------------------------------
*/
void() SUB_UseTargets =
{
  if (DelayedUse())
    return;

  if (activator.classname == "player" && self.message != "")
    ShowMessage();

  if (self.killtarget != "")
  {
    KillSpecificTarget(self.killtarget, targetname);
    KillSpecificTarget(self.killtarget, targetname2);
    KillSpecificTarget(self.killtarget, targetname3);
    KillSpecificTarget(self.killtarget, targetname4);
  }

  if (self.killtarget2 != "")
  {
    KillSpecificTarget(self.killtarget2, targetname);
    KillSpecificTarget(self.killtarget2, targetname2);
    KillSpecificTarget(self.killtarget2, targetname3);
    KillSpecificTarget(self.killtarget2, targetname4);
  }

  if (self.target != "")
  {
    SUB_UseSpecificTarget(self.target, targetname);
    SUB_UseSpecificTarget(self.target, targetname2);
    SUB_UseSpecificTarget(self.target, targetname3);
    SUB_UseSpecificTarget(self.target, targetname4);
  }

  if (self.target2 != "")
  {
    SUB_UseSpecificTarget(self.target2, targetname);
    SUB_UseSpecificTarget(self.target2, targetname2);
    SUB_UseSpecificTarget(self.target2, targetname3);
    SUB_UseSpecificTarget(self.target2, targetname4);
  }

  if (self.target3 != "")
  {
    SUB_UseSpecificTarget(self.target3, targetname);
    SUB_UseSpecificTarget(self.target3, targetname2);
    SUB_UseSpecificTarget(self.target3, targetname3);
    SUB_UseSpecificTarget(self.target3, targetname4);
  }

  if (self.target4 != "")
  {
    SUB_UseSpecificTarget(self.target4, targetname);
    SUB_UseSpecificTarget(self.target4, targetname2);
    SUB_UseSpecificTarget(self.target4, targetname3);
    SUB_UseSpecificTarget(self.target4, targetname4);
  }
};

/*
--------------------------------------------------------------------------
Use for all targetnames

Runs .use on entities matching the string parameter in their target fields
--------------------------------------------------------------------------
*/
void(string matchstring) SUB_UseName =
{
  SUB_UseSpecificTarget(matchstring, targetname);
  SUB_UseSpecificTarget(matchstring, targetname2);
  SUB_UseSpecificTarget(matchstring, targetname3);
  SUB_UseSpecificTarget(matchstring, targetname4);
};
// ### end of Custents triggering code

/*
---------------------------------
Use and clear targets

Fires targets and prevents refire

Credits to iw
---------------------------------
*/
void() SUB_UseAndForgetTargets =
{
  SUB_UseTargets();

  self.delay = 0;
  self.killtarget = "";
  self.killtarget2 = "";
  self.message = "";
  self.target = "";
  self.target2 = "";
  self.target3 = "";
  self.target4 = "";
};

/*
-------------------------------------------------------------------------
Field is targeted

Returns TRUE if .fld field of entity is non-empty and matches any .target
or .pain_target on any other entity

Credits to iw
-------------------------------------------------------------------------
*/
float(.string fld) SUB_FieldIsTargeted =
{
  if (self.fld == "")
    return FALSE;

  // the following function calls are staggered to avoid the silly
  // "return value conflict" problem with traditional compilers -- iw
  if (find(world, target, self.fld) != world)
    return TRUE;

  if (find(world, target2, self.fld) != world)
    return TRUE;

  if (find(world, target3, self.fld) != world)
    return TRUE;

  if (find(world, target4, self.fld) != world)
    return TRUE;

  if (find(world, pain_target, self.fld) != world)
    return TRUE;

  return FALSE;
};

/*
-----------------------------------------------------------------------
Entity is targeted

Returns TRUE if any .targetname of this entity is non-empty and matches
any .target or .pain_target of any other entity

Credits to iw
-----------------------------------------------------------------------
*/
float() SUB_IsTargeted =
{
  // the following function calls are staggered to avoid the silly
  // "return value conflict" problem with traditional compilers -- iw
  if (SUB_FieldIsTargeted(targetname))
    return TRUE;

  if (SUB_FieldIsTargeted(targetname2))
    return TRUE;

  if (SUB_FieldIsTargeted(targetname3))
    return TRUE;

  if (SUB_FieldIsTargeted(targetname4))
    return TRUE;

  return FALSE;
};

/*
----------------------------------------------------------------------------
Use pain target

Executes .use on each entity matching the .targetname field for .pain_target
of the current entity
Only fires the first time the entity is hit

Credits to dumptruck_ds, Spike, Snaut, QueenJazz
----------------------------------------------------------------------------
*/
void() SUB_UsePain =
{
  if (self.pain_target != "")
  {
    SUB_UseSpecificTarget (self.pain_target, targetname);
    SUB_UseSpecificTarget (self.pain_target, targetname2);
    SUB_UseSpecificTarget (self.pain_target, targetname3);
    SUB_UseSpecificTarget (self.pain_target, targetname4);
  }
  self.pain_target = "";
};

/*
--------------------------------------------------------------------------
Finish attack cycle

Resets refire counter and applies attack delay if not on Nightmare skill

normal: seconds until next attack

NOTE: In nightmare mode, all attack_finished times become 0; some monsters
      fire twice automatically
--------------------------------------------------------------------------
*/
void(float normal) SUB_AttackFinished =
{
  self.cnt = 0;

  if (skill != 3)
    self.attack_finished = time + normal;
};

/*
--------------------------------------------------------------------------
Conditional refire

Sets entity .think to the provided function if ALL of the following apply:

  - Skill isn't Nightmare
  - We haven't refired yet
  - .enemy is visible

thinkst: attack AI function to use for refire
--------------------------------------------------------------------------
*/
void(void() thinkst) SUB_CheckRefire =
{
  if (skill != 3)
    return;

  if (self.cnt == 1)
    return;

  if (!visible(self.enemy))
    return;

  self.cnt = 1;
  self.think = thinkst;
};

/*
----------------------------------------------------------------------------
Dislodge resting entities

Clears the FL_ONGROUND flag from any entities that are on top of self to
prevent certain types of entities from being left floating in the air if the
entity they were resting on was removed.

Used in the case current entity is being removed, to ensure that other
entities are not left floating.

Credits to iw
----------------------------------------------------------------------------
*/
void() SUB_DislodgeRestingEntities =
{
  local entity e;

  e = nextent(world);

  while (e != world)
  {
    if ((e.flags & FL_ONGROUND) && e.groundentity == self)
      e.flags = e.flags - (e.flags & FL_ONGROUND);
    e = nextent(e);
  }
};

/*
----------------------------------------------------------
Force think

Runs the provided think function on the provided entity

ent:     Entity to run function for
thinkst: Function to run for entity

NOTE: The entity is treated as self for the think function

Credits to Drake
----------------------------------------------------------
*/
void(entity ent, void() thinkst) SUB_Think =
{
    local entity swap;

    swap = self;
    self = ent;
    thinkst();
    self = swap;
};

/*
------------------------------------------------------------------
Check valid touch

Returns TRUE if all of the following are true for touching entity:

  - other is a player
  - the player lives
  - the player collides with geometry

Used for pickups, doors etc.

Credits to dumptruck_ds, Lunaran
------------------------------------------------------------------
*/
float() CheckValidTouch =
{
  if (other.classname != "player")
    return FALSE;

  if (other.health <= 0)
    return FALSE;

  if (other.movetype == MOVETYPE_NOCLIP)
    return FALSE;

  return TRUE;
}

/*
----------------------------------------------------------------------------
Inhibit entity

Removes current entity, increments inhibition count and returns TRUE if the
entity should not spawn in the current game mode or skill level based on the
following spawnflags:

  4096:  Not in Cooperative mode
  8192:  Not in Single Player mode
  32768: Not on Hard skill specifically
  65536: Not on Nightmare skill specifically

Call at the first line of every spawn function like so:

  if (SUB_Inhibit ())
    return;

Credits to iw
----------------------------------------------------------------------------
*/
float() SUB_Inhibit =
{
  if (coop && (self.spawnflags & SPAWNFLAG_NOT_IN_COOP))
  {
    total_not_in_coop = total_not_in_coop + 1;
    remove (self);
    return TRUE;
  }

  if (!coop && !deathmatch && (self.spawnflags & SPAWNFLAG_NOT_IN_SP))
  {
    total_not_in_sp = total_not_in_sp + 1;
    remove (self);
    return TRUE;
  }

  // The built-in skill level spawnflags are ignored in Deathmatch, so
  // we ignore the new ones in Deathmatch, too.  -- iw
  if (!deathmatch)
  {
    if (skill == 2 && (self.spawnflags & SPAWNFLAG_NOT_ON_SKILL2))
    {
      total_not_on_skill2 = total_not_on_skill2 + 1;
      remove (self);
      return TRUE;
    }

    if (skill == 3 && (self.spawnflags & SPAWNFLAG_NOT_ON_SKILL3))
    {
      total_not_on_skill3 = total_not_on_skill3 + 1;
      remove (self);
      return TRUE;
    }
  }

  return FALSE;
};