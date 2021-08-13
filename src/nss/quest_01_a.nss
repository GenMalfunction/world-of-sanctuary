//::///////////////////////////////////////////////
//:: FileName quest_01_a
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2003-10-15 10:44:04 AM
//:://////////////////////////////////////////////
void main()
{
    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "QWEST_01A");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);
        DestroyObject(oItemToTake);

    // Give the speaker the items
    CreateItemOnObject("emptybottle", GetPCSpeaker(), 1);



}
