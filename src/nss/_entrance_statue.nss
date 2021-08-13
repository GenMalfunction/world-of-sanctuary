void main()
{
object oThrone = OBJECT_SELF;
effect VFX1 = EffectVisualEffect(VFX_DUR_INFERNO);
effect VFX2 = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_RED);
ApplyEffectToObject(DURATION_TYPE_PERMANENT,VFX1,oThrone);
ApplyEffectToObject(DURATION_TYPE_PERMANENT,VFX2,oThrone);
}
