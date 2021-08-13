/*
   Cast to random spells on entering object
   One 90 seconds after the other.
*/
//:://////////////////////////////////////////////
//:: Created  By:   Ben W-Husey
//:: Created On:   November the 6th, 2002
//:://////////////////////////////////////////////

void main()
{
   object oCreature = GetEnteringObject();
   effect eMindA;
   effect eResA;
   effect eMindB;
   effect eResB;
   int nVFXTypeA;
   int nVFXTypeB;
   int iRollA = d6();
   switch(iRollA)
   {
   case 1:
       eMindA = EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS);
       eResA = EffectDamageResistance(DAMAGE_TYPE_FIRE, d8(), 10);
       nVFXTypeA = 1;
       FloatingTextStringOnCreature("Protection for fire", oCreature);
   break;
   case 2:
       eMindA = EffectVisualEffect(VFX_IMP_MAGBLUE);
    eResA = EffectAttackIncrease(2, ATTACK_BONUS_ONHAND);
    nVFXTypeA = 2;
    FloatingTextStringOnCreature("+2 Attack Bonus", oCreature);
   break;
   case 3:
    eMindA = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE);
    eResA = EffectAbilityDecrease(ABILITY_CONSTITUTION, d8());
    nVFXTypeA = 1;
       FloatingTextStringOnCreature("Cursed", oCreature);
       break;
   case 4:
    eMindA = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    eResA = EffectAbilityIncrease(ABILITY_CONSTITUTION, d6());
    nVFXTypeA = 2;
       break;
   case 5:
    eMindA = EffectVisualEffect(VFX_IMP_HEALING_M);
    eResA = EffectHeal(10);
    nVFXTypeA = 2;
       break;
   case 6:
        eMindA = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE);
        eResA =EffectImmunity(IMMUNITY_TYPE_CRITICAL_HIT);
       nVFXTypeA = 1;
       break;
    }

    if (nVFXTypeA == 1)
    {
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMindA, oCreature, 90.0);
    }
    else
    {
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eMindA, oCreature);
    }
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eResA, oCreature, 90.0);

   int iSecondRoll = d6();
    switch(iSecondRoll)
    {
   case 1:
   eMindB = EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS);
   eResB = EffectDamageResistance(DAMAGE_TYPE_FIRE, d8(), 10);
   nVFXTypeB = 1;
       FloatingTextStringOnCreature("Protection for fire", oCreature);
       break;
   case 2:
   eMindB = EffectVisualEffect(VFX_IMP_HEALING_M);
   eResB = EffectHeal(10);
   nVFXTypeB = 2;
       break;
   case 3:
   eMindB = EffectVisualEffect(VFX_IMP_POISON_S);
   eResB = EffectPoison(POISON_LARGE_SPIDER_VENOM);
   nVFXTypeB = 1;
       break;
   case 4:
   eMindB = EffectVisualEffect(VFX_IMP_FROST_S);
   eResB = EffectDamage(d8(),DAMAGE_TYPE_COLD, DAMAGE_POWER_PLUS_ONE);
   nVFXTypeB = 2;
       break;
   case 5:
   eMindB = EffectVisualEffect(VFX_DUR_BLUR);
   eResB = EffectDamageIncrease(d8(), DAMAGE_TYPE_SONIC);
   nVFXTypeB = 1;
       FloatingTextStringOnCreature("Sonic Damage Bonus", oCreature);
       break;
   case 6:
   eMindB = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE);
    eResB =EffectImmunity(IMMUNITY_TYPE_CRITICAL_HIT);
   nVFXTypeB = 1;
       break;
   }
    if (nVFXTypeB == 1)
    {
    DelayCommand(30.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMindB, oCreature, 90.0));
    }
    else
    {
    DelayCommand(30.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eMindB, oCreature));
    }
    DelayCommand(30.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eResB, oCreature, 90.0));
}
