string FixName(string src)
{
    string nam = src;
    int cnt = 0;
    int s;

    for(s=0; s<GetStringLength(nam); s++) {
        if (GetSubString(nam, s, 1) == "<") {
            if (GetSubString(nam, s+1, 1) == "c") cnt++;
            if (GetSubString(nam, s+1, 1) == "/") cnt--;
        }
    }
    for(s=0; s<cnt; s++) nam += "</c>";
// SpeakString("fixed:" + nam + IntToString(cnt) + " name:" +src + " cnt:", TALKVOLUME_SHOUT);

    return nam;
}

void main()
{
    object oPC = OBJECT_SELF;
//object oPC = GetLastUsedBy();
    object oSearchPC;
    string sArea;
    string sAreaTag;
    string sLevel;
    int class, pos;
    string cname;

    SendMessageToPC(oPC, "---------------------------------------");
    SendMessageToPC(oPC, "Players class & location.");
    SendMessageToPC(oPC, "---------------------------------------");

    oSearchPC = GetFirstPC();

    while (oSearchPC != OBJECT_INVALID) {
        for(pos=1; pos<4; pos++) {
            class = GetClassByPosition(pos, oSearchPC);
            if (class != CLASS_TYPE_INVALID) {
                cname = Get2DAString("classes", "Label", class);
                if (cname == "") cname = "unknown (" + IntToString(class) + ")";
                sLevel = sLevel + cname + ":" + IntToString(GetLevelByClass(class, oSearchPC)) + " ";
            }
        }
        sArea = GetName(GetArea(oSearchPC));
        sAreaTag = GetTag(GetArea(oSearchPC));
        if (sAreaTag == "DMHole" || sAreaTag == "WaitingRoom") sArea = "PlatniumForrest";
        SendMessageToPC(oPC, FixName(GetName(oSearchPC)) + " - " + sLevel + "- <c þ >"  + sArea + "</c>");
        sLevel = "";

        oSearchPC = GetNextPC();
    }
    SendMessageToPC(oPC, "---------------------------------------");
}

