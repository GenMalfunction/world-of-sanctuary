//::**********************************************
//:: Script: pgs_pc_disband
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will disband the current PC
    from his/her guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();

    //Determine if oPlayer is not the guild leader.
    if (PGS_GetPlayerInt (oPlayer, PGS_GUILD_RANK) != 6)
        PGS_DisbandPlayer (oPlayer, "You have disbanded from the guild.");

    else  //oPlayer is the leader, destroy guild.
        PGS_DestroyGuild (PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER));
}
