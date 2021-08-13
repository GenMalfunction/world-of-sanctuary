void main(){
   object oPlayer = GetLastSpellCaster();
   AssignCommand(oPlayer, ClearAllActions(TRUE));
   SpeakString(GetName(oPlayer) + "now that was just plain dumb!");

   SetImmortal(oPlayer,FALSE);
   ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_HIT_DIVINE,FALSE), oPlayer, 0.0f);
   ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(44,FALSE), oPlayer, 0.0f);
   ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(81,FALSE), oPlayer, 0.0f);
   ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(91,FALSE), oPlayer, 0.0f);
   ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(57,FALSE), oPlayer, 0.0f);
   ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE), oPlayer, 0.0f);
}
