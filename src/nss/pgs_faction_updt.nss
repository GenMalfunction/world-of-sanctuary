//::**********************************************
//:: Script: pgs_faction_updt
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will update oPlayer's faction
    among all other PCs currently online.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();
    object oPCLoop = GetFirstPC();
    int iGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);

    //Update faction among all players online based on guild factions.
    while (oPCLoop != OBJECT_INVALID)
    {
        if (PGS_GetGuildInt (iGuild, PGS_GUILD_FACTION + IntToString (PGS_GetPlayerInt (oPCLoop, PGS_GUILD_NUMBER))) == -1)
            SetPCDislike (oPlayer, oPCLoop);

        oPCLoop = GetNextPC();
    }

    //Inform oPlayer faction has been updated.
    SendMessageToPC (oPlayer, "Faction status among rival guild members has " +
        "been updated.");
}
