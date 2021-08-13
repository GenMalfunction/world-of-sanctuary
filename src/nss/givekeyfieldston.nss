#include "nw_i0_tool"
void main()
{
object oPlayer = GetEnteringObject();
GiveGoldToCreature(GetPCSpeaker(), 1000);
GiveXPToCreature(GetPCSpeaker(), 200);
CreateItemOnObject("keyfieldofstones", GetPCSpeaker(), 1);
SpeakString("Someone completed the Scroll of Inifuss Quest!", TALKVOLUME_SHOUT);
object oItemToTake;
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "scrollofinifuss");
if(GetIsObjectValid(oItemToTake) != 0)
DestroyObject(oItemToTake);
}
