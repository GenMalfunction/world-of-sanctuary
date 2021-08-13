// next tail
void main()
{
    object oPC = GetPCSpeaker();
    int iTail = GetCreatureTailType(oPC)+1;
    if (iTail >= 15) iTail = 0;
    SetCreatureTailType(iTail,oPC);
    SendMessageToPC(oPC, "Tail: "+IntToString(iTail));
}

