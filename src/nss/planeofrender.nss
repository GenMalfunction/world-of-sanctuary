void main()
{
switch(GetUserDefinedEventNumber())
  {
   case 555:
   {
    location spawnLoc=GetLocation(GetWaypointByTag("WP_guardian"));
    effect eVis=EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, spawnLoc);
    CreateObject(OBJECT_TYPE_CREATURE,"raitheen", spawnLoc);
   }
  }
}
