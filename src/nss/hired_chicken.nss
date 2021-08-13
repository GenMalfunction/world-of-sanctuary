//::///////////////////////////////////////////////
//:: FileName hired_chicken
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 11/14/2002 2:35:26 PM
//:://////////////////////////////////////////////
 #include "nw_i0_henchman"
void main()
{

    // Remove some gold from the player
    TakeGoldFromCreature(10, GetPCSpeaker(), TRUE);
    // Hench Chicken Joins the Player
    if (GetIsObjectValid(GetHenchman(GetPCSpeaker())) == TRUE)
    {   SetFormerMaster(GetPCSpeaker(), GetHenchman(GetPCSpeaker()));
    object oHench = GetHenchman(GetPCSpeaker());
    RemoveHenchman(GetPCSpeaker(), GetHenchman(GetPCSpeaker()));
    AssignCommand(oHench, ClearAllActions());
    }
    SetWorkingForPlayer(GetPCSpeaker());
    SetBeenHired();

    ExecuteScript("NW_CH_JOIN", OBJECT_SELF);
}
