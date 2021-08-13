//::**********************************************
//:: Script: pgs_target_yes
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script determines of the target from
    activating the "Guild Journal" is a valid one.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    object oTarget = GetLocalObject (oPlayer, "PGS_Journal_Target");

    //Check if oTarget is a valid object with which to display guild information.
    return (GetIsPC (oTarget) && (oPlayer != oTarget) && !GetIsDM (oTarget) &&
        !GetIsDMPossessed (oTarget));
}
