//::///////////////////////////////////////////////
//:: FileName sc_ragnar_008
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 17/01/03 12:09:55
//:://////////////////////////////////////////////
int StartingConditional()
{
	if(!(GetAbilityScore(GetPCSpeaker(), ABILITY_WISDOM) > 10))
		return FALSE;

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "nSeenDwarfDoor") == 1))
		return FALSE;

	return TRUE;
}
