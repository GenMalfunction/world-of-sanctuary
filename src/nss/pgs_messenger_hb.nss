//::**********************************************
//:: Script: pgs_messenger_hb
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        OnHeartbeat script for the messenger.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/28/2006
//::**********************************************
void main()
{
    object oMaster = GetLocalObject (OBJECT_SELF, "PGS_Listen_For");

    //Check if the messenger and it's master are in the same area.
    if (GetArea (OBJECT_SELF) != GetArea (oMaster))
    {
        ClearAllActions();
        ActionJumpToLocation (GetLocation (oMaster));
        ActionForceFollowObject (oMaster, 1.5f);
    }
}
