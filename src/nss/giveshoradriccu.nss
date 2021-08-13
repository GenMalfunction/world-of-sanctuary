#include "nw_i0_tool"

/*
void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

CreateItemOnObject("horadricscroll", oPC);

SpeakString("Someone found the Horadric Scroll!", TALKVOLUME_SHOUT);
}
*/

void main()
{
object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

if(!HasItem(oPC, "horadricscroll"))

{
CreateItemOnObject("horadricscroll", oPC);

SpeakString("Someone found the Horadric Scroll!", TALKVOLUME_SHOUT);
}
}

