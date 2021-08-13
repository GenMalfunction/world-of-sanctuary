void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "vic7");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

CreateItemOnObject("belialsvictory", oPC);

}

