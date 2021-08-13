void main()
{
object oCreature = GetLastUsedBy();
object oChair = OBJECT_SELF;
AssignCommand(oCreature, ActionSit(oChair));
}
