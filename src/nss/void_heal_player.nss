void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

object oTarget;
oTarget = oPC;

effect eEffect;
eEffect = EffectHeal(100);

ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);

}

