#include "nw_i0_tool"

void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

object oTarget;
object oSpawn;
location lTarget;
oTarget = GetWaypointByTag("seal1");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_solblue", lTarget);

oTarget = oSpawn;

if (!GetIsPC(oPC)) return;

if (!HasItem(oPC, "seal01")) {
CreateItemOnObject("seal01", oPC);
SpeakString("Someone found Chaos Sanctuary Seal01!", TALKVOLUME_SHOUT);
}
else return;

//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SOUND_BURST), oTarget));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SOUND_BURST), GetLocation(oTarget)));

}

