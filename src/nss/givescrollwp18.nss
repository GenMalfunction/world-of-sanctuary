#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 5000);

    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 200);

    CreateItemOnObject("wayp18", GetPCSpeaker(), 1);

SpeakString("Someone completed the The Seven Tombs Quest!", TALKVOLUME_SHOUT);

// Remove items from the player's inventory
//object oItemToTake;
//oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "keyduriel");
//if(GetIsObjectValid(oItemToTake) != 0)
//DestroyObject(oItemToTake);

}
