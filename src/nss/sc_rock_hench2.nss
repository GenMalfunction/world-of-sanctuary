
int StartingConditional()
{
object oPC = GetPCSpeaker();
object oHench = GetHenchman(oPC);
int nBonus = GetAbilityScore(oHench,ABILITY_STRENGTH);
nBonus = (nBonus*4 + GetAbilityModifier(ABILITY_STRENGTH,oHench)*10) - 100;
    // Add the randomness
    if(Random(100) >= nBonus)
        return FALSE;

    return TRUE;
}


// Chance at strength 11 = 10%
// Chance at strength 12 = 30%
// Chance at strength 13 = 40%
// Chance at strength 14 = 60%
// Chance at strength 15 = 70%
// Chance at strength 16 = 90%
// Chance at strength 17 = 100%
// Chance at strength 18 = 100%
