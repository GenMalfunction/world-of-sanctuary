#include "nw_i0_plot"
void main()
{
object oStore = GetNearestObjectByTag("X2_STORETHIEF003");
 if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
   OpenStore(oStore, GetPCSpeaker());
 else
  ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
