//::**********************************************
//:: Script: pgs_disp_pguild
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display guild information
    for the current guild selected in the list.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/27/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iListGuild = GetLocalInt (oPlayer, "PGS_List_Guild" + IntToString
        (GetLocalInt (oPlayer, "PGS_Generic_Var")));

    //Now set the custom tokens so information can be viewed.
    SetCustomToken (7506, PGS_GetGuildString (iListGuild, PGS_GUILD_NAME));
    SetCustomToken (7507, PGS_GetGuildString (iListGuild, PGS_GUILD_DESC));
    SetCustomToken (7508, PGS_GetGuildString (iListGuild, PGS_GUILD_LEADER));
    SetCustomToken (7510, IntToString (PGS_GetGuildInt (iListGuild, PGS_GUILD_MEMBER_COUNT)));

    //Check if a DM is viewing the guild.  If so, display privacy status.
    if (GetIsDM (oPlayer) || GetIsDMPossessed (oPlayer))
    {
        //Check if guild is private or public.
        if (PGS_GetGuildInt (iListGuild, PGS_GUILD_PRIVACY))
            SetCustomToken (7511, "private");
        else
            SetCustomToken (7511, "public");

        //Display account information.
        SetCustomToken (7509, IntToString (PGS_GetGuildInt (iListGuild, PGS_GUILD_ACCOUNT)));
    }
    return TRUE;
}
