// ****************************************************************
//
// @project Moo Filter 1.2
// @author Sean Darrenkamp
// @date 5/7/2004
// @file sd_fsettings_inc
// Copyright 2004 Sean Darrenkamp
//
// This code is licensed under the GPL for use. See the GNU.org
// site for more information.
//
// http://www.gnu.org/licenses/gpl.html
//
// ****************************************************************

// Settings.
// You can change these values.

// Maximum GP value of items.
// Note: 130000 is for level 20 items. Set to true to activate. All items that
//       don't meet the GP requirements are deleted from the character. 4200000
//       is level 40 gear.
int GP_VALUE_CHECK = TRUE;
int MAX_GOLD = 4200000;

// Maximum number of properties per item.
int MAX_PROPERTIES = 25;

// Maximum allowable AC on items for all AC types.
int MAX_AC = 20;

// Strip vs. None
// Note: vs. None isn't an actual game damage type. It's something bioware
//       included in the game for whatever their reasoning was and never
//       bothered removing it.
int NONE_STRIP = TRUE;

// Allow onHits. (Not onHitCast though.)
// Note: This will eliminate hugely stacked items of onhits making them
//       useless. This helps in the filters effectiveness to nail hacked
//       items. The choice is up to you to leave it on or turn it off.
int ON_HIT_STRIP = FALSE;

// Resistances.
// See Constants tab on the search tool to the right.
// You can get the IP_CONST_DAMAGERESIST_ value there.
// Acceptable values are 5, 10, 15, 20, 25, 30, 35, 40,
// 45, and 50 on the end of the constant.
int MAX_RESIST = IP_CONST_DAMAGERESIST_50;

// HoU Resistance Flags.
// Note: I allowed this to be seperate flags to give maximum customization.
int REMOVE_DEVINE_RESIST = FALSE;
int REMOVE_MAGIC_RESIST = FALSE;
int REMOVE_NEGATIVE_RESIST = FALSE;
int REMOVE_POSITIVE_RESIST = FALSE;

// HoU Damage Flags.
// Note: I allowed this to be seperate flags to give maximum customization.
int REMOVE_DEVINE_DAMAGE = FALSE;
int REMOVE_MAGIC_DAMAGE = FALSE;
int REMOVE_NEGATIVE_DAMAGE = FALSE;
int REMOVE_POSITIVE_DAMAGE = FALSE;

// Attack Bonuses and Enhancement max values for all AB and enhance types.
int MAX_AB_ITEM = 20;
int MAX_EN_ITEM = 20;

// Feats on items flag.
int STRIP_FEATS = FALSE;

// Allow items that cast spells?
int ALLOW_CAST_ITEMS = TRUE;

// Allow potions when no item casting specified?
// NOTE: If allow items that cast spells is true, this is ignored since potions
//       are basiclly items that cast spells.
int ALLOW_POTIONS = TRUE;

// Allow thieves tools?
// NOTE: In earlier days people stacked a lot of spell casting on these with
//       little hit in the GP value.
int ALLOW_THIEVESTOOLS = FALSE;

// Allow torches (Holy symbols in some hak packs)?
// NOTE: In earlier days people stacked a lot of spell casting on these with
//       little hit in the GP value. Also was used for super immunity in the
//       early days.
int ALLOW_TORCHES = FALSE;

// Allow scrolls when no item casting specified?
// NOTE: If allow items that cast spells is true, this is ignored since potions
//       are basiclly items that cast spells.
int ALLOW_SCROLLS = TRUE;
