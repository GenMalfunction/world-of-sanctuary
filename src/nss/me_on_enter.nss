#include "nw_i0_tool"
#include "pgs_inc_events"
#include "pgs_inc_uidsys"

void main()
{
int STARTING_GOLD = 100000;
object oPlayer = GetEnteringObject();
UID_Check (oPlayer);
PGS_OnClientEnter (oPlayer);

object oPCC = GetEnteringObject();
if (!GetIsPC(oPCC)) return;
object oItem;

if(!HasItem(oPlayer, "EmoteWand"))
{
CreateItemOnObject("emotewand", oPlayer, 1);
}

{
AddJournalQuestEntry("Diablo Server Updates", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Diablo Server Rules Part One", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Diablo Server Rules Part Two", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Diablo Server Direct Connect", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Teamspeak Server", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Waypoints Act I", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Waypoints Act II", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Waypoints Act III", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Waypoints Act IV", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Waypoints Act V", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Waypoints Act VI", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Waypoints Act VII", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Waypoints Act VIII", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Waypoints Act IX", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Waypoints Act X", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Waypoints Act XI", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Rune", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Hall of Monuments", 1, oPCC, FALSE, FALSE);
AddJournalQuestEntry("Diablo Server Updates", 1, oPCC, FALSE, FALSE);
}
if (GetHitDice(oPlayer) <= 1)
   {
   RewardPartyXP(1000, oPlayer, FALSE);
   }

    if(GetIsPC(oPlayer) && !(GetXP(oPlayer)) && !(GetIsDM(oPlayer)))
    {
// Giving PC its starting gold.
        GiveGoldToCreature(oPlayer, STARTING_GOLD - GetGold(oPlayer));
// Set the Good Evil Factions
        object oPC = GetEnteringObject();
        if(GetAlignmentGoodEvil(oPC) == ALIGNMENT_GOOD)
        {
        AdjustReputation(oPC, GetObjectByTag("goodfaction"),100);
        AdjustReputation(oPC, GetObjectByTag("evilfaction"),-100);
        }
        if(GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
        {
        AdjustReputation(oPC, GetObjectByTag("goodfaction"),-100);
        AdjustReputation(oPC, GetObjectByTag("evilfaction"),100);
        }
        }
}
