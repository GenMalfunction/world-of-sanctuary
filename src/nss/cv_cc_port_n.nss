// next portrait
void main()
{
    object oPC = GetPCSpeaker();
    int iPort = GetPortraitId(oPC)+1;
    if (iPort == 212) iPort = 214;
    if (iPort == 232) iPort = 233;
    if (iPort == 242) iPort = 243;
    if (iPort == 275) iPort = 277;
    if (iPort == 305) iPort = 306;
    if (iPort == 313) iPort = 314;
    if (iPort == 323) iPort = 349;
    if (iPort == 351) iPort = 353;
    if (iPort == 358) iPort = 543;
    if (iPort == 548) iPort = 555;
    if (iPort == 557) iPort = 559;
    if (iPort == 572) iPort = 601;
    if (iPort == 626) iPort = 630;
    if (iPort == 657) iPort = 692;
    if (iPort == 695) iPort = 701;
    if (iPort == 708) iPort = 709;
    if (iPort == 713) iPort = 714;
    if (iPort == 737) iPort = 738;
    if (iPort == 750) iPort = 816;
    if (iPort == 824) iPort = 900;
    if (iPort == 901) iPort = 935;
    if (iPort == 961) iPort = 962;
    if (iPort == 968) iPort = 969;
    if (iPort == 987) iPort = 1014;
    if (iPort == 1115) iPort = 1118;
    if (iPort == 1017) iPort = 1019;
    if (iPort == 1069) iPort = 1265;
    if (iPort == 1269) iPort = 1270;
    if (iPort == 1299) iPort = 1;
    if (iPort == 65536) iPort = 1;
    SetPortraitId(oPC,iPort);
    SendMessageToPC(oPC, "Portrait: "+IntToString(iPort));
}

