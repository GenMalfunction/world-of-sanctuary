//::**********************************************
//:: Script: pgs_list_check
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will check the current entry
    for the list to determine if it's valid.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/26/2006
//::**********************************************
int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iTokenPosition = GetLocalInt (oPlayer, "PGS_List_Token_Position") + 1;
    string sEntry = GetLocalString (oPlayer, "PGS_List_Entry" + IntToString
        (iTokenPosition));

    //Check if we need to reset the token position.
    if (iTokenPosition == 8)
        DeleteLocalInt (oPlayer, "PGS_List_Token_Position");

    else  //Update new token position.
        SetLocalInt (oPlayer, "PGS_List_Token_Position", iTokenPosition);

    //Check if we should set token.
    if (sEntry != "")
    {
        SetCustomToken ((7519 + iTokenPosition), sEntry);
        DeleteLocalString (oPlayer, "PGS_List_Entry" + IntToString (iTokenPosition));
        return TRUE;
    }

    return FALSE;
}
