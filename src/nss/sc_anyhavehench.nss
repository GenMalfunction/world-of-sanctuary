int StartingConditional()
{
    if (GetHenchman(GetPCSpeaker())==OBJECT_INVALID)
        return FALSE;
    return TRUE;
}
