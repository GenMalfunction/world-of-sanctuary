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
SpeakString("... fallen!", TALKVOLUME_SHOUT);

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



