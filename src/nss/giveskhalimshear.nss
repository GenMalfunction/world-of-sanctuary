#include "nw_i0_tool"

/*
void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

CreateItemOnObject("khalimsheart", oPC);

SpeakString("Someone found Khalim's Heart !", TALKVOLUME_SHOUT);
}
*/

void main()
{
object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

if(!HasItem(oPC, "khalimsheart"))

{
CreateItemOnObject("khalimsheart", oPC);

SpeakString("Someone found Khalim's Heart !", TALKVOLUME_SHOUT);
}
}

