/*
called: OnConversation
This script listens to what PC's say.
*/

void main()
{
    int iListen = GetListenPatternNumber();
    string cmd = GetMatchedSubstring(0);
    int p;
    object oPC = GetLastSpeaker();

// SpeakString("heard " + GetName(GetLastSpeaker()) + ": " + cmd);
    if(iListen == 777) {// listen pattern set in listen_start
        p = StringToInt(cmd);
        if (p > 0 || cmd == "0") {
            CreateItemOnObject("dyec" + GetStringRight("0" + cmd, 2), oPC);
            CreateItemOnObject("dyel" + GetStringRight("0" + cmd, 2), oPC);
            CreateItemOnObject("dyem" + GetStringRight("0" + cmd, 2), oPC);
        }
    } else {
        ActionMoveToObject(GetNearestObjectByTag("POST_" + GetTag(OBJECT_SELF)));
        ActionJumpToObject(GetNearestObjectByTag("POST_" + GetTag(OBJECT_SELF)));
        PlayVoiceChat(VOICE_CHAT_HELLO, OBJECT_SELF);
        SetLocalInt(oPC, "cc_level", 0);
        SetLocalString(oPC, "cc_event", "init_dye");
        ExecuteScript("cc_event", oPC);
    }
}
