//::///////////////////////////////////////////////
//:: FileName blood_chck
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/15/03 10:02:08 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "blood1"))
		return FALSE;
	if(!HasItem(GetPCSpeaker(), "blood2"))
		return FALSE;
	if(!HasItem(GetPCSpeaker(), "blood3"))
		return FALSE;

	return TRUE;
}
