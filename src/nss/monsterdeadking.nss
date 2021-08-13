// Declarations
// StaticSpawn - Summon the monster with the given tag at the given spot.
// Set the local variable ms_info to the given value
void StaticSpawn(string szClass, location lWhere, string info);
// The main event handler.

void main()
{

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

object oPC = GetLastKiller();

while (GetIsObjectValid(GetMaster(oPC)))
   {
   oPC=GetMaster(oPC);
   }

if (!GetIsPC(oPC)) return;

object oTarget;
oTarget = GetObjectByTag("azking");

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), GetLocation(oTarget));

oTarget = GetObjectByTag("azking");

DestroyObject(oTarget, 3.0);

}
}

