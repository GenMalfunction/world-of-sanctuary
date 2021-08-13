//::**********************************************
//:: Script: pgs_set_flist2
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This is a generic script that sets a local
    variable used for the faction list.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
void main()
{
    //Now lets store the variable.
    SetLocalInt (GetPCSpeaker(), "PGS_Faction_List", -1);
}
