void main()
{
object oPC = GetPCSpeaker();
object oTarget;
oTarget = OBJECT_SELF;
int nInt;
nInt = GetObjectType(oTarget);
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), GetLocation(oTarget));
oTarget = OBJECT_SELF;
DestroyObject(oTarget, 3.0);
}
