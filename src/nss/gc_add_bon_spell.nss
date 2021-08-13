//Script Name: gc_add_bon_spell
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

//PROTOTYPE DECLARED
int GetBonusCount(object oItem);

//Main Script
void main()
{
object oPC = GetPCSpeaker();
int nSlot = GetLocalInt(oPC, "CRAFT_SLOT");
object oCraft = GetItemInSlot(nSlot ,oPC);
int nBonus = GetLocalInt(oPC, "CRAFT_SPELL_BONUS");
int nClass = GetLocalInt(oPC, "CRAFT_CLASS");

if (!GetIsObjectValid(oCraft))
{
 FloatingTextStringOnCreature("Your not wearing the item!!", oPC, FALSE);
 SetLocalInt(oPC, "CRAFT_FAILED", 1);
 //Stop EVERYTHING!
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

//First let's count the # of spell bonuses that are on the item! (8 = Max!)
if(GetBonusCount(oCraft)>=8)
{
 FloatingTextStringOnCreature("The item has too many bonuses!!", oPC, FALSE);
 //Stop EVERYTHING!
 AssignCommand(oPC, ClearAllActions());
 return;
}

//What we are adding is AC
itemproperty ipAddAC=ItemPropertyBonusLevelSpell(nClass, nBonus);

//Finally add the Property
AddItemProperty(DURATION_TYPE_PERMANENT, ipAddAC, oCraft);

DeleteLocalInt(oPC, "CRAFT_TYPE");

}

//PROTOTYPE DEFINED

int GetBonusCount(object oItem)
{
 itemproperty iProp;
 int i = 0;

 iProp = GetFirstItemProperty(oItem);
 while(GetIsItemPropertyValid(iProp))
 {
  if(GetItemPropertyType(iProp) == ITEM_PROPERTY_BONUS_SPELL_SLOT_OF_LEVEL_N)
  {
   i++;
  }

  iProp = GetNextItemProperty(oItem);
 }

 return i;
}

