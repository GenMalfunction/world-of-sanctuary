void main()
{
//    object oPC = GetLastUsedBy();
    object oPC = OBJECT_SELF;
    if (GetIsPC(oPC)==TRUE || GetPCPlayerName(oPC)!="") {
        SetLocalString(oPC, "cc_event", "init_recall");
        ExecuteScript("cc_event", oPC);
    }
}


