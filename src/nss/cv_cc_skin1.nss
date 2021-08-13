// first skin
void main()
{
    object oPC = GetPCSpeaker();
    SendMessageToPC(oPC, "Skin: 1");
    SetColor(oPC, COLOR_CHANNEL_SKIN, 1);
}

