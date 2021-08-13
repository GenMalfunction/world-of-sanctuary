//::**********************************************
//:: Script: pgs_plyr_list_gd
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display specific guild
    information for oObjectPos' guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/26/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    object oObjectPos = GetLocalObject (oPlayer, "PGS_List_Object" + IntToString
        (GetLocalInt (oPlayer, "PGS_Generic_Var")));
    int iTargetGuild = PGS_GetPlayerInt (oObjectPos, PGS_GUILD_NUMBER);

    //Display guild information for the conversation.
    SetCustomToken (7506, PGS_GetGuildString (iTargetGuild, PGS_GUILD_NAME));
    SetCustomToken (7507, PGS_GetGuildString (iTargetGuild, PGS_GUILD_DESC));
    SetCustomToken (7533, GetName (oObjectPos));
    SetCustomToken (7508, PGS_GetGuildString (iTargetGuild, PGS_GUILD_LEADER));
    SetCustomToken (7510, IntToString (PGS_GetGuildInt (iTargetGuild, PGS_GUILD_MEMBER_COUNT)));

    return TRUE;
}
