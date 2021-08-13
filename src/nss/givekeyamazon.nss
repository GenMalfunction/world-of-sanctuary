#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 100000);

    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 5000);

    CreateItemOnObject("keyamazon", GetPCSpeaker(), 1);

SpeakString("Someone completed the Village of Rathma Quest!", TALKVOLUME_SHOUT);

}
