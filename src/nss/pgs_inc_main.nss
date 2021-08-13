//::**********************************************
//:: Script: pgs_inc_main
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        An INCLUDE script, which houses all of the
    functions that are used within the 'Player
    Guild System'.

    Note: Do NOT modify this script.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_config"
#include "pgs_inc_constant"
#include "pgs_inc_uidsys"

//PGS_GetPlayerInt -
//  oObject: This refers to the actual object with which to retrieve the integer
//           from.  This can be either a PC, or an NPC.
//  sVariable: This refers to the specific type of information being requested.
//             For a list of guild-specific data that may be requested, refer
//             to the file named, "pgs_inc_constant".
int PGS_GetPlayerInt (object oObject, string sVariable);

//PGS_SetPlayerInt -
//  oObject: This refers to the actual object with which to retrieve the integer
//           from.  This can be either a PC, or an NPC.
//  sVariable: This refers to the specific type of information being requested.
//             For a list of guild-specific data that may be requested, refer
//             to the file named, "pgs_inc_constant".
//  iValue: This refers to the value being stored for sVariable.
void PGS_SetPlayerInt (object oObject, string sVariable, int iValue);

//PGS_GetGuildInt -
//  iGuild: Refers to the unique ID for the guild with which to retrieve the
//          integer from.
//  sVariable: This refers to the specific type of information being requested.
//             For a list of guild-specific data that may be requested, refer
//             to the file named, "pgs_inc_constant".
int PGS_GetGuildInt (int iGuild, string sVariable);

//PGS_SetGuildInt -
//  iGuild: Refers to the unique ID for the guild with which to retrieve the
//          integer from.
//  sVariable: This refers to the specific type of information being requested.
//             For a list of guild-specific data that may be requested, refer
//             to the file named, "pgs_inc_constant".
//  iValue: This refers to the value being stored for sVariable.
void PGS_SetGuildInt (int iGuild, string sVariable, int iValue);

//PGS_GetGuildString -
//  iGuild: Refers to the unique ID for the guild with which to retrieve the
//          integer from.
//  sVariable: This refers to the specific type of information being requested.
//             For a list of guild-specific data that may be requested, refer
//             to the file named, "pgs_inc_constant".
string PGS_GetGuildString (int iGuild, string sVariable);

//PGS_SetGuildString -
//  iGuild: Refers to the unique ID for the guild with which to retrieve the
//          integer from.
//  sVariable: This refers to the specific type of information being requested.
//             For a list of guild-specific data that may be requested, refer
//             to the file named, "pgs_inc_constant".
//  sValue: This refers to the value being stored for sVariable.
void PGS_SetGuildString (int iGuild, string sVariable, string sValue);

//PGS_GetModuleInt -
//  sVariable: This refers to the specific type of information being requested.
//             For a list of guild-specific data that may be requested, refer
//             to the file named, "pgs_inc_constant".
int PGS_GetModuleInt (string sVariable);

//PGS_SetModuleInt -
//  sVariable: This refers to the specific type of information being requested.
//             For a list of guild-specific data that may be requested, refer
//             to the file named, "pgs_inc_constant".
//  iValue: This refers to the value being stored for sVariable.
void PGS_SetModuleInt (string sVariable, int iValue);

/******************************************************************************/

//PGS_SendNotice -
//  iGuild: Refers to the unique ID for the guild with which to retrieve the
//          integer from.
//  sMessage: This is the actual message that will be sent to all guild members
//            that are currently online.
//  oSender: If passed a valid object, the resulting message will be sent as a
//           chat message from this PC.
void PGS_SendNotice (int iGuild, string sMessage, object oSender = OBJECT_INVALID);

/******************************************************************************/

//PGS_DisbandPlayer -
//  oPlayer: This refers to the actual object with which to disband.
//  sReason: This is the actual reason for oPlayer being disbanded.
void PGS_DisbandPlayer (object oPlayer, string sReason);

//PGS_DestroyGuild -
//  iGuild: Refers to the unique ID for the guild with which to retrieve the
//          integer from.
void PGS_DestroyGuild (int iGuild);

/******************************************************************************/

int PGS_GetPlayerInt (object oObject, string sVariable)
{
    return GetLocalInt (oObject, sVariable);
}

void PGS_SetPlayerInt (object oObject, string sVariable, int iValue)
{
    string sPCUniqueDB = PGS_DBNAME_PC + IntToString (GetLocalInt (oObject, "UID_Player_ID"));

    //Determine if variable should be updated, and not deleted.
    if (iValue != 0)
    {
        SetLocalInt (oObject, sVariable, iValue);
        SetCampaignInt (sPCUniqueDB, sVariable, iValue);
    }
    else  //Variable needs to be deleted, not updated.
    {
        DeleteLocalInt (oObject, sVariable);
        DeleteCampaignVariable (sPCUniqueDB, sVariable);
    }
}

