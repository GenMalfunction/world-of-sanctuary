#include "cu_functions"

void main()
{

string sObjectTag = "Illusion1";
object oPC = GetEnteringObject();
int nCheck = GetAbilityScore(oPC, ABILITY_WISDOM)+GetHitDice(oPC)*2+GetSkillRank(SKILL_SEARCH,oPC)*2+GetSkillRank(SKILL_LORE,oPC)*2+GetSkillRank(SKILL_SPOT,oPC);
if (GetLocalInt(oPC,sObjectTag) == 0)
   {
   if(nCheck >50)
    {
    if (GetIsPC(oPC))
       {
        DestroyObject(GetNearestObjectByTag("IllusionaryBoulder",oPC),0.0);
        DestroyObject(GetNearestObjectByTag("IllusionaryBoulder",oPC,2),1.0);
        DestroyObject(GetNearestObjectByTag("IllusionaryBoulder",oPC,3),0.0);
        DestroyObject(GetNearestObjectByTag("IllusionaryBoulder",oPC,4),1.0);
        DestroyObject(GetNearestObjectByTag("IllusionaryBoulder",oPC,5),0.0);
        DestroyObject(GetNearestObjectByTag("IllusionaryBoulder",oPC,6),1.0);
        DestroyObject(GetNearestObjectByTag("IllusionaryBoulder",oPC,7),0.0);
        DestroyObject(GetNearestObjectByTag("IllusionaryBoulder",oPC,8),1.0);
        DestroyObject(GetNearestObjectByTag("IllusionaryBoulder",oPC,9),0.0);
        PartyGotEntry("Illusion1",GetEnteringObject(),1000,"XP gained - illusion discovered");
       }
      }
     }
}

// Level 1 cleric, Wis 16, 2 Lore, 1 Search, 0 spot   = 2 + 16 +  4 +  2 = 24
// Level 3 Fighter, Wis 10, 4 Lore, 2 Search, 1 spot  = 6 + 10 +  8 +  4 + 1= 29
// Level 3 thief, Wis 10, 6 lore, 4 search, 2 spot    = 6 + 10 + 12 +  8 + 2 = 38
// level 5 Barbar, wis 9, lore 6, 3 search, 3 spot    =10 +  9 + 12 +  6 + 3 = 40
// level 6 bard, wis 13, lore 12, search 5, 2 spot    =12 + 13 + 24 + 10 + 2 = 61
// Level 7 paladin wis 15, lore 7, search 4, 3 spot   =14 + 15 + 14 +  8 + 3 = 54
