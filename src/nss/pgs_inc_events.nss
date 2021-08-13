//::**********************************************
//:: Script: pgs_inc_events
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This INCLUDE script holds all of the
    module-related event functions for the PGS.
    It's purpose is to simplify the installation
    process for those wishing to utilize the PGS.

    Note: Do not modify this script.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/24/2006
//::**********************************************
#include "pgs_inc_main"

void PGS_CacheGuild (int iGuild)
{
    int iCount, iFactionGuild;
    int iMaxGuild = PGS_GetModuleInt (PGS_MAX_GUILD);
    string sGuild = IntToString (iGuild), sCount;
    object oGuildWP = CreateObject (OBJECT_TYPE_WAYPOINT, "nw_waypoint001",
        GetStartingLocation(), FALSE, "WP_Guild" + sGuild);

    //Store guild-specific information locally.
    SetLocalString (oGuildWP, PGS_GUILD_NAME, GetCampaignString (PGS_DBNAME_GUILD +
        sGuild, PGS_GUILD_NAME));
    SetLocalString (oGuildWP, PGS_GUILD_DESC, GetCampaignString (PGS_DBNAME_GUILD +
        sGuild, PGS_GUILD_DESC));
    SetLocalString (oGuildWP, PGS_GUILD_LEADER, GetCampaignString (PGS_DBNAME_GUILD +
        sGuild, PGS_GUILD_LEADER));
    SetLocalString (oGuildWP, PGS_GUILD_MEMBER_LIST, GetCampaignString (PGS_DBNAME_GUILD +
        sGuild, PGS_GUILD_MEMBER_LIST));
    SetLocalInt (oGuildWP, PGS_GUILD_ACCOUNT, GetCampaignInt (PGS_DBNAME_GUILD +
        sGuild, PGS_GUILD_ACCOUNT));
    SetLocalInt (oGuildWP, PGS_GUILD_MEMBER_COUNT, GetCampaignInt (PGS_DBNAME_GUILD +
        sGuild, PGS_GUILD_MEMBER_COUNT));
    SetLocalInt (oGuildWP, PGS_GUILD_PRIVACY, GetCampaignInt (PGS_DBNAME_GUILD +
        sGuild, PGS_GUILD_PRIVACY));
    SetLocalInt (oGuildWP, PGS_GUILD_FLAG_COLOR, GetCampaignInt (PGS_DBNAME_GUILD +
        sGuild, PGS_GUILD_FLAG_COLOR));

    //Store guild's rank names locally.
    for (iCount = 1; iCount <= 6; iCount++)
    {
        sCount = IntToString (iCount);
        SetLocalString (oGuildWP, PGS_GUILD_RANK_NAME + sCount, GetCampaignString
            (PGS_DBNAME_GUILD + sGuild, PGS_GUILD_RANK_NAME + sCount));
    }

    //Store guild's messages (title, message, & author) locally.
    for (iCount = 1; iCount <= 8; iCount++)
    {
        sCount = IntToString (iCount);
        SetLocalString (oGuildWP, PGS_MESSAGE_TITLE + sCount, GetCampaignString
            (PGS_DBNAME_GUILD + sGuild, PGS_MESSAGE_TITLE + sCount));
        SetLocalString (oGuildWP, PGS_MESSAGE_AUTHOR + sCount, GetCampaignString
            (PGS_DBNAME_GUILD + sGuild, PGS_MESSAGE_AUTHOR + sCount));
        SetLocalString (oGuildWP, PGS_MESSAGE_POST + sCount, GetCampaignString
            (PGS_DBNAME_GUILD + sGuild, PGS_MESSAGE_POST + sCount));
    }

    //Store guild's faction settings locally.
    for (iCount = 1; iCount <= iMaxGuild; iCount++)
    {
        sCount = IntToString (iCount);

        if (GetCampaignInt (PGS_DBNAME_GUILD + sGuild, PGS_GUILD_FACTION + sCount) != 0)
            SetLocalInt (oGuildWP, PGS_GUILD_FACTION + sCount, GetCampaignInt
                (PGS_DBNAME_GUILD + sGuild, PGS_GUILD_FACTION + sCount));
    }
}

