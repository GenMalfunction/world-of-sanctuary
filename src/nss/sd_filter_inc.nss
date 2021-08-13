// ****************************************************************
//
// @project Moo Filter 1.2
// @author Sean Darrenkamp
// @date 5/7/2004
// @file sd_fsettings_inc
// Copyright 2004 Sean Darrenkamp
//
// This is the main code for the filter. It scans items and
// checks them for invalid or unwanted properties. The filter
// signature method at the end of the listing is where new
// properties can be put in place that the code doesn't detect.
// Think of it like adding signatures to your virus scanner. :)
// Only thing is you have to add em by hand. So some scripting
// knowledge is required.
//
// Remember, this only does items not the actual character short of
// equiped items. My thinking was that scripts are too bloated with
// both character and item scanning and they get overloaded easly.
// Hopefully this will help solve some of the problems.
//
// This code is licensed under the GPL for use. See the GNU.org
// site for more information.
//
// http://www.gnu.org/licenses/gpl.html
//
// ****************************************************************

// ****************************************************************
//
// Special thanks goes out to Tonia Stalker for helping test this.
//
// ****************************************************************

// ****************************************************************
// ****************************************************************
//
//    DON'T TOUCH ANYTHING HERE UNLESS YOU KNOW WHAT YOUR DOING!
//        (See sd_fsettings_inc for configuration options.)
//
// ****************************************************************
// ****************************************************************

#include "sd_fsettings_inc"

// Function headers.
void filterSignature(object oItem, itemproperty prop, int ptype, int psubtype, int param1, int param1val, int costTable, int costTableValue);
void removeFlags(object oItem);
void scanPropertySignatures(object oItem);
void processDamage(object oItem, itemproperty prop);
void scanDamage(object oItem);
void processEN(object oItem, itemproperty prop);
void scanEN(object oItem);
void processAB(object oItem, itemproperty prop);
void scanAB(object oItem);
void stripMisc(object oItem);
void resistPropCheck(object oItem, itemproperty prop);
void resistScanner(object oItem);
void acPropCheck(object oItem, itemproperty prop);
void acScanner(object oItem);
void stripDecrease(object oItem);
void stripOnHit(object oItem);
void stripFeats(object oItem);
void stripImmunity(object oItem);
void stripBadThrowingProperties(object oItem);
void stripBadAmmoProperties(object oItem);
void inventoryScan(object oPC);
void equipedScan(object oPC);
void itemCheck(object oItem);
void stripOverGPValue(object oItem);
void propertyLimitCheck(object oItem);
void scan(object oItem);
void inventoryScan(object oPC);
void equipedScan(object oPC);

// Scans a players gear.
// This is the main method you call from any custom script.
void scanPlayer(object oPC)
{
    if (!GetIsPC(oPC))
    {
        return;
    }

    if (GetIsDM(oPC))
    {
        return;
    }
    //FloatingTextStringOnCreature("** Moo Filter 1.2 Activated **", oPC, FALSE);
    equipedScan(oPC);
    DelayCommand(2.0f, inventoryScan(oPC));
    //DelayCommand(4.0f, FloatingTextStringOnCreature("** Moo Filter 1.2 Scan Completed **", oPC, FALSE));
}

// Scan equipped gear.
void equipedScan(object oPC)
{
    int c = 0;

    // Whack creature equips.
    DestroyObject(GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC));
    DestroyObject(GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oPC));
    DestroyObject(GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oPC));
    DestroyObject(GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oPC));

    // 0-13 are normal equipment slots.
    for (c = 0; c < 15; c++)
    {
        object oItem = GetItemInSlot(c, oPC);

        SetIdentified(oItem, TRUE);
        if (GetGoldPieceValue(oItem) > 4200000)
        {
            AssignCommand(oPC, ActionUnequipItem(oItem));
        }
        scan(oItem);
    }
}

// Scan inventory.
void inventoryScan(object oPC)
{
    object oItem = GetFirstItemInInventory(oPC);

    while (GetIsObjectValid(oItem))
    {
        SetPlotFlag(oItem, FALSE);
        SetDroppableFlag(oItem, TRUE);
        SetIdentified(oItem, TRUE);
        DelayCommand(0.06f, scan(oItem));
        oItem = GetNextItemInInventory(oPC);
    }
}

