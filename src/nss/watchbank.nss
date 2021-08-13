void main()
{
object oPC = GetEnteringObject();
//--
if (!GetIsPC(oPC)) return;
//--
object oTarget;
location lTarget;
oTarget = GetWaypointByTag("deathrow_wp");
lTarget = GetLocation(oTarget);
//--
if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;
AssignCommand(oPC, ClearAllActions());
DelayCommand(2.0, AssignCommand(oPC, ActionJumpToLocation(lTarget)));
//--
oTarget = oPC;
//--
SpeakString(GetName(oPC) + "...is caught trying to rob the Bank of Sanctuary", TALKVOLUME_SHOUT);
//--
int nInt;
nInt = GetObjectType(oTarget);
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), GetLocation(oTarget));
}

