//::///////////////////////////////////////////////
//:: FileName sc_rock_02
//:://////////////////////////////////////////////
// Script for a removeable rock using strength
// B W-Husey 18th January 2003

int StartingConditional()
{
object oPC = GetPCSpeaker();
int nBonus = GetAbilityScore(oPC,ABILITY_STRENGTH);
nBonus = (nBonus*4 + GetAbilityModifier(ABILITY_STRENGTH,oPC)*10 )- 100 ;
    // Add the randomness
    if(Random(100) >= nBonus)
        return FALSE;

    return TRUE;
}


// Chance at strength 11 = 0%
// Chance at strength 12 = 0%
// Chance at strength 13 = 0%
// Chance at strength 14 = 0%
// Chance at strength 15 = 0%
// Chance at strength 16 = 0%
// Chance at strength 17 = 0%
// Chance at strength 18 = 12%
// Chance at strength 19 = 16%
// Chance at strength 20 = 30%
