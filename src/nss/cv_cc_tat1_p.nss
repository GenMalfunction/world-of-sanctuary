// prev tattoo 1
void main()
{
    object oPC = GetPCSpeaker();
    int iTattoo = GetColor(oPC,COLOR_CHANNEL_TATTOO_1)-1;
    if (iTattoo<0) iTattoo = 175;
    SetColor(oPC,COLOR_CHANNEL_TATTOO_1,iTattoo);
    SendMessageToPC(oPC, "Tattoo 1: "+IntToString(iTattoo));
}

