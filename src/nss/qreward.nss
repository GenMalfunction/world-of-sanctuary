void main()
{
    object item, PC = GetPCSpeaker();
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
        item = GetItemPossessedBy(PC, "qr"+IntToString(q+1));
        if (item != OBJECT_INVALID) {
            SpeakString("Thanks for " + GetName(item) + " " + GetName(PC) + ", you are progressing well!");
            DestroyObject(item);
        }
        q++;
    }
    if (msg != "") {
        msg = "You must complete the following quests before you get your reward: <cþ  >" + msg + "</c>";
        if (done != "") {
            msg += "\nCompleted quests: <c þ >" + done + "</c>";
        }
        SpeakString(msg);
    } else {
        if (GetItemPossessedBy(PC, "qreward") == OBJECT_INVALID) {
            SpeakString("Congratulations you have completed all the quests, here is your reward!");
            CreateItemOnObject("qreward", PC);
        } else {
            SpeakString("You have completed all the quests & already have your reward.");
        }
    }
}
