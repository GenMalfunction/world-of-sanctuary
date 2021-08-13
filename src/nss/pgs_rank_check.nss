//::**********************************************
//:: Script: pgs_rank_check
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will update the rank of the
    currently selected member from the list.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 6/29/2007
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iPlayerRank = PGS_GetPlayerInt (oPlayer, PGS_GUILD_RANK);
    int iNewRank = GetLocalInt (oPlayer, "PGS_Rank_Var");
    string sMemberName = GetLocalString (oPlayer, "PGS_Member_Name" +
        IntToString (GetLocalInt (oPlayer, "PGS_Generic_Var")));
    string sMemberID = PGS_DBNAME_PC + IntToString (GetCampaignInt
        (PGS_DBNAME_UID, sMemberName));
    string sErrorReport;
    int iTargetRank = GetCampaignInt (sMemberID, PGS_GUILD_RANK);

    //Check if leader's rank is attempting to be modified:
    if (iTargetRank == 6)
        sErrorReport += "\n   - The guild leader's rank can only be modified " +
            "via the transfer of leadership.";

     //Check if iNewRank is greater than oPlayer's rank:
    if (iNewRank > iPlayerRank)
        sErrorReport += "\n   - You cannot promote someone to a higher rank " +
            "than your own.";

    //Check if iTargetRank is greater than oPlayer's rank.
    if (iTargetRank > iPlayerRank)
        sErrorReport += "\n   - You cannot promote or demote a member who " +
            "holds a higher rank than you.";

    //Determine if one or more errors occured.
    if (sErrorReport != "")
    {
        SendMessageToPC (oPlayer, "Failed requirement(s):" + sErrorReport);
        AssignCommand (oPlayer, PlaySound ("gui_error"));
        return FALSE;
    }

    int iGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
    string sMemberList = PGS_GetGuildString (iGuild, PGS_GUILD_MEMBER_LIST);
    string sOldRank = PGS_GetGuildString (iGuild, PGS_GUILD_RANK_NAME +
        IntToString (iTargetRank));
    int iPosition = FindSubString (sMemberList, sMemberName + "#" + sOldRank);
    object oPCLoop = GetFirstPC();

    //Attempt to locate player object:
    while (oPCLoop != OBJECT_INVALID)
    {
        if (GetName (oPCLoop) == sMemberName)
            break;

        oPCLoop = GetNextPC();
    }

    //If member is online, adjust local and persistent rank info:
    if (oPCLoop != OBJECT_INVALID)
        PGS_SetPlayerInt (oPCLoop, PGS_GUILD_RANK, iNewRank);
    else
        SetCampaignInt (sMemberID, PGS_GUILD_RANK, iNewRank);

    //Update iGuild's member list to reflect member's rank change:
    iPosition += GetStringLength (sMemberName) + 1;
    sMemberList = GetStringLeft (sMemberList, iPosition) + PGS_GetGuildString
        (iGuild, PGS_GUILD_RANK_NAME + IntToString (iNewRank)) + GetStringRight
        (sMemberList, GetStringLength (sMemberList) - (iPosition + GetStringLength
        (sOldRank)));

    //Display oTarget's name for custom token.
    SetCustomToken (7533, sMemberName);

    //Check if the guild leadership is changing hands:
    if (iNewRank == 6)
    {
        //Update leader name for iGuild:
        PGS_SetGuildString (iGuild, PGS_GUILD_LEADER, sMemberName);

        //Retrieve information from oPlayer:
        sMemberName = GetName (oPlayer);
        sOldRank = PGS_GetGuildString (iGuild, PGS_GUILD_RANK_NAME + IntToString
            (iPlayerRank));

        //Update oPlayer's rank:
        PGS_SetPlayerInt (oPlayer, PGS_GUILD_RANK, 5);

         //Update member list to reflect rank change with the old leader:
        iPosition = FindSubString (sMemberList, sMemberName + "#" + sOldRank) +
            GetStringLength (sMemberName) + 1;
        sMemberList = GetStringLeft (sMemberList, iPosition) + PGS_GetGuildString
            (iGuild, PGS_GUILD_RANK_NAME + "5") + GetStringRight (sMemberList,
            GetStringLength (sMemberList) - (GetStringLength (PGS_GetGuildString
            (iGuild, PGS_GUILD_RANK_NAME + "6")) + iPosition));

        //Inform guild members of leadership change:
        PGS_SendNotice (iGuild, sMemberName + " has stepped down from guild " +
            "leader, and has appointed " + PGS_GetGuildString (iGuild,
            PGS_GUILD_LEADER) + " as the new leader.");
    }
    else
    {
        string sRankChange;

        //Determine if the rank change was a promotion or demotion:
        if (iNewRank > iTargetRank)
            sRankChange = "promoted";
        else
            sRankChange = "demoted";

        //Inform guild members of rank change:
        PGS_SendNotice (iGuild, sMemberName + " has been " + sRankChange +
            " to the rank of '" + PGS_GetGuildString (iGuild, PGS_GUILD_RANK_NAME +
            IntToString (iNewRank)) + "'.");
    }

    //Store updated member list (now reflecting rank change(s)):
    PGS_SetGuildString (iGuild, PGS_GUILD_MEMBER_LIST, sMemberList);
    return TRUE;
}
