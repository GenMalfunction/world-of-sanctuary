//::**********************************************
//:: Script: pgs_mod_act_item
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        OnActivateItem script for the module.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/24/2006
//::**********************************************

void main()
{
    //Execute a script based upon the item's resref.
    ExecuteScript (GetResRef (GetItemActivated()), GetItemActivator());
}
