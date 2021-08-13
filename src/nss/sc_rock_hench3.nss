

int StartingConditional()
{
object oPC = GetPCSpeaker();
object oHench = GetHenchman(oPC);
int nBonus = GetAbilityScore(oHench,ABILITY_STRENGTH);
nBonus = nBonus*5 - 100 + GetAbilityModifier(ABILITY_STRENGTH,oHench)*10;
int nRoll = Random(100);
    // Add the randomness
    if(nRoll >= nBonus)
        {
//      FloatingTextStringOnCreature("Throw"+IntToString(nRoll),oPC);
        return FALSE;
        }
    return TRUE;
}

