int StartingConditional()
{
    return GetGold(GetPCSpeaker()) < GetLocalInt(OBJECT_SELF, "TOTAL_COST");
}
