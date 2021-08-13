//Put this OnUsed
void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

object oCaster;
oCaster = OBJECT_SELF;

object oTarget;
oTarget = oPC;

AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_GREATER_RESTORATION, oTarget, METAMAGIC_ANY, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));

}
