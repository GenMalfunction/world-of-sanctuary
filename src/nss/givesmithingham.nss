#include "nw_i0_tool"

void main()
{
object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

if(!HasItem(oPC, "smithhamer"))

{
CreateItemOnObject("smithhamer", oPC);

SpeakString("Someone found the Smith's Anvil !", TALKVOLUME_SHOUT);
}
}

