#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
//    GiveGoldToCreature(GetPCSpeaker(), 10000);

    // Give the speaker some XP
//    GiveXPToCreature(GetPCSpeaker(), 1000);

    CreateItemOnObject("keyfortress", GetPCSpeaker(), 1);

SpeakString("Someone completed The Guardian Quest!", TALKVOLUME_SHOUT);

// Remove items from the player's inventory
//object oItemToTake;
//oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "khalimsbrain");
//if(GetIsObjectValid(oItemToTake) != 0)
//DestroyObject(oItemToTake);

}
