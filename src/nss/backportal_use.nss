//:: Back portal script (placed in town together with WP_Townportal).
//:: Created by: Helge "DarkFame" Ingvoldstad
//::
//:: Purpose: Teleport PC back to the town portal he once created
void main()
{
    location lLoc = GetLocalLocation(GetPCSpeaker(),"Portal"); // gets the location of the town portal the PC once created
    object oPC = GetPCSpeaker(); // gets the PC
    if(GetIsPC(oPC) == 1)
    {
    // Remove the effects if you don't want it
    // Effects start
    object oTarget = oPC;
    effect eVis = EffectVisualEffect(VFX_IMP_DISPEL, FALSE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget, 6.0);
    // Effects stop
    AssignCommand(oPC, ActionJumpToLocation(lLoc)); // Teleports PC to the correct location
    SetLocalLocation(oPC,"Portal",GetLocation(GetObjectByTag("WP_Townportal"))); // resets the variable
    }
}

