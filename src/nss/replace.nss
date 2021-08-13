void main()
{
object oPC = GetEnteringObject();
object oItem = GetItemPossessedBy(oPC, "item_tag");
if (GetIsObjectValid(oItem) && !GetLocalInt(oItem, "AO_IS_REPLACED"))
{
DestroyObject(oItem);
object oNew = CreateItemOnObject("item_resref", oPC);
SetLocalInt(oNew, "AO_IS_REPLACED", TRUE);
}


}
