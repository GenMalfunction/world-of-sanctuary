//::**********************************************
//:: Script: pgs_con_lst_prev
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will determine if the "prev set"
    option is available to oPlayer.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
int StartingConditional()
{
    return GetLocalInt (GetPCSpeaker(), "PGS_List_Prev");
}
