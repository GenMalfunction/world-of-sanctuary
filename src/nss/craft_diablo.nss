void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "vic4");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

CreateItemOnObject("diablosvictory", oPC);

}

