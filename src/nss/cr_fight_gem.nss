void main()
{
object oPC = GetPCSpeaker();
//------------------Part one------------------------------------
object oGem1 = GetItemPossessedBy(oPC, "FrozenFighterGem");
//if (!GetIsObjectValid(oGem1))
DestroyObject(oGem1, 0.0f);

//------------------Part two------------------------------------

int nStackSize = 1;
string sItemTemplate1 = "frozenfighterg";
CreateItemOnObject(sItemTemplate1, oPC, nStackSize);
}
