/*
==============================================================================

Debug utilities

These features are intended for debugging the game.

==============================================================================
*/



/*
====================================
Functions that report on game states
====================================
*/

/*
-----------------------------------------------------------------------
Broadcast entity state report

Reports on an entity by naming entity category and event description
Follows the format: "<type> '<self.classname>' <text> at <self.origin>"

type: Subject type
text: Action taken by subject

Credits to johnfitz
-----------------------------------------------------------------------
*/
void(string type, string text) print_self =
{
  dprint (type);
  dprint (" '");
  dprint (self.classname);
  dprint ("' ");
  dprint (text);
  dprint (" at ");
  dprint (vtos(self.origin));
  dprint ("\n");
};

/*
----------------------------------------------------------------------------
Inhibition total report

Reports the summary line about the total number of entities inhibited by one
of the new not-on-skill spawnflags (see PrintInhibitionSummary)
Skipped when there is nothing to report

total:          Total number of inhibited entities
spawnflag_name: Name of the spawnflag rule which inhibited the entity

Credits to iw
----------------------------------------------------------------------------
*/
void(float total, string spawnflag_name) PrintInhibitionTotal =
{
	if (total == 0)
		return;

	dprint ("... ");
	dprint (ftos (total));
	dprint (" with '");
	dprint (spawnflag_name);
	dprint ("' spawnflag\n");
};

/*
---------------------------------------------------------------------------
Inhibition summary report

Reports a summary of the number of entities inhibited by the new spawnflags
Disables itself - can be relogged by resetting "done_inhibition_summary"

Call at the first line of the "StartFrame" function in world.qc like so:

  if (!done_inhibition_summary)
    PrintInhibitionSummary ();

The engine already logs a developer message about the number of entities
inhibited by the built-in spawnflags
This function complements the original debug message

Credits to iw
---------------------------------------------------------------------------
*/
void() PrintInhibitionSummary =
{
	dprint (ftos (total_not_in_coop + total_not_in_sp +
			total_not_on_skill2 + total_not_on_skill3));
	dprint (" additional entities inhibited by the progs.dat\n");

	PrintInhibitionTotal (total_not_in_coop, "Not in Coop");
	PrintInhibitionTotal (total_not_in_sp, "Not in Single Player");
	PrintInhibitionTotal (total_not_on_skill2, "Not on Hard Only");
	PrintInhibitionTotal (total_not_on_skill3, "Not on Nightmare Only");

	done_inhibition_summary = TRUE;
};
