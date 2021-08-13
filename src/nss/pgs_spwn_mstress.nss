//::**********************************************
//:: Script: pgs_spwn_mistrss
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will spawn the 'Guild Mistress'
    NPC.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
void main()
{
    object oPlayer = GetPCSpeaker();
    object oMistress = CreateObject (OBJECT_TYPE_CREATURE, "pgs_mistress",
        GetLocation (oPlayer), FALSE);

    //Briefly pause the conversation so we can spawn the Guild Mistress.
    ActionPauseConversation();
    DelayCommand (1.5f, PlayVoiceChat (VOICE_CHAT_HELLO, oMistress));
    DelayCommand (2.5f, ActionResumeConversation());

    //Have oPlayer and the Guild Mistress face each other.
    AssignCommand (oPlayer, SetFacingPoint (GetPosition (oMistress)));
    AssignCommand (oMistress, SetFacingPoint (GetPosition (oPlayer)));

    //Make sure the Mistress only listens to oPlayer.
    SetLocalObject (oMistress, "PGS_Listen_For", oPlayer);
    SetLocalObject (oPlayer, "PGS_Mistress_Object", oMistress);

    //Allow for the Mistress to "listen".
    SetListenPattern (oMistress, "**", 7500);
    SetListening (oMistress, TRUE);
}
