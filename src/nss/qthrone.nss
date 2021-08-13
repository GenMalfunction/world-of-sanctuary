void main()
{
    object PC = GetLastUsedBy();
    object Throne = OBJECT_SELF;
    string msg = "";
    string done = "";
    int qdone = GetCampaignInt(GetModuleName(), "qdone", PC);
    int q = 0;
    while(GetObjectByTag("q"+IntToString(q+1)) != OBJECT_INVALID) {
        if ((qdone & (1<<q)) == 0) {
            if (msg != "") msg += ", ";
            msg += GetName(GetObjectByTag("q"+IntToString(q+1)));
        } else {
            if (done != "") done += ", ";
            done += GetName(GetObjectByTag("q"+IntToString(q+1)));
        }
        q++;
    }
    if (msg != "") {
        msg = "You must complete the following quests before you may sit here: <cþ  >" + msg + "</c>";
        if (done != "") {
            msg += "\nCompleted quests: <c þ >" + done + "</c>";
        }
        SpeakString(msg);
    } else {
        if (GetItemPossessedBy(PC, "qreward") != OBJECT_INVALID) {
            AssignCommand(PC, ActionSit(Throne));
        } else {
            SpeakString("You need your members certificate to sit here " + GetName(PC));
            SetImmortal(PC,FALSE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_HIT_DIVINE,FALSE), PC, 0.0f);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(44,FALSE), PC, 0.0f);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(81,FALSE), PC, 0.0f);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(91,FALSE), PC, 0.0f);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(57,FALSE), PC, 0.0f);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE), PC, 0.0f);
        }
    }

//
}
