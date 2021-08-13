//::**********************************************
//:: Script: pgs_clear_member
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will clear the member list.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/28/2006
//::**********************************************
void main()
{
    object oPlayer = GetPCSpeaker();

    //Clear the member list.
    DeleteLocalInt (oPlayer, "PGS_List_Position");
    DeleteLocalObject (oPlayer, "PGS_Object_Position");
}
