//::///////////////////////////////////
//:: Created By:Koenvanlangenhove  :://
//:: Created On:16-06-2003         :://
//::///////////////////////////////////

 void main()
{
  // Damage= *
  effect eDamage = EffectDamage(9000);
  // Get object that has to be damaged
  object oVictim = GetPCSpeaker();

  // aply the damage
  ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oVictim);
}