// Scan an item for duplicate properties and remove them.
void scan(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);
    int count = 0;

    while (GetIsItemPropertyValid(prop))
    {
        string ptype = IntToString(GetItemPropertyType(prop));

        // Nab everything but bonus spell slots.
        if (StringToInt(ptype) != ITEM_PROPERTY_BONUS_SPELL_SLOT_OF_LEVEL_N)
        {
            string psubtype = IntToString(GetItemPropertySubType(prop));
            string param1 = IntToString(GetItemPropertyParam1(prop));
            string param1val = IntToString(GetItemPropertyParam1Value(prop));
            string costTable = IntToString(GetItemPropertyCostTable(prop));
            string costTableValue = IntToString(GetItemPropertyCostTableValue(prop));
            string propHash = ptype + psubtype + param1 + param1val + costTable + costTableValue;
            int flag = GetLocalInt(oItem, propHash);

            if (flag == 1)
            {
                RemoveItemProperty(oItem, prop);
            }
            else
            {
                SetLocalInt(oItem, propHash, 1);
                SetLocalString(oItem, "PROP_" + IntToString(count), propHash);
            }
        }

        prop = GetNextItemProperty(oItem);
    }

    DelayCommand(0.05f, SetLocalInt(oItem, "FLAG_COUNT", count));
    DelayCommand(0.05f, propertyLimitCheck(oItem));
}

// This part enforces the property max limit.
void propertyLimitCheck(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);
    int counter = 1;

    while (GetIsItemPropertyValid(prop))
    {
        prop = GetNextItemProperty(oItem);
        counter++;
        if (counter > MAX_PROPERTIES)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    DelayCommand(0.05f, stripOverGPValue(oItem));
}

// Enforce a set GP value per item.
void stripOverGPValue(object oItem)
{
    if (GP_VALUE_CHECK == TRUE && GetGoldPieceValue(oItem) > MAX_GOLD)
    {
        DestroyObject(oItem, 0.0f);
        return;
    }
    else
    {
        DelayCommand(0.05f, itemCheck(oItem));
    }
}

// Scans an object based on item type.
void itemCheck(object oItem)
{
    // Make sure we have something valid to scan
    if (GetIsObjectValid(oItem) == FALSE)
    {
       DestroyObject(oItem, 0.0f);
       return;
    }

     //If it's a container, whack it.
    if (GetHasInventory(oItem))
    {
        DestroyObject(oItem);
        return;
    }
    else if (GetBaseItemType(oItem) == BASE_ITEM_ARROW ||
             GetBaseItemType(oItem) == BASE_ITEM_BOLT ||
             GetBaseItemType(oItem) == BASE_ITEM_BULLET)
    {
       stripBadAmmoProperties(oItem);
    }
    else if (GetBaseItemType(oItem) == BASE_ITEM_DART ||
             GetBaseItemType(oItem) == BASE_ITEM_SHURIKEN ||
             GetBaseItemType(oItem) == BASE_ITEM_THROWINGAXE)
    {
       stripBadThrowingProperties(oItem);
    }
    else if ((GetBaseItemType(oItem) == BASE_ITEM_THIEVESTOOLS && ALLOW_THIEVESTOOLS == FALSE) ||
             (GetBaseItemType(oItem) == BASE_ITEM_TORCH && ALLOW_TORCHES == FALSE) ||
             (GetBaseItemType(oItem) == BASE_ITEM_POTIONS && ALLOW_POTIONS == FALSE) ||
             (GetBaseItemType(oItem) == BASE_ITEM_SCROLL && ALLOW_SCROLLS == FALSE))
    {
        DestroyObject(oItem);
        return;
    }
    else
    {
        // Otherwise scan it.
        stripImmunity(oItem);
    }
}

