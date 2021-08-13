#include "nw_i0_tool"

/*
void main()
{
object oPC = GetLastUsedBy();
if (!GetIsPC(oPC)) return;
CreateItemOnObject("scrollofinifuss", oPC);
SpeakString("Someone found the Tree of Inifuss!", TALKVOLUME_SHOUT);
}
*/

void main()
{
object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

if(!HasItem(oPC, "scrollofinifuss"))

{
CreateItemOnObject("scrollofinifuss", oPC);

SpeakString("Someone found the Tree of Inifuss!", TALKVOLUME_SHOUT);
}
}
