//::**********************************************
//:: Script: pgs_set_messengr
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will enable/disable the guild
    messenger for oPlayer based on whether or
    not he/she already has one.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
void main()
{
    object oPlayer = GetPCSpeaker();
    object oMessenger = GetLocalObject (oPlayer, "PGS_Messenger_Object");

    //Determine if oPlayer already has a messenger.
    if (oMessenger != OBJECT_INVALID)
    {
        //Remove the guild messenger.
        DestroyObject (oMessenger);
        DeleteLocalObject (oPlayer, "PGS_Messenger_Object");
    }
    else  //Create a guild messenger for oPlayer.
    {
        oMessenger = CreateObject (OBJECT_TYPE_CREATURE, "pgs_messenger",
            GetLocation (oPlayer));

        //Apply cutscene effects to the messenger.
        ApplyEffectToObject (2, EffectCutsceneGhost(), oMessenger);
        ApplyEffectToObject (2, EffectVisualEffect (355), oMessenger);

        //Have the messenger follow oPlayer.
        AssignCommand (oMessenger, ActionForceFollowObject (oPlayer, 1.5f));

        //Store local information for future use.
        SetLocalObject (oMessenger, "PGS_Listen_For", oPlayer);
        SetLocalObject (oPlayer, "PGS_Messenger_Object", oMessenger);

        //Allow for the Messenger to "listen".
        SetListenPattern (oMessenger, "**", 7500);
        SetListening (oMessenger, TRUE);
    }
}
