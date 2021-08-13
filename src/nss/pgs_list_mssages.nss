//::**********************************************
//:: Script: pgs_list_mssages
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will build the message list
    for oPlayer's guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/26/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();
    int iGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER), iCount;
    string sTitle, sCount;

    //Loop through valid messages, and display them in the conversaton.
    for (iCount = 1; iCount <= 8; iCount++)
    {
        sCount = IntToString (iCount);
        sTitle = PGS_GetGuildString (iGuild, PGS_MESSAGE_TITLE + sCount);

        //Check if sMessage is valid.
        if (sTitle != "")
            SetLocalString (oPlayer, "PGS_List_Entry" + sCount, sTitle);

        else  //Message is not valid - don't display.
            DeleteLocalString (oPlayer, "PGS_List_Entry" + sCount);
    }
}
