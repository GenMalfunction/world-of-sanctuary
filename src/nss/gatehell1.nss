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
SpeakString("The Gate from Hell in the High Field Grass is closed", TALKVOLUME_SHOUT);

object oPC = GetLastKiller();

while (GetIsObjectValid(GetMaster(oPC)))
   {
   oPC=GetMaster(oPC);
   }

if (!GetIsPC(oPC)) return;

AddJournalQuestEntry("The Dark Way", 3, oPC, TRUE, FALSE);

}
