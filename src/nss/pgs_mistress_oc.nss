//::**********************************************
//:: Script: pgs_mistress_oc
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        OnConversation script for the Guild
    Mistress.  This script controls what to do
    when guild-related information is entered.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/26/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetLastSpeaker();

    //Have 'Guild Mistress' only listen for a specific player:
    if (oPlayer == GetLocalObject (OBJECT_SELF, "PGS_Listen_For"))
    {
        string sName = GetName (oPlayer);
        string sText = GetMatchedSubstring (0);
        int iRankNum = GetLocalInt (oPlayer, "PGS_Rank_Var");
        int iVarNum = GetLocalInt (oPlayer, "PGS_Generic_Var");

        //Check if rank name is being modified:
        if (iRankNum > 0)
        {
            //Reset rank variable:
            DeleteLocalInt (oPlayer, "PGS_Rank_Var");

            int iGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
            string sMemberList = PGS_GetGuildString (iGuild, PGS_GUILD_MEMBER_LIST);
            string sOldRank = PGS_GetGuildString (iGuild, PGS_GUILD_RANK_NAME +
                IntToString (iRankNum));
            int iPosition = FindSubString (sMemberList, "#" + sOldRank);

            //Loop through member list string, and update rank name for members
            //currently of that rank.
            while (iPosition != -1)
            {
                sMemberList = GetStringLeft (sMemberList, iPosition) + "#" +
                    sText + GetStringRight (sMemberList, GetStringLength
                    (sMemberList) - (iPosition + GetStringLength (sOldRank) + 1));

                //Check for another rank needing to be modified:
                iPosition = FindSubString (sMemberList, "#" + sOldRank);
            }

            //Update guild information to reflect new rank  name:
            PGS_SetGuildString (iGuild, PGS_GUILD_MEMBER_LIST, sMemberList);
            PGS_SetGuildString (iGuild, PGS_GUILD_RANK_NAME + IntToString
                (iRankNum), sText);

            //Inform oPlayer rank name has been updated:
            SpeakString ("I have recorded the new rank name, " + sName + ".");
        }
        else
            switch (iVarNum)  //Determine which variable is being updated/set.
            {
                case 1:  //Guild name.
                    SpeakString ("I have recorded your guild name, " + sName + ".");
                    SetLocalString (oPlayer, "PGS_Temp_Guild_Name", sText);
                    break;
                case 2:  //Guild description.
                    SpeakString ("I have recorded your guild description, " + sName + ".");
                    SetLocalString (oPlayer, "PGS_Temp_Guild_Desc", sText);
                    break;
                case 3:  //Message title.
                    SpeakString ("I have recorded your message title, " + sName + ".");
                    SetLocalString (oPlayer, "PGS_Temp_Message_Title", sText);
                    break;
                case 4:  //Message post.
                    SpeakString ("I have recorded your message post, " + sName + ".");
                    SetLocalString (oPlayer, "PGS_Temp_Message_Post", sText);
                    break;
            }
    }
}
