void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_02");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
