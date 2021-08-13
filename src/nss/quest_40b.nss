int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetGold(oPC) < 100000) return FALSE;

return TRUE;
}

