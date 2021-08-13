void main()
{
    object oPC = GetLastSpeaker();
    if (GetIsPC(oPC) == TRUE) {
        SetLocalInt(oPC, "cc_level", 0);
        SetLocalString(oPC, "cc_event", "init_dye");
        ExecuteScript("cc_event", oPC);
    }
}
