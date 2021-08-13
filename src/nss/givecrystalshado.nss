#include "nw_i0_generic"
#include "nw_i0_tool"
void main()
{
object oPC = GetLastUsedBy();
if (!GetIsPC(oPC)) return;
int DoOnce = GetLocalInt(oPC, GetTag(OBJECT_SELF));
if (DoOnce==TRUE) return;
SetLocalInt(oPC, GetTag(OBJECT_SELF), TRUE);
RewardPartyXP(1000, oPC, FALSE);
RewardPartyGP(1000, oPC, FALSE);
CreateItemOnObject("crystalshadow", oPC);
SpeakString("Someone found the Crystal of Shadow !", TALKVOLUME_SHOUT);
object oTarget;
object oSpawn;
location lTarget;
oTarget = GetWaypointByTag("hadriel");
lTarget = GetLocation(oTarget);
oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "hadriel001", lTarget);
oTarget = oSpawn;
SetIsTemporaryEnemy(oPC, oTarget);
AssignCommand(oTarget, ActionAttack(oPC));
AssignCommand(oTarget, DetermineCombatRound(oPC));
oTarget = oSpawn;
int nInt;
nInt = GetObjectType(oTarget);
if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), oTarget));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), GetLocation(oTarget)));
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), GetLocation(oTarget));
}
