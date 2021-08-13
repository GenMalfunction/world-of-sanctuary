void main()
{
object oPC = GetPCSpeaker();
object oItem;
oItem = GetItemPossessedBy(oPC, "crystallost");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
CreateItemOnObject("keyshadow", oPC);
}

