void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

AddJournalQuestEntry("theforgottentower", 1, oPC, TRUE, FALSE);

}

