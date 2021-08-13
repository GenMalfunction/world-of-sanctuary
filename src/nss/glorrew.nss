//::///////////////////////////////////////////////
//:: FileName glorrew
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/25/2002 9:47:51 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
	// Give the speaker some XP
	RewardPartyXP(1700, GetPCSpeaker());

	// Give the speaker the items
	CreateItemOnObject("bracersofglorfin", GetPCSpeaker(), 1);


	// Remove items from the player's inventory
	object oItemToTake;
	oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "StonefromArathorn");
	if(GetIsObjectValid(oItemToTake) != 0)
		DestroyObject(oItemToTake);
	oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "EssenseofIceDrake");
	if(GetIsObjectValid(oItemToTake) != 0)
		DestroyObject(oItemToTake);
	oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "Athelas");
	if(GetIsObjectValid(oItemToTake) != 0)
		DestroyObject(oItemToTake);
}
