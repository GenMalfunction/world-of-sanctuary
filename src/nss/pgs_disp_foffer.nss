//::**********************************************
//:: Script: pgs_disp_foffer
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display information for
    the faction offer.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/27/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    object oSender = GetLocalObject (oPlayer, "PGS_Journal_Activator");

    //Display information relating to the current faction offer.
    SetCustomToken (7533, GetName (oSender));
    SetCustomToken (7506, PGS_GetGuildString (PGS_GetPlayerInt (oSender,
        PGS_GUILD_NUMBER), PGS_GUILD_NAME));

    //Determine the type of faction offer being requested.
    if (GetLocalInt (oPlayer, "PGS_Faction_Offer") == 1)
        SetCustomToken (7534, "allies");

    else  //Faction change is to neutral.
        SetCustomToken (7534, "neutral");

    return TRUE;
}
