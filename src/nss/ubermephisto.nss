#include "nw_i0_generic"
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

if (GetItemPossessedBy(oPC, "TheStoneofJordann")== OBJECT_INVALID)
   return;

object oItem;
oItem = GetItemPossessedBy(oPC, "TheStoneofJordann");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

object oTarget;
object oSpawn;
location lTarget;
oTarget = oPC;

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "ubermephisto", lTarget);

oTarget = oSpawn;

SetIsTemporaryEnemy(oPC, oTarget);

AssignCommand(oTarget, ActionAttack(oPC));

AssignCommand(oTarget, DetermineCombatRound(oPC));

oTarget = oSpawn;

//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget)));

}

