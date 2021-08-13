//::**********************************************
//:: Script: pgs_disp_ranks
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display the guild's
    current ranks names.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/27/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    int iGuild = PGS_GetPlayerInt (GetPCSpeaker(), PGS_GUILD_NUMBER);
    int iCount;

    //Loop through rank names and display them in the conversation.
    for (iCount = 1; iCount <= 6; iCount++)
        SetCustomToken ((7512 + iCount), PGS_GetGuildString (iGuild,
            PGS_GUILD_RANK_NAME + IntToString (iCount)));
}
