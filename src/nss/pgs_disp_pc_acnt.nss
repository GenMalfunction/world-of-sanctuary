//::**********************************************
//:: Script: pgs_disp_pc_acnt
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display account info
    for oPlayer's guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    //Display account information.
    SetCustomToken (7509, IntToString (PGS_GetGuildInt (PGS_GetPlayerInt
        (GetPCSpeaker(), PGS_GUILD_NUMBER), PGS_GUILD_ACCOUNT)));

    return TRUE;
}
