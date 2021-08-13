//::///////////////////////////////////////////////
//:: Combat Dummy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

  usage:

  assign this script to the OnDamaged event of a placeable
  make placeable non-static & usable
  assign 10.000 hp to the placeable
  set hardness and all saves to 0

*/
//:://////////////////////////////////////////////
//:: Created By: Knat
//:: Created On: 5/2003
//:://////////////////////////////////////////////

// -------------------------------------------------------------------
// --------------- COMBAT DUMMY START --------------------------------
// -------------------------------------------------------------------
/*

 combat dummy

 does not need a creature object to simulate and track combat status.

 player needs to deplete a set amount of HP, depending on their level, to complete
 a training session.

 rewards XP one time during a specific timespan (default 1 hour realtime) ONLY
 if they complete a training session. (no xp if they abort/cancel a session)
 players will be able to re-train asap, but will not get any XP until said timer runs out.
 it's not possible to "farm" xp, it's just a small spice up...

 you can change those values easily.

 combat dummy records some basic statistics like number of hits and total damage
 done. It displays them during combat and a final statistic after the session is complete.

 adds FX based on player damage

 accounts for multiplayer.. only one active training session per dummy. other PCs attacking the
 same dummy get ignored (in theorie at least, never tested so far)

*/

int   PLC_DUMMY_HP_MODIFIER = 25;      // dummy-hp = modifier + (pc-level * modifier)
float PLC_DUMMY_XP_MODIFIER = 0.2;     // adjust this to control XP output (xp = dummy-hp * modifier)
float PLC_DUMMY_XP_TIMER    = 360.0;  // XP timer in seconds. Player won't get XP again until this timer runs out

void DummyRespawn(string sResRef, location lLoc)
{
  CreateObject(OBJECT_TYPE_PLACEABLE, sResRef, lLoc);
}

void DummyCheckSession(object oDummy = OBJECT_SELF)
{
  object oUser = GetLocalObject(oDummy,"PLC_INTERACT_USER");
  if(GetIsObjectValid(oUser))
  {
    if(GetIsInCombat(oUser)) // still in combat, restart timer
      DelayCommand(5.0,DummyCheckSession(oDummy));
    else
    {
      // not in combat, abort session
      FloatingTextStringOnCreature("Session Aborted...",oUser);
      // delete & re-create dummy
      string sResRef = GetResRef(oDummy); location lLoc = GetLocation(oDummy);
      AssignCommand(GetModule(),DelayCommand(0.1,DummyRespawn(sResRef,lLoc)));;
      DestroyObject(oDummy);
    }
  }
}

