////////////////////////////////////////////////////////////////////////////////
// Placeable Object Event: OnUserDefined
////////////////////////////////////////////////////////////////////////////////

#include "inc_modulequest"

//------------------------------------------------------------------------------

// function to create Diablo
// for use in DelayCommand()
void CreateDiablo(string sDiabloResRef,object oDiabloSpawnLocation)
{
  object oDiablo =
    CreateObject(OBJECT_TYPE_CREATURE,sDiabloResRef,GetLocation(oDiabloSpawnLocation));
}

//------------------------------------------------------------------------------

void main()
{
  if (GetUserDefinedEventNumber() == 5000)
  {
    // -------------------------------------------------------------------------
    // check if all five seals are active
    // -------------------------------------------------------------------------

    string sSealTag        = "PLO_Seal";
    int    bAllSealsActive = TRUE;
    int    i;
    for (i=1; (i<=5) && bAllSealsActive; i++)
      bAllSealsActive = GetLocalInt(GetArea(OBJECT_SELF),sSealTag+IntToString(i));

    if (bAllSealsActive)
    {
      // are the bosses dead?

      // -----------------------------------------------------------------------
      // Lord De Seis
      // -----------------------------------------------------------------------

      if (GetIsObjectValid(GetObjectByTag("NPC_LordDeSeis10")) ||
          GetIsObjectValid(GetObjectByTag("NPC_LordDeSeis15")) ||
          GetIsObjectValid(GetObjectByTag("NPC_LordDeSeis20"))) {return;}

      // -----------------------------------------------------------------------
      // Infector of Souls
      // -----------------------------------------------------------------------

      if (GetIsObjectValid(GetObjectByTag("NPC_InfectorOfSouls10")) ||
          GetIsObjectValid(GetObjectByTag("NPC_InfectorOfSouls15")) ||
          GetIsObjectValid(GetObjectByTag("NPC_InfectorOfSouls20"))) {return;}

      // -----------------------------------------------------------------------
      // Grand Vizier of Chaos
      // -----------------------------------------------------------------------

      if (GetIsObjectValid(GetObjectByTag("NPC_GrandVizierOfChaos10")) ||
          GetIsObjectValid(GetObjectByTag("NPC_GrandVizierOfChaos15")) ||
          GetIsObjectValid(GetObjectByTag("NPC_GrandVizierOfChaos20"))) {return;}

      // -----------------------------------------------------------------------
      // Diablo
      // (just to be sure not to spawn Diablo twice)
      // (this could happen if the last seal is activated and simultaneously)
      // (the last boss is killed (because of DelayCommand(SignalEvent())))
      // -----------------------------------------------------------------------

      if (GetIsObjectValid(GetObjectByTag("NPC_Diablo10")) ||
          GetIsObjectValid(GetObjectByTag("NPC_Diablo15")) ||
          GetIsObjectValid(GetObjectByTag("NPC_Diablo20"))) {return;}

      // -----------------------------------------------------------------------
      // spawn Diablo
      // -----------------------------------------------------------------------

      // Darkness effect for all players in the module -------------------------
      object oPC = GetFirstPC();
      SetModuleQuest("JOR_Diablo",2,oPC);
      while (GetIsObjectValid(oPC))
      {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectDarkness(),oPC,10.0);
        oPC = GetNextPC();
      }

      // Visual effects --------------------------------------------------------
      SignalEvent(GetArea(OBJECT_SELF),EventUserDefined(5001)); // Deactivate pentagram
      DelayCommand( 7.0,
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SCREEN_SHAKE),OBJECT_SELF));
      DelayCommand(10.0,
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_WORD        ),OBJECT_SELF));
      DelayCommand(11.0,
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_FIRESTORM   ),OBJECT_SELF));
      DelayCommand(12.0,
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_GATE ),OBJECT_SELF));

      // Determine Diablo's Level ----------------------------------------------
      int    nAveragePCLevel = GetFactionAverageLevel(GetFirstPC());
      string sDiabloResRef;

      if      (nAveragePCLevel <= 10) sDiabloResRef = "diablo";
      else if (nAveragePCLevel <= 15) sDiabloResRef = "diablo";
      else                            sDiabloResRef = "diablo";

      // Create Diablo ---------------------------------------------------------
      DelayCommand(13.5,CreateDiablo(sDiabloResRef,OBJECT_SELF));
      DelayCommand(15.0,PlaySound("c_demon_slct"));
    }
  }
}
