#include "nw_i0_tool"
/*
void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

CreateItemOnObject("wirtsleg", oPC);

SpeakString("Someone found Wirt's Leg!", TALKVOLUME_SHOUT);
}
*/

void main()
{
object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

if(!HasItem(oPC, "wirtsleg"))

{
CreateItemOnObject("wirtsleg", oPC);

SpeakString("Someone found Wirt's Leg!", TALKVOLUME_SHOUT);
}
}