int PGS_GetGuildInt (int iGuild, string sVariable)
{
    object oGuildWP = GetWaypointByTag ("WP_Guild" + IntToString (iGuild));

    //Now return the integer value that was requested.
    return GetLocalInt (oGuildWP, sVariable);
}

void PGS_SetGuildInt (int iGuild, string sVariable, int iValue)
{
    string sGuild = IntToString (iGuild);
    object oGuildWP = GetWaypointByTag ("WP_Guild" + sGuild);

    //Determine if variable should be updated, and not deleted.
    if (iValue != 0)
    {
        //Update both the local, AND the persistent variable.
        SetLocalInt (oGuildWP, sVariable, iValue);
        SetCampaignInt (PGS_DBNAME_GUILD + sGuild, sVariable, iValue);
    }
    else  //Variable needs to be deleted, not updated.
    {
        DeleteLocalInt (oGuildWP, sVariable);
        DeleteCampaignVariable (PGS_DBNAME_GUILD + sGuild, sVariable);
    }
}

string PGS_GetGuildString (int iGuild, string sVariable)
{
    object oGuildWP = GetWaypointByTag ("WP_Guild" + IntToString (iGuild));

    //Now return the string value that was requested.
    return GetLocalString (oGuildWP, sVariable);
}

void PGS_SetGuildString (int iGuild, string sVariable, string sValue)
{
    string sGuild = IntToString (iGuild);
    object oGuildWP = GetWaypointByTag ("WP_Guild" + sGuild);

    //Determine if variable should be updated, and not deleted.
    if (sValue != "")
    {
        //Update both the local, AND the persistent variable.
        SetLocalString (oGuildWP, sVariable, sValue);
        SetCampaignString (PGS_DBNAME_GUILD + sGuild, sVariable, sValue);
    }
    else  //Variable needs to be deleted, not updated.
    {
        DeleteLocalString (oGuildWP, sVariable);
        DeleteCampaignVariable (PGS_DBNAME_GUILD + sGuild, sVariable);
    }
}

int PGS_GetModuleInt (string sVariable)
{
    //Not return the variable that was requested.
    return GetLocalInt (GetModule(), sVariable);
}

void PGS_SetModuleInt (string sVariable, int iValue)
{
    object oModule = GetModule();

    //Determine if variable should be updated, and not deleted.
    if (iValue != 0)
    {
        //Update both the local, AND the persistent variable.
        SetLocalInt (oModule, sVariable, iValue);
        SetCampaignInt (PGS_DBNAME_MAIN, sVariable, iValue);
    }
    else  //Variable needs to be deleted, not updated.
    {
        DeleteLocalInt (oModule, sVariable);
        DeleteCampaignVariable (PGS_DBNAME_MAIN, sVariable);
    }
}

/******************************************************************************/

void PGS_SendNotice (int iGuild, string sMessage, object oSender = OBJECT_INVALID)
{
    object oPCLoop = GetFirstPC();
    string sName = GetName (oSender);
    int iPosition = FindSubString (sName, " ");

    //Check to see if oPlayer does not have a last name.
    if (iPosition != -1)
        sName = GetStringLeft (sName, iPosition);

    //Loop through players, and send notice to all guild members.
    while (oPCLoop != OBJECT_INVALID)
    {
        //Determine if oPCLoop is a member.
        if (PGS_GetPlayerInt (oPCLoop, PGS_GUILD_NUMBER) == iGuild)
        {
            if (GetIsObjectValid (oSender))
                SendMessageToPC (oPCLoop, sName + ": " + sMessage);

            else
                SendMessageToPC (oPCLoop, "Notice: " + sMessage);
        }

        oPCLoop = GetNextPC();
    }
}

/******************************************************************************/

