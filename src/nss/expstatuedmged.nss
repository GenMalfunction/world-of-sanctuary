
void main()
{
float fDamageRange = 17.0; // Range of FireDamage
int iMinDamage = 600; // Minimal Firedamage
int iAddDamage = d20(15); // Additional (random) Damage
// TotalDamage to an object is
// iMinDamage + iAddDamage



// Do the nice Fire Explosion

effect eExpl = EffectVisualEffect(VFX_FNF_STRIKE_HOLY);
effect eExpl2 = EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
effect eSmoke = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
effect eBUMP = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);

DelayCommand(0.2,ApplyEffectToObject(DURATION_TYPE_INSTANT,eExpl,OBJECT_SELF));
DelayCommand(0.3,ApplyEffectToObject(DURATION_TYPE_INSTANT,eBUMP,OBJECT_SELF));
DelayCommand(0.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,eSmoke,OBJECT_SELF));
DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eExpl2,OBJECT_SELF, 5.0));
// Do Damage to all Objects in a range defined by fDamageRange
object o;
effect eFireDamage;
o = GetFirstObjectInShape(SHAPE_SPHERE,fDamageRange,GetLocation(OBJECT_SELF),TRUE,OBJECT_TYPE_ALL);
while(GetIsObjectValid(o))
{
eFireDamage = EffectDamage(iMinDamage + iAddDamage,DAMAGE_TYPE_DIVINE, DAMAGE_POWER_PLUS_FIVE);
DelayCommand(0.9,ApplyEffectToObject(DURATION_TYPE_INSTANT,eFireDamage,o));
o = GetNextObjectInShape(SHAPE_SPHERE,fDamageRange,GetLocation(OBJECT_SELF),TRUE,OBJECT_TYPE_ALL);

}
}







