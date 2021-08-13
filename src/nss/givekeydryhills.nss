#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 1000);

    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 200);

    CreateItemOnObject("keydryhills", GetPCSpeaker(), 1);

SpeakString("Someone completed Horadric Scroll Quest !", TALKVOLUME_SHOUT);

// Remove items from the player's inventory
object oItemToTake;
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "horadricscroll");
if(GetIsObjectValid(oItemToTake) != 0)
DestroyObject(oItemToTake);

}
