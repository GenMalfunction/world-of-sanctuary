//::**********************************************
//:: Script: pgs_add_message
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will add the message created
    by oPlayer to the list.
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
    int iCount, iCount2 = 8;
    string sCount, sCount2;
    string sTitle;

    //Loop through the message list and make room for new message.
    for (iCount = 7; iCount >= 1; iCount--)
    {
        sCount = IntToString (iCount);
        sCount2 = IntToString (iCount2);
        sTitle = PGS_GetGuildString (iGuild, PGS_MESSAGE_TITLE + sCount);

        //Determine if the current position holds a valid message.
        if (sTitle != "")
        {
            //Message is valid, move it up one position.
            PGS_SetGuildString (iGuild, PGS_MESSAGE_TITLE + sCount2, sTitle);
            PGS_SetGuildString (iGuild, PGS_MESSAGE_AUTHOR + sCount2,
                PGS_GetGuildString (iGuild, PGS_MESSAGE_AUTHOR + sCount));
            PGS_SetGuildString (iGuild, PGS_MESSAGE_POST + sCount2,
                PGS_GetGuildString (iGuild, PGS_MESSAGE_POST + sCount));
        }

        iCount2--;
    }

    //Store new message at the beginning of the list.
    PGS_SetGuildString (iGuild, PGS_MESSAGE_TITLE + "1", GetLocalString (oPlayer, "PGS_Temp_Message_Title"));
    PGS_SetGuildString (iGuild, PGS_MESSAGE_AUTHOR + "1", GetName (oPlayer));
    PGS_SetGuildString (iGuild, PGS_MESSAGE_POST + "1", GetLocalString (oPlayer, "PGS_Temp_Message_Post"));
}
