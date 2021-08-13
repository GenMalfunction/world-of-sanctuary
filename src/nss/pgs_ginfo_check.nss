//::**********************************************
//:: Script: pgs_ginfo_check
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will verify if the information
    entered by oPlayer is valid for creating a
    guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    string sGuildName = GetLocalString (oPlayer, "PGS_Temp_Guild_Name");
    string sErrorReport, sTempGuildName;
    int iCount, iMaxGuild = PGS_GetModuleInt (PGS_MAX_GUILD);

    //Loop through guild list, and check for duplicate names.
    for (iCount = 1; iCount <= iMaxGuild; iCount++)
    {
        sTempGuildName = PGS_GetGuildString (iCount, PGS_GUILD_NAME);

        //Check for duplicate guild name.
        if (sGuildName == sTempGuildName)
            sErrorReport = "\n   - Guild name already in use.";
    }

    //Check for valid guild name.
    if (sGuildName == "")
        sErrorReport += "\n   - Invalid guild name.";

    //Check for valid guild description.
    if (GetLocalString (oPlayer, "PGS_Temp_Guild_Desc") == "")
        sErrorReport += "\n   - Invalid guild description.";

    //Determine if one or more error(s) occured.
    if (sErrorReport != "")
    {
        SendMessageToPC (oPlayer, "Failed requirement(s):" + sErrorReport);
        AssignCommand (oPlayer, PlaySound ("gui_error"));
        return FALSE;
    }

    return TRUE;
}
