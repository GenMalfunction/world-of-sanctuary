int StartingConditional()
{
    int nQuest = GetLocalInt(GetPCSpeaker(), "KingTalk")== 1;
    return nQuest;
}
