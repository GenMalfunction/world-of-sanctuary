//::**********************************************
//:: Script: pgs_item_journal
//:: Player Guild System - Version 4.x
//::**********************************************
/*
        This script, which is called from the
    OnActivateItem event, performs the necessary
    functions for when the "Guild Journal" item
    is activated.
*/
//::**********************************************
//:: Created By: Adam Walenga
//:: Created On: 5/25/2006
//::**********************************************

void main()
{
    object oTarget = GetItemActivatedTarget();

    //Determine if a PC or a DM activated the item.
    if (GetIsDM (OBJECT_SELF))
        AssignCommand (OBJECT_SELF, ActionStartConversation (OBJECT_SELF,
            "pgs_manager", TRUE, FALSE));

    else  //Player (PC) activated the 'Guild Journal' item.
    {
        //Store target object on oPlayer for future use.
        SetLocalObject (OBJECT_SELF, "PGS_Journal_Target", oTarget);

        AssignCommand (OBJECT_SELF, ActionStartConversation (OBJECT_SELF,
            "pgs_main", TRUE, FALSE));
    }
}
