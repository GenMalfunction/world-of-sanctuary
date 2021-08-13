//-------------------------Original Script--------------------------------------

//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT2
/*
  Default OnPerception event handler for NPCs.

  Handles behavior when perceiving a creature for the
  first time.
 */
//:://////////////////////////////////////////////////



#include "nw_i0_generic"

void main()
{
// * if not runnning normal or better Ai then exit for performance reasons
    // * if not runnning normal or better Ai then exit for performance reasons
    if (GetAILevel() == AI_LEVEL_VERY_LOW) return;

    object oPercep = GetLastPerceived();
    int bSeen = GetLastPerceptionSeen();

    // This will cause the NPC to speak their one-liner
    // conversation on perception even if they are already
    // in combat.
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION)
       && GetIsPC(oPercep)
       && bSeen)
    {
        SpeakOneLinerConversation();
    }

    // March 5 2003 Brent
    // Had to add this section back in, since  modifications were not taking this specific
    // example into account -- it made invisibility basically useless.
    //If the last perception event was hearing based or if someone vanished then go to search mode
    if ((GetLastPerceptionVanished()) && GetIsEnemy(GetLastPerceived()))
    {
        object oGone = GetLastPerceived();
        if((GetAttemptedAttackTarget() == GetLastPerceived() ||
           GetAttemptedSpellTarget() == GetLastPerceived() ||
           GetAttackTarget() == GetLastPerceived()) && GetArea(GetLastPerceived()) != GetArea(OBJECT_SELF))
        {
            //SpeakString("dude...like disappeared.");
           ClearAllActions();
           DetermineCombatRound();
        }
    }

    // This section has been heavily revised while keeping the
    // pre-existing behavior:
    // - If we're in combat, keep fighting.
    // - If not and we've perceived an enemy, start to fight.
    //   Even if the perception event was a 'vanish', that's
    //   still what we do anyway, since that will keep us
    //   fighting any visible targets.
    // - If we're not in combat and haven't perceived an enemy,
    //   see if the perception target is a PC and if we should
    //   speak our attention-getting one-liner.
    if (GetIsFighting(OBJECT_SELF)) {
        // don't do anything else, we're busy
        MyPrintString("GetIsFighting: TRUE");

    }
    // * BK FEB 2003 Only fight if you can see them. DO NOT RELY ON HEARING FOR ENEMY DETECTION
    else if (GetIsEnemy(oPercep) && bSeen) {
        MyPrintString("GetIsEnemy: TRUE");
        // We spotted an enemy and we're not already fighting
        if(!GetHasEffect(EFFECT_TYPE_SLEEP)) {
            if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL)) {
                MyPrintString("DetermineSpecialBehavior");
                DetermineSpecialBehavior();
            } else {
                MyPrintString("DetermineCombatRound");
                SetFacingPoint(GetPosition(oPercep));
                SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                DetermineCombatRound();
            }
        }
    } else {
        if (bSeen) {
            MyPrintString("GetLastPerceptionSeen: TRUE");
            if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL)) {
                DetermineSpecialBehavior();
            } else if (GetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION)
                       && GetIsPC(oPercep))
            {
                // The NPC will speak their one-liner conversation
                // This should probably be:
                // SpeakOneLinerConversation(oPercep);
                // instead, but leaving it as is for now.
                ActionStartConversation(OBJECT_SELF);
            }
        }

        // activate ambient animations or walk waypoints if appropriate
       if (!IsInConversation(OBJECT_SELF)) {
           if (GetIsPostOrWalking()) {
               WalkWayPoints();
           } else if (GetIsPC(oPercep) &&
               (GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS)
                || GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS_AVIAN)
                || GetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS)
                || GetIsEncounterCreature()))
           {
                SetAnimationCondition(NW_ANIM_FLAG_IS_ACTIVE);
           }
        }
    }

    // Send the user-defined event if appropriate
    if(GetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT) && GetLastPerceptionSeen())
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_PERCEIVE));
    }
}


//------------------------------------end---------------------------------------

//---------------------------------New Script-----------------------------------

