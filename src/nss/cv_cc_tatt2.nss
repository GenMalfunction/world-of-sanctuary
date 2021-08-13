// first tatoo 2
void main()
{
    object oPC = GetPCSpeaker();
    SendMessageToPC(oPC, "Tatoo 2: 1");
    SetColor(oPC, COLOR_CHANNEL_TATTOO_2, 1);
}

