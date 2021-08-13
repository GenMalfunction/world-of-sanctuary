void main()
{
object oPC = GetPCSpeaker();
//------------------Part one------------------------------------
/*
object oBook1 = GetItemPossessedBy(oPC, "TeleportationGem");
//if (!GetIsObjectValid(oBook1))
DestroyObject(oBook1, 0.0f);
*/
//------------------Part two------------------------------------
int nStackSize = 1;
string sItemTemplate1 = "teleportationgem";
CreateItemOnObject(sItemTemplate1, oPC, nStackSize);

SetLocalInt(GetEnteringObject(), "KingTalk",1);
}
