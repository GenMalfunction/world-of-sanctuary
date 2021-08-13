void main()
{
   object oTemple;
   object oPC = GetLastUsedBy();
   string oSubrace = GetStringUpperCase(GetSubRace(oPC));
   if(oSubrace == "")
   {
     oTemple = GetWaypointByTag("ETUM_RESPAWN");
   }
   else if(oSubrace == "DROW")
   {
     oTemple = GetWaypointByTag("SHA_LOLTH_TEMPLE_PT");
   }
   else if(oSubrace == "VAMPIRE" || oSubrace =="LICH")
   {
      oTemple = GetWaypointByTag("vamp_spawn001");
   }
   else if(oSubrace == "WERECAT")
   {
      oTemple = GetWaypointByTag("werecat_respawn");
   }
   else if(oSubrace == "DARK-ELF")
   {
      oTemple = GetWaypointByTag("SHA_SHADOWVALLEY_PT");
   }
   else
   {
      oTemple = GetWaypointByTag("ETUM_RESPAWN");
   }
   AssignCommand(oPC, ClearAllActions(TRUE));
   AssignCommand(oPC, JumpToLocation(GetLocation(oTemple)));

}
