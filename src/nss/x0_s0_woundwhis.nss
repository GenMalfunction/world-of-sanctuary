//::///////////////////////////////////////////////
//:: Wounding Whispers
//:: x0_s0_WoundWhis.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Magical whispers cause 1d8 sonic damage to attackers who hit you.
    Made the damage slightly more than the book says because we cannot
    do the +1 per level.
*/
//
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk   Modified by Tab, Realms of Trinity
//:: Created On: Jan 7, 2002
//:://////////////////////////////////////////////
//:: Modified for wounding whispers, July 30 2002, Brent
//:://////////////////////////////////////////////
//:: Last Update By: Andrew Nobbs May 01, 2003
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
    effect eVis = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE);
    int nDuration = GetCasterLevel(OBJECT_SELF);
    int nBonus = nDuration;
    int nMetaMagic = GetMetaMagicFeat();
    object oTarget = OBJECT_SELF;
    effect eShield = EffectDamageShield(d6(1) + nBonus, 0, DAMAGE_TYPE_SONIC);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

    //Link effects
    effect eLink = EffectLinkEffects(eShield, eDur);
    eLink = EffectLinkEffects(eLink, eVis);

    //Fire cast spell at event for the specified target
    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, 441, FALSE));

    //Enter Metamagic conditions
    if (nMetaMagic == METAMAGIC_EXTEND)
    {
        nDuration = nDuration *2; //Duration is +100%
    }
    //Apply the VFX impact and effects
    RemoveEffectsFromSpell1(OBJECT_SELF,SPELL_WOUNDING_WHISPERS);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
}
