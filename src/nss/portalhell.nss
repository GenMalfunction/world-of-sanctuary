//Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();
object oTarget;
int nInt;


oTarget = GetObjectByTag("hellport");

//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SOUND_BURST), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SOUND_BURST), GetLocation(oTarget));

oTarget = GetObjectByTag("hellport");

DestroyObject(oTarget, 3.0);

oTarget = GetObjectByTag("worldstone");

//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), GetLocation(oTarget));

oTarget = GetObjectByTag("worldstone");

DestroyObject(oTarget, 3.0);


object oPCC = GetLastUsedBy();

if (!GetIsPC(oPCC)) return;

object oTargett;
location lTarget;
oTargett = GetWaypointByTag("enterhell");

lTarget = GetLocation(oTargett);

//only do the jump if the location is valid.
//though not flawless, we just check if it is in a valid area.
//the script will stop if the location isn't valid - meaning that
//nothing put after the teleport will fire either.
//the current location won't be stored, either

if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;

AssignCommand(oPCC, ClearAllActions());

DelayCommand(3.0, AssignCommand(oPCC, ActionJumpToLocation(lTarget)));

oTarget = oPCC;

//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

int nIntt;
nIntt = GetObjectType(oTarget);

if (nIntt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), GetLocation(oTarget));

}

