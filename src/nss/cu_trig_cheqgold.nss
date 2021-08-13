void main()
{
    object oTarget = GetEnteringObject();
    int nOnce = GetLocalInt(oTarget, "Use_GoldTile");
    effect eEffect= EffectVisualEffect(VFX_IMP_GOOD_HELP);
    if(GetIsPC(oTarget))
    {
    if (nOnce==FALSE)
    {
    location lPoint1 = GetLocation(GetWaypointByTag ("Checquer16")) ;
    CreateObject (OBJECT_TYPE_PLACEABLE, "goldchest", lPoint1, TRUE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lPoint1);
    location lPoint2 = GetLocation(GetWaypointByTag ("Checquer10")) ;
    CreateObject (OBJECT_TYPE_PLACEABLE, "goldchest", lPoint2, TRUE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lPoint2);
    location lPoint3 = GetLocation(GetWaypointByTag ("Checquer11")) ;
    CreateObject (OBJECT_TYPE_PLACEABLE, "goldchest", lPoint3, TRUE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lPoint3);
    location lPoint4 = GetLocation(GetWaypointByTag ("Checquer12")) ;
    CreateObject (OBJECT_TYPE_PLACEABLE, "goldchest", lPoint4, TRUE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lPoint4);
    SetLocalInt(oTarget, "Use_GoldTile",TRUE);
    }
    }
}


