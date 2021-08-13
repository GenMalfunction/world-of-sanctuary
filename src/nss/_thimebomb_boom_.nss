//:://////////////////////////////////////////////
//:: BOMB Exfloding Radius
//:: BY: BUTCHA
//:://////////////////////////////////////////////
void main()
{
object oBOMB;
oBOMB =  OBJECT_SELF;
object oBOMB2;
oBOMB2 = GetObjectByTag("BOMB");
object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 15.0,  GetLocation(OBJECT_SELF));
ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL),OBJECT_SELF);
ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HOWL_WAR_CRY),OBJECT_SELF);
ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(9999),OBJECT_SELF);
while(GetIsObjectValid(oTarget))
{
if(!GetIsReactionTypeFriendly(oTarget))
{
ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(9999),oTarget);
ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(9999),oBOMB2);
}
oTarget = GetNextObjectInShape(SHAPE_SPHERE, 15.0, GetLocation(OBJECT_SELF));
}
}

