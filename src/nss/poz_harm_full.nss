#include "x2_inc_switches"
#include "NW_I0_SPELLS"
#include "x2_inc_spellhook"

void main()
{
    if(GetUserDefinedItemEventNumber()!=X2_ITEM_EVENT_ACTIVATE) return;
/*
  Spellcast Hook Code
  Added 2003-06-23 by GeorgZ
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more

*/

    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook


    //Declare major variables
    object oTarget = GetItemActivator();
    int nDamage, nHeal;
    int nMetaMagic = METAMAGIC_NONE;
    //int nTouch = TouchAttackMelee(oTarget);
    effect eVis = EffectVisualEffect(246);
    effect eVis2 = EffectVisualEffect(VFX_IMP_HEALING_G);
    effect eHeal, eDam;
    //Check that the target is undead
    if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
    {
        //Figure out the amount of damage to heal
        nHeal = GetMaxHitPoints(oTarget) - GetCurrentHitPoints(oTarget);
        //Set the heal effect
        eHeal = EffectHeal(nHeal);
        //Apply heal effect and VFX impact
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget);
        //Fire cast spell at event for the specified target
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_HARM, FALSE));
    }
    else   //GZ: Fixed boolean check to work in NWScript. 1 or 2 are valid return numbers from TouchAttackMelee
    {
        //Fire cast spell at event for the specified target
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_HARM));
        if (!MyResistSpell(OBJECT_SELF, oTarget))
        {
            nDamage = GetCurrentHitPoints(oTarget) - d4(1);
            eDam = EffectDamage(nDamage,DAMAGE_TYPE_NEGATIVE);
            //Apply the VFX impact and effects
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        }
    }
}
