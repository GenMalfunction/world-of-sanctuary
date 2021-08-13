#include "nw_i0_tool"

/*
void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

CreateItemOnObject("khalimseye", oPC);

SpeakString("Someone found Khalim's Eye !", TALKVOLUME_SHOUT);
}
*/

void main()
{
object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

if(!HasItem(oPC, "khalimseye"))

{
CreateItemOnObject("khalimseye", oPC);

SpeakString("Someone found Khalim's Eye !", TALKVOLUME_SHOUT);
}
}

