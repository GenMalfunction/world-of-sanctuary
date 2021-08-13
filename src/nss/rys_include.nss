//::///////////////////////////////////////////////
//:: rys_include
//:: We ALL know that every good mod has an include
//:: file that makes it better than all those other
//:: mods that don't...
//::///////////////////////////////////////////////

//Returns the total number of players in the module
int GetTotalPlayers();
//Gets the number of players on each team
int GetTeamPlayers(int iTeam);
//Returns the team that oPlayer is on
int GetTeam(object oPlayer);
//Returns which team has more players
int GetMostPlayers();
//Takes care of all Ints and Effects when a player joins a team
void SetupTeam(object oPlayer, int iTeam);
//Checks which team oPlayerLeaving was on and reset LocalInt
void PlayerLeft(object oPlayer);
//Sets the dead pc's death var up 1, and the killer's kill var up 1
void ModScore(object oDeadPC);
//Destroys all of oPlayer's items and gold.... BWAHAHAHAHA
void ClearInventory(object oPlayer);
//Sets each PC's reputation with the other PC's
void ResetReputations(object oPlayer);
//Sets the new player w/ high score
void SetNewLeader(object oPlayer);
//Checks if oPlayer is at or above the kill count of the current leader
void CheckLeader(object oPlayer);
//Takes care of the custom tokens for the stats conversation
void SetTokens();
//Sends oPlayer to iTeam's start location
void JumpToTeam(object oPlayer, int iTeam);
//Tells oDeadPC who/what killed them
void TellKiller(object oDeadPC);
//Sends the same message to all PC's on the module
void SendMessageToAllPCs(string sMessage);
//Creates a custom scoreboard placeable and lets the user view all the current scores
void GetModuleStatus();
//Sets the current game being played to either CTF, PvP, or KOTH
void SetGame(int iGame);
//Jumps all players back to their team's starting area
void ReturnPlayers();
//Jumps oJumper to a waypoint with sWaypointTag
void JumpToWaypoint(object oJumper, string sWaypointTag);
//Resets each team's score to 0
void ResetTeamScores();
//Used when oPlayer uses iTeam's flag
void FlagUsed(object oPlayer, int iTeam);
//Used when oPlayer uses one of the KotH levers
void LeverUsed(object oPlayer);
//Creates 3 pull chains in each team's area, waits 30 seconds, and returns the game with the most votes
void InitiateVote();
//Returns the number of votes for iGame
int GetVotes(int iGame);
//Returns the game with the most amount of votes
int GetMostVotes();
//Returns the current game being played
int GetGame();
//Gets the best class of oPlayer
//Returns either: "Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Wizard", or "Error"
string GetBestClass(object oPlayer);
//Gives iGP to each member on iTeam
void GiveGoldToTeam(int iGP, int iTeam);
//Returns TRUE if eEffect is negative
int GetIsEffectBad(effect eEffect);

//Int vars for the team names
int RED = 142;
int BLUE = 124;
int TEAMS_EVEN = 167;
int ERROR = 176;

//Int vars for the game names
int CTF = 245;
int PVP = 247;
int KOTH = 249;
int GPVP = 251;

//Custom tokens (for reference only)
//100: Leader's name
//200: Leader's kills
//300: Full sentence (which team has more players)
//400: PCSpeaker's kills
//500: Full sentence (which team is leading)
//600: Returns the current game being played

int GetMostPlayers()
{
if ((GetLocalInt(GetModule(), "Red_Players")) > (GetLocalInt(GetModule(), "Blue_Players")))
  return RED;
else if ((GetLocalInt(GetModule(), "Blue_Players")) > (GetLocalInt(GetModule(), "Red_Players")))
  return BLUE;
else
  return TEAMS_EVEN;
}

int GetTeam(object oPlayer)
{
if (GetLocalString(oPlayer, "Team") == "Blue")
  return BLUE;
else if (GetLocalString(oPlayer, "Team") == "Red")
  return RED;
else
  return ERROR;
}

void SetupTeam(object oPlayer, int iTeam)
{
if (iTeam == BLUE)
 {
  SetLocalInt(GetModule(), "Blue_Players", (GetLocalInt(GetModule(), "Blue_Players") + 1));
  SetLocalString(oPlayer, "Team", "Blue");
  ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_FLAG_BLUE)), oPlayer);
  ResetReputations(oPlayer);
 }
if (iTeam == RED)
 {
  SetLocalInt(GetModule(), "Red_Players", (GetLocalInt(GetModule(), "Red_Players") + 1));
  SetLocalString(oPlayer, "Team", "Red");
  ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_FLAG_RED)), oPlayer);
  ResetReputations(oPlayer);
 }
else
 {
  WriteTimestampedLogEntry("Team setup failure.");
 }
}

void PlayerLeft(object oPlayer)
{
if (GetTeam(oPlayer) == RED)
 {
  SetLocalInt(GetModule(), "Red_Players", (GetLocalInt(GetModule(), "Red_Players") - 1));
  DeleteLocalInt(oPlayer, "Team");
 }
else if (GetTeam(oPlayer) == BLUE)
 {
  SetLocalInt(GetModule(), "Blue_Players", (GetLocalInt(GetModule(), "Blue_Players") - 1));
  DeleteLocalInt(oPlayer, "Team");
 }
else
 {
  WriteTimestampedLogEntry("PlayerLeft failure.");
 }
}

