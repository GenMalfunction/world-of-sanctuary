//::**********************************************
//:: Script: pgs_create_guild
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will create a new guild with
    the information entered by oPlayer.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    object oMistress = GetLocalObject (oPlayer, "PGS_Mistress_Object");
    string sTempGuildName = PGS_GetGuildString (1, PGS_GUILD_NAME);
    string sLeader = GetName (oPlayer);
    int iCount = 1, iPCGold = GetGold (oPlayer);

    //Remove the Guild Mistress NPC.
    DelayCommand (1.0f, AssignCommand (oMistress, PlayVoiceChat (VOICE_CHAT_GOODBYE)));
    DelayCommand (2.0f, ApplyEffectToObject (DURATION_TYPE_INSTANT,
        EffectDisappear(), oMistress));

    //Attempt to take guild creation cost from oPlayer.
    if (iPCGold < PGS_NEW_GUILD_COST)
    {
        SendMessageToPC (oPlayer, "Failed requirement:\n   - " + IntToString
            (PGS_NEW_GUILD_COST) + " gold pieces are needed.");
        AssignCommand (oPlayer, PlaySound ("gui_error"));
        return FALSE;
    }

    //Take guild creation cost amount from oPlayer.
    TakeGoldFromCreature (PGS_NEW_GUILD_COST, oPlayer, TRUE);

    //Find first available position to store guild.
    while (sTempGuildName != "")
    {
        iCount++;
        sTempGuildName = PGS_GetGuildString (iCount, PGS_GUILD_NAME);
    }

    //Check if new max guild number is needed.
    if (iCount > PGS_GetModuleInt (PGS_MAX_GUILD))
        PGS_SetModuleInt (PGS_MAX_GUILD, iCount);

    //Update module guild count.
    PGS_SetModuleInt (PGS_GUILD_COUNT, PGS_GetModuleInt (PGS_GUILD_COUNT) + 1);

    CreateObject (OBJECT_TYPE_WAYPOINT, "nw_waypoint001", GetStartingLocation(),
        FALSE, "WP_Guild" + IntToString (iCount));

    //Valid position found for guild, now store information.
    PGS_SetGuildString (iCount, PGS_GUILD_NAME, GetLocalString (oPlayer, "PGS_Temp_Guild_Name"));
    PGS_SetGuildString (iCount, PGS_GUILD_DESC, GetLocalString (oPlayer, "PGS_Temp_Guild_Desc"));
    PGS_SetGuildInt (iCount, PGS_GUILD_PRIVACY, GetLocalInt (oPlayer, "PGS_Generic_Var") - 1);
    PGS_SetGuildString (iCount, PGS_GUILD_LEADER, sLeader);
    PGS_SetGuildInt (iCount, PGS_GUILD_MEMBER_COUNT, 1);
    PGS_SetGuildString (iCount, PGS_GUILD_MEMBER_LIST, sLeader + "#" +
        PGS_DEFAULT_RANK6 + "***");

    //Set default rank names for the guild.
    PGS_SetGuildString (iCount, PGS_GUILD_RANK_NAME + "6", PGS_DEFAULT_RANK6);
    PGS_SetGuildString (iCount, PGS_GUILD_RANK_NAME + "5", PGS_DEFAULT_RANK5);
    PGS_SetGuildString (iCount, PGS_GUILD_RANK_NAME + "4", PGS_DEFAULT_RANK4);
    PGS_SetGuildString (iCount, PGS_GUILD_RANK_NAME + "3", PGS_DEFAULT_RANK3);
    PGS_SetGuildString (iCount, PGS_GUILD_RANK_NAME + "2", PGS_DEFAULT_RANK2);
    PGS_SetGuildString (iCount, PGS_GUILD_RANK_NAME + "1", PGS_DEFAULT_RANK1);

    //Finally, store guild-specific information on oPlayer.
    PGS_SetPlayerInt (oPlayer, PGS_GUILD_NUMBER, iCount);
    PGS_SetPlayerInt (oPlayer, PGS_GUILD_RANK, 6);

    return TRUE;
}
