void main()
{
object oPC = GetLastUsedBy();
object oThrone = OBJECT_SELF;
AssignCommand(oPC, ActionStartConversation(oThrone, "throne", TRUE));
}
