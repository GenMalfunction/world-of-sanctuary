// first head
void main()
{
    object oPC = GetPCSpeaker();
    SendMessageToPC(oPC, "Head: 1");
    SetCreatureBodyPart(CREATURE_PART_HEAD, 1, oPC);
}

