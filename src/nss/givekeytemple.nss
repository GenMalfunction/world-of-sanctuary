#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 100000);

    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 1000);

    CreateItemOnObject("keytemple", GetPCSpeaker(), 1);

SpeakString("Someone completed the Ruines Of Alterac Quest!", TALKVOLUME_SHOUT);

}
