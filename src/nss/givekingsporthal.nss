#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 1000);

    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 1000);

    CreateItemOnObject("keykingsporthall", GetPCSpeaker(), 1);

SpeakString("Someone completed the Bael quest!", TALKVOLUME_SHOUT);

}
