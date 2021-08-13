//::**********************************************
//:: Script: pgs_set_privacy
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will change the current
    privacy status for the guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();
    int iGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
    int iMaxGuild = PGS_GetModuleInt (PGS_MAX_GUILD), iCount;
    int iIs_Private = PGS_GetGuildInt (iGuild, PGS_GUILD_PRIVACY);

    //Check if guild is attempting to become private.
    if (!iIs_Private)
    {
        //Loop through guild factions.  If guild has 1 or more enemies,
        //it cannot become a private guild.
        for (iCount = 1; iCount <= iMaxGuild; iCount++)
            if (PGS_GetGuildInt (iGuild, PGS_GUILD_FACTION + IntToString (iCount)) == -1)
            {
                SendMessageToPC (oPlayer, "Your guild cannot become private as " +
                    "you currently have one or more enemies.");
                AssignCommand (oPlayer, PlaySound ("gui_error"));
                return;
            }
    }

    //Set the new privacy state for iGuild.
    PGS_SetGuildInt (iGuild, PGS_GUILD_PRIVACY, !iIs_Private);
}