int GetTotalPlayers()
{
return GetTeamPlayers(RED) + GetTeamPlayers(BLUE);
}

int GetTeamPlayers(int iTeam)
{
if (iTeam == RED)
  return GetLocalInt(GetModule(), "Red_Players");
else if (iTeam == BLUE)
  return GetLocalInt(GetModule(), "Blue_Players");
else
  return 0;
}

void ModScore(object oDeadPC)
{
if ((GetIsObjectValid(oDeadPC)) && (GetIsPC(oDeadPC)))
 {
  if (GetIsPC(GetLastHostileActor(oDeadPC)))
   {
    SetLocalInt(oDeadPC, "Deaths", (GetLocalInt(oDeadPC, "Deaths") + 1));
    SetLocalInt(GetLastHostileActor(oDeadPC), "Kills", (GetLocalInt(GetLastHostileActor(oDeadPC), "Kills") + 1));
   }
  else return;
 }
else
 {
  WriteTimestampedLogEntry("SetScore failure.");
 }
}

void ClearInventory(object oPlayer)
{
if (GetIsObjectValid(oPlayer))
{
object oInvItem = GetFirstItemInInventory(oPlayer);
while (GetIsObjectValid(oInvItem))
 {
  DestroyObject(oInvItem);
  oInvItem = GetNextItemInInventory(oPlayer);
 }
//Lots of babble for the next 90 lines or so
object oSlot1 = GetItemInSlot(INVENTORY_SLOT_ARMS, oPlayer);
object oSlot2 = GetItemInSlot(INVENTORY_SLOT_BOLTS, oPlayer);
object oSlot3 = GetItemInSlot(INVENTORY_SLOT_ARROWS, oPlayer);
object oSlot4 = GetItemInSlot(INVENTORY_SLOT_BULLETS, oPlayer);
object oSlot5 = GetItemInSlot(INVENTORY_SLOT_BOOTS, oPlayer);
object oSlot6 = GetItemInSlot(INVENTORY_SLOT_BELT, oPlayer);
object oSlot7 = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPlayer);
object oSlot8 = GetItemInSlot(INVENTORY_SLOT_CHEST, oPlayer);
object oSlot9 = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPlayer);
object oSlot10 = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oPlayer);
object oSlot11 = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oPlayer);
object oSlot12 = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oPlayer);
object oSlot13 = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPlayer);
object oSlot14 = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPlayer);
object oSlot15 = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPlayer);
object oSlot16 = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPlayer);
object oSlot17 = GetItemInSlot(INVENTORY_SLOT_HEAD, oPlayer);
object oSlot18 = GetItemInSlot(INVENTORY_SLOT_NECK, oPlayer);
if (GetIsObjectValid(oSlot1))
 {
  DestroyObject(oSlot1);
 }
if (GetIsObjectValid(oSlot2))
 {
  DestroyObject(oSlot2);
 }
if (GetIsObjectValid(oSlot3))
 {
  DestroyObject(oSlot3);
 }
if (GetIsObjectValid(oSlot4))
 {
  DestroyObject(oSlot4);
 }
if (GetIsObjectValid(oSlot5))
 {
  DestroyObject(oSlot5);
 }
if (GetIsObjectValid(oSlot6))
 {
  DestroyObject(oSlot6);
 }
if (GetIsObjectValid(oSlot7))
 {
  DestroyObject(oSlot7);
 }
if (GetIsObjectValid(oSlot8))
 {
  DestroyObject(oSlot8);
 }
if (GetIsObjectValid(oSlot9))
 {
  DestroyObject(oSlot9);
 }
if (GetIsObjectValid(oSlot10))
 {
  DestroyObject(oSlot10);
 }
if (GetIsObjectValid(oSlot11))
 {
  DestroyObject(oSlot11);
 }
if (GetIsObjectValid(oSlot12))
 {
  DestroyObject(oSlot12);
 }
if (GetIsObjectValid(oSlot13))
 {
  DestroyObject(oSlot13);
 }
if (GetIsObjectValid(oSlot14))
 {
  DestroyObject(oSlot14);
 }
if (GetIsObjectValid(oSlot15))
 {
  DestroyObject(oSlot15);
 }
if (GetIsObjectValid(oSlot16))
 {
  DestroyObject(oSlot16);
 }
if (GetIsObjectValid(oSlot17))
 {
  DestroyObject(oSlot17);
 }
if (GetIsObjectValid(oSlot18))
 {
  DestroyObject(oSlot18);
 }
TakeGoldFromCreature(GetGold(oPlayer), oPlayer, TRUE);
DelayCommand(0.5, TakeGoldFromCreature(GetGold(oPlayer), oPlayer, TRUE));
}
else
 {
  WriteTimestampedLogEntry("ClearInventory failure.");
 }
}

