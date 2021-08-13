int StartingConditional()
{
    object oHench = GetHenchman(GetPCSpeaker());
    object oPC = GetPCSpeaker();
    if (GetAbilityScore(oPC,ABILITY_STRENGTH)>GetAbilityScore(oHench,ABILITY_STRENGTH))
    return TRUE;
return FALSE;
}
