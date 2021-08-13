#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 3000);

    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 200);

    CreateItemOnObject("keylutgholien", GetPCSpeaker(), 1);

SpeakString("Someone completed Radament's Lair Quest!", TALKVOLUME_SHOUT);

// Remove items from the player's inventory
object oItemToTake;
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "radamentssword");
if(GetIsObjectValid(oItemToTake) != 0)
DestroyObject(oItemToTake);

}
