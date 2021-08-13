//::**********************************************
//:: Script: pgs_disp_invite
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will inform the invite reciever
    who has send the invite, and from what guild
    he/she is affiliated with.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/27/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oSender = GetLocalObject (GetPCSpeaker(), "PGS_Journal_Activator");

    //Display information in the conversation.
    SetCustomToken (7532, GetName (oSender));
    SetCustomToken (7506, PGS_GetGuildString (PGS_GetPlayerInt (oSender,
        PGS_GUILD_NUMBER), PGS_GUILD_NAME));
    return TRUE;
}