void ResetReputations(object oPlayer)
{
    object oNextPC = GetFirstPC();
    int iTeam = GetTeam(oPlayer);
    int iNextPCTeam;
    while (GetIsObjectValid(oNextPC))
    {
        iNextPCTeam = GetTeam(oNextPC);
        if (iTeam == iNextPCTeam)
        {
            SetPCLike(oPlayer, oNextPC);
            SetPCLike(oNextPC, oPlayer);
        }
        else
        {
            SetPCDislike(oPlayer, oNextPC);
            SetPCDislike(oNextPC, oPlayer);
        }
        oNextPC = GetNextPC();
    }
}

void SetNewLeader(object oPlayer)
{
SetLocalString(GetModule(), "Leader_Name", GetName(oPlayer));
SetLocalInt(GetModule(), "Leader_Kills", GetLocalInt(oPlayer, "Kills"));
}

void CheckLeader(object oPlayer)
{
if (GetLocalInt(oPlayer, "Kills") > GetLocalInt(GetModule(), "Leader_Kills"))
 {
 SetNewLeader(oPlayer);
 }
else return;
}

void SetTokens()
{
if (GetLocalInt(GetModule(), "Leader_Kills") == 0)
 {
  SetCustomToken(100, "noone");
  SetCustomToken(200, IntToString(0));
 }
else
 {
  SetCustomToken(200, IntToString(GetLocalInt(GetModule(), "Leader_Kills")));
  SetCustomToken(100, GetLocalString(GetModule(), "Leader_Name"));
 }
if (GetMostPlayers() == RED)
 {
  SetCustomToken(300, "The red team has more players.");
 }
if (GetMostPlayers() == BLUE)
 {
  SetCustomToken(300, "The blue team has more players.");
 }
if (GetMostPlayers() == TEAMS_EVEN)
 {
  SetCustomToken(300, "Both teams are even.");
 }
SetCustomToken(400, IntToString(GetLocalInt(GetPCSpeaker(), "Kills")));
if (GetLocalInt(GetModule(), "Red_Score") > GetLocalInt(GetModule(), "Blue_Score"))
 {
  SetCustomToken(500, "The red team is leading with " + IntToString(GetLocalInt(GetModule(), "Red_Score")) + " points.");
 }
if (GetLocalInt(GetModule(), "Blue_Score") > GetLocalInt(GetModule(), "Red_Score"))
 {
  SetCustomToken(500, "The blue team is leading with " + IntToString(GetLocalInt(GetModule(), "Blue_Score")) + " points.");
 }
if (GetLocalInt(GetModule(), "Blue_Score") == GetLocalInt(GetModule(), "Red_Score"))
 {
  SetCustomToken(500, "Both teams are currently tied.");
 }
if (GetLocalInt(GetModule(), "Game") == PVP)
 {
  SetCustomToken(600, "Team PvP");
 }
else if (GetLocalInt(GetModule(), "Game") == CTF)
 {
  SetCustomToken(600, "Capture the Flag");
 }
else if (GetLocalInt(GetModule(), "Game") == KOTH)
 {
  SetCustomToken(600, "King of the Hill");
 }
else if (GetLocalInt(GetModule(), "Game") == GPVP)
 {
  SetCustomToken(600, "Free for All PvP");
 }
}

void JumpToTeam(object oPlayer, int iTeam)
{
if (iTeam == RED)
 {
  JumpToWaypoint(oPlayer, "Service_Red");
 }
else if (iTeam == BLUE)
 {
  JumpToWaypoint(oPlayer, "Service_Blue");
 }
}

void TellKiller(object oDeadPC)
{
SendMessageToPC(oDeadPC, ("Slain by " + GetName(GetLastHostileActor(oDeadPC)) + "."));
}

void SendMessageToAllPCs(string sMessage)
{
object oPC1 = GetFirstPC();
while (GetIsObjectValid(oPC1))
 {
 SendMessageToPC(oPC1, sMessage);
 oPC1 = GetNextPC();
 }
}

void GetModuleStatus()
{
 CreateObject(OBJECT_TYPE_PLACEABLE, "dmscoreboard", GetLocation(GetItemActivator()));
 DelayCommand(0.1, AssignCommand(GetObjectByTag("DM_SCORE"), ActionStartConversation(GetItemActivator(), "", TRUE)));
}

void SetGame(int iGame)
{
 if ((iGame == CTF) || (iGame == KOTH) || (iGame == PVP) || (iGame == GPVP))
  {
   if (iGame == CTF)
    {
     SetLocalInt(GetModule(), "Game", CTF);
    }
   else if (iGame == PVP)
    {
     SetLocalInt(GetModule(), "Game", PVP);
    }
   else if (iGame == KOTH)
    {
     SetLocalInt(GetModule(), "Game", KOTH);
    }
   else if (iGame == GPVP)
    {
     SetLocalInt(GetModule(), "Game", GPVP);
    }
   }
 else
  {
  WriteTimestampedLogEntry("SetGame failure.");
  }
}

