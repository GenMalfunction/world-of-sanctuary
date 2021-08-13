void main()
{
//    object oPC = GetLastUsedBy();
//    if (GetIsObjectValid(oPC)) oPC = GetLastSpeaker();
    object oPC = OBJECT_SELF;
    if (GetIsPC(oPC)==FALSE && GetPCPlayerName(oPC)=="") oPC = GetLastUsedBy();
    if (GetIsPC(oPC)== TRUE || GetPCPlayerName(oPC)!="") {
        SetLocalInt(oPC, "cc_level", 0);
        SetLocalString(oPC, "cc_event", "init_poly");
        ExecuteScript("cc_event", oPC);
    }
}


