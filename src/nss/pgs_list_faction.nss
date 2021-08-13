//::**********************************************
//:: Script: pgs_list_faction
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will build the faction list
    for iGuild based on the list selected.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iPosition = GetLocalInt (oPlayer, "PGS_List_Position"), iCount;
    int iMaxGuild = PGS_GetModuleInt (PGS_MAX_GUILD);
    int iGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
    int iFaction = GetLocalInt (oPlayer, "PGS_Faction_List");
    string sGuildName;

    //Display, to oPlayer, which faction list is being built.
    if (iFaction == 1)
        SetCustomToken (7531, "in alliance");

    else  //Enemy list is being built.
        SetCustomToken (7531, "at war");

    //Loop in reverse, attempting to retrieve a previous position.
    for (iCount = 1; iCount <= 8; iPosition--)
    {
        //Determine if we have reached the beginning of the list.
        if (iPosition == 0)
            break;

        sGuildName = PGS_GetGuildString (iPosition, PGS_GUILD_NAME);

        //Check if iPrevPos is a valid guild.
        //Check if current guild meets the criteria for our faction.
        if (PGS_GetGuildInt (iGuild, PGS_GUILD_FACTION + IntToString (iPosition)) == iFaction)
        {
            if (iCount == 8)  //Enable the "previous set" option.
            {
                SetLocalInt (oPlayer, "PGS_List_Prev", TRUE);
                SetLocalInt (oPlayer, "PGS_Prev_List_Position", iPosition - 1);
            }

            iCount++;
        }
    }

    iPosition = GetLocalInt (oPlayer, "PGS_List_Position") + 1;

    //Loop through guild list and build current list.
    for (iCount = 1; iCount <= 9; iPosition++)
    {
        //Determine if at the end of the list.
        if (iPosition > iMaxGuild)
            break;

        sGuildName = PGS_GetGuildString (iPosition, PGS_GUILD_NAME);

        //Check if current guild meets the criteria for our faction.
        if (PGS_GetGuildInt (iGuild, PGS_GUILD_FACTION + IntToString (iPosition)) == iFaction)
        {
            //Determine if "Next set" is available.
            if (iCount == 9)
            {
                SetLocalInt (oPlayer, "PGS_List_Next", TRUE);
                SetLocalInt (oPlayer, "PGS_Next_List_Position", iPosition - 1);
                break;
            }

            //Store guild information to be displayed in conversation.
            SetLocalString (oPlayer, "PGS_List_Entry" + IntToString (iCount), sGuildName);
            SetLocalInt (oPlayer, "PGS_List_Guild" + IntToString (iCount), iPosition);
            iCount++;
        }
    }

    return TRUE;
}
