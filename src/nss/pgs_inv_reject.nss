//::**********************************************
//:: Script: pgs_inv_reject
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will inform the invite sender
    that his/her guild invite has been rejected.
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
    SendMessageToPC (oPlayer, "You have rejected the guild invitation sent " +
        "from " + GetName (oSender) + ".");
    SendMessageToPC (oSender, GetName (oPlayer) + " has rejected your guild " +
        "invitation.");

    //Clear activator object.
    DeleteLocalObject (oPlayer, "PGS_Journal_Activator");
}
