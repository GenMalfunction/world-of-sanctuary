//::**********************************************
//:: Script: pgs_mod_cl_enter
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        OnClientEnter event for the module.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/24/2006
//::**********************************************
#include "pgs_inc_events"
#include "pgs_inc_uidsys"

void main()
{
    object oPlayer = GetEnteringObject();

    //Check for assigned ID number on the PC.
    //    Note: If one is not assigned, a new one will be given.
    UID_Check (oPlayer);

    //Perform the necessary guild-related procedures for the
    //newly-entered player.
    PGS_OnClientEnter (oPlayer);
}
