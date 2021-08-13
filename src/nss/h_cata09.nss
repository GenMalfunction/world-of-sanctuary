void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_09");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
