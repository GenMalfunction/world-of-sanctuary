// Declarations
// StaticSpawn - Summon the monster with the given tag at the given spot.
// Set the local variable ms_info to the given value
void StaticSpawn(string szClass, location lWhere, string info);
// The main event handler.
void main()
{
// VARIABLES
// The Spawnmaster object
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

object oPC = GetLastKiller();

while (GetIsObjectValid(GetMaster(oPC)))
   {
   oPC=GetMaster(oPC);
   }

if (!GetIsPC(oPC)) return;

AddJournalQuestEntry("theforgottentower", 3, oPC, TRUE, FALSE);

}


