//::///////////////////////////////////////////////
//:: Aid
//:: NW_S0_Aid.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Target creature gains +1 to attack rolls and
    saves vs fear. Also gain +1d8 temporary HP.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk   Modified by Tab, Realms of Trinity
//:: Created On: Sept 6, 2001
//:://////////////////////////////////////////////
//:: VFX Pass By: Preston W, On: June 20, 2001
void RemoveEffectsFromSpell(object oTarget, int SpellID)
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
    int nDuration = GetCasterLevel(OBJECT_SELF);
    int nBonus = d8(1);
    int nMetaMagic = GetMetaMagicFeat();
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

    //Enter Metamagic conditions
    if (nMetaMagic == METAMAGIC_MAXIMIZE)
    {
        nBonus = 8;//Damage is at max
    }
    else if (nMetaMagic == METAMAGIC_EMPOWER)
    {
        nBonus = nBonus + (nBonus/2); //Damage/Healing is +50%
    }
    else if (nMetaMagic == METAMAGIC_EXTEND)
    {
        nDuration = nDuration *2; //Duration is +100%
    }
    effect eAttack = EffectAttackIncrease(1);
    effect eSave = EffectSavingThrowIncrease(SAVING_THROW_ALL, 1, SAVING_THROW_TYPE_FEAR);

    effect eHP = EffectTemporaryHitpoints(nBonus);

    effect eVis = EffectVisualEffect(VFX_IMP_HOLY_AID);
    object oTarget = GetSpellTargetObject();

    effect eLink = EffectLinkEffects(eAttack, eSave);
    eLink = EffectLinkEffects(eLink, eDur);

    //Fire cast spell at event for the specified target
    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_AID, FALSE));

    //Apply the VFX impact and effects
    RemoveEffectsFromSpell(OBJECT_SELF,SPELL_AID);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, TurnsToSeconds(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHP, oTarget, TurnsToSeconds(nDuration));
}

