////////////////////////////////////////////////////////////////////////////////
// Placeable Object Event: OnUse
////////////////////////////////////////////////////////////////////////////////

void main()
{
  string sSealTag    = GetTag(OBJECT_SELF);
  int    bSealActive = GetLocalInt(GetArea(OBJECT_SELF),sSealTag);

  if (!bSealActive)
  {
    // -------------------------------------------------------------------------
    // Activate seal
    // -------------------------------------------------------------------------
    SetLocalInt(GetArea(OBJECT_SELF),sSealTag,TRUE);
    CreateObject(OBJECT_TYPE_PLACEABLE,"plc_solwhite",GetLocation(OBJECT_SELF));
    PlaySound("sff_expdevil30");
    DelayCommand(1.0,
      SoundObjectPlay(GetObjectByTag("SND_Seal"+GetStringRight(sSealTag,1))));

    // -------------------------------------------------------------------------
    // Activate pentagram beam
    // -------------------------------------------------------------------------
    SignalEvent(GetArea(OBJECT_SELF),EventUserDefined(5000));

    // -------------------------------------------------------------------------
    // Lord De Seis
    // -------------------------------------------------------------------------
    if (sSealTag == "PLO_Seal1")
    {
      // Determine Lord De Seis' level -----------------------------------------
      int    nAveragePCLevel = GetFactionAverageLevel(GetFirstPC());
      string sLordDeSeisResRef;
      int    nLordDeSeisMinionsResRef;

      if      (nAveragePCLevel <= 10)
        {sLordDeSeisResRef = "lorddeseis";    nLordDeSeisMinionsResRef = 0;}
      else if (nAveragePCLevel <= 15)
        {sLordDeSeisResRef = "lorddeseis001"; nLordDeSeisMinionsResRef = 4;}
      else
        {sLordDeSeisResRef = "lorddeseis002"; nLordDeSeisMinionsResRef = 8;}

      // Create Lord De Seis & Minions -----------------------------------------
      CreateObject(OBJECT_TYPE_CREATURE,sLordDeSeisResRef,GetLocation(GetObjectByTag("WP_LordDeSeis1")));
      int i;
      for (i=2; i<=6; i++)
      {
        int    j = nLordDeSeisMinionsResRef + (d4()-1); // Acid, Cold, Fire or Lightning Minion
        string s = GetStringRight("00"+IntToString(j),3); if (s == "000") {s="t";}
        s = "oblivionknigh" + s;
        CreateObject(OBJECT_TYPE_CREATURE,s,GetLocation(GetObjectByTag("WP_LordDeSeis"+IntToString(i))));
      }
    }

    // -------------------------------------------------------------------------
    // Infector of Souls
    // -------------------------------------------------------------------------
    if (sSealTag == "PLO_Seal4")
    {
      // Determine Infector of Souls' level ------------------------------------
      int    nAveragePCLevel = GetFactionAverageLevel(GetFirstPC());
      string sInfectorOfSoulsResRef;
      string sInfectorOfSoulsMinionsResRef;

      if      (nAveragePCLevel <= 10)
        {sInfectorOfSoulsResRef = "infectorofsouls";  sInfectorOfSoulsMinionsResRef = "venomlord";}
      else if (nAveragePCLevel <= 15)
        {sInfectorOfSoulsResRef = "infectorofsou001"; sInfectorOfSoulsMinionsResRef = "venomlord001";}
      else
        {sInfectorOfSoulsResRef = "infectorofsou002"; sInfectorOfSoulsMinionsResRef = "venomlord002";}

      // Create Infector of Souls & Minions ------------------------------------
      CreateObject(OBJECT_TYPE_CREATURE,sInfectorOfSoulsResRef,GetLocation(GetObjectByTag("WP_InfectorOfSouls1")));
      int i;
      for (i=2; i<=6; i++)
      {
        CreateObject(OBJECT_TYPE_CREATURE,sInfectorOfSoulsMinionsResRef,GetLocation(GetObjectByTag("WP_InfectorOfSouls"+IntToString(i))));
      }
    }

    // -------------------------------------------------------------------------
    // Grand Vizier of Chaos
    // -------------------------------------------------------------------------
    if (sSealTag == "PLO_Seal2")
    {
      // Determine Grand Vizier of Chaos' level --------------------------------
      int    nAveragePCLevel = GetFactionAverageLevel(GetFirstPC());
      string sGrandVizierOfChaosResRef;
      string sGrandVizierOfChaosMinionsResRef;

      if      (nAveragePCLevel <= 10)
        {sGrandVizierOfChaosResRef = "grandvizierofcha"; sGrandVizierOfChaosMinionsResRef = "stormcaster";}
      else if (nAveragePCLevel <= 15)
        {sGrandVizierOfChaosResRef = "grandvizierof001"; sGrandVizierOfChaosMinionsResRef = "stormcaster001";}
      else
        {sGrandVizierOfChaosResRef = "grandvizierof002"; sGrandVizierOfChaosMinionsResRef = "stormcaster002";}

      // Create Grand Vizier of Chaos & Minions --------------------------------
      CreateObject(OBJECT_TYPE_CREATURE,sGrandVizierOfChaosResRef,GetLocation(GetObjectByTag("WP_GrandVizierOfChaos1")));
      int i;
      for (i=2; i<=6; i++)
      {
        CreateObject(OBJECT_TYPE_CREATURE,sGrandVizierOfChaosMinionsResRef,GetLocation(GetObjectByTag("WP_GrandVizierOfChaos"+IntToString(i))));
      }
    }

    // -------------------------------------------------------------------------
    // Check diablo spawn. All seals open? All bosses dead?
    // delay SignalEvent to ensure the bosses are properly created
    // -------------------------------------------------------------------------
    DelayCommand(3.0,
      SignalEvent(GetObjectByTag("PLO_DiablosSpawnLocation"),EventUserDefined(5000)));
  }
}
