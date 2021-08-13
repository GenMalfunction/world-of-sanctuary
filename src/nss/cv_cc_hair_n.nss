// next hair
void main()
{
    object oPC = GetPCSpeaker();
    int iHair = GetColor(oPC,COLOR_CHANNEL_HAIR)+1;
    if (iHair>175) iHair = 0;
    SetColor(oPC,COLOR_CHANNEL_HAIR,iHair);
    SendMessageToPC(oPC, "Hair: "+IntToString(iHair));
}