// Eliminates bad ammo properties.
void stripBadAmmoProperties(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);

    if (GetItemStackSize(oItem) > 99)
    {
        SetItemStackSize(oItem, 99);
    }

    while (GetIsItemPropertyValid(prop))
    {
        int type = GetItemPropertyType(prop);

        if (type == ITEM_PROPERTY_AC_BONUS ||
            type == ITEM_PROPERTY_AC_BONUS_VS_ALIGNMENT_GROUP ||
            type == ITEM_PROPERTY_AC_BONUS_VS_DAMAGE_TYPE ||
            type == ITEM_PROPERTY_AC_BONUS_VS_RACIAL_GROUP ||
            type == ITEM_PROPERTY_AC_BONUS_VS_SPECIFIC_ALIGNMENT ||
            type == ITEM_PROPERTY_ATTACK_BONUS ||
            type == ITEM_PROPERTY_ATTACK_BONUS_VS_ALIGNMENT_GROUP ||
            type == ITEM_PROPERTY_ATTACK_BONUS_VS_RACIAL_GROUP ||
            type == ITEM_PROPERTY_ATTACK_BONUS_VS_SPECIFIC_ALIGNMENT ||
            type == ITEM_PROPERTY_ENHANCEMENT_BONUS ||
            type == ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_ALIGNMENT_GROUP ||
            type == ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_RACIAL_GROUP ||
            type == ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_SPECIFIC_ALIGNEMENT ||
            type == ITEM_PROPERTY_ABILITY_BONUS ||
            type == ITEM_PROPERTY_BONUS_FEAT ||
            type == ITEM_PROPERTY_ARCANE_SPELL_FAILURE ||
            type == ITEM_PROPERTY_BONUS_SPELL_SLOT_OF_LEVEL_N ||
            type == ITEM_PROPERTY_DARKVISION ||
            type == ITEM_PROPERTY_DAMAGE_RESISTANCE ||
            type == ITEM_PROPERTY_KEEN ||
            type == ITEM_PROPERTY_HASTE ||
            type == ITEM_PROPERTY_HOLY_AVENGER ||
            type == ITEM_PROPERTY_IMPROVED_EVASION ||
            type == ITEM_PROPERTY_FREEDOM_OF_MOVEMENT ||
            type == ITEM_PROPERTY_MIGHTY ||
            type == ITEM_PROPERTY_MIND_BLANK ||
            type == ITEM_PROPERTY_TRUE_SEEING)
        {
            RemoveItemProperty(oItem, prop);
        }

        prop = GetNextItemProperty(oItem);
    }
    stripImmunity(oItem);
}

// Takes care of bad throwing item properties.
void stripBadThrowingProperties(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);

    if (GetItemStackSize(oItem) > 50)
    {
        SetItemStackSize(oItem, 50);
    }

    // Left in for possible future use.
    /*while (GetIsItemPropertyValid(prop))
    {
        int type = GetItemPropertyType(prop);

        if (type == ITEM_PROPERTY_REPLACE_ME)
        {
            RemoveItemProperty(oItem, prop);
        }

        prop = GetNextItemProperty(oItem);
    }*/
    stripImmunity(oItem);
}

// Strips off immunities from an item.
void stripImmunity(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);

    while (GetIsItemPropertyValid(prop))
    {
        int type = GetItemPropertyType(prop);

        if (type == ITEM_PROPERTY_IMMUNITY_DAMAGE_TYPE ||
            //type == ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS ||
            //type == ITEM_PROPERTY_IMMUNITY_SPECIFIC_SPELL ||
            type == ITEM_PROPERTY_IMMUNITY_SPELL_SCHOOL ||
            type == ITEM_PROPERTY_IMMUNITY_SPELLS_BY_LEVEL)
        {
            RemoveItemProperty(oItem, prop);
        }

        prop = GetNextItemProperty(oItem);
    }
    stripFeats(oItem);
}

// Strips away bonus feats.
void stripFeats(object oItem)
{
    if (STRIP_FEATS == TRUE)
    {
        itemproperty prop = GetFirstItemProperty(oItem);

        while (GetIsItemPropertyValid(prop))
        {
            int type = GetItemPropertyType(prop);

            if (type == ITEM_PROPERTY_BONUS_FEAT)
            {
                RemoveItemProperty(oItem, prop);
            }

            prop = GetNextItemProperty(oItem);
        }
    }
    stripOnHit(oItem);
}

// Strips away on hits.
void stripOnHit(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);

    while (GetIsItemPropertyValid(prop))
    {
        int type = GetItemPropertyType(prop);

        if (//(type == ITEM_PROPERTY_ON_HIT_PROPERTIES && ON_HIT_STRIP) ||
            type == ITEM_PROPERTY_ON_MONSTER_HIT) //||
            //type == ITEM_PROPERTY_ONHITCASTSPELL)
        {
            RemoveItemProperty(oItem, prop);
        }

        prop = GetNextItemProperty(oItem);
    }
    stripDecrease(oItem);
}

