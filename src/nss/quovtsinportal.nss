void main()
{

object oPC = GetPCSpeaker();

object oTarget;
object oSpawn;
location lTarget;
oTarget = GetWaypointByTag("angelic01");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "angelic1", lTarget);

oTarget = oSpawn;

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget)));

object oTarget2;
object oSpawn2;
location lTarget2;
oTarget2 = GetWaypointByTag("angelic02");

lTarget2 = GetLocation(oTarget2);

oSpawn2 = CreateObject(OBJECT_TYPE_PLACEABLE, "angelic2", lTarget2);

oTarget2 = oSpawn2;

int nInt2;
nInt2 = GetObjectType(oTarget2);

if (nInt2 != OBJECT_TYPE_WAYPOINT) DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget2));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget2)));

object oTarget3;
object oSpawn3;
location lTarget3;
oTarget3 = GetWaypointByTag("angelic03");

lTarget3 = GetLocation(oTarget3);

oSpawn3 = CreateObject(OBJECT_TYPE_PLACEABLE, "angelic3", lTarget3);

oTarget2 = oSpawn3;

int nInt3;
nInt3 = GetObjectType(oTarget3);

if (nInt3 != OBJECT_TYPE_WAYPOINT) DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget3));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget3)));

object oTarget4;
object oSpawn4;
location lTarget4;
oTarget4 = GetWaypointByTag("angelic04");

lTarget4 = GetLocation(oTarget4);

oSpawn4 = CreateObject(OBJECT_TYPE_PLACEABLE, "angelic4", lTarget4);

oTarget4 = oSpawn4;

int nInt4;
nInt4 = GetObjectType(oTarget4);

if (nInt4 != OBJECT_TYPE_WAYPOINT) DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget4));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget4)));

object oTarget5;
object oSpawn5;
location lTarget5;
oTarget5 = GetWaypointByTag("angelic05");

lTarget5 = GetLocation(oTarget5);

oSpawn5 = CreateObject(OBJECT_TYPE_PLACEABLE, "angelic5", lTarget5);

oTarget5 = oSpawn5;

int nInt5;
nInt5 = GetObjectType(oTarget5);

if (nInt5 != OBJECT_TYPE_WAYPOINT) DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget5));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget5)));

object oTarget6;
object oSpawn6;
location lTarget6;
oTarget6 = GetWaypointByTag("angelic06");

lTarget6 = GetLocation(oTarget6);

oSpawn6 = CreateObject(OBJECT_TYPE_PLACEABLE, "angelic6", lTarget6);

oTarget6 = oSpawn6;

int nInt6;
nInt6 = GetObjectType(oTarget6);

if (nInt6 != OBJECT_TYPE_WAYPOINT) DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget6));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget6)));

object oTarget7;
object oSpawn7;
location lTarget7;
oTarget7 = GetWaypointByTag("angelic07");

lTarget7 = GetLocation(oTarget7);

oSpawn7 = CreateObject(OBJECT_TYPE_PLACEABLE, "angelic7", lTarget7);

oTarget7 = oSpawn7;

int nInt7;
nInt7 = GetObjectType(oTarget7);

if (nInt7 != OBJECT_TYPE_WAYPOINT) DelayCommand(3.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), oTarget7));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), GetLocation(oTarget7)));

}

