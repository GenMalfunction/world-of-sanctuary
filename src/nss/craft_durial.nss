void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "vic2");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

CreateItemOnObject("durialsvictory", oPC);

}

