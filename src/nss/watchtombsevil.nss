void main()
{
object oPC = GetEnteringObject();
if (!GetIsPC(oPC)) return;
object oItem;
oItem = GetItemPossessedBy(oPC, "teleport_magic");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
}
