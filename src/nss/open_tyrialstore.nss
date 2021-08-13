void main()
{
object oPC = GetLastSpeaker();
object oItem;
/*
oItem = GetItemPossessedBy(oPC, "TheStoneofJordann");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
*/
object oStore = GetNearestObjectByTag("Tyrialstore");
 if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
   OpenStore(oStore, GetPCSpeaker());
 else
  ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
