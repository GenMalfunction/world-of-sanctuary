//:://////////////////////////////////////////////
//:: BOMB OnHeadbet (effects)
//:: BY: BUTCHA
//:://////////////////////////////////////////////
void main()
{
object oBOMB = OBJECT_SELF;
effect oVFX1= EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
effect oVFX2 = EffectVisualEffect(VFX_IMP_HEAD_ELECTRICITY);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, oVFX1, oBOMB);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, oVFX2, oBOMB);
}
