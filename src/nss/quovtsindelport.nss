void main()
{

object oPC = GetPCSpeaker();

object oTarget;
oTarget = GetObjectByTag("angelic1");


int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), GetLocation(oTarget));

oTarget = GetObjectByTag("angelic1");

DestroyObject(oTarget, 3.0);

oTarget = GetObjectByTag("angelic2");


nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_ICESTORM), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_ICESTORM), GetLocation(oTarget));

oTarget = GetObjectByTag("angelic2");

DestroyObject(oTarget, 3.0);

oTarget = GetObjectByTag("angelic3");


nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_WEIRD), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_WEIRD), GetLocation(oTarget));

oTarget = GetObjectByTag("angelic3");

DestroyObject(oTarget, 3.0);

oTarget = GetObjectByTag("angelic4");


nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), GetLocation(oTarget));

oTarget = GetObjectByTag("angelic4");

DestroyObject(oTarget, 3.0);

oTarget = GetObjectByTag("angelic5");


nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), GetLocation(oTarget));

oTarget = GetObjectByTag("angelic5");

DestroyObject(oTarget, 3.0);

oTarget = GetObjectByTag("angelic6");


nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget));

oTarget = GetObjectByTag("angelic6");

DestroyObject(oTarget, 3.0);

oTarget = GetObjectByTag("angelic7");


nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), GetLocation(oTarget));

oTarget = GetObjectByTag("angelic7");

DestroyObject(oTarget, 3.0);


object theWaypoint = GetWaypointByTag("enterulrehfirst");
location rivendelia = GetLocation(theWaypoint);

object oTarget2;
location lTarget2;
oTarget2 = GetWaypointByTag("enterulrehfirst");
lTarget2 = GetLocation(oTarget2);


//AssignCommand(oPC, JumpToLocation(rivendelia));
DelayCommand(4.0, AssignCommand(oPC, ActionJumpToLocation(rivendelia)));

oTarget2 = oPC;

int nInt2;
nInt2 = GetObjectType(oTarget2);

if (nInt2 != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), oTarget2);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), GetLocation(oTarget2));

}

