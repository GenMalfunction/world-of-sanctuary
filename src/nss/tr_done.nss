//::///////////////////////////////////////////////
//:: Name: tr_done
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Turns listening off for the trainer.
*/
//:://////////////////////////////////////////////
//:: Created By: Cylvia
//:: Created On: 1-2-2004
//:://////////////////////////////////////////////
void main()
{
SetListening(OBJECT_SELF,FALSE);
PlayVoiceChat(VOICE_CHAT_GOODBYE);
ExecuteScript("nw_walk_wp",OBJECT_SELF);
}
