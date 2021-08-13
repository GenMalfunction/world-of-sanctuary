//::**********************************************
//:: Script: pgs_list_pguild
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will build the public guild
    list.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/26/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();
    int iPosition = GetLocalInt (oPlayer, "PGS_List_Position");
    int iMaxGuild = PGS_GetModuleInt (PGS_MAX_GUILD);
    int iCount;
    string sGuildName;

    //Attempt to retrieve valid location for "Previous Set" option.
    for (iCount = 1; iCount < 9; iPosition--)
    {
        //Check if the beginning of the list has been reached:
        if (iPosition == 0)
            break;

        //Check if current position holds a valid public guild:
        if ((PGS_GetGuildString (iPosition, PGS_GUILD_NAME) != "") && (!PGS_GetGuildInt (iPosition, PGS_GUILD_PRIVACY)))
            iCount++;
    }

    //Check if valid "Previous Set" position was found:
    if (iCount == 8)
    {
        SetLocalInt (oPlayer, "PGS_List_Prev", TRUE);
        SetLocalInt (oPlayer, "PGS_Prev_List_Position", iPosition);
    }

    //One time update for iPosition when first list build.
    if (iPosition == 0)
        iPosition = 1;

    //Loop through guild list, and build current set.
    for (iCount = 1; iCount < 10; iPosition++)
    {
        //Check if the end of the list has been reached:
        if (iPosition > iMaxGuild)
            break;

        sGuildName = PGS_GetGuildString (iPosition, PGS_GUILD_NAME);

        //Check if guild at iPosition is valid to display:
        if ((sGuildName != "") && (!PGS_GetGuildInt (iPosition, PGS_GUILD_PRIVACY)))
        {
            //Store guild information to be displayed in convo list:
            SetLocalString (oPlayer, "PGS_List_Entry" + IntToString (iCount), sGuildName);
            SetLocalInt (oPlayer, "PGS_List_Guild" + IntToString (iCount), iPosition);
            iCount++;
        }
    }

    //Check if valid "Next Set" position was found:
    if (iCount == 9)
    {
        SetLocalInt (oPlayer, "PGS_List_Next", TRUE);
        SetLocalInt (oPlayer, "PGS_Next_List_Position", iPosition);
    }
}
