void main()
{
object oPC = GetPCSpeaker();
int nDam = 2-GetAbilityModifier(ABILITY_STRENGTH, oPC);
if (nDam < 0)
{
nDam = 0;
}
effect eDam = EffectDamage(nDam,DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_NORMAL);
ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oPC);
}

//
