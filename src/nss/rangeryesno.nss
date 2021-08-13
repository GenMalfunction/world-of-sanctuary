int StartingConditional()
{
object oPC = GetPCSpeaker();

if ((GetLevelByClass(CLASS_TYPE_RANGER, oPC)==0))
return FALSE;

return TRUE;
}

