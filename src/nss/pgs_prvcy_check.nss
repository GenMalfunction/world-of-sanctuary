//::**********************************************
//:: Script: pgs_prvcy_check
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will check to make sure
    oTarget's guild has a public status.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/28/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    object oTarget = GetLocalObject (oPlayer, "PGS_Journal_Target");
    int iTargetGuild = PGS_GetPlayerInt (oTarget, PGS_GUILD_NUMBER);
    string sTargetName = GetName (oTarget);

    //Check if iTargetGuild is currently a private guild.
    if (PGS_GetGuildInt (iTargetGuild, PGS_GUILD_PRIVACY))
    {
        SendMessageToPC (oPlayer, "Guild-specific information for " + sTargetName +
            " is unavailable...");
        AssignCommand (oPlayer, PlaySound ("gui_error"));
        return FALSE;
    }

    //Check if oTarget is in a guild.
    if (iTargetGuild == 0)
    {
        SendMessageToPC (oPlayer, sTargetName + " is currently not in a guild.");
        AssignCommand (oPlayer, PlaySound ("gui_error"));
        return FALSE;
    }

    //Display guild information for the conversation.
    SetCustomToken (7506, PGS_GetGuildString (iTargetGuild, PGS_GUILD_NAME));
    SetCustomToken (7507, PGS_GetGuildString (iTargetGuild, PGS_GUILD_DESC));
    SetCustomToken (7533, sTargetName);
    SetCustomToken (7508, PGS_GetGuildString (iTargetGuild, PGS_GUILD_LEADER));
    SetCustomToken (7510, IntToString (PGS_GetGuildInt (iTargetGuild, PGS_GUILD_MEMBER_COUNT)));

    //Store guild number for use with setting faction.
    SetLocalInt (oPlayer, "PGS_List_Guild1", iTargetGuild);
    SetLocalInt (oPlayer, "PGS_Generic_Var", 1);

    return TRUE;
}
