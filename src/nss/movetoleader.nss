//move to the leader, if there is one
void main()
{
    object oLeader = GetFactionLeader(GetPCSpeaker());
    if (GetIsObjectValid(oLeader) == TRUE)
    {
        AssignCommand(GetPCSpeaker(), JumpToObject(oLeader));
    }
}
