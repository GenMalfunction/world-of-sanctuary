#include "nw_i0_tool"

void main()
{
object oPlayer = GetEnteringObject();

    CreateItemOnObject("keyturdulra", GetPCSpeaker(), 1);

SpeakString("Someone completed The Lost Seals Quest!", TALKVOLUME_SHOUT);

}
