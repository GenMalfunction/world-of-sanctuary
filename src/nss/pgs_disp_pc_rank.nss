//::**********************************************
//:: Script: pgs_disp_pc_rank
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display specific rank
    information for oPlayer.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/26/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iPCRank = PGS_GetPlayerInt (oPlayer, PGS_GUILD_RANK);
    string sAbilities;

    //Display rank responsibilities based on iPCRank.
    switch (iPCRank)
    {
        case 1:
            sAbilities = "     * Send guild chat.\n     * Donate to guild account.";
            break;
        case 2:
            sAbilities = "     * Send guild chat.\n     * Donate to guild account.\n     * Create guild messages.";
            break;
        case 3:
            sAbilities = "     * Send guild chat.\n     * Donate to guild account.\n     * Create guild messages.\n     * Invite members.";
            break;
        case 4:
            sAbilities = "     * Send guild chat.\n     * Donate to guild account.\n     * Create guild messages.\n     * Invite members.\n     * Promote guild members.\n     * Remove guild members.";
            break;
        case 5:
            sAbilities = "     * Send guild chat.\n     * Donate to guild account.\n     * Create guild messages.\n     * Invite members.\n     * Promote guild members.\n     * Remove guild members.\n     * Change guild factions.\n     * Withdraw from guild account.";
            break;
        case 6:
            sAbilities = "     * Send guild chat.\n     * Donate to guild account.\n     * Create guild messages.\n     * Invite members.\n     * Promote guild members.\n     * Remove guild members.\n     * Change guild factions.\n     * Withdraw from guild account.\n     * Configuring guild information.";
            break;
    }

    //Now display information in the conversation.
    SetCustomToken (7513, GetStringLowerCase(PGS_GetGuildString (PGS_GetPlayerInt
        (oPlayer, PGS_GUILD_NUMBER), PGS_GUILD_RANK_NAME + IntToString (iPCRank))));
    SetCustomToken (7514, sAbilities);

    return TRUE;
}
