void main()
{
object oPC = GetEnteringObject();
if (GetIsPC(oPC) == TRUE) {
object oSounder = GetNearestObject( OBJECT_TYPE_PLACEABLE,OBJECT_SELF, 1);
int nIndex;
for (nIndex=1; nIndex <= 15; nIndex++)
{
  AssignCommand( oSounder, PlaySound("as_cv_bell1"));
  AssignCommand( oSounder,ActionWait(0.5));
}
}
}

