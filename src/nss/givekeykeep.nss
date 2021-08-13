#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 10000);

    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 5000);

    CreateItemOnObject("keykeep", GetPCSpeaker(), 1);

SpeakString("Someone completed the Betrayal of Harrogath Quest!", TALKVOLUME_SHOUT);

// Remove items from the player's inventory
object oItemToTake;
oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "nihlathakrelic");
if(GetIsObjectValid(oItemToTake) != 0)
DestroyObject(oItemToTake);

}
