string sSayThis;
int iTalkVolume = TALKVOLUME_TALK;
int iTalkFlag = 0;
#include "nw_i0_tool"

void main()
{
if((!HasItem(GetPCSpeaker(), "QWEST_02")) == FALSE){
    RewardPartyGP(100000, GetPCSpeaker());
    RewardPartyXP(100, GetPCSpeaker());
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QWEST_02");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
    sSayThis = "Good.  This will keep others from blowing wind around the Sanctuary. Take this money for your trouble.";
    AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
    AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));
    }

else {
   sSayThis = "Hey!  Did you get his tongue or not?";
   AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
   AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));}
}
