// first portrait
void main()
{
    object oPC = GetPCSpeaker();
    SendMessageToPC(oPC, "Portrait: 1");
    SetPortraitId(oPC, 1);
}

