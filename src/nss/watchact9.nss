void main()
{
object oPC = GetEnteringObject();
if (!GetIsPC(oPC)) return;

/*
{
object pTarget;
pTarget = oPC;
effect eEffect;
eEffect = EffectACDecrease(5);
ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, pTarget, 600.0f);
pTarget = oPC;
eEffect = EffectAttackDecrease(5);
ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, pTarget, 600.0f);
}
*/

if (GetItemPossessedBy(oPC, "wayp55")!= OBJECT_INVALID)
   return;
object oTarget;
location lTarget;
oTarget = GetWaypointByTag("deathrow_wp");
lTarget = GetLocation(oTarget);
if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;
AssignCommand(oPC, ClearAllActions());
DelayCommand(0.5, AssignCommand(oPC, ActionJumpToLocation(lTarget)));
oTarget = oPC;
SpeakString(GetName(oPC) + "...has no right to access Act IX", TALKVOLUME_SHOUT);
int nInt;
nInt = GetObjectType(oTarget);
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), GetLocation(oTarget));
}

