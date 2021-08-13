//::**********************************************
//:: Script: pgs_next_integer
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will update the list position
    for the next set.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
void main()
{
    object oPlayer = GetPCSpeaker();

    //Set the new list position, and reset the "next set" option.
    SetLocalInt (oPlayer, "PGS_List_Position", GetLocalInt (oPlayer,
        "PGS_Next_List_Position"));
    DeleteLocalInt (oPlayer, "PGS_List_Next");
}
