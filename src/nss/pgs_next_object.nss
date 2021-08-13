//::**********************************************
//:: Script: pgs_next_object
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will set the next object
    position for the current list.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/28/2006
//::**********************************************
void main()
{
    object oPlayer = GetPCSpeaker();

    //Update current position and reset "next set" option.
    SetLocalObject (oPlayer, "PGS_Object_Position", GetLocalObject (oPlayer,
        "PGS_Next_Object_Position"));
    DeleteLocalInt (oPlayer, "PGS_List_Next");
}
