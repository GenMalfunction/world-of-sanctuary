void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "vic5");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

CreateItemOnObject("baalsvictory", oPC);

}

