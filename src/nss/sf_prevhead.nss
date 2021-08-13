// Created By Scarface
void main()
{
    object oPC = GetPCSpeaker();
    int iPartNum = GetCreatureBodyPart(CREATURE_PART_HEAD, oPC) - 1;
    if (iPartNum < 1) iPartNum = 34;
    SetCreatureBodyPart(CREATURE_PART_HEAD,  iPartNum, oPC);
}
