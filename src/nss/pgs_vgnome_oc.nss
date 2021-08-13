//::**********************************************
//:: Script: pgs_vgnome_oc
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        OnConversation script for the Vault Gnome.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    //Check if oPlayer is attempting to start a conversation.
    if (GetListenPatternNumber() == -1)
    {
        ClearAllActions();
        BeginConversation();
    }

    object oPlayer = GetLastSpeaker();

    //Make sure oPlayer is the one we want to listen for.
    if (oPlayer != GetLocalObject (OBJECT_SELF, "PGS_Listen_For"))
        return;

    string sName = GetName (oPlayer);
    int iGuild = PGS_GetPlayerInt (oPlayer, PGS_GUILD_NUMBER);
    int iAccount = PGS_GetGuildInt (iGuild, PGS_GUILD_ACCOUNT);
    int iAmount = StringToInt (GetMatchedSubstring (0));

    //Check for valid amount entered.
    if (iAmount <= 0)
        SpeakString ("That is not a valid amount, " + sName + ".");

    else
    {
        //Determine if a withdrawal is being made.
        if (GetLocalInt (oPlayer, "PGS_Generic_Var") - 1)
        {
            //Ensure guild account can cover withdrawal.
            if (iAmount > iAccount)
                SpeakString ("There is not enough coin in the account, " + sName + ".");

            else  //Withdrawal is possible.
            {
                iAccount -= iAmount;

                //Give gold to oPlayer, and remove it from the account.
                GiveGoldToCreature (oPlayer, iAmount);
                PGS_SetGuildInt (iGuild, PGS_GUILD_ACCOUNT, iAccount);

                SpeakString ("Your withdrawal has been completed, " + sName + ".");
                PGS_SendNotice (iGuild, GetName (oPlayer) + " has withdrawn " +
                    IntToString (iAmount) + " gold piece(s) from the guild account.");
            }
        }
        else  //Donation is being made instead.
        {
            //Ensure oPlayer has enough gold for the donation.
            if (GetGold (oPlayer) < iAmount)
                SpeakString ("I'm sorry, but it appears you haven't enough coin " +
                    "for that, " + sName + ".");

            else  //Donation can be done.
            {
                iAccount += iAmount;

                //Take gold from oPlayer, and add it to the guild account.
                TakeGoldFromCreature (iAmount, oPlayer, TRUE);
                PGS_SetGuildInt (iGuild, PGS_GUILD_ACCOUNT, iAccount);

                SpeakString ("Your donation has been completed, " + sName + ".");
                PGS_SendNotice (iGuild, GetName (oPlayer) + " has donated  " +
                    IntToString (iAmount) + " gold piece(s) to the guild account.");
            }
        }
    }
}
