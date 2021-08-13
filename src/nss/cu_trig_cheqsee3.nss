void main()
{
object oTarget = GetEnteringObject();
if(GetIsPC(oTarget))
{
    location lPoint1 = GetLocation(GetWaypointByTag ("Checquer3")) ;
    object oGetRid1 = CreateObject (OBJECT_TYPE_PLACEABLE, "plc_solorange", lPoint1, FALSE);
    location lPoint2 = GetLocation(GetWaypointByTag ("Checquer16")) ;
    object oGetRid2 = CreateObject (OBJECT_TYPE_PLACEABLE, "plc_solorange", lPoint2, FALSE);
    DestroyObject(oGetRid1,10.0);
    DestroyObject(oGetRid2,10.0);
}
}
