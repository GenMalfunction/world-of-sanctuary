//::**********************************************
//:: Script: pgs_msg_check
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script checks to make sure that the
    information entered by oPlayer is valid.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/26/2006
//::**********************************************
int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    string sErrorReport;

    //Determine if the title entered was valid.
    if (GetLocalString (oPlayer, "PGS_Temp_Message_Title") == "")
        sErrorReport = "\n   - Invalid message title.";

    //Determine if the post entered was valid.
    if (GetLocalString (oPlayer, "PGS_Temp_Message_Post") == "")
        sErrorReport = "\n   - Invalid message post.";

    //Determine if an error (or more) occured.
    if (sErrorReport != "")
    {
        SendMessageToPC (oPlayer, "Failed requirement(s):" + sErrorReport);
        AssignCommand (oPlayer, PlaySound ("gui_error"));
        return FALSE;
    }

    return TRUE;
}
