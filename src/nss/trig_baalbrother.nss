int nInt;
location lTarget;
object oSpawn;
object oTarget;

#include "nw_i0_generic"
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

int DoOnce = GetLocalInt(oPC, GetTag(OBJECT_SELF));

if (DoOnce==TRUE) return;

SetLocalInt(oPC, GetTag(OBJECT_SELF), TRUE);

if (GetItemPossessedBy(oPC, "wayp60")!= OBJECT_INVALID)
   {
   oTarget = GetWaypointByTag("baal02");

   lTarget = GetLocation(oTarget);

   oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "baalbrother", lTarget);

   oTarget = oSpawn;

   SetIsTemporaryEnemy(oPC, oTarget);

   AssignCommand(oTarget, ActionAttack(oPC));

   AssignCommand(oTarget, DetermineCombatRound(oPC));


   nInt = GetObjectType(oTarget);

   if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HOWL_WAR_CRY), oTarget));
   else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HOWL_WAR_CRY), GetLocation(oTarget)));

   }
}
