//::///////////////////////////////////////////////
//:: FileName tapasanta2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 22.12.2002 22:44:33
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Inspect local variables
	if(!(GetLocalInt(GetPCSpeaker(), "tapasanta") == 20))
		return FALSE;

	return TRUE;
}
