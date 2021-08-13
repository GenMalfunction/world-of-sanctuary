// prev wing
void main()
{
    object oPC = GetPCSpeaker();
    int iWing = GetCreatureWingType(oPC)-1;
    if (iWing == -1) iWing = 89;
    if (iWing == 58) iWing = 6;
    SetCreatureWingType(iWing,oPC);
    SendMessageToPC(oPC, "Wings: "+IntToString(iWing));
}

