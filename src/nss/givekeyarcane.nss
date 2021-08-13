#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 1000);

    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 200);

    CreateItemOnObject("keyarcane", GetPCSpeaker(), 1);

SpeakString("Someone completed the Arcane Sanctuary Quest!", TALKVOLUME_SHOUT);

}
