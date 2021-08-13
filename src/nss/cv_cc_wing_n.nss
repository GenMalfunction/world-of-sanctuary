// next wing
void main()
{
    object oPC = GetPCSpeaker();
    int iWing = GetCreatureWingType(oPC)+1;
    if (iWing == 7) iWing = 59;
    if (iWing == 90) iWing = 0;
    SetCreatureWingType(iWing,oPC);
    SendMessageToPC(oPC, "Wings: "+IntToString(iWing));
}

