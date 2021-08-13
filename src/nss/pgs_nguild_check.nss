//::**********************************************
//:: Script: pgs_nguild_check
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will determine if the PC who
    is attempting to create a new guild meets or
    exceeds all requirements currently in place.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    string sErrorReport;

    //Determine if oPlayer's LEVE: meets the requirement.
    if ((GetHitDice (oPlayer) < PGS_NEW_GUILD_LEVEL) && (PGS_NEW_GUILD_LEVEL != 0))
        sErrorReport = "\n   - Must be atleast level " + IntToString
            (PGS_NEW_GUILD_LEVEL) + ".";

    //Determine if oPlayer's CHARISMA score meets the requirement.
    if ((GetAbilityScore (oPlayer, ABILITY_CHARISMA) < PGS_NEW_GUILD_CHARISMA) && (PGS_NEW_GUILD_CHARISMA != 0))
        sErrorReport +="\n   - Must have a CHARISMA score of atleast " +
            IntToString (PGS_NEW_GUILD_CHARISMA) + ".";

    //Determine if oPlayer's INTELLIGENCE score meets the requirement.
    if ((GetAbilityScore (oPlayer, ABILITY_INTELLIGENCE) < PGS_NEW_GUILD_INTELLIGENCE) && (PGS_NEW_GUILD_INTELLIGENCE != 0))
        sErrorReport +="\n   - Must have an INTELLIGENCE score of atleast " +
            IntToString (PGS_NEW_GUILD_INTELLIGENCE) + ".";

    //Determine if oPlayer's PERSUADE skill meets the requirement.
    if ((GetSkillRank (SKILL_PERSUADE, oPlayer) < PGS_NEW_GUILD_PERSUADE) && (PGS_NEW_GUILD_PERSUADE != 0))
        sErrorReport +="\n   - Must have a PERSUADE skill of atleast " +
            IntToString (PGS_NEW_GUILD_PERSUADE) + ".";

    //Determine if oPlayer has enough gold.
    if (GetGold (oPlayer) < PGS_NEW_GUILD_COST)
        sErrorReport +="\n   - " + IntToString (PGS_NEW_GUILD_COST) + " gold " +
            "pieces are needed.";

    //Determine if maximum number of guilds allowed has been reached.
    if (((PGS_GetModuleInt (PGS_GUILD_COUNT) + 1) >= PGS_MAX_NUM_GUILDS) && (PGS_MAX_NUM_GUILDS != 0))
        sErrorReport += "\n   - Maximum number of allowed guilds has been " +
            "reached.";

    //Determine if one or more errors occured.
    if (sErrorReport != "")
    {
        SendMessageToPC (oPlayer, "Failed requirement(s):" + sErrorReport);
        AssignCommand (oPlayer, PlaySound ("gui_error"));
        return FALSE;
    }

    return TRUE;
}
