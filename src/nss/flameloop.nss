#include "nw_i0_2q4luskan"
void main()
{
object oPC = GetEnteringObject();
if (!GetIsPC(oPC)) return;
object oTarget;
location lTarget;
oTarget = GetWaypointByTag("fire12");
lTarget = GetLocation(oTarget);
DelayCommand(1.0, CreateObjectVoid(OBJECT_TYPE_CREATURE, "flameloop", lTarget));
effect eEffect;
eEffect = EffectVisualEffect(VFX_FNF_METEOR_SWARM);
DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget));

oTarget = GetWaypointByTag("fire11");
lTarget = GetLocation(oTarget);
DelayCommand(2.0, CreateObjectVoid(OBJECT_TYPE_CREATURE, "flameloop", lTarget));
eEffect = EffectVisualEffect(VFX_FNF_METEOR_SWARM);
DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget));

oTarget = GetWaypointByTag("fire10");
lTarget = GetLocation(oTarget);
DelayCommand(3.0, CreateObjectVoid(OBJECT_TYPE_CREATURE, "flameloop", lTarget));
eEffect = EffectVisualEffect(VFX_FNF_METEOR_SWARM);
DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget));

oTarget = GetWaypointByTag("fire9");
lTarget = GetLocation(oTarget);
DelayCommand(4.0, CreateObjectVoid(OBJECT_TYPE_CREATURE, "flameloop", lTarget));
eEffect = EffectVisualEffect(VFX_FNF_METEOR_SWARM);
DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget));

oTarget = GetWaypointByTag("fire8");
lTarget = GetLocation(oTarget);
DelayCommand(5.0, CreateObjectVoid(OBJECT_TYPE_CREATURE, "flameloop", lTarget));
eEffect = EffectVisualEffect(VFX_FNF_METEOR_SWARM);
DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget));

oTarget = GetWaypointByTag("fire7");
lTarget = GetLocation(oTarget);
DelayCommand(6.0, CreateObjectVoid(OBJECT_TYPE_CREATURE, "flameloop", lTarget));
eEffect = EffectVisualEffect(VFX_FNF_METEOR_SWARM);
DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget));

oTarget = GetWaypointByTag("fire6");
lTarget = GetLocation(oTarget);
DelayCommand(7.0, CreateObjectVoid(OBJECT_TYPE_CREATURE, "flameloop", lTarget));
eEffect = EffectVisualEffect(VFX_FNF_METEOR_SWARM);
DelayCommand(7.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget));

oTarget = GetWaypointByTag("fire5");
lTarget = GetLocation(oTarget);
DelayCommand(8.0, CreateObjectVoid(OBJECT_TYPE_CREATURE, "flameloop", lTarget));
eEffect = EffectVisualEffect(VFX_FNF_METEOR_SWARM);
DelayCommand(8.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget));

oTarget = GetWaypointByTag("fire4");
lTarget = GetLocation(oTarget);
DelayCommand(9.0, CreateObjectVoid(OBJECT_TYPE_CREATURE, "flameloop", lTarget));
eEffect = EffectVisualEffect(VFX_FNF_METEOR_SWARM);
DelayCommand(9.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget));

oTarget = GetWaypointByTag("fire3");
lTarget = GetLocation(oTarget);
DelayCommand(10.0, CreateObjectVoid(OBJECT_TYPE_CREATURE, "flameloop", lTarget));
eEffect = EffectVisualEffect(VFX_FNF_METEOR_SWARM);
DelayCommand(10.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget));

oTarget = GetWaypointByTag("fire2");
lTarget = GetLocation(oTarget);
DelayCommand(11.0, CreateObjectVoid(OBJECT_TYPE_CREATURE, "flameloop", lTarget));
eEffect = EffectVisualEffect(VFX_FNF_METEOR_SWARM);
DelayCommand(11.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget));

oTarget = GetWaypointByTag("fire1");
lTarget = GetLocation(oTarget);
DelayCommand(12.0, CreateObjectVoid(OBJECT_TYPE_CREATURE, "flameloop", lTarget));
eEffect = EffectVisualEffect(VFX_FNF_METEOR_SWARM);
DelayCommand(12.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget));

}

