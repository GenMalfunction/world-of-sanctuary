//::///////////////////////////////////////////////
//:: Name  inc_team
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Ok I admit I took this script from a different game ;)
   didn't have the time to make on of my own
   I modified it a bit to work in this game (SoF)
   Thx to his maker (script from NWN tactics)
*/
//:://////////////////////////////////////////////
//:: Created By: I do no  // modified by Big_A3
//:: Created On: 06/01/2004
//:://////////////////////////////////////////////

// Player Constants
float RESPAWN_TIMER = 12.0;

// Team Constants
int TEAM_NONE = 0;
int TEAM_BLUE = 1;
int TEAM_RED = 2;
int NUM_TEAMS = 2;
string SZ_TEAM_BLUE = "Non_Drow";//"Blue";
string SZ_TEAM_RED = "Drow";//"Red";

// Team Functions
int      AddPlayerToTeam( int nTeam, object oPlayer );
int      GetPlayerTeam( object oPlayer);
string   GetTeamName( int nTeam);
int      ChooseTeam(object oPlayer);
void     BuildParty(int nTeam, object oPlayer);
void     SetTeamLeader(int nTeam, object oPlayer);
object   GetTeamLeader(int nTeam);
void     RemovePlayerFromTeam(int nTeam, object oPlayer);


// Game Initialization Functions
void InitializeModule();
void RestartModule();
void IntializePlayerForGame( object oPlayer );

// Game Specific Functionality
void    RemoveAllEffects( object oPlayer );
void    BroadcastMessage( string sMessage, int nTeam = 0);
void    MovePlayerToSpawn( object oPlayer);
void    MoveMeToLocation (location lLoc);
int     GetIsEnemyTeam (object oTarget, object oMe);
void    IncrementTeamCount(int nTeam, int nAdjust);
int     GetTeamCount(int nTeam);
void    RespawnPlayer(object oPlayer);
void    CapturePoint(object oPoint, object oPlayer);
void    ContestedPoint(object oPoint);
int     GetIsCaptureValid(object oPoint, int nTeam);
void    AdjustTeamCaptures(int nTeam, int nAdjust);
int     GetTeamCaptures(int nTeam);
void    MovePlayerToHQ( object oPlayer);

// Game State Functionality
void SetGameStarted( int bGameStarted );
int  GetGameStarted();
void StartGame();
void EndTheGame(int bRestarting = FALSE);
void IncrementNumGamesPlayed();
void RewardWinningTeam(int nTeam);
void AddTeamScore(int nTeam, int nScore = 1);
void AddPlayerScore(object oPlayer, int nScore);


//////////////////////////////////////////////////////////////
// InitializeModule()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jul/08/02
// Description: Initialize the module at start.
//////////////////////////////////////////////////////////////
void InitializeModule()
{

}


//////////////////////////////////////////////////////////////
// RestartModule()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jul/02/02
// Description: Restart the module.
//////////////////////////////////////////////////////////////
/*
void RestartModule()
{
    EndTheGame(TRUE);
}
*/

//////////////////////////////////////////////////////////////
// GetPlayerTeam()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Returns the team of the specified player.
//////////////////////////////////////////////////////////////
int GetPlayerTeam( object oPlayer )
{
    return GetLocalInt(oPlayer,"nTeam");
}


//////////////////////////////////////////////////////////////
// RemoveAllEffects()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/09/02
// Description: Removes all non-permanent/innate/equipped
//              effects from the specified player.
//////////////////////////////////////////////////////////////
void RemoveAllEffects( object oPlayer )
{
    effect eEffect;
    eEffect = GetFirstEffect(oPlayer);

    while ( GetIsEffectValid(eEffect) == TRUE )
    {
        if ( GetEffectDurationType(eEffect) == DURATION_TYPE_TEMPORARY ||
             GetEffectDurationType(eEffect) == DURATION_TYPE_PERMANENT )
        {
            RemoveEffect(oPlayer,eEffect);
        }

        eEffect = GetNextEffect(oPlayer);
    }
}