void ReturnPlayers()
{
object oTargetPC = GetFirstPC();
if (GetLocalInt(GetModule(), "Game") == GPVP)
 {
  while (GetIsObjectValid(oTargetPC))
   {
    JumpToWaypoint(oTargetPC, "WP_ENTER_ARENA");
    oTargetPC = GetNextPC();
   }
 }
else
 {
while (GetIsObjectValid(oTargetPC))
 {
  if (GetTeam(oTargetPC) == RED)
   {
    JumpToTeam(oTargetPC, RED);
   }
  else if (GetTeam(oTargetPC) == BLUE)
   {
    JumpToTeam(oTargetPC, BLUE);
   }
  oTargetPC = GetNextPC();
 }
 }
if (GetLocalInt(oTargetPC, "Has_Flag") == 1)
 {
  if (GetTeam(oTargetPC) == RED)
   {
    CreateObject(OBJECT_TYPE_PLACEABLE, "blueteamsflag", GetLocation(GetWaypointByTag("WP_BLUEFLAG")));
   }
  else if (GetTeam(oTargetPC) == BLUE)
   {
    CreateObject(OBJECT_TYPE_PLACEABLE, "redteamsflag", GetLocation(GetWaypointByTag("WP_REDFLAG")));
   }
  effect eTarEff = GetFirstEffect(oTargetPC);
   while (GetIsEffectValid(eTarEff))
    {
     if (GetEffectSubType(eTarEff) == SUBTYPE_EXTRAORDINARY)
      {
       RemoveEffect(oTargetPC, eTarEff);
      }
     eTarEff = GetNextEffect(oTargetPC);
    }
 }
}

void JumpToWaypoint(object oJumper, string sWaypointTag)
{
AssignCommand(oJumper, JumpToLocation(GetLocation(GetWaypointByTag(sWaypointTag))));
}

void ResetTeamScores()
{
SetLocalInt(GetModule(), "Red_Score", 0);
SetLocalInt(GetModule(), "Blue_Score", 0);
}

void FlagUsed(object oPlayer, int iTeam)
{
 if (iTeam == RED)
  {
   if ((GetTeam(oPlayer) == RED) && (GetLocalInt(oPlayer, "Has_Flag") == 0))
    {
     SendMessageToPC(oPlayer, "You may not capture your own flag.");
    }
   else if ((GetTeam(oPlayer) == RED) && (GetLocalInt(oPlayer, "Has_Flag") == 1))
    {
     SendMessageToPC(oPlayer, "You have captured the blue team's flag!");
     GiveGoldToTeam(250, RED);
     CreateObject(OBJECT_TYPE_PLACEABLE, "blueteamsflag", GetLocation(GetWaypointByTag("WP_BLUEFLAG")));
     SetLocalInt(oPlayer, "Has_Flag", 0);
     SetLocalInt(GetModule(), "Red_Score", (GetLocalInt(GetModule(), "Red_Score") + 1));
     effect eEffect;
     eEffect = GetFirstEffect(oPlayer);
     while (GetIsEffectValid(eEffect))
     {
      if (GetEffectSubType(eEffect) == SUBTYPE_EXTRAORDINARY)
       {
        RemoveEffect(oPlayer, eEffect);
       }
      eEffect = GetNextEffect(oPlayer);
     }
    }
   else if (GetTeam(oPlayer) == BLUE)
    {
     SendMessageToPC(oPlayer, "You have taken the red team's flag!");
     SetLocalInt(oPlayer, "Has_Flag", 1);
     DestroyObject(OBJECT_SELF);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PARALYZED)), oPlayer);
    }
  }
 else if (iTeam == BLUE)
  {
   if ((GetTeam(oPlayer) == BLUE) && (GetLocalInt(oPlayer, "Has_Flag") == 0))
    {
     SendMessageToPC(oPlayer, "You may not capture your own flag.");
    }
   else if ((GetTeam(oPlayer) == BLUE) && (GetLocalInt(oPlayer, "Has_Flag") == 1))
    {
     SendMessageToPC(oPlayer, "You have captured the red team's flag!");
     GiveGoldToTeam(250, BLUE);
     CreateObject(OBJECT_TYPE_PLACEABLE, "redteamsflag", GetLocation(GetWaypointByTag("WP_REDFLAG")));
     SetLocalInt(GetModule(), "Blue_Score", (GetLocalInt(GetModule(), "Blue_Score") + 1));
     SetLocalInt(oPlayer, "Has_Flag", 0);
     effect eEffect;
     eEffect = GetFirstEffect(oPlayer);
     while (GetIsEffectValid(eEffect))
     {
      if (GetEffectSubType(eEffect) == SUBTYPE_EXTRAORDINARY)
       {
        RemoveEffect(oPlayer, eEffect);
       }
      eEffect = GetNextEffect(oPlayer);
     }
    }
   else if (GetTeam(oPlayer) == RED)
    {
     SendMessageToPC(oPlayer, "You have taken the blue teams' flag!");
     SetLocalInt(oPlayer, "Has_Flag", 1);
     DestroyObject(OBJECT_SELF);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT, ExtraordinaryEffect(EffectVisualEffect(VFX_DUR_PARALYZED)), oPlayer);
    }
  }
 else
  {
   WriteTimestampedLogEntry("FlagUsed failure.");
  }
}

