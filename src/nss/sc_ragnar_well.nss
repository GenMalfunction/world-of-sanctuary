//::///////////////////////////////////////////////
//:: FileName sc_ragnar_well
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 09/10/02 11:52:56
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "nMagicWell") == 1))
		return FALSE;

	return TRUE;
}
