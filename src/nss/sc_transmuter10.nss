//::///////////////////////////////////////////////
//::Malachite
//::FileName sc_transmuter01
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 20/10/02 16:00:58
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "NW_IT_GEM007"))     //
        return FALSE;

    return TRUE;
}
