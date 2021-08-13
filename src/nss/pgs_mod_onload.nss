//::**********************************************
//:: Script: pgs_mod_onload
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        OnModuleLoad script for the module.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/24/2006
//::**********************************************
#include "pgs_inc_events"

void main()
{
    //Load the Unique PC ID system.
    UID_OnModuleLoad();

    //Perform the necessary guild-caching routines in order
    //to increase performance while players are on.
    PGS_OnModuleLoad();
}
