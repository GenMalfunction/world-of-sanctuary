// B W-Husey 28th February
// Object casts fireballs semi randomly at preset waypoints.

void main()
{
location lTarget = GetLocation(GetWaypointByTag("WP_Blast1"));
location lTarget2 = GetLocation(GetWaypointByTag("WP_Blast2"));
location lTarget3 = GetLocation(GetWaypointByTag("WP_Blast3"));
location lTarget4 = GetLocation(GetWaypointByTag("WP_Blast4"));
location lSelf =GetLocation(OBJECT_SELF);
object oCaster = OBJECT_SELF;
effect eFirst = EffectVisualEffect(VFX_IMP_EVIL_HELP);
float nDelay1 = IntToFloat(d8());
float nDelay2 = IntToFloat(d8());
int nRand = d3();

if (nRand<3)
{
DelayCommand(nDelay1,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eFirst, lSelf));
DelayCommand(nDelay1+1,ActionCastSpellAtLocation(SPELL_FIREBALL, lTarget, PROJECTILE_PATH_TYPE_DEFAULT));
}
if (nRand>1)
{
DelayCommand(nDelay2,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eFirst, lSelf));
DelayCommand(nDelay2+1,ActionCastSpellAtLocation(SPELL_FIREBALL, lTarget2, PROJECTILE_PATH_TYPE_DEFAULT));
}
if (nRand == 1)
{
DelayCommand(nDelay2,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eFirst, lSelf));
DelayCommand(nDelay2+1,ActionCastSpellAtLocation(SPELL_FIREBALL, lTarget3, PROJECTILE_PATH_TYPE_DEFAULT));
}
if (nRand == 3)
{
DelayCommand(nDelay2+nDelay1,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eFirst, lSelf));
DelayCommand(nDelay2+nDelay1+1,ActionCastSpellAtLocation(SPELL_FIREBALL, lTarget4, PROJECTILE_PATH_TYPE_DEFAULT));
}
}
