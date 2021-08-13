//::**********************************************
//:: Script: pgs_list_players
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will build the player list
    for all PCs currently involved in a pubic guild.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/26/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();
    object oObjectPos = GetLocalObject (oPlayer, "PGS_Object_Position");
    string sCount;
    int iCount = 1, iPCGuild;

    //Check if a position has already been established for the list.
    if (oObjectPos == OBJECT_INVALID)
        oObjectPos = GetFirstPC();

    else  //Position already established, now locate it.
    {
        object oPCLoop = GetFirstPC();

        //Loop through PCs and find position.
        while (oPCLoop != oObjectPos)
            oPCLoop = GetNextPC();

        oObjectPos = oPCLoop;
    }

    //Loop through online players and build the list.
    while (iCount <= 9)
    {
        sCount = IntToString (iCount);
        iPCGuild = PGS_GetPlayerInt (oObjectPos, PGS_GUILD_NUMBER);

        //Determine if we have reached the end of the list.
        if (oObjectPos == OBJECT_INVALID)
            iCount++;

        //oObject is valid, check if in a public guild.
        else if ((!PGS_GetGuildInt (iPCGuild, PGS_GUILD_PRIVACY)) && (iPCGuild != 0))
        {
            //Check if the "next set" option is available.
            if (iCount == 9)
            {
                SetLocalInt (oPlayer, "PGS_List_Next", TRUE);
                SetLocalObject (oPlayer, "PGS_Next_Object_Position", oObjectPos);
                break;
            }

            SetLocalString (oPlayer, "PGS_List_Entry" + sCount, GetName
                (oObjectPos) + "  [" + PGS_GetGuildString (iPCGuild,
                PGS_GUILD_NAME) + "]");
            SetLocalObject (oPlayer, "PGS_List_Object" + sCount, oObjectPos);
            iCount++;
        }

        oObjectPos = GetNextPC();
    }
}
