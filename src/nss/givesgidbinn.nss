#include "nw_i0_tool"
/*
void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

CreateItemOnObject("gidbinn", oPC);

SpeakString("Someone found the Gidbinn !", TALKVOLUME_SHOUT);
}
*/

void main()
{
object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

if(!HasItem(oPC, "gidbinn"))

{
CreateItemOnObject("gidbinn", oPC);

SpeakString("Someone found the Gidbinn !", TALKVOLUME_SHOUT);
}
}
