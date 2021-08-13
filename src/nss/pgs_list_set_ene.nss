//::**********************************************
//:: Script: pgs_list_set_ene
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will set the two guilds to
    have an enemy faction stance towards one
    another.
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
    int iPCGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
    int iListGuild = GetLocalInt (oPlayer, "PGS_List_Guild" + IntToString
        (GetLocalInt (oPlayer, "PGS_Generic_Var")));
    string sGuild1Notice = "Notice: " + "A faction change has occured towards '" +
        PGS_GetGuildString (iListGuild, PGS_GUILD_NAME) + "', and they are " +
        "now considered an enemy!";

    //Update faction data for both guilds in relation to each other.
    PGS_SetGuildInt (iPCGuild, PGS_GUILD_FACTION + IntToString (iListGuild), -1);
    PGS_SetGuildInt (iListGuild, PGS_GUILD_FACTION + IntToString (iPCGuild), -1);

    //Loop through all players online, adjusting personal faction towards
    //others, and informing them of the recent faction change.
    while (oPCLoop1 != OBJECT_INVALID)
    {
        //Check if oPCLoop1 is a member of oPlayer's guild:
        if (PGS_GetPlayerInt (oPCLoop1, PGS_GUILD_NUMBER) == iPCGuild)
        {
            //Inform oPCLoop1 of the faction change towards iListGuild:
            SendMessageToPC (oPCLoop1, sGuild1Notice);
            oPCLoop2 = GetFirstPC();

            //Loop through all members of opposing guild.
            while (oPCLoop2 != OBJECT_INVALID)
            {
                //Check if oPCLoop2 is a member of iListGuild:
                if (PGS_GetPlayerInt (oPCLoop2, PGS_GUILD_NUMBER) == iListGuild)
                    SetPCDislike (oPCLoop1, oPCLoop2);

                oPCLoop2 = GetNextPC();
            }
        }

        oPCLoop1 = GetNextPC();
    }

    //Send guild notices to other guild informing them of the faction change.
    PGS_SendNotice (iListGuild, "A faction change has occured towards '" +
        PGS_GetGuildString (iPCGuild, PGS_GUILD_NAME) + "', and they are " +
        "now considered an enemy!");
}
