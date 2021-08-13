// next head
void main()
{
    object oPC = GetPCSpeaker();
    int iHead = GetCreatureBodyPart(CREATURE_PART_HEAD,oPC)+1;
    SetCreatureBodyPart(CREATURE_PART_HEAD,iHead,oPC);
    SendMessageToPC(oPC, "Head: "+IntToString(iHead));
}

