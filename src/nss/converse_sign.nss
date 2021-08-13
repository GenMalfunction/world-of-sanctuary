//Object starts conversation when used
void main()
{
    object oPC = GetLastUsedBy();
    AssignCommand(oPC, ClearAllActions(TRUE));
    ActionStartConversation(oPC, "", TRUE);
}
