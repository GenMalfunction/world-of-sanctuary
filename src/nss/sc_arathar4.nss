//::///////////////////////////////////////////////
//:: FileName sc_arathar4
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 29/07/02 15:24:29
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Perform skill checks
	if(!(AutoDC(DC_MEDIUM, SKILL_PERSUADE, GetPCSpeaker())))
		return FALSE;

	return TRUE;
}