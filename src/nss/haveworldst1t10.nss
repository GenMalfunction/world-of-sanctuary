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
    if(!HasItem(GetPCSpeaker(), "worldstone01"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "worldstone02"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "worldstone03"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "worldstone04"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "worldstone05"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "worldstone06"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "worldstone07"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "worldstone08"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "worldstone09"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "worldstone10"))
        return FALSE;

    return TRUE;
}
