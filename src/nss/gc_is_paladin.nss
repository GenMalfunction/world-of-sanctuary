//::///////////////////////////////////////////////
//:: FileName gc_is_paladin
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/11/2008 11:46:56 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Restrict based on the player's class
	int iPassed = 0;
	if(GetLevelByClass(CLASS_TYPE_PALADIN, GetPCSpeaker()) >= 1)
		iPassed = 1;
	if(iPassed == 0)
		return FALSE;

	return TRUE;
}
