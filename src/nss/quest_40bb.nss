int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetGold(oPC) < 1000000) return FALSE;

return TRUE;
}

