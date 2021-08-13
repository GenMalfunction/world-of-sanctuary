//::**********************************************
//:: Script: pgs_temp_guild
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display the current
    information entered by oPlayer before he/she
    finalizes the guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
int StartingConditional()
{
    object oPlayer = GetPCSpeaker();

    //Now set the custom tokens.
    SetCustomToken (7506, GetLocalString (oPlayer, "PGS_Temp_Guild_Name"));
    SetCustomToken (7507, GetLocalString (oPlayer, "PGS_Temp_Guild_Desc"));

    //Determine initial guild privacy status.
    if (GetLocalInt (oPlayer, "PGS_Generic_Var") == 1)
        SetCustomToken (7511, "public");
    else
        SetCustomToken (7511, "private");

    return TRUE;
}
