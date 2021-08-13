//::///////////////////////////////////////////////
//:: FileName gc_has_bracer
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/11/2008 10:30:09 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    int nType;
    object oItem = GetItemInSlot(INVENTORY_SLOT_ARMS, GetPCSpeaker());
    // Make sure the PC speaker has these items in their inventory
    if(oItem !=OBJECT_INVALID)
    {
     nType = GetBaseItemType(oItem);
     if(nType == BASE_ITEM_BRACER)
      {
       nType = TRUE;
      }
      else
      {
       nType = FALSE;
      }
     }

    else
    {
     nType =FALSE;
    }

  return nType;
}
