#include "inc_options"
//////////////////////////////////////////////////
// This function will add the flag effect to the
// chosen object based on his team number
//////////////////////////////////////////////////
void ApplyFlagEffect( object oPlayer );

//////////////////////////////////////////////////
// Resets the Flag for Team 1(cult) or 2 (avenge)
//////////////////////////////////////////////////
int ResetFlagState( int nState );

//////////////////////////////////////////////////
// Broadcasts a message to the server
// nMSGTeam is either 0, 1, or 2.
// 0 is for all people
// 1 is for cultists
// 2 is for avengers
//////////////////////////////////////////////////
void BroadcastMessage( int nMSGTeam, string sMessage );

//////////////////////////////////////////////////
// Respawns the player at their respective base
// nAward if 0 (false) doesnt award the killer
// Default is 1 (true)
// nRespawnTime is the time before the player
// respawns!
//////////////////////////////////////////////////
void RespawnPlayer( object oPlayer, object oKiller, int nAward=1 );

//////////////////////////////////////////////////
// Removes all effects from the object
//////////////////////////////////////////////////
void RemoveAllEffects( object oPlayer );

//////////////////////////////////////////////////
// Remove all items from the object
//////////////////////////////////////////////////
void RemoveAllItems( object oPlayer );

//////////////////////////////////////////////////
// Rewards cult(1) or avenge(2) for capping
// oCapper is the capturer and if set will
// reward him with more gold.
//////////////////////////////////////////////////
void RewardTeam( int nTeam, object oCapper );

//////////////////////////////////////////////////
// Adds player to cult(1) or avenge(2)
//////////////////////////////////////////////////
void AddPlayerToTeam( int nTeam, object oPlayer );

//////////////////////////////////////////////////
// This penalizes the players on the desired team
// nGP gold. Uses: flag caps!
//////////////////////////////////////////////////
void PenalizeTeam( int nTeam, int nGP );

//////////////////////////////////////////////////
// This teleports the player back to the
// dragon cave to rechoose his team, stripping
// the player of armor, weapons (by default),
// but letting them keep their gold.
// 0 = Strip Items
// 1 = Keep Items
//////////////////////////////////////////////////
void RestartPlayer( object oPlayer, int nItems=0 );

//////////////////////////////////////////////////
// Sets oPlayer and all other PCs to like each
// other.
//////////////////////////////////////////////////
void SetPCLikeAll( object oPlayer );'

//////////////////////////////////////////////////
// Returns the gold gained from killing a player
// nGP = The amount of gold the enemy had
//////////////////////////////////////////////////
int GainedGold( int nGP );

//////////////////////////////////////////////////
// Returns the gold lost by a dead player
// nGP = The amount of gold the enemy had
//////////////////////////////////////////////////
int LostGold( int nGP );

//////////////////////////////////////////////////
// Set's oPlayer's nSkill to nSetTo
// If specified (nCreateVar = 1) the
// script will store
// a local variable on the PC that contains
// the original skill ammount for later
// retrieving. This var is called
// "nSKILL_CONSTANT".
//////////////////////////////////////////////////
void SetSkill( object oPlayer, int nSkill, int nSetTo, int nCreateVar=0  );












//////////////////////////////////////////////////
// Created by Bioware
//////////////////////////////////////////////////
void ApplyFlagEffect( object oPlayer )
{
    int nTeam, nVisEffect;
    effect eFlagEffect;

    nTeam = GetLocalInt(oPlayer,"nTeam");
    if ( nTeam == 1 ) {
        nVisEffect = VFX_DUR_FLAG_BLUE;
    }
    else {
        nVisEffect = VFX_DUR_FLAG_RED;
    }

    eFlagEffect = EffectVisualEffect(nVisEffect);
    eFlagEffect = SupernaturalEffect(eFlagEffect);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eFlagEffect,oPlayer);
    PlaySound("as_mg_telepout1");
}

