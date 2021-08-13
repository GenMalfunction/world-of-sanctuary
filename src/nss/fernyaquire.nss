//::///////////////////////////////////////////////
//:: FileName fernyaquire
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/14/2002 9:40:25 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!CheckPlayerForItem(GetPCSpeaker(), "RingofSharkey"))
        return FALSE;

    return TRUE;
}
