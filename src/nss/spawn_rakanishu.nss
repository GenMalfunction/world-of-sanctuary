#include "nw_i0_generic"
//Put this OnEnter
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

if (GetItemPossessedBy(oPC, "vizjerei")== OBJECT_INVALID)
   return;

if (GetItemPossessedBy(oPC, "wayp50")== OBJECT_INVALID)
   return;

object oTarget;
object oSpawn;
location lTarget;
object oItem;

oItem = GetItemPossessedBy(oPC, "vizjerei");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

//-- Creature 1
oTarget = GetWaypointByTag("rakanishu1");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "rakanishu", lTarget);

oTarget = oSpawn;

SetIsTemporaryEnemy(oPC, oTarget);

AssignCommand(oTarget, ActionAttack(oPC));

AssignCommand(oTarget, DetermineCombatRound(oPC));


}