//////////////////////////////////////////////////
// Created by BauB
//////////////////////////////////////////////////
int ResetFlagState( int nState )
{
  object oFlag;
  if (nState == 1) {
    oFlag = GetObjectByTag("cultflag");
    object oVarMaster = GetObjectByTag("mastervarkeeper");
    location lLight = GetLocalLocation(oVarMaster,"lEye");
    CreateObject(OBJECT_TYPE_PLACEABLE,"lightoftheeye",lLight,FALSE);
  }
  if (nState == 2) {
    oFlag = GetObjectByTag("avengeflag");
    object oVarMaster = GetObjectByTag("mastervarkeeper");
    location lLight = GetLocalLocation(oVarMaster,"lTyr");
    CreateObject(OBJECT_TYPE_PLACEABLE,"lightoftyr",lLight,FALSE);
  }
  SetLocalInt(oFlag,"nFlagstate",1);
}

//////////////////////////////////////////////////
// Parameters: 0 = Whole Server
//             1 = Cultists
//             2 = Avengers
//             Default 0
// Created by BauB
//////////////////////////////////////////////////
void BroadcastMessage( int nMSGTeam, string sMessage )
{
  object oCur = GetFirstPC();
  int nTeam = GetLocalInt(oCur,"nTeam");
  if (nMSGTeam != 0) {
    while (GetIsObjectValid(oCur) == TRUE) {
      if (nMSGTeam == nTeam) {
        SendMessageToPC(oCur,sMessage);
      }
      oCur = GetNextPC();
      nTeam = GetLocalInt(oCur,"nTeam");
    }
  } else {
    while (GetIsObjectValid(oCur) == TRUE) {
      SendMessageToPC(oCur,sMessage);
      oCur = GetNextPC();
    }
  }
}

//////////////////////////////////////////////////
// Created by BauB
//////////////////////////////////////////////////
void RespawnPlayer( object oPlayer, object oKiller, int nAward=1 ) {
  int nTeam = GetLocalInt(oPlayer,"nTeam");
  int nFlag = GetLocalInt(oPlayer,"nFlag");
  object oRespawn;
  if (nTeam == 1) {
    oRespawn = GetObjectByTag("cult_respawn");
  } else if (nTeam == 2) {
    oRespawn = GetObjectByTag("avenge_respawn");
  }
  location lSpawn = GetLocation(oRespawn);
  RemoveAllEffects(oPlayer);
  DelayCommand(REBIRTH_WAIT,ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oPlayer));
  DelayCommand(REBIRTH_WAIT,ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal( GetMaxHitPoints(oPlayer) ), oPlayer));
  DelayCommand(REBIRTH_WAIT,AssignCommand(oPlayer,JumpToLocation(lSpawn)));
  SetLocalInt(oPlayer,"nRespawn",1);
  DelayCommand(RESPAWN_WAIT,SetLocalInt(oPlayer,"nRespawn",0));
  string sKilledYou;
  string sYouKilled;
  if (nAward == 1) {
    int nKilledGold = GetGold(oPlayer);
    sYouKilled = "You have slain " + GetName(oPlayer) + "!";
    sKilledYou = "You have been slain by " + GetName(oKiller) + "!";
    int nGoldWon = GainedGold(nKilledGold);
    int nGoldLost = LostGold(nKilledGold);
    if (nFlag == 1) {
      nGoldWon = nGoldWon * FLAG_MULTIPLIER;
      string sFlagKill = GetName(oPlayer) + " had the artifact! You are being awarded extra gold.";
      SendMessageToPC(oKiller,sFlagKill);
    }
    SendMessageToPC(oKiller,sYouKilled);
    SendMessageToPC(oPlayer,sKilledYou);
    AssignCommand(oKiller,TakeGoldFromCreature(nGoldLost,oPlayer,TRUE));
    GiveGoldToCreature(oKiller,nGoldWon);
  }
  if (nFlag == 1) {
    string sFlagReturned;
    if (nTeam == 1) {
      ResetFlagState(2);
      sFlagReturned = "The Cultists have lost the artifact! It now rests safely in the Temple of Tyr.";
      BroadcastMessage(0,sFlagReturned);
    } else {
      ResetFlagState(1);
      sFlagReturned = "The Avengers have lost the artifact! It now rests safely in the Temple of the Eye.";
      BroadcastMessage(0,sFlagReturned);
    }
    SetLocalInt(oPlayer,"nFlag",0);
    int nOrigStealth = GetLocalInt(oPlayer,"nSKILL_MOVE_SILENTLY");
    int nOrigHide = GetLocalInt(oPlayer,"nSKILL_HIDE");
    SetSkill(oPlayer,SKILL_MOVE_SILENTLY,nOrigStealth);
    SetSkill(oPlayer,SKILL_HIDE,nOrigHide);
  }
}

