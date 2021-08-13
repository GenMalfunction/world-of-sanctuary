//::**********************************************
//:: Script: pgs_set_var1
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This is a generic script that sets a local
    variable on the PC.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 6/28/2007
//::**********************************************
void main()
{
    //Now lets store the variable.
    SetLocalInt (GetPCSpeaker(), "PGS_Generic_Var", 1);
}
