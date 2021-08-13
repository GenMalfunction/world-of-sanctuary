#include "x2_inc_switches"
void main()
{
    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) return;
    object oPC = GetItemActivator();
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionStartConversation(oPC, "sf_wings", TRUE, FALSE));

}
