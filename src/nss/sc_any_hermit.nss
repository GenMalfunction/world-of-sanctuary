//::///////////////////////////////////////////////
//:: FileName sc_any_hermit
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 16/05/03 17:19:04
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "nHermitMet") == 1))
		return FALSE;

	return TRUE;
}
