void ClearEffect(object PC)
{
    effect eEffect = GetFirstEffect(PC);
    while ( GetIsEffectValid(eEffect) == TRUE ) {
       if ( GetEffectSubType(eEffect) == SUBTYPE_EXTRAORDINARY) RemoveEffect(PC,eEffect);
       eEffect = GetNextEffect(PC);
    }
}

void main()
{
    object tst = GetFirstPC();
    string qnum = GetSubString(GetTag(GetArea(OBJECT_SELF)),1,3);
    int qdone;
    while(tst != OBJECT_INVALID) {
        if (GetTag(GetArea(tst)) == "q"+qnum) {
//AssignCommand(tst, SpeakString("killed"));
            if (GetLocalInt(tst, "qhit") == StringToInt(qnum)) {
//AssignCommand(tst, SpeakString("hit"));
                qdone = GetCampaignInt(GetModuleName(), "qdone", tst) | (1<<(StringToInt(qnum)-1));
                SetCampaignInt(GetModuleName(), "qdone", qdone, tst);
                AddJournalQuestEntry("qj" + qnum, 2, tst, FALSE);
                if (GetItemPossessedBy(tst, "qr" + qnum) == OBJECT_INVALID) {
                    CreateItemOnObject("qr" + qnum, tst);
                }
                DeleteLocalInt(tst, "qhit");
            }
        }
        ClearEffect(tst);
        tst = GetNextPC();
    }
    ExecuteScript("monsterpoints", OBJECT_SELF);
//    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
