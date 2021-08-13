void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "vic9");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

CreateItemOnObject("horavictory", oPC);

}

