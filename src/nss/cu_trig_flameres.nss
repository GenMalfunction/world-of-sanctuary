//::///////////////////////////////////////////////
//:: flameresist.nss
//::
//:://////////////////////////////////////////////
/*
   Cast fire resistance on entering creature
*/
//:://////////////////////////////////////////////
//:: Created  By:   Ben W-Husey
//:: Created On:   October the 6th, 2002
//:://////////////////////////////////////////////

void main()
{
   object oCreature = GetEnteringObject();
   effect eMind = EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMind, oCreature, 60.0);
   effect eRes = EffectDamageResistance(DAMAGE_TYPE_FIRE, d4(), 10);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRes, oCreature, 60.0);
//    ActionCastSpellAtObject(SPELL_ENDURE_ELEMENTS, oCreature, METAMAGIC_NONE, TRUE, 5, PROJECTILE_PATH_TYPE_DEFAULT, TRUE) ;
}