void PGS_DisbandPlayer (object oPlayer, string sReason)
{
    int iGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
    string sMemList = PGS_GetGuildString (iGuild, PGS_GUILD_MEMBER_LIST);
    string sEntry = GetName (oPlayer) + "#" + PGS_GetGuildString (iGuild,
        PGS_GUILD_RANK_NAME + IntToString (PGS_GetPlayerInt (oPlayer,
        PGS_GUILD_RANK))) + "***";
    int iPosition = FindSubString (sMemList, sEntry);
    effect ePCEffect = GetFirstEffect (oPlayer);
    object oPCLoop = GetFirstPC();

    //Remove all NPCs, if present.
    AssignCommand (oPlayer, ClearAllActions());
    ApplyEffectToObject (DURATION_TYPE_INSTANT, EffectDisappear(), GetLocalObject
        (oPlayer, "PGS_Mistress_Object"));
    DestroyObject (GetLocalObject (oPlayer, "PGS_Messenger_Object"));

    //Check oPlayer's effect for a flag, and remove it.
    while (GetIsEffectValid (ePCEffect))
    {
        if (GetEffectType (ePCEffect) == EFFECT_TYPE_VISUALEFFECT)
            RemoveEffect (oPlayer, ePCEffect);

        ePCEffect = GetNextEffect (oPlayer);
    }

    //Reset oPlayer's faction to all other players:
    while (oPCLoop != OBJECT_INVALID)
    {
        //Remove all hostile factions towards oPlayer:
        SetPCLike (oPlayer, oPCLoop);

        oPCLoop = GetNextPC();
    }

    //Update oPlayer's persistent information.
    PGS_SetPlayerInt (oPlayer, PGS_GUILD_NUMBER, 0);
    PGS_SetPlayerInt (oPlayer, PGS_GUILD_RANK, 0);

    //Update iGuild's persistent information.
    PGS_SetGuildInt (iGuild, PGS_GUILD_MEMBER_COUNT, PGS_GetGuildInt (iGuild,
        PGS_GUILD_MEMBER_COUNT) - 1);
    PGS_SetGuildString (iGuild, PGS_GUILD_MEMBER_LIST, GetStringLeft (sMemList,
        iPosition) + GetStringRight (sMemList, GetStringLength (sMemList) -
        GetStringLength (sEntry) - iPosition));

    //Inform player of his/her disbandment, and send a guild notice to
    //inform all other guild members of the situation.
    SendMessageToPC (oPlayer, sReason);
    PGS_SendNotice (iGuild, GetName (oPlayer) + " has been disbanded, and is " +
        "no longer part of this guild.");
}

void PGS_DestroyGuild (int iGuild)
{
    string sMemberList = PGS_GetGuildString (iGuild, PGS_GUILD_MEMBER_LIST);
    string sMemberName, sMemberID;
    int iMaxGuild = PGS_GetModuleInt (PGS_MAX_GUILD);
    int iPosition = FindSubString (sMemberList, "***");
    int iCount;
    object oPCLoop;

    //Reset any faction changes made with iGuild:
    for (iCount = 1; iCount <= iMaxGuild; iCount++)
        //Check if iCount guild had a faction change towards iGuild:
        if (PGS_GetGuildInt (iCount, PGS_GUILD_FACTION + IntToString (iGuild)) != 0)
            PGS_SetGuildInt (iCount, PGS_GUILD_FACTION + IntToString (iGuild), 0);

    //Determine if iMaxGuild needs to be updated:
    if (iGuild == iMaxGuild)
        for (; iMaxGuild > 0; iMaxGuild--)
        {
            //Check if guild at iMaxGuild position is valid:
            if (PGS_GetGuildString (iMaxGuild, PGS_GUILD_NAME) != "")
                break;
        }

    //Update module-specific information:
    PGS_SetModuleInt (PGS_MAX_GUILD, iMaxGuild);
    PGS_SetModuleInt (PGS_GUILD_COUNT, PGS_GetModuleInt (PGS_GUILD_COUNT) - 1);

    //Loop through all members online and disband them:
    while (oPCLoop != OBJECT_INVALID)
    {
        //Disband oPCLoop if he/she was a member of iGuild:
        if (PGS_GetPlayerInt (oPCLoop, PGS_GUILD_NUMBER) == iGuild)
            PGS_DisbandPlayer (oPCLoop, "Your guild has been disbanded, and " +
                "now ceases to exist.");

        oPCLoop = GetNextPC();
    }

    //Loop through iGuild's member list and update each member's database:
    while (iPosition != -1)
    {
        //Retrieve member name from member list:
        sMemberName = GetStringLeft (sMemberList, iPosition);
        sMemberList = GetStringRight (sMemberList, GetStringLength (sMemberList) - iPosition);
        iPosition = FindSubString (sMemberName, "#");
        sMemberName = GetStringLeft (sMemberName, iPosition);

        //Retrieve sMemberName's database ID:
        sMemberID = PGS_DBNAME_PC + IntToString (GetCampaignInt (PGS_DBNAME_UID, sMemberName));

        //Update sMemberName's database to reflect guild disbandment:
        DeleteCampaignVariable (sMemberID, PGS_GUILD_NUMBER);
        DeleteCampaignVariable (sMemberID, PGS_GUILD_RANK);
        SetCampaignInt (sMemberID, PGS_GUILD_DISBANDED, TRUE);

        //Check for next member in sMemberList:
        iPosition = FindSubString (sMemberList, "***");
    }

    //Lastly, remove all local and persistent information for this guild.
    DestroyCampaignDatabase (PGS_DBNAME_GUILD + IntToString (iGuild));
    DestroyObject (GetWaypointByTag ("WP_Guild" + IntToString (iGuild)));
}