//////////////////////////////////////////////////
// Created by Bioware
//////////////////////////////////////////////////
void RemoveAllEffects( object oPlayer )
{
    effect eEffect;
    eEffect = GetFirstEffect(oPlayer);

    while ( GetIsEffectValid(eEffect) == TRUE )
    {
        if ( GetEffectDurationType(eEffect) == DURATION_TYPE_TEMPORARY ||
             GetEffectDurationType(eEffect) == DURATION_TYPE_PERMANENT )
        {
            RemoveEffect(oPlayer,eEffect);
        }

        eEffect = GetNextEffect(oPlayer);
    }
}

//////////////////////////////////////////////////
// Created by BauB
//////////////////////////////////////////////////
void RemoveAllItems( object oPlayer ) {
  object oGear = GetItemInSlot(INVENTORY_SLOT_ARMS, oPlayer);
  if(GetIsObjectValid(oGear))
    AssignCommand(oPlayer,DestroyObject(oGear));
  oGear = GetItemInSlot(INVENTORY_SLOT_BELT, oPlayer);
  if(GetIsObjectValid(oGear))
    AssignCommand(oPlayer,DestroyObject(oGear));
  oGear = GetItemInSlot(INVENTORY_SLOT_BOLTS, oPlayer);
  if(GetIsObjectValid(oGear))
    AssignCommand(oPlayer,DestroyObject(oGear));
  oGear = GetItemInSlot(INVENTORY_SLOT_BOOTS, oPlayer);
  if(GetIsObjectValid(oGear))
    AssignCommand(oPlayer,DestroyObject(oGear));
  oGear = GetItemInSlot(INVENTORY_SLOT_CHEST, oPlayer);
  if(GetIsObjectValid(oGear))
    AssignCommand(oPlayer,DestroyObject(oGear));
  oGear = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPlayer);
  if(GetIsObjectValid(oGear))
    AssignCommand(oPlayer,DestroyObject(oGear));
  oGear = GetItemInSlot(INVENTORY_SLOT_HEAD, oPlayer);
  if(GetIsObjectValid(oGear))
    AssignCommand(oPlayer,DestroyObject(oGear));
  oGear = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPlayer);
  if(GetIsObjectValid(oGear))
    AssignCommand(oPlayer,DestroyObject(oGear));
  oGear = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPlayer);
  if(GetIsObjectValid(oGear))
    AssignCommand(oPlayer,DestroyObject(oGear));
  oGear = GetItemInSlot(INVENTORY_SLOT_NECK, oPlayer);
  if(GetIsObjectValid(oGear))
    AssignCommand(oPlayer,DestroyObject(oGear));
  oGear = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPlayer);
  if(GetIsObjectValid(oGear))
    AssignCommand(oPlayer,DestroyObject(oGear));
  oGear = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPlayer);
  if(GetIsObjectValid(oGear))
    AssignCommand(oPlayer,DestroyObject(oGear));
  oGear = GetItemInSlot(INVENTORY_SLOT_ARROWS, oPlayer);
  if(GetIsObjectValid(oGear))
    AssignCommand(oPlayer,DestroyObject(oGear));
  object oCurrent = GetFirstItemInInventory(oPlayer);
  while (GetIsObjectValid(oCurrent) == TRUE) {
  AssignCommand(oPlayer,DestroyObject(oCurrent,0.0));
  oCurrent = GetNextItemInInventory(oPlayer);
    }
}

//////////////////////////////////////////////////
// Created by BauB
//////////////////////////////////////////////////
void RewardTeam( int nTeam, object oCapper ) {
  object oCur = GetFirstPC();
  int nCurTeam = GetLocalInt(oCur,"nTeam");
  int nAward = AWARD_CAP_TEAM;
  int nAwardC = AWARD_CAPPER;
  while (GetIsObjectValid(oCur) == TRUE) {
    if (nCurTeam == nTeam) {
      if (oCur == oCapper) {
        GiveGoldToCreature(oCur,nAwardC);
      } else {
        GiveGoldToCreature(oCur,nAward);
      }
    }
    oCur = GetNextPC();
    nCurTeam = GetLocalInt(oCur,"nTeam");
  }
}

