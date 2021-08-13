// prev tattoo 2
void main()
{
    object oPC = GetPCSpeaker();
    int iTattoo = GetColor(oPC,COLOR_CHANNEL_TATTOO_2)-1;
    if (iTattoo<0) iTattoo = 175;
    SetColor(oPC,COLOR_CHANNEL_TATTOO_2,iTattoo);
    SendMessageToPC(oPC, "Tattoo 2: "+IntToString(iTattoo));
}

