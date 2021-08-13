void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_01");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
