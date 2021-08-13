//::**********************************************
//:: Script: pgs_display_sets
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will display, to the PC,
    his/her current configurable option settings.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();
    string sSetVariable;
    int iCount;

    //Loop through PC settings, 3 in all.
    for (iCount = 2; iCount <= 4; iCount++)
    {
        //Determine which setting we are currently looking for.
        switch (iCount)
        {
            case 2:  sSetVariable = PGS_FACTION_OFFERS;  break;
            case 3:  sSetVariable = PGS_INVITES;  break;
            case 4:  sSetVariable = PGS_SHOW_FLAG;  break;
        }

        //Now determine, from the value, if the setting is enabled/disabled.
        if (PGS_GetPlayerInt (oPlayer, sSetVariable))
            SetCustomToken ((7500 + iCount), "Enabled");

        else
            SetCustomToken ((7500 + iCount), "Disabled");
    }
}
