void main()
{

object oPC = GetLastKiller();

SpeakString("Azmodan, Lord Of Sin is fallen!", TALKVOLUME_SHOUT);

while (GetIsObjectValid(GetMaster(oPC)))
   {
   oPC=GetMaster(oPC);
   }

if (!GetIsPC(oPC)) return;

AddJournalQuestEntry("karcheus", 2, oPC, TRUE, FALSE);

object oTarget;
object oSpawn;
location lTarget;
oTarget = GetWaypointByTag("azmodan");

lTarget = GetLocation(oTarget);

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "kingportal", lTarget);

oTarget = oSpawn;

//Visual effects can't be applied to waypoints, so if it is a WP
//apply to the WP's location instead

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), oTarget));
else DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), GetLocation(oTarget)));

{
    object PC = GetLastKiller();
    object area = GetArea(OBJECT_SELF);

    SetLocalInt(area, "kills", GetLocalInt(area, "kills") + 1);
    int monster = GetLocalInt(PC, "monster");
    int points = FloatToInt(GetChallengeRating(OBJECT_SELF)) / 10;
    SetLocalInt(PC, "monster", monster + points);
    FloatingTextStringOnCreature(IntToString(points) + " monsterpoints", PC, TRUE);
    ExecuteScript("pointeffects", OBJECT_SELF);
}

}

