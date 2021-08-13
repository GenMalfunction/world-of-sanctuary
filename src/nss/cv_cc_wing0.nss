// remove wings
void main()
{
    object oPC = GetPCSpeaker();
    SendMessageToPC(oPC, "Wings removed.");
    SetCreatureWingType(0, oPC);
}

