void main()
{
    effect eFirst;
    effect eSecond;
    effect eStrength = EffectAbilityIncrease(ABILITY_STRENGTH, (d4() + 1));
    object oTarget = GetLastUsedBy();
    int nOnce = GetLocalInt(oTarget, "Use_Pool_Once");
    // if the PC has not used the pool before
    if (nOnce == FALSE)
    {
        eFirst = EffectVisualEffect(VFX_IMP_GOOD_HELP);
        eSecond = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
        // create the effect on the pool
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eFirst, OBJECT_SELF);
        // apply the strength effect with visual 3 seconds later
        DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eSecond, oTarget));
        DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eStrength, oTarget, 300.0));
        // and set the variable on the PC so they can't use the pool again
        SetLocalInt(oTarget, "Use_Pool_Once", TRUE);
    }
    // if they have used the pool
    else
    {
        eFirst = EffectVisualEffect(VFX_IMP_EVIL_HELP);
        // allow them a reflex save against the lightning bolt
        int nDamage = GetReflexAdjustedDamage(d6(), oTarget, 25, SAVING_THROW_TYPE_NEGATIVE);
        eSecond = EffectDamage(nDamage, DAMAGE_TYPE_NEGATIVE);
        // and then cause the visual effect of the bolt strike and apply the damage
        DelayCommand(3.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eFirst, oTarget));
        DelayCommand(3.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eSecond, oTarget));
    }
}

