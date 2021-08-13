//::///////////////////////////////////////////////
//:: FileName quest_05_a
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2003-10-15 2:10:10 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "QWEST_05"))
		return FALSE;

	return TRUE;
}
