#include "nw_i0_tool"
void main()
{
object oPC = GetPCSpeaker();
object oItem;
oItem = GetItemPossessedBy(oPC, "IronclawTrident");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
}
