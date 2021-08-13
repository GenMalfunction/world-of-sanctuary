void main()
{

object oPC = GetPCSpeaker();

object oItem;

oItem = GetItemPossessedBy(oPC, "vic11");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

object oTarget;
object oSpawn;
location lTarget;
oTarget = GetWaypointByTag("portalexospector");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "portalenterexosp", lTarget);

oTarget = oSpawn;

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), oTarget));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), GetLocation(oTarget)));
}

