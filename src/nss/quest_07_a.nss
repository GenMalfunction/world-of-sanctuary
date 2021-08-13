//::///////////////////////////////////////////////
//:: FileName quest_07_a
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2003-10-15 2:45:23 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "QWEST_07"))
		return FALSE;

	return TRUE;
}