// Strips of decreased items. No negative ability bugs.
void stripDecrease(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);

    while (GetIsItemPropertyValid(prop))
    {
        int type = GetItemPropertyType(prop);

        if (type == ITEM_PROPERTY_DAMAGE_VULNERABILITY ||
            type == ITEM_PROPERTY_DECREASED_ABILITY_SCORE ||
            type == ITEM_PROPERTY_DECREASED_AC ||
            type == ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER ||
            type == ITEM_PROPERTY_DECREASED_DAMAGE ||
            type == ITEM_PROPERTY_DECREASED_ENHANCEMENT_MODIFIER ||
            type == ITEM_PROPERTY_DECREASED_SAVING_THROWS ||
            type == ITEM_PROPERTY_DECREASED_SAVING_THROWS_SPECIFIC ||
            type == ITEM_PROPERTY_DECREASED_SKILL_MODIFIER ||
            type == ITEM_PROPERTY_NO_DAMAGE)
        {
            RemoveItemProperty(oItem, prop);
        }

        prop = GetNextItemProperty(oItem);
    }
    acScanner(oItem);
}

// Scans for AC properties and passes ac items to acPropCheck
void acScanner(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);

    while (GetIsItemPropertyValid(prop))
    {
        int type = GetItemPropertyType(prop);

        if (type == ITEM_PROPERTY_AC_BONUS ||
            type == ITEM_PROPERTY_AC_BONUS_VS_ALIGNMENT_GROUP ||
            type == ITEM_PROPERTY_AC_BONUS_VS_DAMAGE_TYPE ||
            type == ITEM_PROPERTY_AC_BONUS_VS_RACIAL_GROUP ||
            type == ITEM_PROPERTY_AC_BONUS_VS_SPECIFIC_ALIGNMENT)
        {
            acPropCheck(oItem, prop);
        }

        prop = GetNextItemProperty(oItem);
    }
    resistScanner(oItem);
}

// Checks to enforce the MAX_AC limit.
void acPropCheck(object oItem, itemproperty prop)
{
    int ptype = GetItemPropertyType(prop);
    int costTableValue = GetItemPropertyCostTableValue(prop);
    int psubtype = GetItemPropertySubType(prop);

    if (costTableValue > MAX_AC)
    {
        RemoveItemProperty(oItem, prop);
        if (MAX_AC < 1)
        {
           return;
        }

        if (ptype == ITEM_PROPERTY_AC_BONUS)
        {
            AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonus(MAX_AC), oItem, 0.0f);
        }
        else if (ptype == ITEM_PROPERTY_AC_BONUS_VS_ALIGNMENT_GROUP)
        {
            if (NONE_STRIP && psubtype == 0)
            {
                return;
            }
            AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsAlign(psubtype, MAX_AC), oItem, 0.0f);
        }
        else if (ptype == ITEM_PROPERTY_AC_BONUS_VS_DAMAGE_TYPE)
        {
            AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsDmgType(psubtype, MAX_AC), oItem, 0.0f);
        }
        else if (ptype == ITEM_PROPERTY_AC_BONUS_VS_RACIAL_GROUP)
        {
            AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsRace(psubtype, MAX_AC), oItem, 0.0f);
        }
        else if (ptype == ITEM_PROPERTY_AC_BONUS_VS_SPECIFIC_ALIGNMENT)
        {
            AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyACBonusVsSAlign(psubtype, MAX_AC), oItem, 0.0f);
        }
    }
}

// Scans for AC properties and passes ac items to acPropCheck
void resistScanner(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);

    while (GetIsItemPropertyValid(prop))
    {
        int type = GetItemPropertyType(prop);

        if (type == ITEM_PROPERTY_DAMAGE_RESISTANCE)
        {
            resistPropCheck(oItem, prop);
        }

        prop = GetNextItemProperty(oItem);
    }
    stripMisc(oItem);
}

