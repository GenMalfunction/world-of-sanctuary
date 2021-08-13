//::**********************************************
//:: Script: pgs_disp_pc_guil
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display guild-related
    information for oPlayer's guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    int iGuild = PGS_GetPlayerInt (GetPCSpeaker(), PGS_GUILD_NUMBER);

    //Now set the custom tokens so information can be viewed.
    SetCustomToken (7506, PGS_GetGuildString (iGuild, PGS_GUILD_NAME));
    SetCustomToken (7507, PGS_GetGuildString (iGuild, PGS_GUILD_DESC));
    SetCustomToken (7508, PGS_GetGuildString (iGuild, PGS_GUILD_LEADER));
    SetCustomToken (7510, IntToString (PGS_GetGuildInt (iGuild, PGS_GUILD_MEMBER_COUNT)));

    //Determine if iGuild has a private status.
    if (PGS_GetGuildInt (iGuild, PGS_GUILD_PRIVACY))
        SetCustomToken (7511, "private");

    else  //iGuild has a public status, not a private one.
        SetCustomToken (7511, "public");

    return TRUE;
}
