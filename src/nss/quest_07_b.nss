string sSayThis;
int iTalkVolume = TALKVOLUME_TALK;
int iTalkFlag = 0;
#include "nw_i0_tool"

void main()
{
if((!HasItem(GetPCSpeaker(), "QWEST_07")) == FALSE){
    RewardPartyXP(1000, GetPCSpeaker());
    CreateItemOnObject("bootsoftheelwins", GetPCSpeaker(), 1);
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QWEST_07");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);
    sSayThis = "Very impressive.  Before you go...take these magic boots.  They make for good traveling.";
    AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
    AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));
}

else {
   sSayThis = "Hey!  Did you find the mask or not?";
   AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
   AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));}
}
