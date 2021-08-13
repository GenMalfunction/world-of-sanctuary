#include "nw_i0_tool"
void main()
{
object oPlayer = GetEnteringObject();
GiveGoldToCreature(GetPCSpeaker(), 1000);
GiveXPToCreature(GetPCSpeaker(), 200);
CreateItemOnObject("keycoldplains", GetPCSpeaker(), 1);
SpeakString("Someone completed the Den of Evil Quest!", TALKVOLUME_SHOUT);
object oItemToTake;
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "TheRingOfAkara");
if(GetIsObjectValid(oItemToTake) != 0)
DestroyObject(oItemToTake);
}
