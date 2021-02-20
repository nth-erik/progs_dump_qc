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
