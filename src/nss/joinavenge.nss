#include "inc_mod"
void main()
{
  /////////////////////////////////////////////////////////////
  //This script will join a player into the Avenger's Faction//
  /////////////////////////////////////////////////////////////
  object oCur = GetFirstPC();
  object oPlayer = GetLastUsedBy();
  int nCurTeam = GetLocalInt(oCur,"nTeam");
  int nTeam1 = 0;
  int nTeam2 = 0;
  int nC1 = GetLevelByPosition(1,oPlayer);
  int nC2 = GetLevelByPosition(2,oPlayer);
  int nC3 = GetLevelByPosition(3,oPlayer);
  while (GetIsObjectValid(oCur) == TRUE) {
    if (nCurTeam == 1) {
       nTeam1 = nTeam1 + 1;
    } else if (nCurTeam == 2) {
       nTeam2 = nTeam2 + 1;
    }
    oCur = GetNextPC();
    nCurTeam = GetLocalInt(oCur,"nTeam");
  }
 {
      object oMaster = GetObjectByTag("mastervarkeeper");
      object oAvengeSpawn = GetObjectByTag("avenge_spawn");
      string sMSG = GetName(oPlayer) + " has joined the -=TBD=- Clan.";
      SpeakString(GetName(oPlayer) + " has joined the -=TBD=- Clan.", TALKVOLUME_SHOUT);
      SetLocalInt(oPlayer,"nTeam",2);
      SetLocalInt(oPlayer,"nFlag",0);
      AssignCommand(oPlayer,JumpToLocation(GetLocation(oAvengeSpawn)));
      BroadcastMessage(2,sMSG);
      AddPlayerToTeam(2,oPlayer);
      AdjustAlignment(oPlayer,ALIGNMENT_GOOD,100);
    }
  }
