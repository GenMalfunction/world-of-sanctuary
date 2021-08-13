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
if (GetItemPossessedBy(oPC, "gateseal9")== OBJECT_INVALID)
   return;

object oTarget;
object oSpawn;
location lTarget;
oTarget = GetWaypointByTag("worldstonex");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "worldstonex", lTarget);

oTarget = oSpawn;

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), oTarget));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), GetLocation(oTarget)));

}

