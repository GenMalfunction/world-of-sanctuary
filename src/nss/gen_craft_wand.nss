//Script Name:
///////////////////////////////////////////
// Created By: Genisys (Guile)
// Created On: 8/13/08
//
// (TABASED ITEM SCRIPT TEMPLATE)
///////////////////////////////////////////
/*
This script is for the Genisys Crafting
Wand (Portable Forge) wand, which is
executed everytime the PC targets and item.
*/
///////////////////////////////////////////
#include "x2_inc_switches"

//PROTOTYPE DECLARED
int CountBoxItems(object oTarget);

//Main Script
void main()
{

    //All Major Variables Declared (Commonly used variables as well)

    int nEvent = GetUserDefinedItemEventNumber();  //Which event triggered this
    object oPC;                                   //The player character using the item
    object oItem;                                //The item being used
    object oSpellOrigin;                        //The origin of the spell
    object oSpellTarget;                       //The target of the spell
    int iSpell;                               //The Spell ID number
    object oTarget;     //Define oTarget below
    object oObject;     //Define oObject below
    int nInt;           //A commonly used intergal (Must be defined)
    int nLvl;           //Commonly used intergal for levels  (ie. GetHitDice(oTarget); etc.)
    string sTag;        //Used to define a tagname of something
    string sResref;     //Used to define a resref name of something
    string sMsg;        //Used to define a message
    effect eEffect;     //Used to define an effect to be applied to an object or location
    effect eVis;        //Used to define a visual effect to be applied to an object or location
    location lTarget;   //The Target Location of the PC ONLY! (USE - Getlocation(oPC);)
    location lway;      //The Target location for the Activated Item's Target only! (See below)
    int nType;
    object oMe;
    object oSpawn;
    object oBox;

////////////////////////////////////////////////////////////////////////////////////////////////
  //Set the return value for the item event script
  // * X2_EXECUTE_SCRIPT_CONTINUE - continue calling script after executed script is done
  // * X2_EXECUTE_SCRIPT_END - end calling script after executed script is done
  int nResult = X2_EXECUTE_SCRIPT_END;
///////////////////////////////////////////////////////////////////////////////////////////////

    //Deterimine which event has fired for the item...
    switch (nEvent)
    {

///////////////////////////////////////////////////////////////////////////
/////////////Cast Spell: Unique Power /or/ Activate Item//////////////////

  //I seperated this cause it's more commonly used..
  case X2_ITEM_EVENT_ACTIVATE:
  {
  // * This code runs when the Unique Power property of the item is used
  // * or the item is activated. Note that this event fires for PCs only.

   oPC   = GetItemActivator();        // The player who activated the item
   oItem = GetItemActivated();         // The item that was activated
   //oTarget = GetItemActivatedTarget();   //The target of the item's power
   lway = GetItemActivatedTargetLocation(); //To get the location of the target!
   nType = GetBaseItemType(oTarget);
   sResref = GetTag(oTarget);
   oMe = oPC;

   oTarget = oPC;

   AssignCommand(oTarget, ActionStartConversation(oPC, "gen_craft_conv"));

   break;
  //Case Statement End
  }

 //Switch Statment End
 }

    //Pass the return value back to the calling script
    SetExecutedScriptReturnValue(nResult);
}


//PROTOTYPE DEFINED
int CountBoxItems(object oTarget)
{
 int i = 0;
 object oItem;

 oItem = GetFirstItemInInventory(oTarget);
 while(GetIsObjectValid(oItem))
 {
  i++;
  oItem = GetNextItemInInventory(oTarget);
 }

 return i;
}
