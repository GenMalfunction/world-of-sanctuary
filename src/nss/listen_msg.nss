void main()
{
    int iListen = GetListenPatternNumber();
    string cmd = GetMatchedSubstring(0);
    int p;
    object oPC = GetLastSpeaker();

// SpeakString("heard " + GetName(GetLastSpeaker()) + ": " + cmd);
    if(iListen == 777) {// listen pattern set in listen_start
        if (GetLocalString(oPC, "title") == ".") {
            SetLocalString(oPC, "title", GetStringLeft(cmd, 50) + " <c þ >by</c> <c þþ>" + GetName(oPC) + " (" + GetPCPlayerName(oPC) + ")</c>");
            SetLocalString(oPC, "msg", ".");
            SpeakString("Speak message");
        } else if (GetLocalString(oPC, "msg") == ".") {
            SetLocalInt(oPC, "cc_level", 0);
            SetLocalString(oPC, "msg", GetStringLeft(cmd, 500));
            SetLocalString(oPC, "cc_event", "init_post");
            ExecuteScript("cc_event", oPC);
        }
    } else {
        ActionMoveToObject(GetNearestObjectByTag("POST_" + GetTag(OBJECT_SELF)));
        ActionJumpToObject(GetNearestObjectByTag("POST_" + GetTag(OBJECT_SELF)));
        PlayVoiceChat(VOICE_CHAT_HELLO, OBJECT_SELF);
    }
}
