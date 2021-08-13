#include "nw_i0_tool"
int StartingConditional()
{
    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "soulstone0010"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "soulstone0011"))
        return FALSE;
    return TRUE;
}
