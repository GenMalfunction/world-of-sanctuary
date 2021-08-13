// remove tail
void main()
{
    object oPC = GetPCSpeaker();
    SendMessageToPC(oPC, "Tail removed.");
    SetCreatureTailType(0, oPC);
}

