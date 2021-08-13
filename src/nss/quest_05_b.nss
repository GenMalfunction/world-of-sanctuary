string sSayThis;
int iTalkVolume = TALKVOLUME_TALK;
int iTalkFlag = 0;
#include "nw_i0_tool"

void main()
{
if((!HasItem(GetPCSpeaker(), "QWEST_05")) == FALSE){
    RewardPartyXP(1000, GetPCSpeaker());
    CreateItemOnObject("thespiderscept", GetPCSpeaker(), 1);
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QWEST_05");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);
    sSayThis = "Excellent.  My friend will be pleased.  Before you go...take this holy symbol.";
    AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
    AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));
    }

else {
   sSayThis = "Hey!  Did you get the crystal or not?";
   AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
   AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));}
}
