//::///////////////////////////////////////////////
//:: FileName sc_rock_01
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 18/01/03 14:10:32
//:://////////////////////////////////////////////
int StartingConditional()
{
object oPC = GetPCSpeaker();
int nBonus = GetAbilityScore(oPC,ABILITY_STRENGTH);
nBonus = nBonus*5 - 100 + GetAbilityModifier(ABILITY_STRENGTH,oPC)*10;
int nRoll = Random(100);
    // Add the randomness
    if(nRoll >= nBonus)
        {
//      FloatingTextStringOnCreature("Throw"+IntToString(nRoll),oPC);
        return FALSE;
        }
    return TRUE;
}

// Chance at strength 15 = 0%
// Chance at strength 16 = 10%
// Chance at strength 17 = 15%
// Chance at strength 18 = 30%
// Chance at strength 19 = 35%
// Chance at strength 20 = 50%
