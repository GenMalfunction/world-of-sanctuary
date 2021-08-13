//::///////////////////////////////////////////////
//:: FileName barlimerch
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/15/2002 11:54:46 AM
//:://////////////////////////////////////////////
void main()
{

	// Either open the store with that tag or let the user know that no store exists.
	object oStore = GetNearestObjectByTag("NW_STORGENRAL001");
	if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
		OpenStore(oStore, GetPCSpeaker());
	else
		ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
