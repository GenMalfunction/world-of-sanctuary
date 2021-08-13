//look for a valid party leader
int StartingConditional()
{
    int iResult;
    // * Player cannot be the party leaer
    iResult = GetIsObjectValid(GetFactionLeader(GetPCSpeaker())) && GetPCSpeaker() != GetFactionLeader(GetPCSpeaker());
    return iResult;
}
