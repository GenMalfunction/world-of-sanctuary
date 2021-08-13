void main()
{
object oCreature = GetLastUsedBy();
object oThrone = OBJECT_SELF;
AssignCommand(oCreature, ActionSit(oThrone));
}
