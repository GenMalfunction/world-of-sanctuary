//::**********************************************
//:: Script: pgs_main_cend
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        OnEnd script for the "pgs_main" convo.
    This script will clean up any and all variables
    created from the user.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
void main()
{
    object oPlayer = GetPCSpeaker();
    object oMistress = GetLocalObject (oPlayer, "PGS_Mistress_Object");
    string sCount;
    int iCount;

    //Integers:
    DeleteLocalInt (oPlayer, "PGS_Generic_Var");
    DeleteLocalInt (oPlayer, "PGS_List_Next");
    DeleteLocalInt (oPlayer, "PGS_List_Prev");
    DeleteLocalInt (oPlayer, "PGS_List_Position");
    DeleteLocalInt (oPlayer, "PGS_Next_List_Position");
    DeleteLocalInt (oPlayer, "PGS_Prev_List_Position");
    DeleteLocalInt (oPlayer, "PGS_Faction_List");

    //Strings:
    DeleteLocalString (oPlayer, "PGS_Temp_Guild_Name");
    DeleteLocalString (oPlayer, "PGS_Temp_Guild_Desc");
    DeleteLocalString (oPlayer, "PGS_Temp_Message_Title");
    DeleteLocalString (oPlayer, "PGS_Temp_Message_Post");

    //Objects:
    DeleteLocalObject (oPlayer, "PGS_Mistress_Object");
    DeleteLocalObject (oPlayer, "PGS_Object_Position");
    DeleteLocalObject (oPlayer, "PGS_Journal_Target");

    //Remove listing variables.
    for (iCount = 1; iCount <= 8; iCount++)
    {
        sCount = IntToString (iCount);

        DeleteLocalInt (oPlayer, "PGS_List_Guild" + sCount);
        DeleteLocalObject (oPlayer, "PGS_List_Object" + sCount);
        DeleteLocalString (oPlayer, "PGS_Member_Name" + sCount);
    }

    //Remove Guild Mistress NPC.
    ApplyEffectToObject (DURATION_TYPE_INSTANT, EffectDisappear(), oMistress);
}
