//::///////////////////////////////////////////////
//:: FileName have_bodaktooth
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: NW_IT_MSMLMISC06 = Bodak Tooth
//:: Created By: Script Wizard
//:: Created On: 29/12/2003 1:59:22 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "NW_IT_MSMLMISC06"))
        return FALSE;

    return TRUE;
}
