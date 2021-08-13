void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_14");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
