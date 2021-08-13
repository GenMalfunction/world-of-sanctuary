//::**********************************************
//:: Script: pgs_list_set_neu
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will set the two guilds faction
    to neutral, if possible.  Otherwise, a faction
    offer will be sent to the guild leader.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/27/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();
    object oPCLoop = GetFirstPC();
    int iPCGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
    int iListGuild = GetLocalInt (oPlayer, "PGS_List_Guild" + IntToString
        (GetLocalInt (oPlayer, "PGS_Generic_Var")));
    string sErrorReport;

    //Check if guilds are currently allied with one another.
    if (PGS_GetGuildInt (iPCGuild, PGS_GUILD_FACTION + IntToString (iListGuild)) == 1)
    {
        //Update faction data for both guilds in relation to each other.
        PGS_SetGuildInt (iPCGuild, PGS_GUILD_FACTION + IntToString (iListGuild), 0);
        PGS_SetGuildInt (iListGuild, PGS_GUILD_FACTION + IntToString (iPCGuild), 0);

        //Send guild notices to both guilds informing them of the faction change.
        PGS_SendNotice (iPCGuild, "A faction change has occured towards '" +
            PGS_GetGuildString (iListGuild, PGS_GUILD_NAME) + "', and they are " +
            "now considered neutral.");
        PGS_SendNotice (iListGuild, "A faction change has occured towards '" +
            PGS_GetGuildString (iPCGuild, PGS_GUILD_NAME) + "', and they are " +
            "now considered neutral.");
    }
    else  //Guilds are currently at war with one another.
    {
        string sLeaderName = PGS_GetGuildString (iListGuild, PGS_GUILD_LEADER);

        //Loop through players online and attempt to locate guild leader.
        while (oPCLoop != OBJECT_INVALID)
        {
            if (GetName (oPCLoop) == sLeaderName)
                break;

            oPCLoop = GetNextPC();
        }

        //Check if guild leader for other guild is online:
        if (oPCLoop != OBJECT_INVALID)
        {
            //Check if leader is currently accepting faction offers.
            if (!PGS_GetPlayerInt (oPCLoop, PGS_FACTION_OFFERS))
                sErrorReport += "\n   - " + sLeaderName + " is currently not " +
                    "accepting faction offers.";

            //Check if oPlayer has a high enough rank.
            if (PGS_GetPlayerInt (oPlayer, PGS_GUILD_RANK) < 5)
                sErrorReport += "\n   - You currently do not hold a high enough " +
                    "rank to perform that action.";

            //Check if the leader is currently in combat.
            if (GetIsInCombat (oPCLoop))
                sErrorReport += "\n   - " + sLeaderName + " is currently in " +
                    "combat.";

            //Check if the leader is already in a conversation.
            if (IsInConversation (oPCLoop))
                sErrorReport += "\n   - " + sLeaderName + " is currently involved " +
                    "in another conversation.";

            //Determine if one or more errors occured.
            if (sErrorReport != "")
            {
                SendMessageToPC (oPCLoop, GetName (oPlayer) + " attempted to send " +
                "you a faction offer, but you are either busy or currently " +
                "rejecting them.");
                SendMessageToPC (oPlayer, "Failed requirement(s):" + sErrorReport);
                AssignCommand (oPlayer, PlaySound ("gui_error"));
            }
            else
            {
                //Faction request can now be sent.
                AssignCommand (oPCLoop, ClearAllActions());
                SetLocalObject (oPCLoop, "PGS_Journal_Activator", oPlayer);
                AssignCommand (oPCLoop, ActionStartConversation (oPCLoop, "pgs_faction",
                    TRUE, FALSE));
                SendMessageToPC (oPlayer, "Your faction request has successfully been " +
                    "sent to " + sLeaderName + ".");
            }
        }
        else
            SendMessageToPC (oPlayer, sLeaderName + " the leader of '" +
                PGS_GetGuildString (iListGuild, PGS_GUILD_NAME) + "' is " +
                "currently not online.  Please try this action again when " +
                "he/she is.");
    }
}
