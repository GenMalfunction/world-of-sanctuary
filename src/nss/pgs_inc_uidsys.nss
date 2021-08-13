//::**********************************************
//:: Script: pgs_inc_uidsys
//:: Unique Player ID System - Version 1.0
//::**********************************************
/*
        This include file houses several functions
    that make up the 'Unique Player ID System.'
    In a nutshell, this system will assign unique
    ID numbers to all new PCs who enter the module.

        With this unique ID number, it becomes much
    easier for module builders to store persistent
    information that is player-specific.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/24/2006
//::**********************************************
#include "pgs_inc_constant"
#include "pgs_inc_config"

//UID_GetPCUniqueDB -
//    This function will return the unique database
//    name for the player passed to this function.
//
//Note: When storing player-scecific data in this DB,
//      you do NOT need to have unique variable names.
string UID_GetPCUniqueDB (object oPlayer)
{
    return PGS_DBNAME_PC + IntToString (GetLocalInt (oPlayer, "UID_Player_ID"));
}

//UID_Check -
//    This function is meant to be called from the
//    OnClientEnter event for the module.  It will
//    assign a unique ID number to all new players
//    who enter the module.
//
//Note: The purpose of this unique ID number is to
//      ease the process in storing player-specific
//      information.
void UID_Check (object oPlayer)
{
    //Check if oPlayer is a DM.
    //If so, cancel ID check as player-specific datais not usually stored on DMs.
    if (GetIsDM (oPlayer))
        return;

    string sName = GetName (oPlayer);

    //Check if oPlayer is new to the module (denoted by not having an ID token).
    if (!GetIsObjectValid (GetItemPossessedBy (oPlayer, "Player_ID_Token")))
    {
        //Check player's name for length (must be <= 32 characters).
        if (GetStringLength (sName) > 32)
            SendMessageToPC (oPlayer, "Attention " + GetPCPlayerName (oPlayer) +
                ":\nThe name for your character is too long.  Please re-create " +
                "your character with a name that is 32 characters or less.");

        //Name length test passed.
        //Now check to ensure this name has not already been taken.
        else if (GetCampaignInt (PGS_DBNAME_UID, sName) != 0)
            SendMessageToPC (oPlayer, "Attention " + GetPCPlayerName (oPlayer) +
                ":\nThe name for your character has already been taken.  " +
                "Please re-create your character with a different name.");

        //Both name tests passed.
        //Assign a unique ID number to the player.
        else
        {
            object oModule = GetModule();
            int iCurrentID = GetLocalInt (oModule, "Current_PlayerID") + 1;

            //Assign and store player's new unique ID number.
            SetCampaignInt (PGS_DBNAME_UID, UID_CURRENTID, iCurrentID);
            SetCampaignInt (PGS_DBNAME_UID, sName, iCurrentID);
            SetLocalInt (oPlayer, "UID_Player_ID", iCurrentID);

            //Update next available ID number for next new player.
            SetLocalInt (oModule, "Current_PlayerID", iCurrentID);

            //Give an ID token to the player, then save his new character.
            //This will inform the system that he is no longer "new".
            CreateItemOnObject ("pc_id_token", oPlayer);
            DelayCommand (PGS_EXPORT_DELAY, ExportSingleCharacter (oPlayer));
            return;
        }

        //Freeze player via a cutscene effect.
        ApplyEffectToObject (2, EffectCutsceneImmobilize(), oPlayer);

        //Inform player they will automatically be removed from the module.
        DelayCommand (5.0f, FloatingTextStringOnCreature ("** You will be " +
            "removed from the server in one minute. **", oPlayer, FALSE));
        DelayCommand (65.0f, BootPC (oPlayer));
    }

    //Player is not a new character to the module.
    //Locally store his unique ID number for future use with other systems.
    else
        SetLocalInt (oPlayer, "UID_Player_ID", GetCampaignInt (PGS_DBNAME_UID, sName));
}

void UID_OnModuleLoad()
{
    //Store current ID number to be made available for next new player.
    SetLocalInt (OBJECT_SELF, "Current_PlayerID", GetCampaignInt (PGS_DBNAME_UID,
        UID_CURRENTID));
}
