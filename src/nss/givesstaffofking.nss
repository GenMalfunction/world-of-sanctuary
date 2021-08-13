#include "nw_i0_tool"
/*
void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

CreateItemOnObject("staffofkingss", oPC);

SpeakString("Someone found the Staff Of Kings!", TALKVOLUME_SHOUT);
}
*/

void main()
{
object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

if(!HasItem(oPC, "staffofkings"))

{
CreateItemOnObject("staffofkingss", oPC);

SpeakString("Someone found the Staff Of Kings!", TALKVOLUME_SHOUT);
}
}

