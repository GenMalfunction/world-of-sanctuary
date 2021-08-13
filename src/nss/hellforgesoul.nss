#include "nw_i0_tool"
void main()
{
object oPC = GetLastUsedBy();
if (!GetIsPC(oPC)) return;
if(HasItem(oPC, "soulstone0005"))
{
SpeakString("Someone destroyed the soulstones !", TALKVOLUME_SHOUT);
object oItem;
oItem = GetItemPossessedBy(oPC, "soulstone0001");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
oItem = GetItemPossessedBy(oPC, "soulstone0002");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
oItem = GetItemPossessedBy(oPC, "soulstone0003");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
oItem = GetItemPossessedBy(oPC, "soulstone0004");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
oItem = GetItemPossessedBy(oPC, "soulstone0005");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
oItem = GetItemPossessedBy(oPC, "soulstone0006");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
oItem = GetItemPossessedBy(oPC, "soulstone0007");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
oItem = GetItemPossessedBy(oPC, "soulstone0008");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
oItem = GetItemPossessedBy(oPC, "soulstone0009");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
object oTarget;
oTarget = oPC;
int nInt;
nInt = GetObjectType(oTarget);
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget));
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SOUND_BURST), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SOUND_BURST), GetLocation(oTarget));
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), GetLocation(oTarget));
if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget));

object oTarget1;
object oSpawn1;
location lTarget1;
oTarget1 = GetWaypointByTag("cain1000");
lTarget1 = GetLocation(oTarget1);
oSpawn1 = CreateObject(OBJECT_TYPE_CREATURE, "cain1000", lTarget1);
oTarget1 = oSpawn1;
SetIsTemporaryEnemy(oPC, oTarget1);
AssignCommand(oTarget1, ActionAttack(oPC));
oTarget1 = oSpawn1;

object oTarget2;
object oSpawn2;
location lTarget2;
oTarget2 = GetWaypointByTag("king1000");
lTarget2 = GetLocation(oTarget2);
oSpawn2 = CreateObject(OBJECT_TYPE_CREATURE, "king1000", lTarget2);
oTarget2 = oSpawn2;
SetIsTemporaryEnemy(oPC, oTarget2);
AssignCommand(oTarget2, ActionAttack(oPC));
oTarget2 = oSpawn2;
}
}
