void main()
{
object oStore = GetNearestObjectByTag("Cain");
 if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
   OpenStore(oStore, GetPCSpeaker());
 else
  ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}


