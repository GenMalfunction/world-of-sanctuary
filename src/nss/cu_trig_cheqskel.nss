void main()
{
    object oTarget = GetEnteringObject();
    int nOnce = GetLocalInt(oTarget, "Use_Undead");
if(GetIsPC(oTarget))
{
   if (nOnce == FALSE)
{
location lPoint1 = GetLocation(GetWaypointByTag ("Checquer1")) ;
CreateObject (OBJECT_TYPE_CREATURE, "skeleton002", lPoint1, TRUE);
location lPoint2 = GetLocation(GetWaypointByTag ("Checquer5")) ;
CreateObject (OBJECT_TYPE_CREATURE, "skeleton002", lPoint2, TRUE);
location lPoint3 = GetLocation(GetWaypointByTag ("Checquer7")) ;
CreateObject (OBJECT_TYPE_CREATURE, "skeleton002", lPoint3, TRUE);
location lPoint4 = GetLocation(GetWaypointByTag ("Checquer9")) ;
CreateObject (OBJECT_TYPE_CREATURE, "skeleton002", lPoint4, TRUE);
location lPoint5 = GetLocation(GetWaypointByTag ("Checquer11")) ;
CreateObject (OBJECT_TYPE_CREATURE, "skeleton002", lPoint5, TRUE);
location lPoint6 = GetLocation(GetWaypointByTag ("Checquer13")) ;
CreateObject (OBJECT_TYPE_CREATURE, "skeleton002", lPoint6, TRUE);
location lPoint7 = GetLocation(GetWaypointByTag ("Checquer15")) ;
CreateObject (OBJECT_TYPE_CREATURE, "skeleton002", lPoint7, TRUE);
SetLocalInt(oTarget, "Use_Undead", TRUE);
}
else
{
location lPoint4 = GetLocation(GetWaypointByTag ("Checquer9")) ;
CreateObject (OBJECT_TYPE_CREATURE, "firefiend", lPoint4, TRUE);
location lPoint7 = GetLocation(GetWaypointByTag ("Checquer15")) ;
CreateObject (OBJECT_TYPE_CREATURE, "moltenfiend", lPoint7, TRUE);
location lPoint1 = GetLocation(GetWaypointByTag ("Checquer1")) ;
CreateObject (OBJECT_TYPE_CREATURE, "smallfirefiend", lPoint1, TRUE);
}
}
}


