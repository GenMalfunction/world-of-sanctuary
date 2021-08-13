#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 1000);

    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 5000);

    CreateItemOnObject("keytal", GetPCSpeaker(), 1);

SpeakString("Someone opened Tal Rasha's Tomb Chamber !", TALKVOLUME_SHOUT);

// Remove items from the player's inventory
object oItemToTake;
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "horadricstaff");
if(GetIsObjectValid(oItemToTake) != 0)
DestroyObject(oItemToTake);

}