// Check to enforce resistance policy on server.
void resistPropCheck(object oItem, itemproperty prop)
{
    int psubtype = GetItemPropertySubType(prop);
    int costTableValue = GetItemPropertyCostTableValue(prop);

    if (costTableValue > MAX_RESIST)
    {
        RemoveItemProperty(oItem, prop);
        if (REMOVE_DEVINE_RESIST == TRUE && psubtype == IP_CONST_DAMAGETYPE_DIVINE)
        {
            return;
        }
        if (REMOVE_MAGIC_RESIST == TRUE && psubtype == IP_CONST_DAMAGETYPE_MAGICAL)
        {
            return;
        }
        if (REMOVE_NEGATIVE_RESIST == TRUE && psubtype == IP_CONST_DAMAGETYPE_NEGATIVE)
        {
            return;
        }
        if (REMOVE_POSITIVE_RESIST == TRUE && psubtype == IP_CONST_DAMAGETYPE_POSITIVE)
        {
            return;
        }
        itemproperty ip = ItemPropertyDamageResistance(psubtype, MAX_RESIST);
        AddItemProperty(DURATION_TYPE_PERMANENT, ip, oItem, 0.0f);
    }
    else // Ok, we didn't go over the limit. Check for banned resist types anyway.
    {
        if (REMOVE_DEVINE_RESIST == TRUE && psubtype == IP_CONST_DAMAGETYPE_DIVINE)
        {
            RemoveItemProperty(oItem, prop);
            return;
        }
        if (REMOVE_MAGIC_RESIST == TRUE && psubtype == IP_CONST_DAMAGETYPE_MAGICAL)
        {
            RemoveItemProperty(oItem, prop);
            return;
        }
        if (REMOVE_NEGATIVE_RESIST == TRUE && psubtype == IP_CONST_DAMAGETYPE_NEGATIVE)
        {
            RemoveItemProperty(oItem, prop);
            return;
        }
        if (REMOVE_POSITIVE_RESIST == TRUE && psubtype == IP_CONST_DAMAGETYPE_POSITIVE)
        {
            RemoveItemProperty(oItem, prop);
            return;
        }
    }
}

// Strips away misc.
void stripMisc(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);
    int baseType = GetBaseItemType(oItem);

    while (GetIsItemPropertyValid(prop))
    {
        int type = GetItemPropertyType(prop);

        if (type == ITEM_PROPERTY_MONSTER_DAMAGE ||
            type == ITEM_PROPERTY_ON_MONSTER_HIT ||
            type == ITEM_PROPERTY_REGENERATION ||
            type == ITEM_PROPERTY_REGENERATION_VAMPIRIC ||
            type == ITEM_PROPERTY_DAMAGE_REDUCTION)
        {
            RemoveItemProperty(oItem, prop);
        }
        if (type == ITEM_PROPERTY_CAST_SPELL && ALLOW_CAST_ITEMS == FALSE)
        {
           if (baseType == BASE_ITEM_POTIONS && ALLOW_POTIONS == TRUE)
           {
               // Do nothing since we are allowing potions.
           }
           else if (baseType == BASE_ITEM_SCROLL && ALLOW_SCROLLS == TRUE)
           {
               // Do nothing since we are allowing scrolls.
           }
           else
           {
               RemoveItemProperty(oItem, prop);
           }
        }

        prop = GetNextItemProperty(oItem);
    }
    scanAB(oItem);
}

// Scan attack bonus properties.
void scanAB(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);

    while (GetIsItemPropertyValid(prop))
    {
        int type = GetItemPropertyType(prop);

        if (type == ITEM_PROPERTY_ATTACK_BONUS ||
            type == ITEM_PROPERTY_ATTACK_BONUS_VS_ALIGNMENT_GROUP ||
            type == ITEM_PROPERTY_ATTACK_BONUS_VS_RACIAL_GROUP ||
            type == ITEM_PROPERTY_ATTACK_BONUS_VS_SPECIFIC_ALIGNMENT)
        {
            processAB(oItem, prop);
        }

        prop = GetNextItemProperty(oItem);
    }
    scanEN(oItem);
}

// Process attack bonus properties.
void processAB(object oItem, itemproperty prop)
{
    int ptype = GetItemPropertyType(prop);
    int psubtype = GetItemPropertySubType(prop);
    int costTableValue = GetItemPropertyCostTableValue(prop);
    itemproperty ip;

    if (costTableValue > MAX_AB_ITEM)
    {
        RemoveItemProperty(oItem, prop);
        if (ptype == ITEM_PROPERTY_ATTACK_BONUS)
        {
            ip = ItemPropertyAttackBonus(MAX_AB_ITEM);
        }
        else if (ptype == ITEM_PROPERTY_ATTACK_BONUS_VS_ALIGNMENT_GROUP)
        {
            if (NONE_STRIP && psubtype == 0)
            {
                return;
            }
            ip = ItemPropertyAttackBonusVsAlign(psubtype, MAX_AB_ITEM);
        }
        else if (ptype == ITEM_PROPERTY_ATTACK_BONUS_VS_RACIAL_GROUP)
        {
            ip = ItemPropertyAttackBonusVsRace(psubtype, MAX_AB_ITEM);
        }
        else if (ptype == ITEM_PROPERTY_ATTACK_BONUS_VS_SPECIFIC_ALIGNMENT)
        {
            ip = ItemPropertyAttackBonusVsSAlign(psubtype, MAX_AB_ITEM);
        }
        AddItemProperty(DURATION_TYPE_PERMANENT, ip, oItem);
    }
}

