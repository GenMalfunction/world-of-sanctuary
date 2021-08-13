//::///////////////////////////////////////////////
//:: Name x2_def_userdef
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On User Defined Event script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////
const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == EVENT_HEARTBEAT ) //HEARTBEAT
    {

    }
    else if(nUser == EVENT_PERCEIVE) // PERCEIVE
    {

    }
    else if(nUser == EVENT_END_COMBAT_ROUND) // END OF COMBAT
    {

    }
    else if(nUser == EVENT_DIALOGUE) // ON DIALOGUE
    {
    // We need to identify the quest number of the NPCs
    // involved so we can work with the objects as needed
    string sQuest = GetStringRight(GetTag(OBJECT_SELF),5);
    // We need to figure out the quest type so that this only fires for kidnapping quests.
    // We can do this by determining if the kidnap victim is a valid object as follows:
    string sSelfTag = GetTag(OBJECT_SELF);              // Tag of this NPC
    string sKNVictim = "QuestKNVictim"+sQuest;          // This is the kidnap victim's tag
    int iTagMatch = TestStringAgainstPattern(sKNVictim,sSelfTag);   // See if this is the kidnap victim for this quest
    if(iTagMatch)
        {
        // This should make the Kidnap Victim follow the Criminal after being talked to before rescue.
        // They should do this anyway because they are forced to follow the criminal
        // on creation, but I have noticed that if a PC talks to the kidnap victim,
        // they quit following the criminal.  This is just an assurance that behavior
        // is what we want after conversation.
        object oPC = GetPCSpeaker();                        // The PC the NPC is speaking to
        object oKNVictim = GetObjectByTag(sKNVictim);       // This is the kidnap victim
        int iQuestStatus = GetLocalInt(oPC,"Quest"+sQuest); // Determine the quest state for the PC
        if (iQuestStatus < 3)
            {
            string sCriminal = "QuestCriminal"+sQuest;          // This is the kidnapper
            object oCriminal = GetObjectByTag(sCriminal);
            AssignCommand(oKNVictim,ActionForceFollowObject(oCriminal,1.0));
            }
        // Similarly, I have noticed the kidnap vicitm will stop following the PC if talked to
        // after being saved.  It seems the dialog event clears all NPC actions?  So, I am adding
        // this so the victim continues to follow the PC.
        if (iQuestStatus == 3)
            {
            DelayCommand(0.5,AssignCommand(oKNVictim,ActionForceFollowObject(oPC,1.0)));
            }
        }
    }
    else if(nUser == EVENT_ATTACKED) // ATTACKED
    {
    // We need to identify the quest number of the NPCs
    // involved so we can work with the objects as needed
    string sQuest = GetStringRight(GetTag(OBJECT_SELF),5);
    // We need to figure out the quest type so that this only fires for kidnapping quests
    // This must fire only if the criminal is attacked, so we have to make sure that
    // there is a kidnap victim associated with the attacked criminal.
    // We can do this by determining if the kidnap victim is a valid object as follows:
    string sKNVictim = "QuestKNVictim"+sQuest;      // This is the kidnap victims tag
    object oKNVictim = GetObjectByTag(sKNVictim);   // This is the kidnap victim
    if (GetIsObjectValid(oKNVictim))
        {
        // We need to figure out what PC acted as the last attacker.
        object oAttacker = GetLastHostileActor(OBJECT_SELF);
        // Lets make the kidnapping victim friendly to the PC even after witnessing the attack
        // of the criminal.  I suggest using custom factions as I have in this demo module and making the
        // victim and criminal fully neutral to eachother, but friendly to the PC.  This code is just a safety.
        //
        // Another work around would be to make the kidnap victim a member of the PCs party, as if they
        // were a henchman of sorts, but this would not be nice since we don't want the kid fighting with
        // the PC . . . or do we?
        if (GetIsPC(oAttacker))
            {
            AssignCommand(oKNVictim,ClearAllActions());
            SetIsTemporaryFriend(oAttacker,oKNVictim);
            ClearPersonalReputation(oAttacker,oKNVictim);
            }
        }
    }
    else if(nUser == EVENT_DAMAGED) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH  - do not use for critical code, does not fire reliably all the time
    {
    // Module Object
    object oMod = GetModule();
    // We need to identify the quest number of the NPCs
    // involved so we can work with the objects as needed
    string sQuest = GetStringRight(GetTag(OBJECT_SELF),5);
    // We need to figure out the quest type so that this only fires for kidnapping quests
    // This must fire only if the criminal is killed by the PC, so we have to make sure that
    // there is a kidnap victim associated with the attacked criminal.
    // We can do this by seeing if the kidnap victim is a valid object as follows:
    string sKNVictim = "QuestKNVictim"+sQuest;      // This is the kidnap victims tag
    object oKNVictim = GetObjectByTag(sKNVictim);   // This is the kidnap victim
    if (GetIsObjectValid(oKNVictim))
        {
        // We need to figure out what PC acted as the last attacker.
        object oKiller = GetLastKiller();
        // Lets make the kidnapping victim friendly to the PC even after witnessing the death
        // of the criminal.  I suggest using custom factions as I have in this demo module and making the
        // victim and criminal fully neutral to eachother, but friendly to the PC.  This code is just a safety.
        //
        // Another work around would be to make the kidnap victim a member of the PCs party, as if they
        // were a henchman of sorts, but this would not be nice since we don't want the kid fighting with
        // the PC . . . or do we?
        if (GetIsPC(oKiller))
            {
            AssignCommand(oKNVictim,ClearAllActions());
            SetIsTemporaryFriend(oKiller,oKNVictim);
            ClearPersonalReputation(oKiller,oKNVictim);
            // We also need to make the kidnap victim follow the PC of course :)
            AssignCommand(oKNVictim,ActionForceFollowObject(oKiller,1.0));
            // Advance the quest status so the quest can move on when the PC talks to quest giver
            if (GetLocalInt(oKiller,"Quest"+sQuest)==2)
                {
                SetLocalInt(oKiller,"Quest"+sQuest,3);
                }
            }
        }
        // We need to ensure that the task master can make new quests even if quests can't get
        // finished due to NPC death.  So lets reset quest status on the module when NPCs die.
        SetLocalInt(oMod,"iQuest"+sQuest,0);
    }
    else if(nUser == EVENT_DISTURBED) // DISTURBED
    {

    }
    else if (nUser == EVENT_USER_DEFINED_PRESPAWN)
    {

    }
    else if (nUser == EVENT_USER_DEFINED_POSTSPAWN)
    {

    }
}
