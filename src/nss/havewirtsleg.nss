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

    if(!HasItem(GetPCSpeaker(), "wirtsleg"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "wayp39"))
        return FALSE;

    return TRUE;
}
