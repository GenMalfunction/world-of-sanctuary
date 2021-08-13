//::**********************************************
//:: Script: pgs_disp_privacy
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display the current
    privacy status for oPlayer's guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    //Determine if the guild has a private status.
    if (PGS_GetGuildInt (PGS_GetPlayerInt (GetPCSpeaker(), PGS_GUILD_NUMBER), PGS_GUILD_PRIVACY))
        SetCustomToken (7511, "private");

    else  //Guild has a public status.
        SetCustomToken (7511, "public");

    return TRUE;
}
