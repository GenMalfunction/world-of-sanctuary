//::**********************************************
//:: Script: pgs_faction_neut
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script checks to see if the option
    to become neutral is available to oPlayer.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/27/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iPCGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
    int iListGuild = GetLocalInt (oPlayer, "PGS_List_Guild" + IntToString
        (GetLocalInt (oPlayer, "PGS_Generic_Var")));

    //Determine if this option is available to oPlayer.
    return ((iPCGuild != iListGuild) && (iPCGuild != 0) && (PGS_GetGuildInt
        (iPCGuild, PGS_GUILD_FACTION + IntToString (iListGuild)) != 0));
}
