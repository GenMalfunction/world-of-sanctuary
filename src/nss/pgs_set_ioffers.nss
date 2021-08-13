//::**********************************************
//:: Script: pgs_set_ioffers
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script will update the state of the
    invitation offers option for oPlayer.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
#include "pgs_inc_main"

void main()
{
    object oPlayer = GetPCSpeaker();

    //Now set the new setting value for oPlayer.
    PGS_SetPlayerInt (oPlayer, PGS_INVITES, !PGS_GetPlayerInt (oPlayer, PGS_INVITES));
}
