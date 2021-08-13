//::**********************************************
//:: Script: pgs_disp_rmodify
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display the rank name
    that was selected by oPlayer to be modified.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();

    //Now lets set the custom token.
    SetCustomToken (7518, PGS_GetGuildString (PGS_GetPlayerInt (oPlayer,
        PGS_GUILD_NUMBER), PGS_GUILD_RANK_NAME + IntToString (GetLocalInt
        (oPlayer, "PGS_Rank_Var"))));

    return TRUE;
}
