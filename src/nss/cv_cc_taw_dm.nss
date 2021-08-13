int StartingConditional()
{
    object oUser = GetPCSpeaker();
    return (GetIsDM(oUser)||GetIsDMPossessed(oUser));
}