void LeverUsed(object oPlayer)
{
 if (GetTeam(oPlayer) == BLUE)
  {
  if (GetLocalInt(GetModule(), "Blue_Levers") <= 1)
    {
     if ((GetLocalInt(GetObjectByTag(GetTag(OBJECT_SELF)), "Team") != BLUE) && (GetLocalInt(OBJECT_SELF, "Team") != RED))
      {
       SetLocalInt(GetObjectByTag(GetTag(OBJECT_SELF)), "Team", BLUE);
       SetLocalInt(GetModule(), "Blue_Levers", (GetLocalInt(GetModule(), "Blue_Levers") + 1));
       CreateObject(OBJECT_TYPE_PLACEABLE, "bluelight", GetLocation(OBJECT_SELF));
      }
     else if (GetLocalInt(GetObjectByTag(GetTag(OBJECT_SELF)), "Team") == RED)
      {
       SetLocalInt(GetModule(), "Red_Levers", (GetLocalInt(GetModule(), "Red_Levers") - 1));
       DestroyObject(GetNearestObjectByTag("redlight"));
       CreateObject(OBJECT_TYPE_PLACEABLE, "bluelight", GetLocation(OBJECT_SELF));
       DeleteLocalInt(OBJECT_SELF, "Team");
       SetLocalInt(OBJECT_SELF, "Team", BLUE);
       SetLocalInt(GetModule(), "Blue_Levers", (GetLocalInt(GetModule(), "Blue_Levers") + 1));
      }
     else if (GetLocalInt(GetObjectByTag(GetTag(OBJECT_SELF)), "Team") == BLUE)
      {
       SendMessageToPC(oPlayer, "Your team already has possession of this area.");
      }
    }
   else if (GetLocalInt(GetModule(), "Blue_Levers") == 2)
    {
     if (GetLocalInt(OBJECT_SELF, "Team") == BLUE)
      {
       return;
      }
     else
      {
     SendMessageToAllPCs("Blue team wins!");
     GiveGoldToTeam(250, BLUE);
     DelayCommand(1.0, ReturnPlayers());
     SetLocalInt(GetModule(), "Red_Levers", 0);
     SetLocalInt(GetModule(), "Blue_Levers", 0);
     SetLocalInt(GetModule(), "Blue_Score", (GetLocalInt(GetModule(), "Blue_Score") + 1));
     DeleteLocalInt(GetObjectByTag("lever1"), "Team");
     DeleteLocalInt(GetObjectByTag("lever2"), "Team");
     DeleteLocalInt(GetObjectByTag("lever3"), "Team");
     DestroyObject(GetNearestObjectByTag("redlight", OBJECT_SELF, 1));
     DestroyObject(GetNearestObjectByTag("redlight", OBJECT_SELF, 2));
     DestroyObject(GetNearestObjectByTag("redlight", OBJECT_SELF, 3));
     DestroyObject(GetNearestObjectByTag("bluelight", OBJECT_SELF, 1));
     DestroyObject(GetNearestObjectByTag("bluelight", OBJECT_SELF, 2));
     DestroyObject(GetNearestObjectByTag("bluelight", OBJECT_SELF, 3));
     }
    }
  }
 else if (GetTeam(oPlayer) == RED)
  {
   if (GetLocalInt(GetModule(), "Red_Levers") <= 1)
    {
     if ((GetLocalInt(GetObjectByTag(GetTag(OBJECT_SELF)), "Team") != RED) && (GetLocalInt(OBJECT_SELF, "Team") != BLUE))
      {
       SetLocalInt(GetObjectByTag(GetTag(OBJECT_SELF)), "Team", RED);
       SetLocalInt(GetModule(), "Red_Levers", (GetLocalInt(GetModule(), "Red_Levers") + 1));
       CreateObject(OBJECT_TYPE_PLACEABLE, "redlight", GetLocation(OBJECT_SELF));
      }
     else if (GetLocalInt(GetObjectByTag(GetTag(OBJECT_SELF)), "Team") == BLUE)
      {
       SetLocalInt(GetModule(), "Blue_Levers", (GetLocalInt(GetModule(), "Blue_Levers") - 1));
       DestroyObject(GetNearestObjectByTag("bluelight"));
       CreateObject(OBJECT_TYPE_PLACEABLE, "redlight", GetLocation(OBJECT_SELF));
       DeleteLocalInt(OBJECT_SELF, "Team");
       SetLocalInt(OBJECT_SELF, "Team", RED);
       SetLocalInt(GetModule(), "Red_Levers", (GetLocalInt(GetModule(), "Red_Levers") + 1));
      }
     else if (GetLocalInt(GetObjectByTag(GetTag(OBJECT_SELF)), "Team") == RED)
      {
       SendMessageToPC(oPlayer, "Your team already has possession of this area.");
      }
    }
   else if (GetLocalInt(GetModule(), "Red_Levers") == 2)
    {
     if (GetLocalInt(OBJECT_SELF, "Team") == RED)
      {
      return;
      }
     else
      {
     SendMessageToAllPCs("Red team wins!");
     GiveGoldToTeam(250, RED);
     DelayCommand(1.0, ReturnPlayers());
     SetLocalInt(GetModule(), "Red_Levers", 0);
     SetLocalInt(GetModule(), "Blue_Levers", 0);
     SetLocalInt(GetModule(), "Red_Score", (GetLocalInt(GetModule(), "Red_Score") + 1));
     DeleteLocalInt(GetObjectByTag("lever1"), "Team");
     DeleteLocalInt(GetObjectByTag("lever2"), "Team");
     DeleteLocalInt(GetObjectByTag("lever3"), "Team");
     DestroyObject(GetNearestObjectByTag("redlight", GetObjectByTag("lever1"), 1));
     DestroyObject(GetNearestObjectByTag("redlight", GetObjectByTag("lever2"), 1));
     DestroyObject(GetNearestObjectByTag("redlight", GetObjectByTag("lever3"),1));
     DestroyObject(GetNearestObjectByTag("bluelight", GetObjectByTag("lever1"), 1));
     DestroyObject(GetNearestObjectByTag("bluelight", GetObjectByTag("lever2"), 1));
     DestroyObject(GetNearestObjectByTag("bluelight", GetObjectByTag("lever3"), 1));
     }
    }
  }
 else
  {
   WriteTimestampedLogEntry("LeverUsed failure.");
  }
}

