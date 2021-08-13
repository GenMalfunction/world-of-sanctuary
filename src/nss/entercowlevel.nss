void main()
{

object oPC = GetPCSpeaker();

object oTarget;
object oSpawn;
location lTarget;
oTarget = GetWaypointByTag("scl");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "sclp", lTarget);

oTarget = oSpawn;

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DOOM), oTarget));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DOOM), GetLocation(oTarget)));

}

