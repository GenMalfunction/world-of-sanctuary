int StartingConditional()
{
//    object oPC = GetLastSpeaker();
    object oPC = OBJECT_SELF;
    SetLocalString(oPC, "cc_event", "chk_24");
    ExecuteScript("cc_event", oPC);
    if (GetLocalString(oPC, "cc_event") == "1") return TRUE;
    return FALSE;
}
