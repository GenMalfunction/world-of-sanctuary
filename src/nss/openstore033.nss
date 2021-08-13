void main()
{
object oStore = GetNearestObjectByTag("saaurmanmagic");
 if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
   OpenStore(oStore, GetPCSpeaker());
 else
  ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}

