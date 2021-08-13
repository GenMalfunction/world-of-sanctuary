void main()
{
    object oPC = GetLastSpeaker();
    ActionMoveToObject(GetNearestObjectByTag("POST_" + GetTag(OBJECT_SELF)));
    ActionJumpToObject(GetNearestObjectByTag("POST_" + GetTag(OBJECT_SELF)));
    PlayVoiceChat(VOICE_CHAT_HELLO, OBJECT_SELF);
    if (GetIsPC(oPC) == TRUE) {
//        SetLocalInt(oPC, "cc_level", 0);
        SetLocalObject(oPC, "target", oPC);
        SetLocalString(oPC, "cc_event", "init_lvup");
        ExecuteScript("cc_event", oPC);
    }
}
