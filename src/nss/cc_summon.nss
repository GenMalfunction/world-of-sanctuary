void main()
{
    object oPC = GetLastSpeaker();
    ActionMoveToObject(GetNearestObjectByTag("POST_" + GetTag(OBJECT_SELF)));
    ActionJumpToObject(GetNearestObjectByTag("POST_" + GetTag(OBJECT_SELF)));
    PlayVoiceChat(VOICE_CHAT_HELLO, OBJECT_SELF);
    if (GetIsPC(oPC)==TRUE || GetPCPlayerName(oPC)!="") {
        SetLocalString(oPC, "cc_event", "init_summon");
        SetLocalObject(oPC, "cc_conv", OBJECT_SELF);
        ExecuteScript("cc_event", oPC);
    }
}


