void main()
{
switch(GetUserDefinedEventNumber())
  {
   case 555:
   {
    location spawnLoc=GetLocation(GetWaypointByTag("WP_guardian"));
    CreateObject(OBJECT_TYPE_CREATURE,"raitheen", spawnLoc, VFX_FNF_SUMMON_CELESTIAL);

   }
  }
}
