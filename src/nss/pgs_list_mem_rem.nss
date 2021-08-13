//::**********************************************
//:: Script: pgs_list_mem_rem
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will remove the selected PC
    in the member list from the guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/26/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();
    object oPCLoop = GetFirstPC();
    int iPCRank = PGS_GetPlayerInt (oPlayer, PGS_GUILD_RANK);
    int iGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
    string sMemberName = GetLocalString (oPlayer, "PGS_Member_Name" +
        IntToString (GetLocalInt (oPlayer, "PGS_Generic_Var")));
    string sMemberList = PGS_GetGuildString (iGuild, PGS_GUILD_MEMBER_LIST);
    string sTemp;
    int iPosition = FindSubString (sMemberList, sMemberName + "#");
    string sMemberID = PGS_DBNAME_PC + IntToString (GetCampaignInt (PGS_DBNAME_UID, sMemberName));
    int iMemberRank = GetCampaignInt (sMemberID, PGS_GUILD_RANK);

    //Check if leader is attempting to remove him/herself:
    if ((iPCRank == 6) && (iMemberRank == 6))
    {
        SendMessageToPC (oPlayer, "To remove your guild, use the 'Disband from " +
            "guild' option.  Otherwise, you can promote another member to " +
            "take over as guild leader.");
        PlaySound ("gui_error");
        return;
    }

    //Check if oPlayer's rank is higher than the member he/she is attempting
    //to remove.  If not, oPlayer cannot remove said member.
    if (iPCRank < iMemberRank)
    {
        SendMessageToPC (oPlayer, "You cannot remove a member whose rank is " +
            "greater than your own.");
        PlaySound ("gui_error");
        return;
    }

    //Loop through players and see if the one being removed is online.
    while (oPCLoop != OBJECT_INVALID)
    {
        //Check for player match via name.
        if (GetName (oPCLoop) == sMemberName)
            break;

        oPCLoop = GetNextPC();
    }

    //Check if player was found online.
    if (GetIsObjectValid (oPCLoop))
        PGS_DisbandPlayer (oPCLoop, "You have been removed from the guild by " +
            GetName (oPlayer) + ".");

    else    //Player was not found online.  Remove him from the member list.
    {
        //Store disband info to inform the member next time he/she logs on.
        SetCampaignInt (sMemberID, PGS_GUILD_DISBANDED, TRUE);

        //Delete member's guild-related information.
        DeleteCampaignVariable (sMemberID, PGS_GUILD_NUMBER);
        DeleteCampaignVariable (sMemberID, PGS_GUILD_RANK);

        //Update iGuild's information to reflect lost member.
        PGS_SetGuildInt (iGuild, PGS_GUILD_MEMBER_COUNT, PGS_GetGuildInt
            (iGuild, PGS_GUILD_MEMBER_COUNT) - 1);

        sTemp = GetStringLeft (sMemberList, iPosition);
        iPosition += GetStringLength (sMemberName);
        iPosition += GetStringLength (PGS_GetGuildString (iGuild,
            PGS_GUILD_RANK_NAME + IntToString (iMemberRank)));
        iPosition += 4;
        sTemp += GetStringRight (sMemberList, GetStringLength (sMemberList) - iPosition);

        //Save updated member list for iGuild.
        PGS_SetGuildString (iGuild, PGS_GUILD_MEMBER_LIST, sTemp);
    }

    //Reset list, building it from the beginning.
    DeleteLocalInt (oPlayer, "PGS_List_Position");
}
