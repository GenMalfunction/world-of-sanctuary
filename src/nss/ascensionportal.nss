void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

if (GetItemPossessedBy(oPC, "gateseal1")== OBJECT_INVALID)
   return;

if (GetItemPossessedBy(oPC, "gateseal2")== OBJECT_INVALID)
   return;

if (GetItemPossessedBy(oPC, "gateseal3")== OBJECT_INVALID)
   return;

if (GetItemPossessedBy(oPC, "gateseal4")== OBJECT_INVALID)
   return;

if (GetItemPossessedBy(oPC, "gateseal5")== OBJECT_INVALID)
   return;

if (GetItemPossessedBy(oPC, "gateseal6")== OBJECT_INVALID)
   return;

if (GetItemPossessedBy(oPC, "gateseal7")== OBJECT_INVALID)
   return;

if (GetItemPossessedBy(oPC, "gateseal8")== OBJECT_INVALID)
   return;

object oTarget;
object oSpawn;
location lTarget;
oTarget = GetWaypointByTag("openascension");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "portaltoascens", lTarget);

oTarget = oSpawn;

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), oTarget));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), GetLocation(oTarget)));

FloatingTextStringOnCreature("Portal to Ascension is open", oPC);

}

