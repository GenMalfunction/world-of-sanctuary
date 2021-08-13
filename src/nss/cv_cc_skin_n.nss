// next skin
void main()
{
    object oPC = GetPCSpeaker();
    int iSkin = GetColor(oPC,COLOR_CHANNEL_SKIN)+1;
    if (iSkin>175) iSkin = 0;
    SetColor(oPC,COLOR_CHANNEL_SKIN,iSkin);
    SendMessageToPC(oPC, "Skin: "+IntToString(iSkin));
}

