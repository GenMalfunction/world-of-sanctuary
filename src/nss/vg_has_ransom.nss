int StartingConditional()
{
object oPC = GetPCSpeaker();
// Reject player if they don't have 10 gold
int iGold = GetGold(oPC);
int iRansom = GetLocalInt(OBJECT_SELF,"Ransom");
if(iGold < iRansom)
    {
    return FALSE;
    }
return TRUE;
}
