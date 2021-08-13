void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_04");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
