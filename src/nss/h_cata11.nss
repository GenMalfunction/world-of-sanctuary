void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_11");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
