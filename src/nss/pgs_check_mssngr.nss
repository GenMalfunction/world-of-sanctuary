//::**********************************************
//:: Script: pgs_check_mssngr
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will check to see if oPlayer
    already has a messenger.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
void main()
{
    //Check if oPlayer already has a messenger.
    if (GetLocalObject (GetPCSpeaker(), "PGS_Messenger_Object") != OBJECT_INVALID)
        SetCustomToken (7519, "Disable");

    else  //oPlayer does not have a messenger.
        SetCustomToken (7519, "Enable");
}
