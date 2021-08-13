// first tatoo 1
void main()
{
    object oPC = GetPCSpeaker();
    SendMessageToPC(oPC, "Tatoo 1: 1");
    SetColor(oPC, COLOR_CHANNEL_TATTOO_1, 1);
}

