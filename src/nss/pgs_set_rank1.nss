//::**********************************************
//:: Script: pgs_set_rank1
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script is used to store the rank
    number that is to be modified.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 6/29/2007
//::**********************************************
void main()
{
    //Now lets store the variable.
    SetLocalInt (GetPCSpeaker(), "PGS_Rank_Var", 1);
}
