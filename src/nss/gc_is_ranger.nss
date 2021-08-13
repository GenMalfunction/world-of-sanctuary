//::///////////////////////////////////////////////
//:: FileName gc_is_ranger
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/11/2008 12:18:32 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Restrict based on the player's class
	int iPassed = 0;
	if(GetLevelByClass(CLASS_TYPE_RANGER, GetPCSpeaker()) >= 1)
		iPassed = 1;
	if(iPassed == 0)
		return FALSE;

	return TRUE;
}
