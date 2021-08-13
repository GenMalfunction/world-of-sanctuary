#include "nw_i0_tool"
int StartingConditional()
{
    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "soulstone0001"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "soulstone0002"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "soulstone0003"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "soulstone0004"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "soulstone0005"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "soulstone0006"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "soulstone0007"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "soulstone0008"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "soulstone0009"))
        return FALSE;
    return TRUE;
}
