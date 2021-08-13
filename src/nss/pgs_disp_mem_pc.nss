//::**********************************************
//:: Script: pgs_disp_mem_pc
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display both the name
    and rank of the member currently selected in
    the member list.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/26/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    string sMemberName = GetLocalString (oPlayer, "PGS_Member_Name" +
        IntToString (GetLocalInt (oPlayer, "PGS_Generic_Var")));

    //Check if oPlayer is high enough in rank to remove someone from the guild.
    if (PGS_GetPlayerInt (oPlayer, PGS_GUILD_RANK) < 4)
        return FALSE;

    //Display guild member's name and rank:
    SetCustomToken (7535, sMemberName);
    SetCustomToken (7513, PGS_GetGuildString (PGS_GetPlayerInt (oPlayer,
        PGS_GUILD_NUMBER), PGS_GUILD_RANK_NAME + IntToString (GetCampaignInt
        (PGS_DBNAME_PC + IntToString (GetCampaignInt (PGS_DBNAME_UID,
        sMemberName)), PGS_GUILD_RANK))));

    return TRUE;
}
