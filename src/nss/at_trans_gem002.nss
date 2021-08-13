//::///////////////////////////////////////////////
//:: FileName at_trans_gem2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 20/10/02 17:20:22
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetPCSpeaker(), "nGem2", 1);
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "NW_IT_GEM002");
    if(GetIsObjectValid(oItemToTake) != 0)
    DestroyObject(oItemToTake);

}
