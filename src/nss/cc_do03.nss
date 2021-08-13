void main()
{
//    object oPC = GetLastSpeaker();
    object oPC = OBJECT_SELF;
    SetLocalString(oPC, "cc_event", "do_03");
    ExecuteScript("cc_event", oPC);
}