//////////////////////////////////////////////////////////////
// BroadcastMessage()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jun/27/02
// Description: Send message to all PCs, or to specific team.
//
//////////////////////////////////////////////////////////////
void BroadcastMessage(string sMessage, int nTeam)
{
    object oPlayer;

    oPlayer = GetFirstPC();
    while ( GetIsObjectValid(oPlayer) == TRUE )
    {
        if (nTeam == 0 || nTeam == GetLocalInt(oPlayer, "nTeam"))
        {
            SendMessageToPC(oPlayer,sMessage);
        }
        oPlayer = GetNextPC();
    }
}


//////////////////////////////////////////////////////////////
// GetTeamName()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jun/27/02
// Description: Returns the team name.
//
//////////////////////////////////////////////////////////////
string GetTeamName( int nTeam )
{
    if (nTeam == TEAM_BLUE)
    {
        return SZ_TEAM_BLUE;
    }
    else if (nTeam == TEAM_RED)
    {
        return SZ_TEAM_RED;
    }
    else
    {
        return "None";
    }
}


//////////////////////////////////////////////////////////////
// AddPlayerToTeam()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Modified By: Erich Delcamp
// Created On: Jun/09/02
// Description: Adds a player to the specified team.
//////////////////////////////////////////////////////////////
void AddPlayerToTeam( int nTeam, object oPlayer )
{

    // Loop through all other players in the game
    // and set up the likes/dislikes appropriately.
    object oPC;

    SetLocalInt(oPlayer, "nTeam", nTeam);
    oPC = GetFirstPC();
    while ( GetIsObjectValid(oPC) == TRUE )
    {
        if ( oPC != oPlayer )
        {
            if ( GetPlayerTeam(oPC) == nTeam )
            {
                SetPCLike(oPlayer,oPC);
                SetPCLike(oPC,oPlayer);
            }
            else
            {
                SetPCDislike(oPlayer,oPC);
                SetPCDislike(oPC,oPlayer);
            }
        }

        oPC = GetNextPC();
    }

    //BroadcastMessage(GetName(oPlayer) + " joined " + GetTeamName(nTeam) + ".");
    IncrementTeamCount(nTeam, 1);
    BuildParty(nTeam, oPlayer);
    SetLocalInt(oPC, "nScore", 0);
}


//////////////////////////////////////////////////////////////
// RemovePlayerFromTeam()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jul/01/02
// Description: Remove a player to the specified team.
//////////////////////////////////////////////////////////////
void RemovePlayerFromTeam(int nTeam, object oPlayer)
{
    object oLeader = GetTeamLeader(nTeam);

    if (oPlayer == oLeader)
    {
        oLeader = GetFactionLeader(oPlayer);
        oLeader = GetNextFactionMember(oPlayer, TRUE);
        SetTeamLeader(nTeam, oLeader);
    }
    RemoveFromParty(oPlayer);
    IncrementTeamCount(nTeam, -1);
    SetLocalInt(oPlayer, "nTeam", TEAM_NONE);
}



//////////////////////////////////////////////////////////////
// BuildParty()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jul/01/02
// Description: Create party if there is none, or add a new
//              player to the party.
//
//////////////////////////////////////////////////////////////
void BuildParty(int nTeam, object oPlayer)
{
    if (GetTeamCount(nTeam) == 1)
    {
    // This player is the first on the team.
        SetTeamLeader(nTeam, oPlayer);
    }
    else
    {
        if (GetIsObjectValid(GetTeamLeader(nTeam)) == TRUE &&
            GetPlayerTeam(GetTeamLeader(nTeam)) == nTeam)
        {
            // This player is not the first.
            AddToParty(oPlayer, GetTeamLeader(nTeam));
        }
        else
        // The team is broken somehow, probably because the team leader has left
        // or switched sides.
        {
            SetTeamLeader(nTeam, OBJECT_INVALID);
            object oPC = GetFirstPC();
            while (GetIsObjectValid(oPC))
            {
                if (GetPlayerTeam(oPC) == nTeam)
                {
                    RemoveFromParty(oPC);
                    if (GetIsObjectValid(GetTeamLeader(nTeam)) == FALSE)
                    {
                        SetTeamLeader(nTeam, oPC);
                    }
                    else
                    {
                        AddToParty(oPC, GetTeamLeader(nTeam));
                    }
                }
                oPC = GetNextPC();
            }
        }
    }
}


