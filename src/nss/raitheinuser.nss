void main()
{
 switch(GetUserDefinedEventNumber())
 {
  case 767:
  object oTarget=GetObjectByTag("Raitheen");
  effect eVis=EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL);
  ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));

 }

}

