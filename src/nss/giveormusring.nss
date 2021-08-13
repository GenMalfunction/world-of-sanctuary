#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 1000);

    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 200);

    CreateItemOnObject("ormusring", GetPCSpeaker(), 1);

SpeakString("Someone completed the The Blade of the Old Religion Quest!", TALKVOLUME_SHOUT);

// Remove items from the player's inventory
object oItemToTake;
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "gidbinn");
if(GetIsObjectValid(oItemToTake) != 0)
DestroyObject(oItemToTake);

}
