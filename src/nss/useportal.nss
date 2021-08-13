//:: Script for the town portal scroll
//:: Created by: Helge "DarkFame" Ingvoldstad
//::
//:: Purpose: Teleports the PC back to town when town portal is used
void main()
{
    location lLoc = GetLocation(GetWaypointByTag("WP_Townportal")); // Finds the waypoint to teleport to (placed in town).
    object oPC = GetPCSpeaker();
    if(GetIsPC(oPC) == 1)
    {
    // Effects start
    object oTarget = oPC;
    effect eVis = EffectVisualEffect(VFX_IMP_DISPEL, FALSE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget, 6.0);
    // Effects stop
    AssignCommand(oPC, ActionJumpToLocation(lLoc)); // Teleports the PC
    if (GetLocalLocation(oPC,"Portal") == GetLocation(OBJECT_SELF)) { DestroyObject(OBJECT_SELF); } // Destroys the portal when the OWNER enters it, remove this line if you want a permanent portal
    SetLocalLocation(oPC,"Portal",GetLocation(OBJECT_SELF));
    }
}

