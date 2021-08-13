////////////////////////////////////////////////////////////////////////////////
// include file: inc_modulequest
////////////////////////////////////////////////////////////////////////////////

//
// module-wide quest handling (for all players)
//

// -----------------------------------------------------------------------------

// Schreibt einen Eintrag in das Journal (bei allen Spielern)
// und speichert im Modulobjekt eine entsprechende Journal-/Questvariable
//
// string sQuest:  Name des Journaleintrages (muss mit der Bezeichnung
//                 des Quests im Journaleditor uebereinstimmen)
// int nEntry:     Nummer des Journaleintrages (muss mit einer Nummer
//                 aus dem Journaleditor uebereinstimmen)
// object oPC:     Spielercharacter Objekt (welcher Spieler ist egal,
//                 denn der Journaleintrag wird bei allen Spielern gesetzt)
//                 (Dieser Parameter ist nur deswegen vorhanden, um
//                 es der Funktion prinzipell zu ermoeglichen,
//                 Journaleintraege nur fuer einzelne Spielercharakter
//                 einzutragen. Dies wird hier jedoch nicht verwendet)
// int bOverwrite: TRUE erlaubt es, eine niedrigere Eintragsnummer in das
//                 Journal einzutragen, Standardwert=FALSE

void SetModuleQuest(string sQuest,int nEntry,object oPC, int bOverwrite=FALSE)
{
  object oModule = GetModule();
  if ((GetLocalInt(oModule,sQuest) < nEntry) || bOverwrite)
  {
    AddJournalQuestEntry(sQuest,nEntry,oPC,TRUE,TRUE,bOverwrite);
    SetLocalInt(oModule,sQuest,nEntry);
  }
}

// -----------------------------------------------------------------------------

// Liefert die Eintragsnummer des Journals fuer das Quest sQuest
//
// string sQuest:  Name des Journaleintrages (muss mit der Bezeichnung
//                 des Quests im Journaleditor uebereinstimmen)

int GetModuleQuest(string sQuest)
{
  return GetLocalInt(GetModule(),sQuest);
}

// -----------------------------------------------------------------------------

// Schreibt einen Eintrag in das Journal des Spielers oPC
// anhand des aktuellen Modul-Queststatus sQuest
// (Fuer den Fall, dass ein Spieler spaeter dazukommt, oder ein Spieler
//  einen Disconnect hatte. Aufruf durch Module Event: OnClientEnter)
//
// string sQuest:  Name des Journaleintrages (muss mit der Bezeichnung
//                 des Quests im Journaleditor uebereinstimmen)
// object oPC:     Spielercharacter Objekt

void UpdateModuleQuest(string sQuest,object oPC)
{
  int nEntry = GetLocalInt(GetModule(),sQuest);
  if (nEntry > 0)
  {
    AddJournalQuestEntry(sQuest,nEntry,oPC,FALSE,FALSE,FALSE);
  }
}

// -----------------------------------------------------------------------------

// Gibt allen Spielern die im Journal-Editor festgelegte Menge an
// Erfahrungspunkten. Mit nPercent kann festgelegt werden,
// dass nur ein prozentualer Anteil dieses Wertes gegeben werden soll.
//
// string sQuest:  Name des Journaleintrages (muss mit der Bezeichnung
//                 des Quests im Journaleditor uebereinstimmen)
// object oPC:     Spielercharacter Objekt (welcher Spieler ist egal,
//                 denn die Erfahrungspunkte werden allen Spielern gegeben)
//                 (Dieser Parameter ist nur deswegen vorhanden, um
//                 es der Funktion prinzipell zu ermoeglichen,
//                 Erfahrungspunkte nur fuer einzelne Spielercharakter
//                 zu geben. Dies wird hier jedoch nicht verwendet)

void RewardModuleQuest(string sQuest,object oPC,float fPercent=1.0)
{
  if (fPercent <= 0.0) return;
  if (fPercent >  1.0) fPercent = 1.0;

  int   nXP = GetJournalQuestExperience(sQuest);
  float fXP = IntToFloat(nXP) * fPercent;
  oPC       = GetFirstPC();

  while (GetIsObjectValid(oPC))
  {
    GiveXPToCreature(oPC,FloatToInt(fXP));
    oPC = GetNextPC();
  }
}

// -----------------------------------------------------------------------------

