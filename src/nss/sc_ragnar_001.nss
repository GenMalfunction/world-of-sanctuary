//::///////////////////////////////////////////////
//:: FileName sc_ragnar_001
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 09/10/02 11:45:08
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "nRagnarSpeak") == 1))
		return FALSE;

	return TRUE;
}
