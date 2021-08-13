//::///////////////////////////////////////////////
//:: FileName havewayp18
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 25-7-2005 15:02:44
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
    if(!HasItem(GetPCSpeaker(), "wayp10"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp11"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp12"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp13"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp14"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp15"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp16"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp17"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp18"))
        return FALSE;

    return TRUE;
}
