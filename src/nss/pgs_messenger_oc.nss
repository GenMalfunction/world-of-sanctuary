//::**********************************************
//:: Script: pgs_messenger_oc
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        OnConversation script for the Guild
    Messenger.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetLastSpeaker();

    //Make sure oPlayer is the one we want to listen for.
    if (oPlayer != GetLocalObject (OBJECT_SELF, "PGS_Listen_For"))
        return;

    //Broadcast chat message to all guild members currently online.
    PGS_SendNotice (PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER),
        GetMatchedSubstring (0), oPlayer);
}
