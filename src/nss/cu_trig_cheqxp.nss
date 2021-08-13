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
object oWayPoint = GetWaypointByTag( "WP_OutOfTreasury" );
location lWayPoint = GetLocation( oWayPoint );

if ( GetIsObjectValid( GetItemPossessedBy(oPC,"wayp39") ) )
    {
    AssignCommand(oPC, JumpToLocation( lWayPoint ));


    int nOnce = GetLocalInt(oPC, "Use_XPTile");

    // Give the speaker some XP
    if (nOnce==FALSE)
    {
    GiveXPToCreature( GetEnteringObject(),1500);
    SetLocalInt(oPC, "Use_XPTile",TRUE);
    }
    }
}
