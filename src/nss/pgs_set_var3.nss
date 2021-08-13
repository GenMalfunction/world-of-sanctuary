//::**********************************************
//:: Script: pgs_set_var3
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This is a generic script that sets a local
    variable on the PC.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************
void main()
{
    //Now lets store the variable.
    SetLocalInt (GetPCSpeaker(), "PGS_Generic_Var", 3);
}
