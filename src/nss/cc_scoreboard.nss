void main()
{
    object oPC = GetLastUsedBy();
    if (GetIsPC(oPC)==TRUE || GetPCPlayerName(oPC)!="") {
        SetLocalString(oPC, "cc_event", "init_score");
        ExecuteScript("cc_event", oPC);
    }
}


