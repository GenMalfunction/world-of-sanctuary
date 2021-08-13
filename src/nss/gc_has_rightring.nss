//::///////////////////////////////////////////////
//:: FileName gc_has_rightring
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/11/2008 10:30:09 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    int nType;
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTRING ,GetPCSpeaker());
    // Make sure the PC speaker has these items in their inventory
    if(oItem !=OBJECT_INVALID)
    {
    return TRUE;
    }
    else
    {
    return FALSE;
    }

}
