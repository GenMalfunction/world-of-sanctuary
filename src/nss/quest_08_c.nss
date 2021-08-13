string sSayThis;
int iTalkVolume = TALKVOLUME_TALK;
int iTalkFlag = 0;
#include "nw_i0_tool"

void main()
{
if((!HasItem(GetPCSpeaker(), "QWEST_08")) == FALSE){
    RewardPartyXP(2000, GetPCSpeaker());
    CreateItemOnObject("cloakoftherhunda", GetPCSpeaker(), 1);
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QWEST_08");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);
    sSayThis = "Take this and get out of here.";
    AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
    AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));
    DelayCommand(2.0, ExecuteScript("quest_spawn", OBJECT_SELF));}

else {
   sSayThis = "Hey!  Did you get Tyrek's blood or not?";
   AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
   AssignCommand(OBJECT_SELF, ActionSpeakString(sSayThis, iTalkVolume));}
}
