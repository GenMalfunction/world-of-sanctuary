/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

//Put this script OnEnter
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

object oItem;
oItem = GetItemPossessedBy(oPC, "gateseal1");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "gateseal2");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "gateseal3");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "gateseal4");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "gateseal5");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "gateseal6");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "gateseal7");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "gateseal8");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "gateseal9");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

}

