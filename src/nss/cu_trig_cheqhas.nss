void main()
{
    effect eSecond;
    effect efirst;
    effect eStrength = EffectHaste();
    object oTarget = GetEnteringObject();
    int nOnce = GetLocalInt(oTarget, "Use_Heal");

    if (nOnce == FALSE)
    {
         eSecond = EffectVisualEffect(VFX_IMP_HASTE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eSecond, oTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eStrength, oTarget, 60.0);
         SetLocalInt(oTarget, "Use_Heal", TRUE);
        FloatingTextStringOnCreature("Invigorated", oTarget);
    }

    else
    {
        int nDamage = GetReflexAdjustedDamage(d6(), oTarget, 25, SAVING_THROW_TYPE_NEGATIVE);
        efirst = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
        eSecond = EffectDamage(nDamage, DAMAGE_TYPE_NEGATIVE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, efirst, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eSecond, oTarget);
    }
}

