//Script Name: gc_add_save
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
 AssignCommand(oPC, ClearAllActions());
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
int nType = GetLocalInt(oPC, "CRAFT_SAVE");
int nBonus = GetLocalInt(oPC, "CRAFT_REGEN_TOTAL");

//What we are adding is AC
itemproperty ipAddAC;


if(nType != IP_CONST_SAVEVS_UNIVERSAL)
{
int nR;

if(nType == SAVING_THROW_FORT)
nR = IP_CONST_SAVEBASETYPE_FORTITUDE;
else if(nType == SAVING_THROW_REFLEX)
nR = IP_CONST_SAVEBASETYPE_REFLEX;
else if(nType == SAVING_THROW_WILL)
nR = IP_CONST_SAVEBASETYPE_WILL;

ipAddAC = ItemPropertyBonusSavingThrow(nR, nBonus);

//Remove the Existing FIRST!
IPRemoveMatchingItemProperties(oCraft, ITEM_PROPERTY_SAVING_THROW_BONUS, DURATION_TYPE_PERMANENT, nR);
IPRemoveMatchingItemProperties(oCraft, ITEM_PROPERTY_SAVING_THROW_BONUS, DURATION_TYPE_PERMANENT, -1);

//AddItemProperty(DURATION_TYPE_PERMANENT, ipAddAC, oCraft);

IPSafeAddItemProperty(oCraft, ipAddAC, 0.0f, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, TRUE);
}

else if(nType == IP_CONST_SAVEVS_UNIVERSAL)
{

ipAddAC = ItemPropertyBonusSavingThrowVsX(nType, nBonus);

//Remove ALL Fort / Reflex / Will Saves
IPRemoveMatchingItemProperties(oCraft, ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC, DURATION_TYPE_PERMANENT, -1);

//Remove ALL Universal Saves as well..
IPRemoveMatchingItemProperties(oCraft, ITEM_PROPERTY_SAVING_THROW_BONUS, DURATION_TYPE_PERMANENT, -1);

//Finally add the Prior AC + 1
//AddItemProperty(DURATION_TYPE_PERMANENT, ipAddAC, oCraft);

IPSafeAddItemProperty(oCraft, ipAddAC, 0.0f, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING, FALSE, TRUE);

}


//We don't want to delete this intergal because we can change it later..
//DeleteLocalInt(oPC, "CRAFT_TYPE");

}

