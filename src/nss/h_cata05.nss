void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_05");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
