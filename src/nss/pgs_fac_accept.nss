//::**********************************************
//:: Script: pgs_fac_accept
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script controls what to do when a
    faction request is accepted by a guild leader.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/27/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();
    object oPCLoop1 = GetFirstPC();
    object oPCLoop2;
    int iFactionType = GetLocalInt (oPlayer, "PGS_Faction_Offer");
    object oSender = GetLocalObject (oPlayer, "PGS_Journal_Activator");
    int iPlayerGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
    int iSenderGuild = PGS_GetPlayerInt (oSender, PGS_GUILD_NUMBER);
    string sFactionType;

    //Update faction data (in database) for both guilds.
    PGS_SetGuildInt (iPlayerGuild, PGS_GUILD_FACTION + IntToString (iSenderGuild), iFactionType);
    PGS_SetGuildInt (iSenderGuild, PGS_GUILD_FACTION + IntToString (iPlayerGuild), iFactionType);

    //Determine the faction type for this offer.
    if (iFactionType == 1)
        sFactionType = "an ally.";
    else
        sFactionType = "neutral.";

    string sGuild1Notice = "Notice: " + "A faction change has occured towards '" +
        PGS_GetGuildString (iSenderGuild, PGS_GUILD_NAME) + "', and they are " +
        "now considered " + sFactionType;

    //Send guild notice to other guild, informing them of the faction change.
    PGS_SendNotice (iSenderGuild, "A faction change has occured towards '" +
        PGS_GetGuildString (iPlayerGuild, PGS_GUILD_NAME) + "', and they are " +
        "now considered " + sFactionType);

    //Loop through all players online, and update factions for all
    //players involved in either of these two guilds.
    while (oPCLoop1 != OBJECT_INVALID)
    {
        //Check if oPCLoop1 is in iPlayerGuild:
        if (PGS_GetPlayerInt (oPCLoop1, PGS_GUILD_NUMBER) == iPlayerGuild)
        {
            SendMessageToPC (oPCLoop1, sGuild1Notice);
            oPCLoop2 = GetFirstPC();

            while (oPCLoop2 != OBJECT_INVALID)
            {
                //Check if oPCLoop2 is a member of the opposing guild:
                if (PGS_GetPlayerInt (oPCLoop2, PGS_GUILD_NUMBER) == iSenderGuild)
                    SetPCLike (oPCLoop1, oPCLoop2);

                oPCLoop2 = GetNextPC();
            }
        }

        oPCLoop1 = GetNextPC();
    }

    //Clear remaining unused variables.
    DeleteLocalObject (oPlayer, "PGS_Journal_Activator");
    DeleteLocalInt (oPlayer, "PGS_Faction_Offer");
}
