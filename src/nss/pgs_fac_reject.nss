//::**********************************************
//:: Script: pgs_fac_reject
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will inform the faction sender
    that his/her request was rejected.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/27/2006
//::**********************************************
void main()
{
    object oPlayer = GetPCSpeaker();
    object oSender = GetLocalObject (oPlayer, "PGS_Journal_Activator");

    //Inform invite sender and reciever of the rejection.
    SendMessageToPC (oPlayer, "You have rejected the faction offer from " +
        GetName (oSender) + ".");
    SendMessageToPC (oSender, GetName (oPlayer) + " has rejected your " +
        "faction offer.");

    //Clear activator object.
    DeleteLocalObject (oPlayer, "PGS_Journal_Activator");
    DeleteLocalInt (oPlayer, "PGS_Faction_Offer");
}
