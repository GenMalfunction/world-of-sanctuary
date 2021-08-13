//::///////////////////////////////////////////////
//:: FileName sc_ragnar_007
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 20/01/03 09:56:00
//:://////////////////////////////////////////////
int StartingConditional()
{
	if(!(GetAbilityScore(GetPCSpeaker(), ABILITY_INTELLIGENCE) > 10))
		return FALSE;

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "nRagnarPassage") == 1))
		return FALSE;

	return TRUE;
}
