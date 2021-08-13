#include "nw_i0_generic"

void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

if (GetItemPossessedBy(oPC, "seal01")== OBJECT_INVALID)
   return;

if (GetItemPossessedBy(oPC, "seal02")== OBJECT_INVALID)
   return;

if (GetItemPossessedBy(oPC, "seal03")== OBJECT_INVALID)
   return;

if (GetItemPossessedBy(oPC, "seal04")== OBJECT_INVALID)
   return;

if (GetItemPossessedBy(oPC, "seal05")== OBJECT_INVALID)
   return;


object oItem;

oItem = GetItemPossessedBy(oPC, "seal01");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
oItem = GetItemPossessedBy(oPC, "seal02");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
oItem = GetItemPossessedBy(oPC, "seal03");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
oItem = GetItemPossessedBy(oPC, "seal04");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);
oItem = GetItemPossessedBy(oPC, "seal05");
if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

object oTarget;
object oSpawn;
location lTarget;
oTarget = GetWaypointByTag("diablo");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "diablo", lTarget);

oTarget = oSpawn;

DelayCommand(4.0,PlaySound("c_demon_slct"));


//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget));
else DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), GetLocation(oTarget)));
     DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_WORD), GetLocation(oTarget)));
     DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget)));
     DelayCommand(20.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget)));
     DelayCommand(30.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget)));
     DelayCommand(40.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget)));
     DelayCommand(50.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget)));
}

