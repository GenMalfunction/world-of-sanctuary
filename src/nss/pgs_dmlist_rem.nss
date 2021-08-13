//::**********************************************
//:: Script: pgs_dmlist_rem
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will remove the selected guild
    from the DM list.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/28/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();

    //Destroy the guild, and reset the list position.
    PGS_DestroyGuild (GetLocalInt (oPlayer, "PGS_List_Guild" + IntToString
        (GetLocalInt (oPlayer, "PGS_Generic_Var"))));
    DeleteLocalInt (oPlayer, "PGS_List_Position");
}
