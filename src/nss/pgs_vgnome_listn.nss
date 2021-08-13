//::**********************************************
//:: Script: pgs_vgnome_listn
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will set the Vault Gnome up
    to listen for a donation/withdrawal amount
    from the PCSpeaker.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/28/2006
//::**********************************************
void main()
{
    //Set the Vault Gnome to listen for a number.
    SetListenPattern (OBJECT_SELF, "*n", 7500);
    SetListening (OBJECT_SELF, TRUE);

    //Have Vault Gnome remember who to listen for.
    SetLocalObject (OBJECT_SELF, "PGS_Listen_For", GetPCSpeaker());
}
