////////////////////////////////////////////////////////////////////////////////
// Module Event: OnPlayerDying
////////////////////////////////////////////////////////////////////////////////

void main()
{
  // instant death
  effect eDeath = EffectDeath(TRUE,TRUE);
  ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath,GetLastPlayerDying());
}
