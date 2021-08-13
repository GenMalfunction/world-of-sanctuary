//::**********************************************
//:: Script: pgs_disp_flag
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display the guild's
    current guild flag color.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    //Determine the flag color based on the integer.
    switch (PGS_GetGuildInt (PGS_GetPlayerInt (GetPCSpeaker(), PGS_GUILD_NUMBER), PGS_GUILD_FLAG_COLOR))
    {
        case 303:  SetCustomToken (7512, "Red");  break;
        case 304:  SetCustomToken (7512, "Blue");  break;
        case 305:  SetCustomToken (7512, "Purple");  break;
        case 306:  SetCustomToken (7512, "Gold");  break;
        default:  SetCustomToken (7512, "None");  break;
    }

    return TRUE;
}
