void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

object oTarget;
location lTarget;
oTarget = GetWaypointByTag("outbelial");

lTarget = GetLocation(oTarget);


if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;

AssignCommand(oPC, ClearAllActions());

DelayCommand(3.0, AssignCommand(oPC, ActionJumpToLocation(lTarget)));

oTarget = oPC;


int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), GetLocation(oTarget));

}

