int StartingConditional()
{
    int nQuest = GetLocalInt(GetPCSpeaker(), "Yetariatele")== 1;
    return nQuest;
}