//////////////////////////////////////////////////////////////
// GetTeamLeader()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jul/01/02
// Description: Get the team leader.
//
//////////////////////////////////////////////////////////////
object GetTeamLeader(int nTeam)
{
    object oResult = GetLocalObject(GetModule(), "oTeamLeader_" + IntToString(nTeam));

    return oResult;
}

//////////////////////////////////////////////////////////////
// SetTeamLeader()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jul/01/02
// Description: Set the team leader.
//
//////////////////////////////////////////////////////////////
void SetTeamLeader(int nTeam, object oPlayer)
{
    SetLocalObject(GetModule(), "oTeamLeader_" + IntToString(nTeam), oPlayer);
}


//////////////////////////////////////////////////////////////
// ChooseTeam()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jun/27/02
// Description: Selects a team for the player based on the
//              number of players on each team.
//              In desperate need of a rewrite, now that I
//              track team counts.
//////////////////////////////////////////////////////////////
void ChooseTeam( object oPC )
{
    int nBlue = GetTeamCount(TEAM_BLUE);
    int nRed = GetTeamCount(TEAM_RED);

    if (nRed > nBlue)
    {
        AddPlayerToTeam(TEAM_BLUE, oPC);

    }
    else if (nBlue > nRed)
    {
        AddPlayerToTeam(TEAM_RED, oPC);
    }
    else
    {
        AddPlayerToTeam(d2(), oPC);
    }

}


//////////////////////////////////////////////////////////////
// InitializePlayerForGame()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Modified By: Erich Delcamp
// Created On: Jun/09/02
// Description: Initializes the player with a team and sets
//              up the base statistics values for that player.
//////////////////////////////////////////////////////////////

void InitializePlayerForGame( object oPlayer )
{
    PrintString("Selecting a team for player: " + GetName(oPlayer));
    ChooseTeam(oPlayer);

    SetLocalInt(oPlayer, "nScore", 0);
    SetLocalInt(oPlayer, "nKills", 0);
    SetLocalInt(oPlayer, "nDeaths", 0);

}


//////////////////////////////////////////////////////////////
// MovePlayerToSpawn()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jul/09/02
// Description: Moves player to team spawn point.
//              This will change depending on game state and
//              Team Captures.
//////////////////////////////////////////////////////////////
void MovePlayerToSpawn( object oPlayer)
{
    int nTeam = GetPlayerTeam(oPlayer);
    int nSpawnNumber = 0;
    location lSpawn;
    object oSpawnPoint;

    if (nTeam == TEAM_NONE)
    {
        lSpawn = GetStartingLocation();
    }
    else if (GetGameStarted() == TRUE)
    {
        if (nTeam == TEAM_RED)
        {
            nSpawnNumber = GetTeamCaptures(nTeam);
            if (nSpawnNumber == 0)
            {
                nSpawnNumber = 1;
            }
        }
        else
        {
            nSpawnNumber = 7 - GetTeamCaptures(nTeam);
            if (nSpawnNumber == 7)
            {
                nSpawnNumber = 6;
            }
        }
    }
    else
    {
        // SpawnPoint_7 is TEAM_BLUE's HQ.
        // SpawnPoint_8 is TEAM_RED's HQ.
        nSpawnNumber = 6 + nTeam;
    }

    if (nSpawnNumber > 0)
    {
        oSpawnPoint = GetObjectByTag("SpawnPoint_" + IntToString(nSpawnNumber));
        lSpawn = GetLocation(oSpawnPoint);
    }

    AssignCommand(oPlayer, MoveMeToLocation(lSpawn));

}