// Scan enhancement bonus properties.
void scanEN(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);

    while (GetIsItemPropertyValid(prop))
    {
        int type = GetItemPropertyType(prop);

        if (type == ITEM_PROPERTY_ENHANCEMENT_BONUS ||
            type == ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_ALIGNMENT_GROUP ||
            type == ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_RACIAL_GROUP ||
            type == ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_SPECIFIC_ALIGNEMENT)
        {
            processEN(oItem, prop);
        }

        prop = GetNextItemProperty(oItem);
    }
    scanDamage(oItem);
}

// Process enhancement bonus properties.
void processEN(object oItem, itemproperty prop)
{
    int ptype = GetItemPropertyType(prop);
    int psubtype = GetItemPropertySubType(prop);
    int costTableValue = GetItemPropertyCostTableValue(prop);
    itemproperty ip;

    if (costTableValue > MAX_EN_ITEM)
    {
        RemoveItemProperty(oItem, prop);
        if (ptype == ITEM_PROPERTY_ENHANCEMENT_BONUS)
        {
            ip = ItemPropertyEnhancementBonus(MAX_EN_ITEM);
        }
        else if (ptype == ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_ALIGNMENT_GROUP)
        {
            if (NONE_STRIP && psubtype == 0)
            {
                return;
            }
            ip = ItemPropertyEnhancementBonusVsAlign(psubtype, MAX_EN_ITEM);
        }
        else if (ptype == ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_RACIAL_GROUP)
        {
            ip = ItemPropertyEnhancementBonusVsRace(psubtype, MAX_EN_ITEM);
        }
        else if (ptype == ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_SPECIFIC_ALIGNEMENT)
        {
            ip = ItemPropertyEnhancementBonusVsSAlign(psubtype, MAX_EN_ITEM);
        }
        AddItemProperty(DURATION_TYPE_PERMANENT, ip, oItem);
    }
}

// Scan for damage bonus properties.
void scanDamage(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);

    while (GetIsItemPropertyValid(prop))
    {
        int type = GetItemPropertyType(prop);

        if (type == ITEM_PROPERTY_DAMAGE_BONUS ||
            type == ITEM_PROPERTY_DAMAGE_BONUS_VS_ALIGNMENT_GROUP ||
            type == ITEM_PROPERTY_DAMAGE_BONUS_VS_RACIAL_GROUP ||
            type == ITEM_PROPERTY_DAMAGE_BONUS_VS_SPECIFIC_ALIGNMENT)
        {
            processDamage(oItem, prop);
        }

        prop = GetNextItemProperty(oItem);
    }
    scanPropertySignatures(oItem);
}

// Process damage bonus properties.
void processDamage(object oItem, itemproperty prop)
{
    int ptype = GetItemPropertyType(prop);
    int psubtype = GetItemPropertySubType(prop);
    int param1val = GetItemPropertyParam1Value(prop);
    int costTableValue = GetItemPropertyCostTableValue(prop);
    itemproperty ip;

    if (ptype == ITEM_PROPERTY_DAMAGE_BONUS_VS_ALIGNMENT_GROUP)
    {
        if (NONE_STRIP && psubtype == 0)
        {
            RemoveItemProperty(oItem, prop);
            return;
        }
        if (REMOVE_DEVINE_DAMAGE == TRUE && param1val == IP_CONST_DAMAGETYPE_DIVINE)
        {
            RemoveItemProperty(oItem, prop);
            return;
        }
        if (REMOVE_MAGIC_DAMAGE == TRUE && param1val == IP_CONST_DAMAGETYPE_MAGICAL)
        {
            RemoveItemProperty(oItem, prop);
            return;
        }
        if (REMOVE_NEGATIVE_DAMAGE == TRUE && param1val == IP_CONST_DAMAGETYPE_NEGATIVE)
        {
            RemoveItemProperty(oItem, prop);
            return;
        }
        if (REMOVE_POSITIVE_DAMAGE == TRUE && param1val == IP_CONST_DAMAGETYPE_POSITIVE)
        {
            RemoveItemProperty(oItem, prop);
            return;
        }
    }
    else
    {
        if (REMOVE_DEVINE_DAMAGE == TRUE && psubtype == IP_CONST_DAMAGETYPE_DIVINE)
        {
            RemoveItemProperty(oItem, prop);
            return;
        }
        if (REMOVE_MAGIC_DAMAGE == TRUE && psubtype == IP_CONST_DAMAGETYPE_MAGICAL)
        {
            RemoveItemProperty(oItem, prop);
            return;
        }
        if (REMOVE_NEGATIVE_DAMAGE == TRUE && psubtype == IP_CONST_DAMAGETYPE_NEGATIVE)
        {
            RemoveItemProperty(oItem, prop);
            return;
        }
        if (REMOVE_POSITIVE_DAMAGE == TRUE && psubtype == IP_CONST_DAMAGETYPE_POSITIVE)
        {
            RemoveItemProperty(oItem, prop);
            return;
        }
    }
}

