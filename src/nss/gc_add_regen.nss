//Script Name: gc_add_regen
//////////////////////////////////////////
//Created By: Genisys (Guile)
//Created On:   8/30/08
/////////////////////////////////////////
/*
This script goes in the ActionTaken
Event of a Conversation line, it will
Add AC to the item we are looking at
which an item the PC possessoses has
in it..
*/
////////////////////////////////////////
#include "x2_inc_itemprop"


//Main Script
void main()
{
object oPC = GetPCSpeaker();
int nSlot = GetLocalInt(oPC, "CRAFT_SLOT");
object oCraft = GetItemInSlot(nSlot ,oPC);

if (!GetIsObjectValid(oCraft))
{
 FloatingTextStringOnCreature("Your not wearing the item!!", oPC, FALSE);
 SetLocalInt(oPC, "CRAFT_FAILED", 1);
 return;
}

int nCost = GetLocalInt(oPC, "CRAFT_PAYMENT");
effect eEffect;

if(GetGold(oPC)<nCost)
{
FloatingTextStringOnCreature("You do not have enough gold!", oPC, FALSE);
AssignCommand(oPC, ClearAllActions()); //End the conversation!
return;
}
else
{
//Take the cost to craft..
TakeGoldFromCreature(nCost, oPC, TRUE);
eEffect = EffectVisualEffect(VFX_IMP_HOLY_AID);
ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC, 0.0f);

FloatingTextStringOnCreature("Your item has been crafted.", oPC, FALSE);
}

//Determine how much AC we are adding..
int nAmount = GetLocalInt(oPC, "CRAFT_REGEN_TOTAL");

//What we are adding is AC
itemproperty ipAddAC=ItemPropertyRegeneration(nAmount);

//Remove the Existing FIRST!
IPRemoveMatchingItemProperties(oCraft, ITEM_PROPERTY_REGENERATION, DURATION_TYPE_PERMANENT, -1);

//Finally add the Property
IPSafeAddItemProperty(oCraft, ipAddAC, 0.0f, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, TRUE, FALSE);

//We don't want to delete this intergal because we can change it later..
//DeleteLocalInt(oPC, "CRAFT_TYPE");

}

