#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

   // Give the speaker some gold
//    GiveGoldToCreature(GetPCSpeaker(), 100);

    // Give the speaker some XP
//    GiveXPToCreature(GetPCSpeaker(), 200);

    CreateItemOnObject("relicancients", GetPCSpeaker(), 1);

}
