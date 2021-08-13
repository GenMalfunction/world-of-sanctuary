string sSayThis;
int iTalkVolume = TALKVOLUME_TALK;
int iTalkFlag = 0;
#include "nw_i0_tool"

void main()
{
if((!HasItem(GetPCSpeaker(), "QWEST_06")) == FALSE){
    RewardPartyXP(500, GetPCSpeaker());
    CreateItemOnObject("g_firework_wand", GetPCSpeaker(), 1);
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QWEST_06");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);
    sSayThis = "Here.  I will trade this wand for it.";
    AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
    AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));
}

else {
   sSayThis = "Hey!  Did you get the tiger skin or not?";
   AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
   AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));}
}
