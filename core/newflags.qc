/*
==============================================================================

NEW SPAWNFLAGS FOR ALL ENTITIES

==============================================================================

This file was created for progs_dump by Ian "iw" Walshaw, August 2019.

It defines functions which can be called to implement the following new
spawnflags:

  4096   Not in Coop
  8192   Not in Single Player
  32768  Not on Hard Only
  65536  Not on Nightmare Only

(Spawnflag 16384 is not used here because it's already used for something else
in progs_dump.)

The new spawnflags complement and complete the set of built-in spawnflags
provided by the engine, which of course are:

  256    Not on Easy
  512    Not on Normal
  1024   Not on Hard or Nightmare
  2048   Not in Deathmatch

In conjunction with the old spawnflags, the new spawnflags make it possible
to exclude any entity from any combination of game modes and/or skill levels.


"Not in Coop" and "Not in Single Player"
----------------------------------------

These spawnflags were inspired by Quoth 2 (Kell and Necros, 2008), which
included two additional spawnflags for all entities: "Not in Coop" and
"Coop Only".  In contrast to Quoth 2, the spawnflags implemented here are
"Not in Coop" and "Not in Single Player", for symmetry with the built-in
"Not in Deathmatch" spawnflag.


"Not on Hard Only" and "Not on Nightmare Only"
----------------------------------------------

The set of built-in spawnflags doesn't allow a mapper to treat the Hard and
Nightmare skill levels differently, because it only includes one spawnflag,
1024, which excludes an entity from both Hard and Nightmare. The new
"Not on Hard Only" and "Not on Nightmare Only" spawnflags allow the mapper to
exclude an entity from one of these skill levels without affecting the other.

==============================================================================
*/

/*
--------------------------------------------------------------------------
Init new spawnflags

Initializes skill global from cvar manually for use with the new flags
Initializes additional inhibition statistics for debug in global variables
Call at the start of the worldspawn function in "world.qc"

Credits to iw
--------------------------------------------------------------------------
*/
void() InitNewSpawnflags =
{
  total_not_in_coop = 0;
  total_not_in_sp = 0;
  total_not_on_skill2 = 0;
  total_not_on_skill3 = 0;
  done_inhibition_summary = FALSE;

  // In the original code, the value of the skill cvar was not copied
  // into the skill global until the first call to StartFrame.
  // However, the new SUB_Inhibit function will need to check what the
  // skill is before then, so, the value is copied here.  -- iw
  skill = cvar ("skill");
};
