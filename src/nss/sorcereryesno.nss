int StartingConditional()
{
object oPC = GetPCSpeaker();

if ((GetLevelByClass(CLASS_TYPE_SORCERER, oPC)==0))
return FALSE;

return TRUE;
}