// Scanner to get property signatures.
void scanPropertySignatures(object oItem)
{
    itemproperty prop = GetFirstItemProperty(oItem);

    while (GetIsItemPropertyValid(prop))
    {
        int ptype = GetItemPropertyType(prop);
        int psubtype = GetItemPropertySubType(prop);
        int param1 = GetItemPropertyParam1(prop);
        int param1val = GetItemPropertyParam1Value(prop);
        int costTable = GetItemPropertyCostTable(prop);
        int costTableValue = GetItemPropertyCostTableValue(prop);

        if (costTableValue > 50 || costTableValue < 0)
        {
            RemoveItemProperty(oItem, prop);
        }
        else
        {
            filterSignature(oItem, prop, ptype, psubtype, param1, param1val, costTable, costTableValue);
        }

        prop = GetNextItemProperty(oItem);
    }
    DelayCommand(0.05f, removeFlags(oItem));
}

// This removes the flags from the duplicate check.
void removeFlags(object oItem)
{
    int total = GetLocalInt(oItem, "FLAG_COUNT");
    int c = 0;

    for (c = 0; c <= total; c++)
    {
        string hash = GetLocalString(oItem, "PROP_" + IntToString(total));

        SetLocalInt(oItem, hash, 0);
    }
    SetLocalInt(oItem, "FLAG_COUNT", 0);
}

