string sSayThis;
int iTalkVolume = TALKVOLUME_TALK;
int iTalkFlag = 0;
#include "nw_i0_tool"

void main()
{
if((!HasItem(GetPCSpeaker(), "QWEST_01")) == FALSE){
    RewardPartyXP(150, GetPCSpeaker());
    CreateItemOnObject("keyruinedtemple", GetPCSpeaker(), 1);
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QWEST_01");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);
    sSayThis = "Take this key as a token of my gratitude.";
    AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
    AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));
    }

else {
    sSayThis = "Hey!  Did you get my fairy or not?";
    AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
    AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));}
}
