//::///////////////////////////////////////////////
//:: FileName blood_tak
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/15/03 10:02:08 PM
//:://////////////////////////////////////////////
void main()
{

	// Remove items from the player's inventory
	object oItemToTake;
	oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "blood1");
	if(GetIsObjectValid(oItemToTake) != 0)
		DestroyObject(oItemToTake);
	oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "blood2");
	if(GetIsObjectValid(oItemToTake) != 0)
		DestroyObject(oItemToTake);
	oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "blood3");
	if(GetIsObjectValid(oItemToTake) != 0)
		DestroyObject(oItemToTake);
}