//////////////////////////////////////////////////////////////
// MoveMeToLocation()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Modified By: Erich Delcamp
// Created On: Jun/14/02
// Description: Moves this creature to their designated start
//              location.
//////////////////////////////////////////////////////////////
void MoveMeToLocation( location lLoc )
{
    ClearAllActions();
    JumpToLocation(lLoc);
    ActionDoCommand(SetCommandable(TRUE));
    SetCommandable(FALSE);
}


//////////////////////////////////////////////////////////////
// GetIsEnemyTeam()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jun/30/02
// Description: Returns TRUE if PC is not on source's
//              team, or if source has a hostile reaction.
//////////////////////////////////////////////////////////////
int GetIsEnemyTeam(object oTarget, object oMe)
{
    int nTargetTeam = GetPlayerTeam(oTarget);
    int nMyTeam = GetPlayerTeam(oMe);

    if (GetIsPC(oTarget))
    {
        if (nTargetTeam != nMyTeam)
        {
            return TRUE;
        }
        return FALSE;
    }
    else
    {
        if (GetIsReactionTypeHostile(oTarget, oMe))
        {
            return TRUE;
        }
        return FALSE;
    }
}


//////////////////////////////////////////////////////////////
// IncrementTeamCount()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jul/01/02
// Description: Add or subtract a team member.
//
//////////////////////////////////////////////////////////////
void IncrementTeamCount(int nTeam, int nAdjust)
{
    string szTeamCountVar = "nTeamCount_" + IntToString(nTeam);
    int nCurrentCount = GetLocalInt(GetModule(), szTeamCountVar);

    nCurrentCount += nAdjust;
    SetLocalInt(GetModule(), szTeamCountVar, nCurrentCount);
}


//////////////////////////////////////////////////////////////
// GetTeamCount()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jul/01/02
// Description: Get the number of players on a team.
//
//////////////////////////////////////////////////////////////
int GetTeamCount(int nTeam)
{
    int nResult = GetLocalInt(GetModule(), "nTeamCount_" + IntToString(nTeam));

    return nResult;
}


//////////////////////////////////////////////////////////////
// AddTeamScore()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jun/30/02
// Description: Add points to one team's score.
//////////////////////////////////////////////////////////////
void AddTeamScore(int nTeam, int nScore)
{
    string szScoreVar = "nScore_" + IntToString(nTeam);
    int nCurrentScore = GetLocalInt(GetModule(), szScoreVar);

    nCurrentScore += nScore;
    SetLocalInt(GetModule(), szScoreVar, nCurrentScore);
}


//////////////////////////////////////////////////////////////
// AddPlayerScore()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jun/30/02
// Description: Add points to one player's score.
//////////////////////////////////////////////////////////////
void AddPlayerScore(object oPlayer, int nScore)
{
    int nCurrentScore = GetLocalInt(oPlayer, "nScore") + nScore;

    SetLocalInt(oPlayer, "nScore", nCurrentScore);
}


