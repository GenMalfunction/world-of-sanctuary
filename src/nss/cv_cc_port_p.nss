// prev portrait
void main()
{
    object oPC = GetPCSpeaker();
    int iPort = GetPortraitId(oPC)-1;
    if (iPort == 0) iPort = 1298;
    if (iPort == 212) iPort = 211;
    if (iPort == 232) iPort = 231;
    if (iPort == 242) iPort = 241;
    if (iPort == 276) iPort = 274;
    if (iPort == 305) iPort = 304;
    if (iPort == 313) iPort = 312;
    if (iPort == 347) iPort = 322;
    if (iPort == 352) iPort = 350;
    if (iPort == 542) iPort = 357;
    if (iPort == 554) iPort = 547;
    if (iPort == 558) iPort = 556;
    if (iPort == 600) iPort = 571;
    if (iPort == 629) iPort = 625;
    if (iPort == 691) iPort = 656;
    if (iPort == 700) iPort = 694;
    if (iPort == 708) iPort = 707;
    if (iPort == 713) iPort = 712;
    if (iPort == 737) iPort = 736;
    if (iPort == 816) iPort = 749;
    if (iPort == 899) iPort = 823;
    if (iPort == 934) iPort = 900;
    if (iPort == 961) iPort = 960;
    if (iPort == 968) iPort = 967;
    //if (iPort == 988) iPort = 986;
    if (iPort == 1013) iPort = 986;
    if (iPort == 1018) iPort = 1016;
    //if (iPort == 1079) iPort = 1068;
    //if (iPort == 1117) iPort = 1114;
    if (iPort == 1264) iPort = 1068;
    if (iPort == 1269) iPort = 1268;
    if (iPort == 65534) iPort = 1298;
    SetPortraitId(oPC,iPort);
    SendMessageToPC(oPC, "Portrait: "+IntToString(iPort));
}

