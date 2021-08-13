#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
    GiveGoldToCreature(GetPCSpeaker(), 1000);

    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 200);

    CreateItemOnObject("keycanyon", GetPCSpeaker(), 1);

SpeakString("Someone completed The Summoner Quest!", TALKVOLUME_SHOUT);

}
