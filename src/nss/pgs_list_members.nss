//::**********************************************
//:: Script: pgs_list_members
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will build the member list for
    oPlayer's guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/26/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();
    int iGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
    int iMemberCount = PGS_GetGuildInt (iGuild, PGS_GUILD_MEMBER_COUNT);
    int iPosition = GetLocalInt (oPlayer, "PGS_List_Position") + 1;
    int iCount, iListPos;
    string sMemberList = PGS_GetGuildString (iGuild, PGS_GUILD_MEMBER_LIST);
    string sTemp, sMemberName;

    //Determine if 'Next Set' option is available:
    if ((iPosition + 8) <= iMemberCount)
    {
        SetLocalInt (oPlayer, "PGS_List_Next", TRUE);
        SetLocalInt (oPlayer, "PGS_Next_List_Position", iPosition + 7);
    }

    //If necessary, loop through member list to display next set.
    if (iPosition > 2)
        for (iCount = 1; iCount < iPosition; iCount++)
        {
            iPosition = FindSubString (sMemberList, "***");
            sMemberList = GetStringRight (sMemberList, GetStringLength
                (sMemberList) - (iPosition + 3));
        }

    //Loop through current member list (at iPosition), and build it:
    for (iCount = 1; iCount < 9; iCount++)
    {
        iPosition = FindSubString (sMemberList, "***");

        //Check if end of member list has been reached:
        if (iPosition == -1)
            DeleteLocalString (oPlayer, "PGS_List_Entry" + IntToString (iCount));

        else
        {
            //Retrieve current member from list, then update it:
            sTemp = GetStringLeft (sMemberList, iPosition);
            sMemberList = GetStringRight (sMemberList, GetStringLength
                (sMemberList) - (iPosition + 3));
            iPosition = FindSubString (sTemp, "#");
            sMemberName = GetStringLeft (sTemp, iPosition);

            //Store member position for list:
            SetLocalString (oPlayer, "PGS_List_Entry" + IntToString (iCount),
                sMemberName + "  [" + GetStringRight (sTemp, GetStringLength
                (sTemp) - (iPosition + 1)) + "]");
            SetLocalString (oPlayer, "PGS_Member_Name" + IntToString (iCount), sMemberName);
        }
    }
}
