//::**********************************************
//:: Script: pgs_vgnome_end
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will end the Vault Gnome from
    listening.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/27/2006
//::**********************************************
void main()
{
    //Stop Vault Gnome from listening.
    SetListening (OBJECT_SELF, FALSE);
    DeleteLocalObject (OBJECT_SELF, "PGS_Listen_For");
}
