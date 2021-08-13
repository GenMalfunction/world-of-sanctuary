string sSayThis;
int iTalkVolume = TALKVOLUME_TALK;
int iTalkFlag = 0;
#include "nw_i0_tool"

void main()
{
if((!HasItem(GetPCSpeaker(), "QWEST_01A")) == FALSE){
    CreateItemOnObject("fairyinabottle", GetPCSpeaker(), 1);
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QWEST_01A");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);
    sSayThis = "You capture the fairy and put it in the bottle.";
    AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
    AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));
    SetIsDestroyable(TRUE);
    DestroyObject(OBJECT_SELF);}

else {
   sSayThis = "You need a bottle to capture the fairy.";
   AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
   AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));}
}
