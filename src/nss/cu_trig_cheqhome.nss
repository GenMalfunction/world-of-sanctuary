//::///////////////////////////////////////////////
//:: FileName at_006
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 24/07/02 22:36:10
//:://////////////////////////////////////////////
#include "nw_i0_tool"


void main()
{
object oPC = GetEnteringObject();
object oWayPoint = GetWaypointByTag( "NW_SpecExit001" );
location lWayPoint = GetLocation( oWayPoint );
AssignCommand(oPC, JumpToLocation( lWayPoint ));
}
