int StartingConditional()
{
    int nQuest = GetLocalInt(GetPCSpeaker(), "Dockstravel")== 1;
    return nQuest;
}
