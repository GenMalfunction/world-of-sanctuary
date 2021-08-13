//::///////////////////////////////////////////////
//:: FileName have_dragonblood
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: NW_IT_MSMLMISC17 = Dragon Blood
//:: Created By: Script Wizard
//:: Created On: 29/12/2003 1:59:22 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "NW_IT_MSMLMISC17"))
        return FALSE;

    return TRUE;
}