/*
    Round function
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////
/*
#include "NW_I0_GENERIC"

void main()
{
   object self = OBJECT_SELF;
   if(GetLocalInt(OBJECT_SELF, "taunt") <=2 ){
    int stop = GetLocalInt(OBJECT_SELF, "taunt")+1 ;
    SetLocalInt(OBJECT_SELF, "taunt", stop);
   /*
   switch (d20()) {
                    case 1: SpeakString("Kill the surface dwellers!"); break;
                    case 2: SpeakString("INTRUDERS! SOUND THE ALARM!!"); break;
                    case 3: SpeakString("Die weakling surface dweller!!"); break;
                    case 4: SpeakString("You will rot in my dungeons!!"); break;
                    case 5: SpeakString("Take them alive, I want to torture them!!"); break;
                    case 6: SpeakString("I do not fear you, surface dweller!"); break;
                    case 7: SpeakString("Your time has come to an end!"); break;
                    case 8: SpeakString("You will scream in agony!"); break;
                    case 9: SpeakString("You DARE oppose ME?!"); break;
                    case 10: SpeakString("How DARE you defile this place!"); break;
                    case 11: SpeakString("Kill them, KILL THEM ALL!"); break;
                    case 12: SpeakString("Destroy the intruders!"); break;
                    case 13: SpeakString("Alert the Matriarch!"); break;
                    case 14: SpeakString("Your death will please the Matriarch!"); break;
                    case 15: SpeakString("I will hang your head above my bed!"); break;
                    case 16: SpeakString("You think you can stop us? HAHAHAHAHA!"); break;
                    case 17: SpeakString("We will destroy ALL surface dwellers!"); break;
                    case 18: SpeakString("The tides of darkness shall overcome you!"); break;
                    case 19: SpeakString("You will rest in darkness, FOREVER!!"); break;
                    case 20: SpeakString("Do not trifle with my awesome power!!!");
                    }

    */
    /*

                    switch (d6()) {
  case 1: AssignCommand(self, ActionCastSpellAtObject(SPELL_GREATER_STONESKIN, self, METAMAGIC_MAXIMIZE, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));  break;
  case 2: DelayCommand(0.1, AssignCommand(self, ActionCastSpellAtObject(SPELL_GREATER_STONESKIN, self, METAMAGIC_MAXIMIZE, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE))); break;
  case 3:  DelayCommand(0.2, AssignCommand(self, ActionCastSpellAtObject(SPELL_ENERGY_BUFFER, self, METAMAGIC_MAXIMIZE, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));    break;
  case 4:   DelayCommand(0.3, AssignCommand(self, ActionCastSpellAtObject(SPELL_GREATER_SPELL_MANTLE, self, METAMAGIC_MAXIMIZE, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));    break;
  case 5:    DelayCommand(0.4, AssignCommand(self, ActionCastSpellAtObject(SPELL_MAGIC_CIRCLE_AGAINST_GOOD, self, METAMAGIC_MAXIMIZE, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));  break;
  case 6:     DelayCommand(0.5, AssignCommand(self, ActionCastSpellAtObject(SPELL_PROTECTION_FROM_SPELLS, self, METAMAGIC_MAXIMIZE, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
        }
        */
        /*
object enemy =  GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC);
DetermineCombatRound(enemy);
        }
    //This is the equivalent of a force conversation bubble, should only be used if you want an NPC
    //to say something while he is already engaged in combat.
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION) && GetIsPC(GetLastPerceived()) && GetLastPerceptionSeen())
    {
        SpeakOneLinerConversation();
    }
    //If the last perception event was hearing based or if someone vanished then go to search mode
    if ((GetLastPerceptionVanished()) && GetIsEnemy(GetLastPerceived()))
    {
        object oGone = GetLastPerceived();
        if((GetAttemptedAttackTarget() == GetLastPerceived() ||
           GetAttemptedSpellTarget() == GetLastPerceived() ||
           GetAttackTarget() == GetLastPerceived()) && GetArea(GetLastPerceived()) != GetArea(OBJECT_SELF))
        {
           ClearAllActions();
           DetermineCombatRound();
        }
    }
    //Do not bother checking the last target seen if already fighting
    else if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
    {
        //Check if the last percieved creature was actually seen
        if(GetLastPerceptionSeen())
        {
            if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL))
            {
                DetermineSpecialBehavior();
            }
            else if(GetIsEnemy(GetLastPerceived()))
            {
                if(!GetHasEffect(EFFECT_TYPE_SLEEP))
                {
                    SetFacingPoint(GetPosition(GetLastPerceived()));
                    SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
                    DetermineCombatRound();
                }
            }
            //Linked up to the special conversation check to initiate a special one-off conversation
            //to get the PCs attention
            else if(GetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION) && GetIsPC(GetLastPerceived()))
            {
                ActionStartConversation(OBJECT_SELF);
            }
        }
    }
    if(GetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT) && GetLastPerceptionSeen())
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1002));
    }
}

//------------------------------End---------------------------------------------
