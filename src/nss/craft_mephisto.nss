void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "vic3");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

CreateItemOnObject("mephistovictory", oPC);

}

