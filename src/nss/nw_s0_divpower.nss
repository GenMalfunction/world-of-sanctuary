//::///////////////////////////////////////////////
//:: Divine Power
//:: NW_S0_DivPower.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Improves the Clerics base attack by 33%, +1 HP
    per level and raises their strength to 18 if
    is not already there.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk    Modified by Tab, Realms of Trinity
//:: Created On: Oct 21, 2001
//:://////////////////////////////////////////////

/*
bugfix by Kovi 2002.07.22
- temporary hp was stacked
- loosing temporary hp resulted in loosing the other bonuses
- number of attacks was not increased (should have been a BAB increase)
still problem:
~ attacks are better still approximation (the additional attack is at full BAB)
~ attack/ability bonuses count against the limits
*/

#include "nw_i0_spells"
void RemoveEffectsFromSpell1(object oTarget, int SpellID)
{
  effect eLook = GetFirstEffect(oTarget);
  while (GetIsEffectValid(eLook)) {
    if (GetEffectSpellId(eLook) == SpellID)
      RemoveEffect(oTarget, eLook);
    eLook = GetNextEffect(oTarget);
  }
}


void main()
{
    //Declare major variables
    object oTarget = GetSpellTargetObject();
    int nLevel = GetCasterLevel(OBJECT_SELF);
    int nHP = nLevel;
    int nAttack = nLevel - ((nLevel/4)*3) ;
    int nStr = GetAbilityScore(oTarget, ABILITY_STRENGTH);
    int nStrength = (nStr - 18) * -1;
    if(nStrength < 0)
    {
        nStrength = 0;
    }
    int nMetaMagic = GetMetaMagicFeat();
    effect eVis = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
    effect eStrength = EffectAbilityIncrease(ABILITY_STRENGTH, nStrength);
    effect eHP = EffectTemporaryHitpoints(nHP);
    effect eAttack = EffectAttackIncrease(nAttack);
    effect eAttackMod = EffectModifyAttacks(CalcNumberOfAttacks());
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

    effect eLink = EffectLinkEffects(eAttack, eAttackMod);
    eLink = EffectLinkEffects(eLink, eDur);

//    effect eLink = EffectLinkEffects(eAttack, eHP);
//    eLink = EffectLinkEffects(eLink, eDur);

    //Make sure that the strength modifier is a bonus
    if(nStrength > 0)
    {
        eLink = EffectLinkEffects(eLink, eStrength);
    }
    //Meta-Magic
    if(nMetaMagic == METAMAGIC_EXTEND)
    {
        nLevel *= 2;
    }

    RemoveTempHitPoints();

    //Fire cast spell at event for the specified target
    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_DIVINE_POWER, FALSE));

    //Apply Link and VFX effects to the target
    RemoveEffectsFromSpell1(OBJECT_SELF,SPELL_DIVINE_POWER);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nLevel));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHP, oTarget, RoundsToSeconds(nLevel));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
}

