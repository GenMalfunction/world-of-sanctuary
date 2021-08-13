//::///////////////////////////////////////////////
//:: FileName have_coldstone
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: X1_IT_MSMLMISC01 = ColdStone
//:: Created By: Script Wizard
//:: Created On: 29/12/2003 1:59:22 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "X1_IT_MSMLMISC01"))
        return FALSE;

    return TRUE;
}
