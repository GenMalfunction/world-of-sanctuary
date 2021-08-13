//------------------------
//Start conversation with an inanimate object
//Ben W-Husey 6th of August 2002
//------------------------

void main()
{
//Get the PC using the object
    object oPC = GetLastUsedBy();
    ActionStartConversation(oPC, "", TRUE);
}

