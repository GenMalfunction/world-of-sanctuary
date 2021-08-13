const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;
#include "x2_inc_switches"
void main()
{
    object oNPC = OBJECT_SELF;
    object oItem = GetFirstItemInInventory(oNPC);

    while (GetIsObjectValid(oItem)&& GetDroppableFlag(oItem)== FALSE)
    {

//     int bDroppable=d100()>90;
       int bDroppable=d100()>85;
//     int bDroppable=d100()>75;

     SetDroppableFlag(oItem, bDroppable);

    oItem = GetNextItemInInventory(oNPC);
    }
    // User defined OnSpawn event requested?
    int nSpecEvent = GetLocalInt(OBJECT_SELF,"X2_USERDEFINED_ONSPAWN_EVENTS");
    // Pre Spawn Event requested
    if (nSpecEvent == 1  || nSpecEvent == 3  )
    {
    SignalEvent(OBJECT_SELF,EventUserDefined(EVENT_USER_DEFINED_PRESPAWN ));
    }
    /*  Fix for the new golems to reduce their number of attacks */
    int nNumber = GetLocalInt(OBJECT_SELF,CREATURE_VAR_NUMBER_OF_ATTACKS);
    if (nNumber >0 )
    {
        SetBaseAttackBonus(nNumber);
    }
    // Execute default OnSpawn script.
    ExecuteScript("nw_c2_default9", OBJECT_SELF);
    //Post Spawn event requeste
    if (nSpecEvent == 2 || nSpecEvent == 3)
    {
    SignalEvent(OBJECT_SELF,EventUserDefined(EVENT_USER_DEFINED_POSTSPAWN));
    }
}
