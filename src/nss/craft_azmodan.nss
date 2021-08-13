void main()
{

object oPC = GetPCSpeaker();

object oItem;
oItem = GetItemPossessedBy(oPC, "vic6");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

CreateItemOnObject("azmadonsvictor", oPC);

}

