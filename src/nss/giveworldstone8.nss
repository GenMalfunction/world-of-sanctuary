#include "nw_i0_tool"

/*
void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

CreateItemOnObject("viperamulet", oPC);

SpeakString("Someone found the Viper Amulet!", TALKVOLUME_SHOUT);
}
*/

void main()
{
object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

if(!HasItem(oPC, "worldstone08"))

{
CreateItemOnObject("worldstone08", oPC);

 SpeakString("Someone found the Dunemaul !", TALKVOLUME_SHOUT);
}
}