//////////////////////////////////////////////////
// Created by BauB
//////////////////////////////////////////////////
void AddPlayerToTeam( int nTeam, object oPlayer ) {
  object oCur = GetFirstPC();
  int nCur = GetLocalInt(oCur,"nTeam");
  while (GetIsObjectValid(oCur) == TRUE) {
    if (nCur == nTeam) {
      SetPCLike(oPlayer,oCur);
    } else {
      SetPCDislike(oPlayer,oCur);
    }
    oCur = GetNextPC();
    nCur = GetLocalInt(oCur,"nTeam");
  }
}

//////////////////////////////////////////////////
// Created by BauB
//////////////////////////////////////////////////
void PenalizeTeam( int nTeam, int nGP ) {
  object oCur = GetFirstPC();
  int nCurTeam = GetLocalInt(oCur,"nTeam");
  while (GetIsObjectValid(oCur) == TRUE) {
    if (nCurTeam == nTeam) {
      TakeGoldFromCreature(nGP,oCur,TRUE);
    }
  oCur = GetNextPC();
  nCurTeam = GetLocalInt(oCur,"nTeam");
  }
}

//////////////////////////////////////////////////
// Created by BauB
//////////////////////////////////////////////////
void RestartPlayer( object oPlayer, int nItems ) {
  int nTeam = GetLocalInt(oPlayer,"nTeam");
  int nFlag = GetLocalInt(oPlayer,"nFlag");
  location lStart = GetLocation(GetObjectByTag("startpoint"));
  SetLocalInt(oPlayer,"nTeam",0);
  SetPCLikeAll(oPlayer);
  AssignCommand(oPlayer,ActionJumpToLocation(lStart));
  RemoveAllEffects(oPlayer);
  if (nFlag == 1) {
    string sLost;
    if (nTeam == 1) {
      ResetFlagState(2);
      sLost = "Cultists";
    } else {
      ResetFlagState(1);
      sLost = "Avengers";
    }
    BroadcastMessage(0,"The " + sLost + " have lost the artifact!");
  }
}

//////////////////////////////////////////////////
// Created by BauB
//////////////////////////////////////////////////
void SetPCLikeAll( object oPlayer ) {
  object oCur = GetFirstPC();
  while (GetIsObjectValid(oCur) == TRUE) {
    SetPCLike(oPlayer,oCur);
    oCur = GetNextPC();
  }
}

//////////////////////////////////////////////////
// Created by BauB
//////////////////////////////////////////////////
int GainedGold( int nGP ) {
  float fGP = IntToFloat(nGP);
  int nRand = Random(1000) + 1000;
  float fRand = IntToFloat(nRand);
  float fSqr = sqrt(fGP);
  float fA1 = fSqr * 15;
  float fA2 = fSqr + fRand;
  int nReturn = FloatToInt(fA2);
  return nReturn;
}

//////////////////////////////////////////////////
// Created by BauB
//////////////////////////////////////////////////
int LostGold( int nGP ) {
  float fGP = IntToFloat(nGP);
  int nReturn;
  if (nGP > GOLD_LOSS_LIMIT) {
    float fA1 = fGP * 100;
    float fA2 = sqrt(fA1);
    nReturn = FloatToInt(fA2);
  } else {
    nReturn = 0;
  }
  return nReturn;
}

