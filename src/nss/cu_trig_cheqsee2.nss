void main()
{

    object oTarget = GetEnteringObject();
    int nOnce = GetLocalInt(oTarget, "Use_See2");
    effect eEffect= EffectVisualEffect(VFX_IMP_GOOD_HELP);
    if (nOnce==FALSE)
    {
    if(GetIsPC(oTarget))
        {
        location lPoint1 = GetLocation(GetWaypointByTag ("Checquer9")) ;
        CreateObject (OBJECT_TYPE_PLACEABLE, "plc_solblue", lPoint1, FALSE);
        location lPoint2 = GetLocation(GetWaypointByTag ("WP_ToTreasury")) ;
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lPoint2);
        CreateObject (OBJECT_TYPE_ITEM, "spawnkey", lPoint2, TRUE);
        SetLocalInt(oTarget, "Use_See2",TRUE);
        }
    }
}
