void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_08");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
