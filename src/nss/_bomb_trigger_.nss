void main()
{
object oPC = GetPCSpeaker();
object oTarget;
object oSpawn;
location lTarget;
oTarget = oPC;
lTarget = GetLocation(oTarget);
oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "bomb", lTarget);
oTarget = oSpawn;
int nInt;
nInt = GetObjectType(oTarget);
if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), oTarget));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), GetLocation(oTarget)));
}

