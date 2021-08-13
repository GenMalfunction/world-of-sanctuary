void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_10");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
