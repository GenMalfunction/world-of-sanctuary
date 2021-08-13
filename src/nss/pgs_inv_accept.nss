//::**********************************************
//:: Script: pgs_inv_accept
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will add the invite reciever
    to the guild with which he/she has recieved
    the invitation for.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/27/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker(), oPCLoop = GetFirstPC();
    object oSender = GetLocalObject (oPlayer, "PGS_Journal_Activator");
    int iNewGuild = PGS_GetPlayerInt (oSender, PGS_GUILD_NUMBER);
    int iPlayerRank = PGS_GetPlayerInt (oPlayer, PGS_GUILD_RANK);
    int iGuildFlag = PGS_GetGuildInt (iNewGuild, PGS_GUILD_FLAG_COLOR);

    //Check if oPlayer is currently the leader of another guild.
    if (iPlayerRank == 6)
        PGS_DestroyGuild (PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER));

    //Check if oPlayer is in a guild, just not the leader.
    else if (iPlayerRank > 0)
        PGS_DisbandPlayer (oPlayer, "You have disbanded from your guild.");

    //Inform members of the new guild about the new member.
    PGS_SendNotice (iNewGuild, "A new member, " + GetName (oPlayer) + ", has " +
        "joined the guild!");

    //Update oPlayer's information, as well as iNewGuild's membership information.
    PGS_SetPlayerInt (oPlayer, PGS_GUILD_NUMBER, iNewGuild);
    PGS_SetPlayerInt (oPlayer, PGS_GUILD_RANK, 1);
    PGS_SetGuildInt (iNewGuild, PGS_GUILD_MEMBER_COUNT, PGS_GetGuildInt
        (iNewGuild, PGS_GUILD_MEMBER_COUNT) + 1);
    PGS_SetGuildString (iNewGuild, PGS_GUILD_MEMBER_LIST, PGS_GetGuildString
        (iNewGuild, PGS_GUILD_MEMBER_LIST) + GetName (oPlayer) + "#" +
        PGS_GetGuildString (iNewGuild, PGS_GUILD_RANK_NAME + "1") + "***");

    //Check if we should apply the guild flag to oPlayer.
    if (PGS_ALLOW_FLAGS && (iGuildFlag != 0) && PGS_GetPlayerInt (oPlayer, PGS_SHOW_FLAG))
        ApplyEffectToObject (DURATION_TYPE_PERMANENT, SupernaturalEffect
            (ExtraordinaryEffect (EffectVisualEffect (iGuildFlag))), oPlayer);

    //Loop through players, and update faction among enemy guild members.
    while (oPCLoop != OBJECT_INVALID)
    {
        //Check if oPCLoop is a member of a rival guild.
        if (PGS_GetGuildInt (iNewGuild, PGS_GUILD_FACTION + IntToString (PGS_GetPlayerInt (oPCLoop, PGS_GUILD_NUMBER))) == -1)
            SetPCDislike (oPlayer, oPCLoop);

        oPCLoop = GetNextPC();
    }

    //Clear activator object.
    DeleteLocalObject (oPlayer, "PGS_Journal_Activator");
}
