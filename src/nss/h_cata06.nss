void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_06");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
