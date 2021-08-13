//::///////////////////////////////////////////////
//:: FileName havewayp9
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 25-7-2005 14:52:00
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "wayp1"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp2"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp3"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp4"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp5"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp6"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp7"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp8"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp9"))
        return FALSE;

    return TRUE;
}
