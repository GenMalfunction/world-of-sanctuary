#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
   // GiveGoldToCreature(GetPCSpeaker(), 1000);

    // Give the speaker some XP
   // GiveXPToCreature(GetPCSpeaker(), 1000);

SpeakString("Someone completed the Search for Quov Tsin quest!", TALKVOLUME_SHOUT);

}
