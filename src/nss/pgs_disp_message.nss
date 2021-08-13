//::**********************************************
//:: Script: pgs_disp_message
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display information for
    the selected message from the list.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/28/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
    string sMessage = IntToString (GetLocalInt (oPlayer, "PGS_Generic_Var"));

    //Set the tokens to display the information.
    SetCustomToken (7528, PGS_GetGuildString (iGuild, PGS_MESSAGE_TITLE + sMessage));
    SetCustomToken (7529, PGS_GetGuildString (iGuild, PGS_MESSAGE_AUTHOR + sMessage));
    SetCustomToken (7530, PGS_GetGuildString (iGuild, PGS_MESSAGE_POST + sMessage));
    return TRUE;
}