//////////////////////////////////////////////////
// Created by BauB
//////////////////////////////////////////////////
void SetSkill( object oPlayer, int nSkill, int nSetTo, int nCreateVar=0  ) {
  if (nCreateVar == 1) {
    if (nSkill == SKILL_ANIMAL_EMPATHY) {
      SetLocalInt(oPlayer,"nSKILL_ANIMAL_EMPATHY",GetSkillRank(SKILL_ANIMAL_EMPATHY,oPlayer));
    } else if (nSkill == SKILL_CONCENTRATION) {
      SetLocalInt(oPlayer,"nSKILL_CONCENTRATION",GetSkillRank(SKILL_CONCENTRATION,oPlayer));
    } else if (nSkill == SKILL_DISABLE_TRAP) {
      SetLocalInt(oPlayer,"nSKILL_DISABLE_TRAP",GetSkillRank(SKILL_DISABLE_TRAP,oPlayer));
    } else if (nSkill == SKILL_DISCIPLINE) {
      SetLocalInt(oPlayer,"nSKILL_DISCIPLINE",GetSkillRank(SKILL_DISCIPLINE,oPlayer));
    } else if (nSkill == SKILL_HEAL) {
      SetLocalInt(oPlayer,"nSKILL_HEAL",GetSkillRank(SKILL_HEAL,oPlayer));
    } else if (nSkill == SKILL_HIDE) {
      SetLocalInt(oPlayer,"nSKILL_HIDE",GetSkillRank(SKILL_HIDE,oPlayer));
    } else if (nSkill == SKILL_LISTEN) {
      SetLocalInt(oPlayer,"nSKILL_LISTEN",GetSkillRank(SKILL_LISTEN,oPlayer));
    } else if (nSkill == SKILL_LORE) {
      SetLocalInt(oPlayer,"nSKILL_LORE",GetSkillRank(SKILL_LORE,oPlayer));
    } else if (nSkill == SKILL_MOVE_SILENTLY) {
      SetLocalInt(oPlayer,"nSKILL_MOVE_SILENTLY",GetSkillRank(SKILL_MOVE_SILENTLY,oPlayer));
    } else if (nSkill == SKILL_OPEN_LOCK) {
      SetLocalInt(oPlayer,"nSKILL_OPEN_LOCK",GetSkillRank(SKILL_OPEN_LOCK,oPlayer));
    } else if (nSkill == SKILL_PARRY) {
      SetLocalInt(oPlayer,"nSKILL_PARRY",GetSkillRank(SKILL_PARRY,oPlayer));
    } else if (nSkill == SKILL_PERFORM) {
      SetLocalInt(oPlayer,"nSKILL_PERFORM",GetSkillRank(SKILL_PERFORM,oPlayer));
    } else if (nSkill == SKILL_PERSUADE) {
      SetLocalInt(oPlayer,"nSKILL_PERSUADE",GetSkillRank(SKILL_PERSUADE,oPlayer));
    } else if (nSkill == SKILL_PICK_POCKET) {
      SetLocalInt(oPlayer,"nSKILL_PICK_POCKET",GetSkillRank(SKILL_PICK_POCKET,oPlayer));
    } else if (nSkill == SKILL_SEARCH) {
      SetLocalInt(oPlayer,"nSKILL_SEARCH",GetSkillRank(SKILL_SEARCH,oPlayer));
    } else if (nSkill == SKILL_SET_TRAP) {
      SetLocalInt(oPlayer,"nSKILL_SET_TRAP",GetSkillRank(SKILL_SET_TRAP,oPlayer));
    } else if (nSkill == SKILL_SPELLCRAFT) {
      SetLocalInt(oPlayer,"nSKILL_SPELLCRAFT",GetSkillRank(SKILL_SPELLCRAFT,oPlayer));
    } else if (nSkill == SKILL_SPOT) {
      SetLocalInt(oPlayer,"nSKILL_SPOT",GetSkillRank(SKILL_SPOT,oPlayer));
    } else if (nSkill == SKILL_TAUNT) {
      SetLocalInt(oPlayer,"nSKILL_TAUNT",GetSkillRank(SKILL_TAUNT,oPlayer));
    } else if (nSkill == SKILL_USE_MAGIC_DEVICE) {
      SetLocalInt(oPlayer,"nSKILL_USE_MAGIC_DEVICE",GetSkillRank(SKILL_USE_MAGIC_DEVICE,oPlayer));
    }
  }
  int nCurSkill = GetSkillRank(nSkill,oPlayer);
  int nChange;
  int nInc;
  if (nCurSkill > nSetTo) {
    nChange = nCurSkill - nSetTo;
    nInc = 0;
  } else if (nCurSkill < nSetTo) {
    nChange = nSetTo - nCurSkill;
    nInc = 1;
  } else {
    nChange = 0;
    nInc = 2;
  }
  effect eChange;
  if (nInc == 1) {
    eChange = EffectSkillIncrease(nSkill,nChange);
  } else if (nInc == 0) {
    eChange = EffectSkillDecrease(nSkill,nChange);
  }
  if (nInc != 2) {
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eChange,oPlayer);
  }
}
