// first hair
void main()
{
    object oPC = GetPCSpeaker();
    SendMessageToPC(oPC, "Hair: 1");
    SetColor(oPC, COLOR_CHANNEL_HAIR, 1);
}

