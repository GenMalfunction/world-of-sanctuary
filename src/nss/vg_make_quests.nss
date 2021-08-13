#include "vg_questgen_inc"
int StartingConditional()
{
// Module Object
object oMod = GetModule();
// ID this Task Master as an individual by a local string set on him
string sTaskMaster = GetLocalString(OBJECT_SELF,"TaskMaster");
// Lets reset the quest states for all five quests on the PCs so they can do the new quests
// We need to do this to all PCs so they can all do the quests (takes care of multi-player)
// Should not be an issue for keeping any PC from completing a quest since they must all
// be done before this function gets called again.
object oPlayer = GetFirstPC();
while (GetIsObjectValid(oPlayer) == TRUE)
    {
    SetLocalInt(oPlayer,"Quest1"+sTaskMaster,0);
    SetLocalInt(oPlayer,"Quest2"+sTaskMaster,0);
    SetLocalInt(oPlayer,"Quest3"+sTaskMaster,0);
    SetLocalInt(oPlayer,"Quest4"+sTaskMaster,0);
    SetLocalInt(oPlayer,"Quest5"+sTaskMaster,0);

    oPlayer = GetNextPC();
    }
// Now we need to destroy all quest NPCs and quest items that were previously made.
// If we do not clean up these objects, then the module will get cluttered beyond usefullness
// and there will be doubling effects for quests.
DespawnNPCs();

object oPC = GetPCSpeaker();
// I have to do this so the "DM Only" conversation actually works.
// If this is not done, then the creation of quests bugs out after a DM
// tries to delete then recreate quests.
if (GetIsDM(oPC))
    {
    SetLocalInt(oPC,"Quest1"+sTaskMaster,0);
    SetLocalInt(oPC,"Quest2"+sTaskMaster,0);
    SetLocalInt(oPC,"Quest3"+sTaskMaster,0);
    SetLocalInt(oPC,"Quest4"+sTaskMaster,0);
    SetLocalInt(oPC,"Quest5"+sTaskMaster,0);
    }
// Set up a loop to call for 5 quest types so we can set
// them all up in the task masters convo.
int iQuest;
while (iQuest < 5)
    {
    // Lets figure out what type of quest we will get this time
    DetermineQuestType();
    // Lets count up our number of quests to get our five quest types
    iQuest++;
    // Retrieve quest type for this particular quest
    string sQuestType = GetLocalString(OBJECT_SELF,"QuestType");
    // Record the quest number for data monitoring
    string sQuest = IntToString(iQuest);
    SetLocalString(OBJECT_SELF,"Quest",sQuest+sTaskMaster);
    SetLocalString(OBJECT_SELF,"Quest"+sQuest,sQuestType);

    if (GetLocalInt(GetModule(),"Debug")==1)
        {
        SendMessageToPC(GetFirstPC(),"Quest #"+sQuest+" is a "+sQuestType+" quest.");
        }

    // Spawn in the NPCs for the quest
    SpawnNPCs(oPC);
    }
return TRUE;
}
