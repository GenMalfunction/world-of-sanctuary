//::///////////////////////////////////////////////
//:: FileName quest_01_d
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2003-10-15 10:59:04 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "QWEST_01A"))
		return FALSE;

	return TRUE;
}