void InitiateVote()
{
 location lMasterLever;
 CreateObject(OBJECT_TYPE_PLACEABLE, "pvpchain", GetLocation(GetWaypointByTag("WP_BLUEVOTEPVP")));
 CreateObject(OBJECT_TYPE_PLACEABLE, "ctfchain", GetLocation(GetWaypointByTag("WP_BLUEVOTECTF")));
 CreateObject(OBJECT_TYPE_PLACEABLE, "kothchain", GetLocation(GetWaypointByTag("WP_BLUEVOTEKOTH")));
 CreateObject(OBJECT_TYPE_PLACEABLE, "gpvpchain", GetLocation(GetWaypointByTag("WP_BLUEVOTEGPVP")));
 CreateObject(OBJECT_TYPE_PLACEABLE, "pvpchain", GetLocation(GetWaypointByTag("WP_REDVOTEPVP")));
 CreateObject(OBJECT_TYPE_PLACEABLE, "ctfchain", GetLocation(GetWaypointByTag("WP_REDVOTECTF")));
 CreateObject(OBJECT_TYPE_PLACEABLE, "kothchain", GetLocation(GetWaypointByTag("WP_REDVOTEKOTH")));
 CreateObject(OBJECT_TYPE_PLACEABLE, "gpvpchain", GetLocation(GetWaypointByTag("WP_REDVOTEGPVP")));
 CreateObject(OBJECT_TYPE_PLACEABLE, "pvpchain", GetLocation(GetWaypointByTag("WP_GVOTEPVP")));
 CreateObject(OBJECT_TYPE_PLACEABLE, "ctfchain", GetLocation(GetWaypointByTag("WP_GVOTECTF")));
 CreateObject(OBJECT_TYPE_PLACEABLE, "kothchain", GetLocation(GetWaypointByTag("WP_GVOTEKOTH")));
 CreateObject(OBJECT_TYPE_PLACEABLE, "gpvpchain", GetLocation(GetWaypointByTag("WP_GVOTEGPVP")));
 SendMessageToAllPCs("Voting is now open, please vote quickly. The game master may end the voting at any time.");
 DelayCommand(1.0, ReturnPlayers());
 object oMaster = GetFirstPC();
 while (GetIsObjectValid(oMaster))
  {
   if (GetLocalInt(oMaster, "Me_Master") == 1)
    {
     lMasterLever = GetLocation(oMaster);
    }
   oMaster = GetNextPC();
  }
 CreateObject(OBJECT_TYPE_PLACEABLE, "masterlever", lMasterLever);
 SetLocalInt(GetModule(), "Voting", 1);
}

int GetVotes(int iGame)
{
if (iGame == PVP)
  return GetLocalInt(GetModule(), "PVP_VOTES");
if (iGame == CTF)
  return GetLocalInt(GetModule(), "CTF_VOTES");
if (iGame == KOTH)
  return GetLocalInt(GetModule(), "KOTH_VOTES");
if (iGame == GPVP)
  return GetLocalInt(GetModule(), "GPVP_VOTES");
else
  return ERROR;
}

int GetMostVotes()
{
if ((GetVotes(PVP) >= GetVotes(CTF)) && (GetVotes(PVP) >= GetVotes(KOTH)) && (GetVotes(PVP) > GetVotes(GPVP)))
  return PVP;
if ((GetVotes(CTF) > GetVotes(PVP)) && (GetVotes(CTF) > GetVotes(KOTH)) && (GetVotes(CTF) > GetVotes(GPVP)))
  return CTF;
if ((GetVotes(KOTH) > GetVotes(PVP)) && (GetVotes(KOTH) > GetVotes(CTF)) && (GetVotes(KOTH) > GetVotes(GPVP)))
  return KOTH;
if ((GetVotes(GPVP) > GetVotes(PVP)) && (GetVotes(GPVP) > GetVotes(KOTH)) && (GetVotes(GPVP) > GetVotes(CTF)))
  return GPVP;
else
  return ERROR;
}

