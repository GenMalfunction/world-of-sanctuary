void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_07");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
