void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

AddJournalQuestEntry("The Dark Way", 2, oPC, TRUE, FALSE);

}

