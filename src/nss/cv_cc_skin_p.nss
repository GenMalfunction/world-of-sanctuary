// prev skin
void main()
{
    object oPC = GetPCSpeaker();
    int iSkin = GetColor(oPC,COLOR_CHANNEL_SKIN)-1;
    if (iSkin<0) iSkin = 175;
    SetColor(oPC,COLOR_CHANNEL_SKIN,iSkin);
    SendMessageToPC(oPC, "Skin: "+IntToString(iSkin));
}

