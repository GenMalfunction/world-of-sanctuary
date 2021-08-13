//::///////////////////////////////////////////////
//:: flameresist.nss
//::
//:://////////////////////////////////////////////
/*
  Put entering creature to sleep
*/
//:://////////////////////////////////////////////
//:: Created  By:   Ben W-Husey
//:: Created On:   October the 16th, 2002
//:://////////////////////////////////////////////

void main()
{
   object oCreature = GetEnteringObject();
   effect eMind = EffectVisualEffect(VFX_IMP_SLEEP);
   effect eRes = EffectSleep();
    FloatingTextStringOnCreature("You feel drowsy", oCreature);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMind, oCreature, 30.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eMind, oCreature, 30.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRes, oCreature, 30.0);
}
