//::**********************************************
//:: Script: pgs_pc_rank3
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will determine if oPlayer's
    rank is greater than or equal to three (3).
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/26/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    //Return the result.
    return (PGS_GetPlayerInt (GetPCSpeaker(), PGS_GUILD_RANK) >= 3);
}
