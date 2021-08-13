//::///////////////////////////////////////////////
//:: FileName quest_04_a
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2003-10-15 1:49:07 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "QWEST_04"))
		return FALSE;

	return TRUE;
}
