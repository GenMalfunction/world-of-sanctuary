// prev hair
void main()
{
    object oPC = GetPCSpeaker();
    int iHair = GetColor(oPC,COLOR_CHANNEL_HAIR)-1;
    if (iHair<0) iHair = 175;
    SetColor(oPC,COLOR_CHANNEL_HAIR,iHair);
    SendMessageToPC(oPC, "Hair: "+IntToString(iHair));
}

