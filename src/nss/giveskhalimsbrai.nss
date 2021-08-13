#include "nw_i0_tool"

/*
void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

CreateItemOnObject("khalimsbrain", oPC);

SpeakString("Someone found Khalim's Brain !", TALKVOLUME_SHOUT);
}
*/

void main()
{
object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

if(!HasItem(oPC, "khalimsbrain"))

{
CreateItemOnObject("khalimsbrain", oPC);

SpeakString("Someone found Khalim's Brain !", TALKVOLUME_SHOUT);
}
}

