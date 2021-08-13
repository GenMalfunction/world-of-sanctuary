// B W-Husey 2nd March
// Aplly curse (level drain) to the opener

void main()
{
object oPC = GetLastOpenedBy();
if (!GetIsPC(oPC)) return; //safety if not PC then don't apply
int DoOnce = GetLocalInt(OBJECT_SELF, GetTag(OBJECT_SELF));
if (DoOnce==TRUE) return; //If not first time than do nothing
SetLocalInt(OBJECT_SELF, GetTag(OBJECT_SELF), TRUE);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectNegativeLevel(2), oPC);
ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH), oPC);
}
