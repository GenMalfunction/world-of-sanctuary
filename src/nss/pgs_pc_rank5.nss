//::**********************************************
//:: Script: pgs_pc_rank5
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will determine if oPlayer's
    rank is greater than or equal to 5.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    //Check if oPlayer's rank is greater than or equal to 5.
    return (PGS_GetPlayerInt (GetPCSpeaker(), PGS_GUILD_RANK) >= 5);
}
