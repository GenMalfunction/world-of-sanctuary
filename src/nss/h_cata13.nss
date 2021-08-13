void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_13");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
