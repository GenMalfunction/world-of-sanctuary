void StaticSpawn(string szClass, location lWhere, string info);
void main()
{
object oPC = GetLastKiller();
while (GetIsObjectValid(GetMaster(oPC)))
   {
   oPC=GetMaster(oPC);
   }
if (!GetIsPC(oPC)) return;
object oTarget;
object oSpawn;
location lTarget;
oTarget = GetWaypointByTag("end");
lTarget = GetLocation(oTarget);
oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "thronegood003", lTarget);
oTarget = oSpawn;
int nInt;
nInt = GetObjectType(oTarget);
if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_METEOR_SWARM), oTarget));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_METEOR_SWARM), GetLocation(oTarget)));
object oSpawnMaster;
{
    object PC = GetLastKiller();
    object area = GetArea(OBJECT_SELF);

    SpeakString(GetName(PC) + "... killed me!", TALKVOLUME_SHOUT);
    SetLocalInt(area, "kills", GetLocalInt(area, "kills") + 1);
    int monster = GetLocalInt(PC, "monster");
    int points = FloatToInt(GetChallengeRating(OBJECT_SELF)) / 10;
    SetLocalInt(PC, "monster", monster + points);
    FloatingTextStringOnCreature(IntToString(points) + " monsterpoints", PC, TRUE);
    ExecuteScript("pointeffects", OBJECT_SELF);
}
}
