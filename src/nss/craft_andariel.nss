void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "vic1");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

CreateItemOnObject("andarielsvicto", oPC);

}

