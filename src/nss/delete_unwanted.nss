void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

object oItem;

//oItem = GetItemPossessedBy(oPC, "DarthVaderAmulet");
//if (GetIsObjectValid(oItem))
//   DestroyObject(oItem);

//oItem = GetItemPossessedBy(oPC, "DarthVaderBracer");
//if (GetIsObjectValid(oItem))
//   DestroyObject(oItem);

//oItem = GetItemPossessedBy(oPC, "CloakoftheDark");
//if (GetIsObjectValid(oItem))
//   DestroyObject(oItem);

//oItem = GetItemPossessedBy(oPC, "LongswordoftheDark");
//if (GetIsObjectValid(oItem))
//   DestroyObject(oItem);

//oItem = GetItemPossessedBy(oPC, "DarkMaulWeapon");
//if (GetIsObjectValid(oItem))
//   DestroyObject(oItem);

//oItem = GetItemPossessedBy(oPC, "RingoftheDark");
//if (GetIsObjectValid(oItem))
//   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "uberrunesword");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "Furplus");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
}
