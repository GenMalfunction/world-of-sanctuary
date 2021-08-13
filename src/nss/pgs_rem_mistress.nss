//::**********************************************
//:: Script: pgs_rem_mistress
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will remove the Guild Mistress.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
void main()
{
    object oMistress = GetLocalObject (GetPCSpeaker(), "PGS_Mistress_Object");

    //Have the Guild Mistress fly away.
    AssignCommand (oMistress, PlayVoiceChat (VOICE_CHAT_GOODBYE));
    DelayCommand (1.5f, ApplyEffectToObject (DURATION_TYPE_INSTANT,
        EffectDisappear(), oMistress));
}
