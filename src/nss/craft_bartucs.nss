void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "vic8");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

CreateItemOnObject("sf_wingwand", oPC);

}

