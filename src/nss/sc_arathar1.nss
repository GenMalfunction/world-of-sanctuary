//::///////////////////////////////////////////////
//:: FileName sc_arathar1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 29/07/02 15:20:41
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Restrict based on the player's class
	int iPassed = 0;
	if(GetLevelByClass(CLASS_TYPE_BARBARIAN, GetPCSpeaker()) >= 1)
		iPassed = 1;
	if((iPassed == 0) && (GetLevelByClass(CLASS_TYPE_BARD, GetPCSpeaker()) >= 1))
		iPassed = 1;
	if((iPassed == 0) && (GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker()) >= 1))
		iPassed = 1;
	if((iPassed == 0) && (GetLevelByClass(CLASS_TYPE_FIGHTER, GetPCSpeaker()) >= 1))
		iPassed = 1;
	if((iPassed == 0) && (GetLevelByClass(CLASS_TYPE_MONK, GetPCSpeaker()) >= 1))
		iPassed = 1;
	if((iPassed == 0) && (GetLevelByClass(CLASS_TYPE_PALADIN, GetPCSpeaker()) >= 1))
		iPassed = 1;
	if((iPassed == 0) && (GetLevelByClass(CLASS_TYPE_ROGUE, GetPCSpeaker()) >= 1))
		iPassed = 1;
	if((iPassed == 0) && (GetLevelByClass(CLASS_TYPE_SORCERER, GetPCSpeaker()) >= 1))
		iPassed = 1;
	if((iPassed == 0) && (GetLevelByClass(CLASS_TYPE_WIZARD, GetPCSpeaker()) >= 1))
		iPassed = 1;
	if(iPassed == 0)
		return FALSE;

	return TRUE;
}
