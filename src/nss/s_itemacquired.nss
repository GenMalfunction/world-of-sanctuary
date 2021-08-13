#include "nw_i0_plotwizard"
void main()
{
object oItem = GetModuleItemAcquired();
object oPlayer = GetModuleItemAcquiredFrom();
  if (GetIsPC(GetItemPossessor(oItem))) {
    DeleteLocalInt(oItem, "CT_DESTRUCT_TIME");
    SetLocalInt(oItem, "PCItem", 1);
  }
}
