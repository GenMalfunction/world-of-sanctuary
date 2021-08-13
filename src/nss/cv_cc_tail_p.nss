// next tail
void main()
{
    object oPC = GetPCSpeaker();
    int iTail = GetCreatureTailType(oPC)-1;
    if (iTail < 0) iTail = 14;
    SetCreatureTailType(iTail,oPC);
    SendMessageToPC(oPC, "Tail: "+IntToString(iTail));
}

