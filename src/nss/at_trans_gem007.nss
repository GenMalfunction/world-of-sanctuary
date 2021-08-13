//::///////////////////////////////////////////////
//:: FileName at_trans_gem1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 20/10/02 17:18:16
//:://////////////////////////////////////////////
void main()
{
    // Set the variables
    SetLocalInt(GetPCSpeaker(), "nGem5", 1);
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_GEM007");
    if(GetIsObjectValid(oItemToTake) != 0)
    DestroyObject(oItemToTake);

}
