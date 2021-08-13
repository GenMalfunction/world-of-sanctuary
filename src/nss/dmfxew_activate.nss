void chkloc(object PC, object mat, string ref)
{
    if(!GetIsObjectValid(PC)) {
        DestroyObject(mat);  // destroy if they leave
    } else if (GetLocalLocation(PC, "loc") != GetLocation(PC)) {
        CreateItemOnObject(ref, PC, 1);
        DestroyObject(mat);
    } else {
        DelayCommand(4.0, chkloc(PC, mat, ref));
    }

}

void SetLoc(object PC)
{
    SetLocalLocation(PC, "loc", GetLocation(PC));
}

void matsit(object PC)
{
    location loc = GetLocation(PC);
    object area = GetAreaFromLocation(loc);
    vector pos = GetPositionFromLocation(loc);
    loc = Location(area, pos, GetFacingFromLocation(loc) + 90.0);
    object mat = CreateObject(OBJECT_TYPE_PLACEABLE, "placeablemat", loc);
    AssignCommand(PC, ClearAllActions(TRUE));
    AssignCommand(PC, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS,0.0f,30000.0));
    DelayCommand(2.0, SetLoc(PC));
    DelayCommand(4.0, chkloc(PC, mat, "mat"));
}

#include "x2_inc_switches"
void main()
{
ExecuteScript (GetResRef (GetItemActivated()), GetItemActivator());

   object oPlayer = GetItemActivator();
   object oItem=GetItemActivated();
   object oActivator=GetItemActivator();
   object oArea = GetArea(oPlayer);

   location lActivator = GetLocation(oActivator);
   string sItemTag = GetTag(oItem);
   location lPlayer = GetLocation(oPlayer);
   location lTarget = GetItemActivatedTargetLocation();

    if(GetResRef(oItem) == "createlistener")
    {
        if(GetLocalObject(oPlayer, "Listener")!= OBJECT_INVALID){ SendMessageToPC(oPlayer, "You already have a listener"); return;}
        object oListener = CreateObject(OBJECT_TYPE_CREATURE, "listener", GetLocation(oPlayer));
        SetLocalObject(oListener, "Master", oPlayer);
        SetLocalObject(oPlayer, "Listener", oListener);
        effect eInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY); // players shouldn't see their listener
        effect eEther = EffectEthereal();  // prevents monsters attacking the listener
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eInvis, oListener, 999999.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEther, oListener, 999999.0);
        AssignCommand(oListener, ActionForceFollowObject(oPlayer));
        SetListening(oListener, TRUE);
        SetListenPattern(oListener, "**::**", 5432);
    }

 if(oItem == GetObjectByTag("teleport_magic"))
   {
      float fDistance = GetDistanceBetweenLocations(lPlayer, lTarget);
      float fAngle = GetFacing(oPlayer);
      vector vPlayer = GetPosition(oPlayer);
      effect eTele1 = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
      effect eTele2 = EffectVisualEffect(VFX_IMP_MAGIC_PROTECTION);

      vector vTarget;
      if(sin(fAngle) > 0.0 && cos(fAngle) > 0.0)//I
      {
         vTarget = Vector(vPlayer.x + fDistance * cos(fAngle) * 5,
         vPlayer.y + fDistance * sin(fAngle) * 5,
         vPlayer.z);
      }
      else if(sin(fAngle) > 0.0 && cos(fAngle) < 0.0) //II
      {
         vTarget = Vector(vPlayer.x - fDistance * cos(180 - fAngle) * 5,
         vPlayer.y + fDistance * sin(fAngle) * 5,
         vPlayer.z);
      }
      else if(sin(fAngle) < 0.0 && cos(fAngle) < 0.0) //III
      {
         vTarget = Vector(vPlayer.x - fDistance * sin(270 - fAngle) * 5,
         vPlayer.y - fDistance * cos(270 - fAngle) * 5,
         vPlayer.z);
      }
      else if(sin(fAngle) < 0.0 && cos(fAngle) > 0.0) //IV
      {
         vTarget = Vector(vPlayer.x + fDistance * cos(360 - fAngle) * 5,
         vPlayer.y - fDistance * sin(360 - fAngle) * 5,
         vPlayer.z);
      }
      location lTele = Location(oArea, vTarget, fAngle);
      ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTele1, lPlayer);
      AssignCommand(oPlayer, ActionJumpToLocation(lTele));
      DelayCommand(0.25, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTele2, lTele));
   }

     // * Generic Item Script Execution Code
     // * If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // * it will execute a script that has the same name as the item's tag
     // * inside this script you can manage scripts for all events by checking against
     // * GetUserDefinedItemEventNumber(). See x2_it_example.nss
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_ACTIVATE);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }

     }

    if (sItemTag == "DiceBag")
    {
        object oPlaceable = CreateObject(OBJECT_TYPE_PLACEABLE, "dicebag", lActivator);
        DelayCommand(1.0, AssignCommand(oPlaceable, ActionStartConversation(oActivator, "", TRUE)));
    }

   if (sItemTag == "townportal")  // checks if it's the town portal scroll that was used
    {
    // variable init
    object oItem = GetItemActivated(); // gets which item activated
    object oPC = GetItemActivator(); // gets item activator
    string sItemTag = GetTag(oItem); // gets tag of activated item
    location lLoc = GetItemActivatedTargetLocation(); // sets the location the scroll was casted at
    // Effects start
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD, FALSE);
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, lLoc, 6.0);
    // Effects stop
    CreateObject(OBJECT_TYPE_PLACEABLE,sItemTag,lLoc,TRUE); // creates the actual portal
    SetLocalLocation(oPC, "Portal", GetItemActivatedTargetLocation()); // stores the location variable in the PC itself
    }

  if(GetTag(oItem)=="DMsHelper")
   {
      // Test to make sure the activator is a DM, or is a DM
      // controlling a creature.
      if(GetIsDM(oActivator) != TRUE)
      {
         object oTest = GetFirstPC();
         string sTestName = GetPCPlayerName(oActivator);
         int nFound = FALSE;
         while (GetIsObjectValid(oTest) && (! nFound))
         {
            if (GetPCPlayerName(oTest) == sTestName)
            {
               if(GetIsDM(oTest))
               {
                  nFound = TRUE;
               }
               else
               {
                  DestroyObject(oItem);
                  SendMessageToPC(oActivator,"You are mortal and this is not yours!");
                  return;
               }
            }
            oTest=GetNextPC();
         }
      }
      // get the wand's activator and target, put target info into local vars on activator
      object oMyActivator = GetItemActivator();
      object oMyTarget = GetItemActivatedTarget();
      SetLocalObject(oMyActivator, "dmwandtarget", oMyTarget);
      location lMyLoc = GetItemActivatedTargetLocation();
      SetLocalLocation(oMyActivator, "dmwandloc", lMyLoc);

      //Make the activator start a conversation with itself
      AssignCommand(oMyActivator, ActionStartConversation(oMyActivator, "dmwand", TRUE));
      return;
   }

   if(GetTag(oItem)=="AutoFollow")
   {
      object oTarget = GetItemActivatedTarget();

      if(GetIsObjectValid(oTarget))
      {
         AssignCommand ( oActivator, ActionForceFollowObject(oTarget));
      }
      return;
   }

   if(GetTag(oItem)=="WandOfFX")
   {

       // get the wand's activator and target, put target info into local vars on activator
      object oDM = GetItemActivator();
      object oMyTarget = GetItemActivatedTarget();
      SetLocalObject(oDM, "FXWandTarget", oMyTarget);
      location lTargetLoc = GetItemActivatedTargetLocation();
      SetLocalLocation(oDM, "FXWandLoc", lTargetLoc);

      object oTest=GetFirstPC();
      string sTestName = GetPCPlayerName(oDM);
      // Test to make sure the activator is a DM, or is a DM
      // controlling a creature.

      if(GetIsDM(oDM) != TRUE)
      {
         object oTest = GetFirstPC();
         string sTestName = GetPCPlayerName(oDM);
         int nFound = FALSE;
         while (GetIsObjectValid(oTest) && (! nFound))
         {
            if (GetPCPlayerName(oTest) == sTestName)
            {
               if(GetIsDM(oTest))
               {
                  nFound = TRUE;
               }
               else
               {
                  DestroyObject(oItem);
                  SendMessageToPC(oDM,"You are mortal and this is not yours!");
                  return;
               }
            }
            oTest=GetNextPC();
         }
      }

      //Make the activator start a conversation with itself
      AssignCommand(oDM, ActionStartConversation(oDM, "fxwand", TRUE));
      return;

   }

    ExecuteScript(GetTag(GetItemActivated()),OBJECT_SELF);
    object PC = GetItemActivator();
    object item = GetItemActivated();
    object oTownPortal;
    string tag = GetTag(item);
    ExecuteScript("puffweed", PC);

   if (tag == "water") {
        FloatingTextStringOnCreature("You feel refreshed.", PC);
        SetLocalInt(PC, "thirst", 1);
    } else  if (tag == "EmoteWand") {
        DelayCommand(1.0, ExecuteScript("cc_emote", PC));
    } else  if (tag == "mat") {
        DelayCommand(1.0, matsit(PC));
//    } else if (GetStringLeft(tag, 4) == "toy_") {
//        ExecuteScript("x_activate", OBJECT_SELF);
//    } else if (tag == "whostone" || tag == "WhoStone") {
//        ExecuteScript("whostone", PC);
    }
    else {
        ExecuteScript("nw_s3_alcohol", PC);
    }

   if(GetTag(oItem)=="waymaster")
   {
      AssignCommand(oActivator, ActionStartConversation(oActivator, "waymaster", TRUE));
      return;
   }
   if(GetTag(oItem)=="summonbook")
   {
      AssignCommand(oActivator, ActionStartConversation(oActivator, "summonbook", TRUE));
      return;
   }
     if(GetTag(oItem)=="summonranger")
   {
      AssignCommand(oActivator, ActionStartConversation(oActivator, "summonranger", TRUE));
      return;
   }
     if(GetTag(oItem)=="summonwizard")
   {
      AssignCommand(oActivator, ActionStartConversation(oActivator, "summonwizard", TRUE));
      return;
   }
     if(GetTag(oItem)=="summonsorcerer")
   {
      AssignCommand(oActivator, ActionStartConversation(oActivator, "summonsorcerer", TRUE));
      return;
   }
     if(GetTag(oItem)=="runequestbook")
   {
      AssignCommand(oActivator, ActionStartConversation(oActivator, "runequestbook", TRUE));
      return;
   }
     if(GetTag(oItem)=="sidequestbook")
   {
      AssignCommand(oActivator, ActionStartConversation(oActivator, "sidequestbook", TRUE));
      return;
   }
     if(GetTag(oItem)=="bombtrigger")
   {
      AssignCommand(oActivator, ActionStartConversation(oActivator, "bombtrigger", TRUE));
      return;
   }
     if(GetTag(oItem)=="dismounthorse")
   {
      AssignCommand(oActivator, ActionStartConversation(oActivator, "dismounthorse", TRUE));
      return;
   }

      if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_ACTIVATE);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }
     }
}