//////////////////////////////////////////////////////////////
// EndTheGame()
//////////////////////////////////////////////////////////////
// Created By: Erich Delcamp
// Created On: Jun/30/02
// Description: Report the scores, reset everything.
//////////////////////////////////////////////////////////////
/*
void EndTheGame(int bRestarting)
{
    object oPlayer;
    int nBestScore = -1;
    int nBlueCaps = GetTeamCaptures(TEAM_BLUE);
    int nRedCaps = GetTeamCaptures(TEAM_RED);
    int nPointNum;

    if (bRestarting == TRUE)
    {
        // StartNewModule("module name");
    }
    else
    {
        // Advance the time to 4am.
        SetTime(4, 0, 0, 0);
        SetLocalInt(GetModule(), "nStartWarning", 0);
        // Lock the HQ doors until the next round.
        SetGameStarted(FALSE);
        // Add a point to the winning team's score.
        if (nBlueCaps > nRedCaps)
        {
            AddTeamScore(TEAM_BLUE);
        }
        else
        {
            AddTeamScore(TEAM_RED);
        }

        // Move players to their HQ and make an announcement.
        oPlayer = GetFirstPC();
        while (GetIsObjectValid(oPlayer) == TRUE)
        {
            if (GetPlayerTeam(oPlayer) != TEAM_NONE)
            {
                SendMessageToPC(oPlayer, "+-------------------------+");
                RemoveAllEffects(oPlayer);
                MovePlayerToHQ(oPlayer);
                if ((GetPlayerTeam(oPlayer) == TEAM_BLUE && nBlueCaps > nRedCaps) ||
                    (GetPlayerTeam(oPlayer) == TEAM_RED && nRedCaps > nBlueCaps))
                {
                    AssignCommand(oPlayer, PlayVoiceChat(VOICE_CHAT_CHEER));
                    SendMessageToPC(oPlayer, "Your team won the round!");
                }
                else
                {
                    AssignCommand(oPlayer, PlayVoiceChat(VOICE_CHAT_CUSS));
                    SendMessageToPC(oPlayer, "Your team lost the round!");
                }
                SendMessageToPC(oPlayer, "Blue score: " + IntToString(GetLocalInt(GetModule(), "nScore_1")));
                SendMessageToPC(oPlayer, "Red score: " + IntToString(GetLocalInt(GetModule(), "nScore_2")));
                SendMessageToPC(oPlayer, "+-------------------------+");
            }
            oPlayer = GetNextPC();
        }

        // Clear all the captured points.
        for (nPointNum = 1; nPointNum < 6; nPointNum++)
        {
            ContestedPoint(GetObjectByTag("CapturePoint_" + IntToString(nPointNum)));
        }
    }
}
*/


//::///////////////////////////////////////////////
//:: StartGame()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start a new round.
*/
//:://////////////////////////////////////////////
//:: Created By: Erich Delcamp
//:: Created On: Jul/09/02
//:://////////////////////////////////////////////
/*
void StartGame()
{
}


//::///////////////////////////////////////////////
//:: RespawnPlayer()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Resurrect the player and send him to his
    spawn point.
*/
//:://////////////////////////////////////////////
//:: Created By: Erich Delcamp
//:: Created On: Jul/09/02
//:://////////////////////////////////////////////

