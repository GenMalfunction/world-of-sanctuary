void main()
{
    object oPC = GetLastUsedBy();
    int msgcnt = GetLocalInt(GetModule(), "msgcnt");
    if (msgcnt == 0) {
        msgcnt = GetCampaignInt(GetModuleName(), "msgcnt");
        SetLocalInt(GetModule(), "msgcnt", msgcnt);
    }
    SetLocalInt(oPC, "cc_level", 0);
    SetLocalInt(oPC, "sel", 0);
    SetLocalInt(oPC, "showmsg", msgcnt);
    SetLocalString(oPC, "cc_event", "init_msg");
    ExecuteScript("cc_event", oPC);
}
