void main()
{
object oCatapult = GetNearestObjectByTag("CATAP_03");

AssignCommand(OBJECT_SELF, ActionInteractObject(oCatapult));


}