/*
void RespawnPlayer(object oPlayer)
{
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPlayer);
    MovePlayerToSpawn(oPlayer);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oPlayer)), oPlayer);
}


//::///////////////////////////////////////////////
//:: CapturePoint()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set control of a point.
*/
//:://////////////////////////////////////////////
//:: Created By: Erich Delcamp
//:: Created On: Jul/09/02
//:://////////////////////////////////////////////
/*
void CapturePoint(object oPoint, object oPlayer)
{

    object oCaptureVisual;
    int nOldTeam = GetPlayerTeam(oPoint);
    int nNewTeam = GetPlayerTeam(oPlayer);
    string szVisualRef;
    string szTeamSound;

    if (nOldTeam != TEAM_NONE)
    {
        oCaptureVisual = GetLocalObject(oPoint, "oCaptureVisual");
        DestroyObject(oCaptureVisual);
        AdjustTeamCaptures(nOldTeam, -1);
    }

    if (nNewTeam == TEAM_BLUE)
    {
        szVisualRef = "bluecapture";
        szTeamSound = "sca_dragodd";
    }
    else
    {
        szVisualRef = "redcapture";
        szTeamSound = "sca_dragmind";
    }

    oCaptureVisual = CreateObject(OBJECT_TYPE_PLACEABLE, szVisualRef, GetLocation(oPoint));
    SetLocalObject(oPoint, "oCaptureVisual", oCaptureVisual);
    SetLocalInt(oPoint, "nTeam", nNewTeam);
    AdjustTeamCaptures(nNewTeam, 1);

    // Play sound effect and make a broadcast here.
    AssignCommand(oPoint, PlaySound(szTeamSound));
    BroadcastMessage(GetTeamName(nNewTeam) + " captures " + GetName(oPoint) + "!");



    // Check for a winner
    if (GetTeamCaptures(nNewTeam) == 5)
    {
        // We have a winner!
        EndTheGame();
    }

}


//::///////////////////////////////////////////////
//:: ContestedPoint()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Called when both teams are trying to capture
    the same point. Set the point to neutral.
*/
//:://////////////////////////////////////////////
//:: Created By: Erich Delcamp
//:: Created On: Jul/09/02
//:://////////////////////////////////////////////
/*
void ContestedPoint(object oPoint)
{
    object oCaptureVisual = GetLocalObject(oPoint, "oCaptureVisual");
    int nOldTeam = GetPlayerTeam(oPoint);

    if (nOldTeam != TEAM_NONE)
    {
        oCaptureVisual = GetLocalObject(oPoint, "oCaptureVisual");
        DestroyObject(oCaptureVisual);
        AdjustTeamCaptures(nOldTeam, -1);
        SetLocalInt(oPoint, "nTeam", TEAM_NONE);
        AssignCommand(oPoint, PlaySound("as_mg_telepin1"));
    }
}


//::///////////////////////////////////////////////
//:: GetIsCaptureValid()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test if nTeam can legally capture oPoint.
    Red captures in order 1,2,3,4,5
    Blue captures in order 5,4,3,2,1
*/
//:://////////////////////////////////////////////
//:: Created By: Erich Delcamp
//:: Created On: Jul/09/02
//:://////////////////////////////////////////////
/*
int GetIsCaptureValid(object oPoint, int nTeam)
{
    int bValid = FALSE;
    int nNextPointForTeam;
    int nPointNumber = StringToInt(GetStringRight(GetTag(oPoint), 1));

    if (nTeam == TEAM_BLUE)
    {
        nNextPointForTeam = 5 - GetTeamCaptures(nTeam);
    }
    else
    {
        nNextPointForTeam = 1 + GetTeamCaptures(nTeam);
    }

    if (nPointNumber == nNextPointForTeam)
    {
        bValid = TRUE;
    }


    return bValid;
}


//::///////////////////////////////////////////////
//:: AdjustTeamCaptures()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Add nAdjust to nTeam's capture count.
*/
//:://////////////////////////////////////////////
//:: Created By: Erich Delcamp
//:: Created On: Jul/09/02
//:://////////////////////////////////////////////
/*
void AdjustTeamCaptures(int nTeam, int nAdjust)
{
    int nCaptures = GetTeamCaptures(nTeam) + nAdjust;

    SetLocalInt(GetModule(), "nCaptures_" + IntToString(nTeam), nCaptures);
}


//::///////////////////////////////////////////////
//:: GetTeamCaptures()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Return the number of capture points under
    nTeam's control.
*/
//:://////////////////////////////////////////////
//:: Created By: Erich Delcamp
//:: Created On: Jul/09/02
//:://////////////////////////////////////////////
/*
int GetTeamCaptures(int nTeam)
{
    int nCaptures = GetLocalInt(GetModule(), "nCaptures_" + IntToString(nTeam));

    return nCaptures;
}


int GetGameStarted()
{
    int bGameStarted = GetLocalInt(GetModule(), "bGameStarted");

    return bGameStarted;
}


void SetGameStarted(int bGameStarted)
{
    object oPlayer;
    SetLocalInt(GetModule(), "bGameStarted", bGameStarted);
    if (bGameStarted == TRUE)
    {
        oPlayer = GetFirstPC();
        while (GetIsObjectValid(oPlayer))
        {
            AssignCommand(oPlayer, PlayVoiceChat(VOICE_CHAT_ATTACK));
            SendMessageToPC(oPlayer, "THE DOORS ARE OPEN! LET THE BATTLE BEGIN!");
            oPlayer = GetNextPC();
        }
    }
}


void MovePlayerToHQ(object oPlayer)
{
    int nSpawnNumber = 6 + GetPlayerTeam(oPlayer);
    object oSpawnPoint;
    location lSpawn;

    if (GetPlayerTeam(oPlayer) == TEAM_NONE)
    {
        nSpawnNumber = 0;
    }

    oSpawnPoint = GetObjectByTag("SpawnPoint_" + IntToString(nSpawnNumber));
    lSpawn = GetLocation(oSpawnPoint);

    AssignCommand(oPlayer, MoveMeToLocation(lSpawn));
}
