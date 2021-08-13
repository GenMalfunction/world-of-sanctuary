void main()
{
object oPC = GetLastSpeaker();
object theWaypoint = GetWaypointByTag("SideQuest3");
location rivendelia = GetLocation(theWaypoint);
object oTarget;
location lTarget;
oTarget = GetWaypointByTag("SideQuest3");
lTarget = GetLocation(oTarget);
DelayCommand(3.0, AssignCommand(oPC, ActionJumpToLocation(rivendelia)));
oTarget = oPC;
int nInt;
nInt = GetObjectType(oTarget);
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), GetLocation(oTarget));
}
