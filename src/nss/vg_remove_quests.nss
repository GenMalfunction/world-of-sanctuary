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
// Set the module quest production control Ints to zero so new quests can be made
SetLocalInt(oMod,"iQuest1"+sTaskMaster,0);
SetLocalInt(oMod,"iQuest2"+sTaskMaster,0);
SetLocalInt(oMod,"iQuest3"+sTaskMaster,0);
SetLocalInt(oMod,"iQuest4"+sTaskMaster,0);
SetLocalInt(oMod,"iQuest5"+sTaskMaster,0);

// Now we need to destroy all quest NPCs and quest items that were previously made.
// If we do not clean up these objects, then the module will get cluttered beyond usefullness
// and there will be doubling effects for quests.
DespawnNPCs();

return TRUE;
}
