void main()
{
    object oPC = OBJECT_SELF;
    if (GetIsPC(oPC)==FALSE && GetPCPlayerName(oPC)=="") oPC = GetLastUsedBy();
    if (GetIsPC(oPC)== TRUE || GetPCPlayerName(oPC)!="") {
        SetLocalInt(oPC, "cc_level", 0);
        SetLocalString(oPC, "cc_event", "init_ap0");
        ExecuteScript("cc_event", oPC);
    }
}


