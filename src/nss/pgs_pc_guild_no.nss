//::**********************************************
//:: Script: pgs_pc_guild_no
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will determine if oPlayer is
    currently not involved in a guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    //Check if oPlayer is not in a guild.
    return (PGS_GetPlayerInt (GetPCSpeaker(), PGS_GUILD_NUMBER) == 0);
}