// Custome filter for aquired signature.
// Use this section to add item property signatures that get
// through the filtering process. Think of this as a virus
// scanners signature section for detection. Each item property
// has it's own numerical signature. Use the sd_item_output scanning
// script on a barrel or something to get the items properties.
//
// Note the signature for test crash arrows have already been added.
// Those arrows have 4 properties that make them what they are.
// My thinking was to group items by the ptype. For example, ptypes of
// 10 would have their own if block. Makes for easier organization I think
// of common property type values.
//
// Finally take note how I do AC, AB, Enhance, and Damges for badstreff.
// I leave out the costTableValue to cover the whole range of values for that
// particular property. Becareful what you put in there for removing a bunch in
// one if block. You may end up stepping on a legitmate property.
//
void filterSignature(object oItem, itemproperty prop, int ptype, int psubtype,
                     int param1, int param1val, int costTable, int costTableValue)
{
    if (ptype == 7)
    {
        // Nail Enhance vs. BadStreff.
        if (psubtype == 0 && param1 == 255 && param1val == 0 && costTable == 2)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 255 && param1 == 255 && param1val == 0 && costTable == 2)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    if (ptype == 9)
    {
        // Special thanks to Hatred for donating his Pain Kami's.
        if (psubtype == 0 && param1 == 255 && param1val == 0 && costTable == 2)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 9 && param1 == 255 && param1val == 0 && costTable == 2)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 255 && param1 == 255 && param1val == 0 && costTable == 2)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    if (ptype == 16)
    {
        // Test Arrow Property Removal.
        if (psubtype == 197 && param1 == 255 && param1val == 0 && costTable == 4 && costTableValue == 10)
        {
            RemoveItemProperty(oItem, prop);
        }
        // Test Arrow Property Removal.
        else if (psubtype == 200 && param1 == 255 && param1val == 0 && costTable == 4 && costTableValue == 10)
        {
            RemoveItemProperty(oItem, prop);
        }
        // Test Arrow Property Removal.
        else if (psubtype == 203 && param1 == 255 && param1val == 0 && costTable == 4 && costTableValue == 10)
        {
            RemoveItemProperty(oItem, prop);
        }
        // Test Arrow Property Removal.
        else if (psubtype == 204 && param1 == 255 && param1val == 0 && costTable == 4 && costTableValue == 8)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    if (ptype == 17)
    {
        // Badstreff Damage vs. Chaotic
        if (psubtype == 3 && param1 == 0 && param1val == 238 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    if (ptype == 19)
    {   // Special thanks to Hatred for donating his Pain Kami's.
        if (psubtype == 255 && param1 == 0 && param1val == 0 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 255 && param1 == 0 && param1val == 1 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 255 && param1 == 0 && param1val == 2 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 9 && param1 == 0 && param1val == 0 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 9 && param1 == 0 && param1val == 1 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 9 && param1 == 0 && param1val == 2 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    if (ptype == 23)
    {
        if (psubtype == 197 && param1 == 255 && param1val == 0 && costTable == 12)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 198 && param1 == 255 && param1val == 0 && costTable == 12)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 199 && param1 == 255 && param1val == 0 && costTable == 12)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 200 && param1 == 255 && param1val == 0 && costTable == 12)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 201 && param1 == 255 && param1val == 0 && costTable == 12)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 202 && param1 == 255 && param1val == 0 && costTable == 12)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 203 && param1 == 255 && param1val == 0 && costTable == 12)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 204 && param1 == 255 && param1val == 0 && costTable == 12)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 205 && param1 == 255 && param1val == 0 && costTable == 12)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 206 && param1 == 255 && param1val == 0 && costTable == 12)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 238 && param1 == 255 && param1val == 0 && costTable == 12)
        {
            RemoveItemProperty(oItem, prop);
        }
        else if (psubtype == 238 && param1 == 255 && param1val == 0 && costTable == 7)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    if (ptype == 57)
    {
        // Nail AB vs. BadStreff.
        if (psubtype == 0 && param1 == 255 && param1val == 0 && costTable == 2)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    if (ptype == 59)
    {
        // Special thanks to Hatred for donating his Pain Kami's.
        if (psubtype == 255 && param1 == 255 && param1val == 0 && costTable == 2)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    if (ptype == 51)
    {

        if (psubtype == 0 && param1 == 255 && param1val == 0 && costTable == 80)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    if (ptype == 57)
    {

        if (psubtype == 0 && param1 == 255 && param1val == 255 && costTable == 2)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    if (ptype == 2)
    {

        if (psubtype == 0 && param1 == 255 && param1val == 0 && costTable == 2)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    if (ptype == 16)
    {

        if (psubtype == 238 && param1 == 255 && param1val == 0 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    if (ptype == 57)
    {

        if (psubtype == 6 && param1 == 255 && param1val == 0 && costTable == 2)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
    if (ptype == 17)
    {

        if (psubtype == 6 && param1 == 0 && param1val == 11 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
     if (ptype == 17)
    {

        if (psubtype == 6 && param1 == 0 && param1val == 12 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
     if (ptype == 17)
    {

        if (psubtype == 6 && param1 == 0 && param1val == 13 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
     if (ptype == 17)
    {

        if (psubtype == 6 && param1 == 0 && param1val == 6 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
     if (ptype == 17)
    {

        if (psubtype == 6 && param1 == 0 && param1val == 0 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
     if (ptype == 17)
    {

        if (psubtype == 6 && param1 == 0 && param1val == 7 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
     if (ptype == 17)
    {

        if (psubtype == 6 && param1 == 0 && param1val == 8 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
     if (ptype == 17)
    {

        if (psubtype == 6 && param1 == 0 && param1val == 9 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
     if (ptype == 17)
    {

        if (psubtype == 6 && param1 == 0 && param1val == 10 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
     if (ptype == 17)
    {

        if (psubtype == 6 && param1 == 0 && param1val == 5 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
     if (ptype == 17)
    {

        if (psubtype == 6 && param1 == 0 && param1val == 1 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
     if (ptype == 17)
    {

        if (psubtype == 6 && param1 == 0 && param1val == 2 && costTable == 4)
        {
            RemoveItemProperty(oItem, prop);
        }
    }
}
