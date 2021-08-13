void main()
{
object oPC = GetEnteringObject();
object oDeny;

if (!GetIsPC(oPC)) return;

if (GetItemPossessedBy(oPC, "stablekey1")!= OBJECT_INVALID)
   return;

object oTarget;
location lTarget;
oTarget = GetWaypointByTag("deathrow_wp");
lTarget = GetLocation(oTarget);
if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;
AssignCommand(oPC, ClearAllActions());
DelayCommand(0.5, AssignCommand(oPC, ActionJumpToLocation(lTarget)));
oTarget = oPC;
SpeakString(GetName(oPC) + "...is steeling a horse", TALKVOLUME_SHOUT);
int nInt;
nInt = GetObjectType(oTarget);
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), GetLocation(oTarget));

}
