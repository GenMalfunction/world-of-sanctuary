//::///////////////////////////////////////////////
//:: FileName havegateseals
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 31-7-2005 0:36:14
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "gateseal1"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "gateseal2"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "gateseal3"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "gateseal4"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "gateseal5"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "gateseal6"))
        return FALSE;
    if(!HasItem(GetPCSpeaker(), "gateseal7"))
        return FALSE;

    return TRUE;
}
