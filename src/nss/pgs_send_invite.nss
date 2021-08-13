//::**********************************************
//:: Script: pgs_send_invite
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will have oPlayer send a guild
    invitation to oTarget.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/27/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();
    object oTarget = GetLocalObject (oPlayer, "PGS_Journal_Target");
    string sTargetName = GetName (oTarget), sErrorReport;

    //Determine if oTarget meets the level requirement for joining a guild.
    if (GetHitDice (oTarget) < PGS_NEW_GUILD_LEVEL)
        sErrorReport += "\n   - Minimum level required for joining a guild " +
            "is: " + IntToString (PGS_NEW_GUILD_LEVEL) + ".";

    //Check if oTarget is not accepting guild invites.
    if (!PGS_GetPlayerInt (oTarget, PGS_INVITES))
        sErrorReport += "\n   - " + sTargetName + " is currently not accepting " +
            "guild invitations.";

    //Check if oTarget is currently in combat.
    if (GetIsInCombat (oTarget))
        sErrorReport += "\n   - " + sTargetName + " is currently in combat.";

    if (IsInConversation (oTarget))
        sErrorReport += "\n   - " + sTargetName + " is currently in another " +
            "conversation.";

    //Check if oPlayer and oTarget are in the same guild already.
    if (PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER) == PGS_GetPlayerInt (oTarget, PGS_GUILD_NUMBER))
        sErrorReport += "\n   - " + sTargetName + " is already a member of your guild.";

    //Determine if one or more errors occured.
    if (sErrorReport != "")
    {
        SendMessageToPC (oPlayer, "Failed requirement(s):" + sErrorReport);
        AssignCommand (oPlayer, PlaySound ("gui_error"));
    }
    else  //No errors occured, send guild invite to oTarget.
    {
        //Store invite sender object on oTarget:
        SetLocalObject (oTarget, "PGS_Journal_Activator", oPlayer);

        AssignCommand (oTarget, ClearAllActions());
        SendMessageToPC (oPlayer, "Your guild invitation was successfully sent " +
            "to " + sTargetName + ".");
        AssignCommand (oTarget, ActionStartConversation (oTarget, "pgs_invite",
            TRUE, FALSE));
    }
}
