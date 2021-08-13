#include "nw_i0_generic"
void main()
{
object oPC = GetPCSpeaker();
object oTarget;
oTarget = OBJECT_SELF;
AdjustReputation(oPC, oTarget, -100);
oTarget = OBJECT_SELF;
SetIsTemporaryEnemy(oPC, oTarget);
AssignCommand(oTarget, ActionAttack(oPC));
AssignCommand(oTarget, DetermineCombatRound(oPC));
}

