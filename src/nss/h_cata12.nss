void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_12");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
