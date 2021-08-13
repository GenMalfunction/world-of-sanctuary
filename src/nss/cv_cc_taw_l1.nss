// level one characters only

int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetHitDice(oPC) >  1) return FALSE;

return TRUE;
}