void PGS_OnModuleLoad()
{
    int iMaxGuild = GetCampaignInt (PGS_DBNAME_MAIN, PGS_MAX_GUILD), iCount;

    //Cache PGS-related variables for the module.
    SetLocalInt (OBJECT_SELF, PGS_MAX_GUILD, iMaxGuild);
    SetLocalInt (OBJECT_SELF, PGS_GUILD_COUNT, GetCampaignInt (PGS_DBNAME_MAIN,
        PGS_GUILD_COUNT));

    //Loop through all guilds, and cache them (for improved performance).
    for (iCount = 1; iCount <= iMaxGuild; iCount++)
        AssignCommand (OBJECT_SELF, PGS_CacheGuild (iCount));
}

/******************************************************************************/

void PGS_OnClientEnter (object oPlayer)
{
    string sPCUniqueDB = PGS_DBNAME_PC + IntToString (GetCampaignInt (PGS_DBNAME_UID, GetName (oPlayer)));
    int iPCShowFlag = GetCampaignInt (sPCUniqueDB, PGS_SHOW_FLAG);
    int iGuild = GetCampaignInt (sPCUniqueDB, PGS_GUILD_NUMBER);

    //Determine if oEnterer does NOT have a "Guild Journal".
    if (!GetIsObjectValid (GetItemPossessedBy (oPlayer, "PGS_Item_Journal")))
        CreateItemOnObject ("pgs_item_journal", oPlayer);

    SetLocalInt (oPlayer, PGS_FACTION_OFFERS, GetCampaignInt (sPCUniqueDB, PGS_FACTION_OFFERS));
    SetLocalInt (oPlayer, PGS_INVITES, GetCampaignInt (sPCUniqueDB, PGS_INVITES));
    SetLocalInt (oPlayer, PGS_SHOW_FLAG, iPCShowFlag);

    //Check if oPlayer was removed from his/her guild while offline:
    if (GetCampaignInt (sPCUniqueDB, PGS_GUILD_DISBANDED) == TRUE)
    {
        DeleteCampaignVariable (sPCUniqueDB, PGS_GUILD_DISBANDED);

        //Inform oPlayer he/she has been disbanded from a guild.
        SendMessageToPC (oPlayer, "While away, you were disbanded from your guild.");
        PlaySound ("gui_error");

        //Manually reset local variables for oPlayer:
        DeleteLocalInt (oPlayer, PGS_GUILD_NUMBER);
        DeleteLocalInt (oPlayer, PGS_GUILD_RANK);
    }
    else if (iGuild > 0)
    {
        int iFlagColor = PGS_GetGuildInt (iGuild, PGS_GUILD_FLAG_COLOR);
        object oPCLoop = GetFirstPC();

        //Store player-specific information locally for improved access.
        SetLocalInt (oPlayer, PGS_GUILD_NUMBER, iGuild);
        SetLocalInt (oPlayer, PGS_GUILD_RANK, GetCampaignInt (sPCUniqueDB, PGS_GUILD_RANK));

        //Determine if flag should be shown on oPlayer.
        if ((PGS_ALLOW_FLAGS) && (iFlagColor != 0) && (iPCShowFlag))
            ApplyEffectToObject (DURATION_TYPE_PERMANENT, SupernaturalEffect
                (ExtraordinaryEffect (EffectVisualEffect (iFlagColor))), oPlayer);

        //Apply any necessary faction changes towards other PC's based on guild faction.
        while (oPCLoop != OBJECT_INVALID)
        {
            //Check if oPCLoop belongs to a rival guild of oPlayer's.
            if (PGS_GetGuildInt (iGuild, PGS_GUILD_FACTION + IntToString (PGS_GetPlayerInt (oPCLoop, PGS_GUILD_NUMBER))) == -1)
                SetPCDislike (oPlayer, oPCLoop);

            oPCLoop = GetNextPC();
        }
    }
}
