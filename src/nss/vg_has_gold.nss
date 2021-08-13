int StartingConditional()
{
object oPC = GetPCSpeaker();
// Reject player if they don't have 10 gold
int iGold = GetGold(oPC);
if(iGold < 10)
    {
    return FALSE;
    }
return TRUE;
}
