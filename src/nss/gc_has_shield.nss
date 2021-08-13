//::///////////////////////////////////////////////
//:: FileName gc_has_shield
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Genisys
//:: Created On: 9/11/2008 10:30:09 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{
   object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND ,GetPCSpeaker());
   int nType;
    if(GetBaseItemType(oItem) == BASE_ITEM_LARGESHIELD ||
    GetBaseItemType(oItem) == BASE_ITEM_SMALLSHIELD ||
    GetBaseItemType(oItem) == BASE_ITEM_TOWERSHIELD)
    {
      return TRUE;
    }

    else
    {
    return FALSE;
    }
}
