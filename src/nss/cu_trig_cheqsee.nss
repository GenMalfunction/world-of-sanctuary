void main()
{
object oTarget = GetEnteringObject();
if(GetIsPC(oTarget))
{
location lPoint1 = GetLocation(GetWaypointByTag ("Checquer2")) ;
object oGetRid1 = CreateObject (OBJECT_TYPE_PLACEABLE, "plc_solred", lPoint1, FALSE);
location lPoint2 = GetLocation(GetWaypointByTag ("Checquer5")) ;
object oGetRid2 = CreateObject (OBJECT_TYPE_PLACEABLE, "plc_solred", lPoint2, FALSE);
location lPoint3 = GetLocation(GetWaypointByTag ("Checquer8")) ;
object oGetRid3 = CreateObject (OBJECT_TYPE_PLACEABLE, "plc_solred", lPoint3, FALSE);
location lPoint4 = GetLocation(GetWaypointByTag ("Checquer10")) ;
object oGetRid4 = CreateObject (OBJECT_TYPE_PLACEABLE, "plc_solred", lPoint4, FALSE);
location lPoint5 = GetLocation(GetWaypointByTag ("Checquer11")) ;
object oGetRid5 = CreateObject (OBJECT_TYPE_PLACEABLE, "plc_solred", lPoint5, FALSE);
location lPoint6 = GetLocation(GetWaypointByTag ("Checquer13")) ;
object oGetRid6 = CreateObject (OBJECT_TYPE_PLACEABLE, "plc_solred", lPoint6, FALSE);

DestroyObject(oGetRid1,10.0);
DestroyObject(oGetRid2,10.0);
DestroyObject(oGetRid3,10.0);
DestroyObject(oGetRid4,10.0);
DestroyObject(oGetRid5,10.0);
DestroyObject(oGetRid6,10.0);
}
}