void DummyMain(object oPC, object oDummy)
{

  // initial user interaction, starts training session
  if( !GetLocalInt(oDummy,"PLC_INTERACT_INUSE") )
  {
    //DelayCommand(5.0,CombatDummyReport(oPC, oDummy));
    // set target PC
    SetLocalObject(oDummy,"PLC_INTERACT_USER",oPC);
    // set InUse flag
    SetLocalInt(oDummy,"PLC_INTERACT_INUSE",TRUE);
    // set strength of dummy based on player level
    SetLocalInt(oDummy,"PLC_INTERACT_SESSIONHP", ((GetLevelByPosition(1,oPC) + GetLevelByPosition(2,oPC) + GetLevelByPosition(3,oPC)) * PLC_DUMMY_HP_MODIFIER ) + PLC_DUMMY_HP_MODIFIER );
    // initiate "check for session abort/cancel"
    // this function polls every 5 sec and checks if the player is still
    // fighting with the dummy. if not, session gets aborted
    // and dummy gets re-created. this deletes all variables and resets
    // everything to clean state.
    // this "pseudo heartbeat" only runs during PC<>dummy interaction
    // and is very small
    DelayCommand(5.0,DummyCheckSession(oDummy));
    FloatingTextStringOnCreature("Session Started - Dummy Strength: "+IntToString(GetLocalInt(oDummy,"PLC_INTERACT_SESSIONHP")),oPC);
    if(GetLocalInt(oPC,"PLC_INTERACT_COMBATDUMMY_NOXP"))
      FloatingTextStringOnCreature("You won't get XP this time",oPC);
  }

  object oUser = GetLocalObject(oDummy,"PLC_INTERACT_USER");
  if(oUser == oPC)
  {
    int nSessionHP = GetLocalInt(oDummy,"PLC_INTERACT_SESSIONHP");
    int nTotalDamage = GetMaxHitPoints() - GetCurrentHitPoints();
    int nHitCount;
    int nLastTotalDamage = GetLocalInt(oDummy,"PLC_INTERACT_LASTHP");
    nHitCount = GetLocalInt(oDummy,"PLC_INTERACT_HITCOUNT");

    // register hit
    if(nTotalDamage > nLastTotalDamage)
    {
      SetLocalInt(oDummy,"PLC_INTERACT_LASTHP", nTotalDamage);
      nHitCount++;
      SetLocalInt(oDummy,"PLC_INTERACT_HITCOUNT", nHitCount);
    }

    // apply some effects based on damage
    int nDamage = nTotalDamage - nLastTotalDamage;
    if (nDamage > 24) ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(75), OBJECT_SELF);
    if (nDamage > 12) ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(281), OBJECT_SELF);
    if (nDamage > 6)  ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(112), OBJECT_SELF);
    if (nDamage > 3)  ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(236 + d3()), OBJECT_SELF);
    FloatingTextStringOnCreature("Total Damage: " +IntToString(nTotalDamage)+ " Hits: "+IntToString(nHitCount),oPC);

    if(nTotalDamage > nSessionHP) // session done - dummy HP depleted
    {
      FloatingTextStringOnCreature("You have finished your training session",oPC);
      // report final statistic
      AssignCommand(GetModule(),DelayCommand(4.0,FloatingTextStringOnCreature("You inflicted "+IntToString(nTotalDamage)+ " damage to the dummy with "+IntToString(nHitCount)+" hits",oPC)));
      AssignCommand(GetModule(),DelayCommand(6.0,FloatingTextStringOnCreature("Your average damage is " + IntToString(nTotalDamage/nHitCount)+" per attack",oPC)));
      // award xp only if permitted
      if(GetLocalInt(oPC,"PLC_INTERACT_COMBATDUMMY_NOXP"))
        AssignCommand(GetModule(),DelayCommand(8.0,FloatingTextStringOnCreature("No XP reward ! You trained too recently...",oPC)));
      else
      {
        // award xp and report it to the user
        AssignCommand(GetModule(),DelayCommand(8.0,FloatingTextStringOnCreature("You earned " + IntToString( FloatToInt( IntToFloat(nSessionHP) * PLC_DUMMY_XP_MODIFIER ) ) + " xp for your training",oPC)));
        AssignCommand(GetModule(),DelayCommand(9.0,GiveXPToCreature(oPC,FloatToInt( IntToFloat(nSessionHP)* PLC_DUMMY_XP_MODIFIER ) ) ) );
        // set no-xp flag
        SetLocalInt(oPC,"PLC_INTERACT_COMBATDUMMY_NOXP",TRUE);
        // set deletion timer for no-xp flag
        AssignCommand(GetModule(),DelayCommand(PLC_DUMMY_XP_TIMER,DeleteLocalInt(oPC,"PLC_INTERACT_COMBATDUMMY_NOXP")));
      }
      // destroy & re-create dummy
      string sResRef = GetResRef(oDummy); location lLoc = GetLocation(oDummy);
      AssignCommand(GetModule(),DelayCommand(0.1,DummyRespawn(sResRef,lLoc)));;
      DestroyObject(oDummy);
    }
  }
  else
    SendMessageToPC(oPC,"Dummy is currently busy...");
}

void main()
{
  object oLastDamager = GetLastDamager();

  if(GetIsObjectValid(oLastDamager))
  {
    //SendMessageToPC(GetFirstPC(),"Last Damager: "+GetName(oLastDamager));
    DummyMain(oLastDamager,OBJECT_SELF);
  }
}
