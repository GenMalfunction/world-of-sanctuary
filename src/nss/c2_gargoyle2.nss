//::///////////////////////////////////////////////
//:: NW_C2_GARGOYLE.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   on gargoyle's heartbeat, if no PC nearby then become a statue
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: January 17, 2001
//:://////////////////////////////////////////////
//:: Noel made the orientation correct, May 2002

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if ((GetIsObjectValid(oPC) != TRUE) || (GetIsDead(oPC) == TRUE) || GetDistanceToObject(oPC) >= 10.0)
    {
        location l = GetLocation(OBJECT_SELF);
        location lNew = Location( GetAreaFromLocation(l), GetPositionFromLocation(l), GetFacingFromLocation(l) + 180);
//        CreateObject( OBJECT_TYPE_PLACEABLE, "plc_statue3", lNew );

        CreateObject(OBJECT_TYPE_PLACEABLE, "stat_garg002", lNew);
        DestroyObject(OBJECT_SELF, 0.5);
    }
}