int GetGame()
{
return GetLocalInt(GetModule(), "Game");
}

/////WARNING: -VERY- LONG FUNCTION//////
string GetBestClass(object oPlayer)
{
int iPos1 = GetLevelByPosition(1, oPlayer);
int iPos2 = GetLevelByPosition(2, oPlayer);
int iPos3 = GetLevelByPosition(3, oPlayer);
int iTotal = GetHitDice(oPlayer);
int iClass1 = GetClassByPosition(1, oPlayer);
int iClass2 = GetClassByPosition(2, oPlayer);
int iClass3 = GetClassByPosition(3, oPlayer);
/////////////////////////////////////////////////////////
//////////////Pure, Single-Classed PC////////////////////
/////////////////////////////////////////////////////////
if ((iPos1 >= 1) && (iPos2 == 0) && (iPos3 == 0))
 {
  if (iClass1 == CLASS_TYPE_BARBARIAN)
   {
    return "Barbarian";
   }
  else if (iClass1 == CLASS_TYPE_BARD)
   {
    return "Bard";
   }
  else if (iClass1 == CLASS_TYPE_CLERIC)
   {
    return "Cleric";
   }
  else if (iClass1 == CLASS_TYPE_DRUID)
   {
    return "Druid";
   }
  else if (iClass1 == CLASS_TYPE_FIGHTER)
   {
    return "Fighter";
   }
  else if (iClass1 == CLASS_TYPE_MONK)
   {
    return "Monk";
   }
  else if (iClass1 == CLASS_TYPE_PALADIN)
   {
    return "Paladin";
   }
  else if (iClass1 == CLASS_TYPE_RANGER)
   {
    return "Ranger";
   }
  else if (iClass1 == CLASS_TYPE_ROGUE)
   {
    return "Rogue";
   }
  else if (iClass1 == CLASS_TYPE_SORCERER)
   {
    return "Sorcerer";
   }
  else if (iClass1 == CLASS_TYPE_WIZARD)
   {
    return "Wizard";
   }
  else
   {
    return "Error";
   }
 }
/////////////////////////////////////////////////////////
/////////////////////Bi-Classed PC///////////////////////
/////////////////////////////////////////////////////////
else if ((iPos1 >= 1) && (iPos2 >= 1) && (iPos3 == 0))
{
 if (iPos1 >= iPos2)
  {
   if (iClass1 == CLASS_TYPE_BARBARIAN)
   {
    return "Barbarian";
   }
  else if (iClass1 == CLASS_TYPE_BARD)
   {
    return "Bard";
   }
  else if (iClass1 == CLASS_TYPE_CLERIC)
   {
    return "Cleric";
   }
  else if (iClass1 == CLASS_TYPE_DRUID)
   {
    return "Druid";
   }
  else if (iClass1 == CLASS_TYPE_FIGHTER)
   {
    return "Fighter";
   }
  else if (iClass1 == CLASS_TYPE_MONK)
   {
    return "Monk";
   }
  else if (iClass1 == CLASS_TYPE_PALADIN)
   {
    return "Paladin";
   }
  else if (iClass1 == CLASS_TYPE_RANGER)
   {
    return "Ranger";
   }
  else if (iClass1 == CLASS_TYPE_ROGUE)
   {
    return "Rogue";
   }
  else if (iClass1 == CLASS_TYPE_SORCERER)
   {
    return "Sorcerer";
   }
  else if (iClass1 == CLASS_TYPE_WIZARD)
   {
    return "Wizard";
   }
  else
   {
    return "Error";
   }
  }
 else if (iPos2 > iPos1)
  {
  if (iClass2 == CLASS_TYPE_BARBARIAN)
   {
    return "Barbarian";
   }
  else if (iClass2 == CLASS_TYPE_BARD)
   {
    return "Bard";
   }
  else if (iClass2 == CLASS_TYPE_CLERIC)
   {
    return "Cleric";
   }
  else if (iClass2 == CLASS_TYPE_DRUID)
   {
    return "Druid";
   }
  else if (iClass2 == CLASS_TYPE_FIGHTER)
   {
    return "Fighter";
   }
  else if (iClass2 == CLASS_TYPE_MONK)
   {
    return "Monk";
   }
  else if (iClass2 == CLASS_TYPE_PALADIN)
   {
    return "Paladin";
   }
  else if (iClass2 == CLASS_TYPE_RANGER)
   {
    return "Ranger";
   }
  else if (iClass2 == CLASS_TYPE_ROGUE)
   {
    return "Rogue";
   }
  else if (iClass2 == CLASS_TYPE_SORCERER)
   {
    return "Sorcerer";
   }
  else if (iClass2 == CLASS_TYPE_WIZARD)
   {
    return "Wizard";
   }
  else
   {
    return "Error";
   }
  }
 else
  {
  return "Error";
  }
}
/////////////////////////////////////////////////////////
///////////////////Tri-Classed PC////////////////////////
/////////////////////////////////////////////////////////
else if ((iPos1 >= 1) && (iPos3 >= 1) && (iPos3 >= 1))
{
 if ((iPos1 >= iPos2) && (iPos1 >= iPos3))
  {
  if (iClass1 == CLASS_TYPE_BARBARIAN)
   {
    return "Barbarian";
   }
  else if (iClass1 == CLASS_TYPE_BARD)
   {
    return "Bard";
   }
  else if (iClass1 == CLASS_TYPE_CLERIC)
   {
    return "Cleric";
   }
  else if (iClass1 == CLASS_TYPE_DRUID)
   {
    return "Druid";
   }
  else if (iClass1 == CLASS_TYPE_FIGHTER)
   {
    return "Fighter";
   }
  else if (iClass1 == CLASS_TYPE_MONK)
   {
    return "Monk";
   }
  else if (iClass1 == CLASS_TYPE_PALADIN)
   {
    return "Paladin";
   }
  else if (iClass1 == CLASS_TYPE_RANGER)
   {
    return "Ranger";
   }
  else if (iClass1 == CLASS_TYPE_ROGUE)
   {
    return "Rogue";
   }
  else if (iClass1 == CLASS_TYPE_SORCERER)
   {
    return "Sorcerer";
   }
  else if (iClass1 == CLASS_TYPE_WIZARD)
   {
    return "Wizard";
   }
  else
   {
    return "Error";
   }
  }
 else if ((iPos2 >= iPos1) && (iPos2 >= iPos3))
  {
  if (iClass2 == CLASS_TYPE_BARBARIAN)
   {
    return "Barbarian";
   }
  else if (iClass2 == CLASS_TYPE_BARD)
   {
    return "Bard";
   }
  else if (iClass2 == CLASS_TYPE_CLERIC)
   {
    return "Cleric";
   }
  else if (iClass2 == CLASS_TYPE_DRUID)
   {
    return "Druid";
   }
  else if (iClass2 == CLASS_TYPE_FIGHTER)
   {
    return "Fighter";
   }
  else if (iClass2 == CLASS_TYPE_MONK)
   {
    return "Monk";
   }
  else if (iClass2 == CLASS_TYPE_PALADIN)
   {
    return "Paladin";
   }
  else if (iClass2 == CLASS_TYPE_RANGER)
   {
    return "Ranger";
   }
  else if (iClass2 == CLASS_TYPE_ROGUE)
   {
    return "Rogue";
   }
  else if (iClass2 == CLASS_TYPE_SORCERER)
   {
    return "Sorcerer";
   }
  else if (iClass2 == CLASS_TYPE_WIZARD)
   {
    return "Wizard";
   }
  else
   {
    return "Error";
   }
  }
 else if ((iPos3 >= iPos1) && (iPos3 >= iPos2))
  {
  if (iClass3 == CLASS_TYPE_BARBARIAN)
   {
    return "Barbarian";
   }
  else if (iClass3 == CLASS_TYPE_BARD)
   {
    return "Bard";
   }
  else if (iClass3 == CLASS_TYPE_CLERIC)
   {
    return "Cleric";
   }
  else if (iClass3 == CLASS_TYPE_DRUID)
   {
    return "Druid";
   }
  else if (iClass3 == CLASS_TYPE_FIGHTER)
   {
    return "Fighter";
   }
  else if (iClass3 == CLASS_TYPE_MONK)
   {
    return "Monk";
   }
  else if (iClass3 == CLASS_TYPE_PALADIN)
   {
    return "Paladin";
   }
  else if (iClass3 == CLASS_TYPE_RANGER)
   {
    return "Ranger";
   }
  else if (iClass3 == CLASS_TYPE_ROGUE)
   {
    return "Rogue";
   }
  else if (iClass3 == CLASS_TYPE_SORCERER)
   {
    return "Sorcerer";
   }
  else if (iClass3 == CLASS_TYPE_WIZARD)
   {
    return "Wizard";
   }
  else
   {
    return "Error";
   }
  }
 else
  {
   return "Error";
  }
}
else
 {
  return "Error";
 }
}

void GiveGoldToTeam(int iGP, int iTeam)
{
 object oTeamMember = GetFirstPC();
 while (GetIsObjectValid(oTeamMember))
  {
   if (GetTeam(oTeamMember) == iTeam)
    {
     GiveGoldToCreature(oTeamMember, iGP);
    }
   oTeamMember = GetNextPC();
  }
}

int GetIsEffectBad(effect eEffect)
{
if ((GetEffectType(eEffect) == EFFECT_TYPE_ABILITY_DECREASE) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_AC_DECREASE) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_ATTACK_DECREASE) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_CURSE) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_DAMAGE_DECREASE) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_DEAF) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_DISEASE) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_MISS_CHANCE) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_NEGATIVELEVEL) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_MOVEMENT_SPEED_DECREASE) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_POISON) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_SAVING_THROW_DECREASE) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_SILENCE) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_SLOW) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_SKILL_DECREASE) ||
      (GetEffectType(eEffect) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE))
   {
   return TRUE;
   }
else
 {
  return FALSE;
 }
}
