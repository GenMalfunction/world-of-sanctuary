void main()
{
object oPC = GetLastSpeaker();
object theWaypoint = GetWaypointByTag("hellforgesoul");
location rivendelia = GetLocation(theWaypoint);
object oTarget;
location lTarget;
oTarget = GetWaypointByTag("hellforgesoul");
lTarget = GetLocation(oTarget);
//AssignCommand(oPC, JumpToLocation(rivendelia));
DelayCommand(3.0, AssignCommand(oPC, ActionJumpToLocation(rivendelia)));
oTarget = oPC;
int nInt;
nInt = GetObjectType(oTarget);
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), GetLocation(oTarget));
}
