void main()
{
object oPC = GetPCSpeaker();
// Determine Quest Number
string sQuest = GetLocalString(OBJECT_SELF,"Quest");
// Determine Ransom amount
int iRansom = GetLocalInt(OBJECT_SELF,"Ransom");
// Remove Ransom gold from the player
TakeGoldFromCreature(iRansom, oPC, TRUE);
// Shift PCs alignment toward good for doing this without murdering the criminal
AdjustAlignment(oPC,ALIGNMENT_GOOD,5);
// Give them the child to PC

SetLocalInt(oPC,"Quest"+sQuest,3);
}
